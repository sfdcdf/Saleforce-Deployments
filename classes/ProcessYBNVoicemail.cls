//This class is used for parsing the YBN Voicemail Email and updating a Case
global class ProcessYBNVoicemail implements Messaging.InboundEmailHandler {
    public String parseToFindContactPhone(String html){
        /*
            Sample HTML Email that you should be setting from the Test Method - 
        
            You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.

            See for more info - https://regex101.com/r/vI1gH8/2
        */
        /*
            Modified by : Subba Gadhamsetty
            Modified Date : 9/1/2017 , JIRA : YO-72903
            Description : Email Generating System CISCO, changed the format of generating mail to send subject like "Message from Gadhamsetty,SubbaRao (7036684753).", adhere the change into Salesforce code and also address few Null pointer exceptions
            Reference : https://regex101.com/r/vI1gH8/3
        */
        
        //Matcher telMatcher = Pattern.compile('(tel:(.*?)")').matcher(html);
        Matcher telMatcher = Pattern.compile('\\((.*?)\\)').matcher(html);
        
        while(telMatcher.find()){    
            Matcher numberMatcher = Pattern.compile('(\\d+)').matcher(telMatcher.group());
            while(numberMatcher.find()){
                return numberMatcher.group();
            }
        }
        
        return NULL;
    }
    
    //Method to get Target Account Details to be used during Case creation  
    List<Account> getTargetAccountDetails(Id accountId) {
        List<Account> targetAccountDetails = [
            SELECT  RecordType.DeveloperName,
                    Lead_Consultant__c,
                    IMS_Rep__c
            FROM    Account
            WHERE   Id = : accountId
        ];

        return targetAccountDetails;
    }

    //Method to add Voicemail attachment to the create Case
    void addAttachment(Case insertedCase, Messaging.InboundEmail email) {
         if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
             for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
                Attachment attachment = new Attachment();
                // Attach to the newly created Case record
                attachment.ParentId = insertedCase.Id;
                attachment.Name = email.binaryAttachments[i].filename;
                attachment.Body = email.binaryAttachments[i].body;
                insert attachment;
             }
        }
    }

    // Method to create Case using details grabbed from Email and other logic
    Case createCase(List<Account> targetAccountDetails, Messaging.InboundEmail email) {
        Case vmCase = new Case();

        //Grab the CatchAllQueue
        Group catchAllQueue = [
            SELECT  Id
            FROM    Group
            WHERE   Type = 'Queue' AND
                    DeveloperName = 'YBN_E2C_Catch_all'
            LIMIT 1
        ];

        
        //Grab the YBN Inbound Case Record Type
        List<RecordType> ybnInboundRecordType = [
            SELECT  Id
            FROM    RecordType
            WHERE   DeveloperName = 'YBN_Inbound_Inquiry'
            LIMIT 1
        ];

        System.Debug('Record Type Id is: ' + ybnInboundRecordType[0].Id);

        //Assign OwnerID and Target Account depending upon Target Account is NULL or Not
        if (targetAccountDetails != NULL && targetAccountDetails.size() != 0) {
            if (
                targetAccountDetails[0].RecordType.DeveloperName == 'YBN_Corporate_Relationship' && 
                targetAccountDetails[0].Lead_Consultant__c != NULL
            ) {
                vmCase.OwnerId = targetAccountDetails[0].Lead_Consultant__c;
            } 
            else if (
                targetAccountDetails[0].RecordType.DeveloperName == 'Standard' && 
                targetAccountDetails[0].IMS_Rep__c != NULL
            ) {
                vmCase.OwnerId = targetAccountDetails[0].IMS_Rep__c;
            } 
            else {
                vmCase.OwnerId = catchAllQueue.Id;
            }

            vmCase.AccountId = targetAccountDetails[0].Id;
        } else {
            vmCase.AccountId = NULL;
            vmCase.OwnerId = catchAllQueue.Id;
        }
        
        /*
        System.debug('Attachment is: ' + email.binaryAttachments);
        System.debug('Attachment body is: ' + email.binaryAttachments[0].body);
        */
        
        //Check for attachments and attach if there are any
        /*
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
                Attachment attachment = new Attachment();
                // Attach to the newly created Case record
                attachment.ParentId = vmCase.Id;
                attachment.Name = email.binaryAttachments[0].filename;
                attachment.Body = email.binaryAttachments[0].body;
                insert attachment;
        } 
        */
        
        vmCase.ContactId = NULL;
        vmCase.RecordTypeId = ybnInboundRecordType[0].Id;
        vmCase.Status = 'New';
        vmCase.Origin = 'Voicemail';
        vmCase.Subject = email.Subject;
        vmCase.RecordTypeId = ybnInboundRecordType[0].Id;
        vmCase.Description = email.PlainTextBody;
        
        System.debug('All Case attributes have been set');

        return vmCase;
    }
    
    
    //Begin with the Email Services method
    global Messaging.InboundEmailResult handleInboundEmail(
        Messaging.InboundEmail email,
        Messaging.InboundEnvelope envelope
    ) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        List<Contact> lstSimilarContacts;
        String contactPhone;
        
        try{   
            //contactPhone = parseToFindContactPhone(email.HtmlBody);
            contactPhone = parseToFindContactPhone(email.Subject);

            System.debug('HTMl Subject:' + email.Subject);
            System.debug('HTMl Body:' + email.HtmlBody);
            System.debug('The parsed out Contact phone number is: ' +(contactPhone == NULL ? 'No PhoneNumber in the Subject' : contactPhone));
    
            //Find all YBN Contacts which have the parsed Phone Number
            
            if(contactPhone!=NULL){
            lstSimilarContacts = [
                SELECT  Id,
                        Target_Account__c
                        FROM Contact
                WHERE   Plain_Phone__c = :contactPhone 
                OR      Plain_Other_Phone__c = :contactPhone 
                OR      Plain_Mobile_Phone__c = :contactPhone 
            ];
            }
                
            System.debug('Number of Contacts found is: ' + (lstSimilarContacts == NULL ? 0 : lstSimilarContacts.size()));
            
            if (lstSimilarContacts != NULL){
                System.debug('list of Contacts is: ' +lstSimilarContacts);
            }
            
            Set<Id> similarConsIds = new Set<Id>();
            for(Contact con: lstSimilarContacts){
                similarConsIds.add(con.Id);
            }
    
            //*********************No Contacts found*****************************
            if (lstSimilarContacts == NULL || lstSimilarContacts.size() == 0) {
                
                System.debug('No Contacts found');
                Case vmCase = createCase(NULL, email);
                INSERT vmCase;
    
                System.debug('Inserted Case ID is: ' + vmCase.Id);
                
                addAttachment(vmCase, email);
    
                return result;
            }
    
            //********************* One Contact found*****************************
            else if (lstSimilarContacts.size() == 1) {
                
                System.debug(' Only one Contacts found');
                
                List<Account> targetAccountDetails = getTargetAccountDetails(lstSimilarContacts[0].Target_Account__c);
    
                Case vmCase = createCase(targetAccountDetails, email);
                vmCase.ContactId = lstSimilarContacts[0].Id;
                INSERT vmCase;
                System.debug('Case has been inserted with ID: ' +vmCase.Id);
                
                addAttachment(vmCase, email);
    
                return result;
            }
    
            //********************* Multiple Contacts Found - Find most eligible Contact*****************************
            else {
                
                System.debug('Multiple Contacts found');
                
                List<Contact> mostEligibleContacts = [
                    SELECT  Id,
                            Target_Account__c
                    FROM    Contact
                    WHERE   Id IN: similarConsIds
                    AND     Most_Eligible__c = TRUE
                ];
                
                System.debug('Number of most eligible Contacts found is :' +mostEligibleContacts.size());
    
                //This would never happen but still taking care of it
                if (mostEligibleContacts == NULL || mostEligibleContacts.size() ==0) {
                    List<Account> targetAccountDetails = getTargetAccountDetails(lstSimilarContacts[0].Target_Account__c);
                    
                    if (targetAccountDetails == NULL || targetAccountDetails.size() ==0){
                        Case vmCase = createCase(NULL, email);
                        vmCase.ContactId = lstSimilarContacts[0].Id;
                        INSERT vmCase;
                        
                        addAttachment(vmCase, email);
    
                        return result;
                    }
                    else{
                        Case vmCase = createCase(targetAccountDetails, email);
                        vmCase.ContactId = lstSimilarContacts[0].Id;
                        INSERT vmCase;
                        
                        addAttachment(vmCase, email);
    
                        return result;
                    }    
                } 
                else {
                    List<Account> targetAccountDetails = getTargetAccountDetails(mostEligibleContacts[0].Target_Account__c);
    
                    Case vmCase = createCase(targetAccountDetails, email);
                    vmCase.ContactId = mostEligibleContacts[0].Id;
                    INSERT vmCase;
                    
                    addAttachment(vmCase, email);
    
                    return result;
                }
            }
        }
        catch(Exception ex){
            new ApexDebugLog().createLog(
                new ApexDebugLog.Error(
                    'ProcessYBNVoicemail',
                    'handleInboundEmail',                    
                    '[ Similar Contacts:' + (lstSimilarContacts == NULL ? '' :String.join(lstSimilarContacts, ',')  ) + ']' +  
                    '[ Contact Phone :' + (contactPhone == NULL ? 'No PhoneNumber in the Subject' : contactPhone) + ']',
                    ex
                )
            );
            
            return result;
        }
    }
}