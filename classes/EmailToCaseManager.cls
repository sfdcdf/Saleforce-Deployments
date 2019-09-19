public class EmailToCaseManager {
    //Global Variables, Properties and Classes
    private static String CatchAllQueue {
        get {
            return 'YBN_E2C_Catch_all';
        }
    }

    //Support Setting Keys
    private static String SSK_E2CSubstituteCaseOwners {
        get {
            return 'E2C_Substitute_Case_Owners';
        }
    }

    //Public Methods begin
    @future
    public static void manageEmail2CaseAsync(Set < Id > setEmailMessages) {
        manageEmail2CaseSync(
            [
                SELECT  Id,
                        ParentId,
                        ToAddress,
                        FromAddress
                FROM    EmailMessage
                WHERE   Id IN : setEmailMessages
                LIMIT   10000
            ]
        );
    }

    public static void manageEmail2CaseSync(List < EmailMessage > lstEmailMessages) {
        
     List < Contact > lstSimilarContactsDebug;
         
     try{    
        Set < String > e2cSubstituteCaseOwners = getSupportSetting(SSK_E2CSubstituteCaseOwners);

        System.debug('5 Emails are : ' + e2cSubstituteCaseOwners);
        
        for (EmailMessage eMsgDebug: lstEmailMessages) {
                 lstSimilarContactsDebug = [
                    SELECT  Id,
                            Email,
                            AccountId,
                            Alternate_Email__c,
                            Target_Account_E2C__c
                    FROM    Contact
                    WHERE   Email = : eMsgDebug.FromAddress OR 
                            Alternate_Email__c = : eMsgDebug.FromAddress
                    LIMIT   500
                ];
        }

        //Begin iterating in a for loop
        for (EmailMessage eMsg: lstEmailMessages) {
            System.debug('email message from address is :' + eMsg.FromAddress);
            System.debug('email message To  address is :' + eMsg.ToAddress);
            System.debug('email message Case ID is :' + eMsg.ParentId);

            //Deciding which flow path to take
            //****************************Right part of the Flowchart**********************************
            if (e2cSubstituteCaseOwners.contains(eMsg.ToAddress)) {
                System.debug('Entered the right path because one of 5 emails was located');

                //Find all YBN Contacts which have the From Email in Email or Alternate Email field
                List < Contact > lstSimilarContacts = [
                    SELECT  Id,
                            Email,
                            AccountId,
                            Alternate_Email__c,
                            Target_Account_E2C__c
                    FROM    Contact
                    WHERE   Email = : emsg.FromAddress OR 
                            Alternate_Email__c = : emsg.FromAddress
                    LIMIT   50000
                ];

                System.debug('Number of Contacts found is: ' + lstSimilarContacts.size());
                System.debug('list of Contacts is: ' + lstSimilarContacts);

                Set < Id > similarConsIds = new Set < Id > ();
                for (Contact con: lstSimilarContacts) {
                    similarConsIds.add(con.Id);
                }
                
                if(lstSimilarContacts != NULL && lstSimilarContacts.size() > 0){
                    YodleUtilities.flagEligibleContactByEmail(lstSimilarContacts);
                    System.debug('Called YodleUtilities flagEligibleContactByEmail method');
                    
                    lstSimilarContacts = [
                        SELECT  Id,
                                Email,
                                AccountId,
                                Alternate_Email__c,
                                Target_Account_E2C__c
                        FROM    Contact
                        WHERE   Id IN :lstSimilarContacts
                        LIMIT   50000
                    ];
                    
                    System.debug('Updated Contacts After Flagging: ' + lstSimilarContacts);
                }
                

                //*********No Contacts found*********
                if (lstSimilarContacts == NULL || lstSimilarContacts.size() == 0) {
                    System.debug('***No Contacts found****** part entered');

                    Case emailCase = updateCaseRight(eMsg.ParentId, NULL);
                    
                    System.debug('Case returned via right method');

                    UPDATE(emailCase);

                    System.debug('Case Owner Id AFTER update is: ' + emailCase.OwnerId);
                    System.debug('Case Account Id AFTER update is: ' + emailCase.AccountId);
                    System.debug('Case Contact Id AFTER update is: ' + emailCase.ContactId);
                    System.debug('Updated Case ID is: ' + emailCase.Id);
                }

                //***** One Contact found*************
                else if (lstSimilarContacts.size() == 1) {
                    System.debug(' **** Only one Contact found******  part entered');

                    List < Account > targetAccountDetails = getTargetAccountDetails(lstSimilarContacts[0].Target_Account_E2C__c);

                    System.debug('Target Account Id is : ' + targetAccountDetails[0].Id);

                    Case emailCase = updateCaseRight(eMsg.ParentId, targetAccountDetails);
                    emailCase.ContactId = lstSimilarContacts[0].Id;

                    UPDATE(emailCase);

                    System.debug('Case Owner Id AFTER update is: ' + emailCase.OwnerId);
                    System.debug('Case Account Id AFTER update is: ' + emailCase.AccountId);
                    System.debug('Case Contact Id AFTER update is: ' + emailCase.ContactId);
                    System.debug('Updated Case ID is: ' + emailCase.Id);
                }

                //******Multiple Contacts Found - Find most eligible Contact*****
                else {
                    System.debug('******Multiple Contacts found********* part entered');

                    List < Contact > mostEligibleContacts = [
                        SELECT  Id,
                                Target_Account_E2C__c
                        FROM    Contact
                        WHERE   Id IN: similarConsIds AND 
                                Most_Eligible_E2C__c = TRUE
                        LIMIT   50000
                    ];

                    System.debug('Number of most eligible Contacts found is :' + mostEligibleContacts.size());

                    //This would never happen but still taking care of it
                    if (mostEligibleContacts == NULL || mostEligibleContacts.size() == 0) {
                        List < Account > targetAccountDetails = getTargetAccountDetails(lstSimilarContacts[0].Target_Account_E2C__c);
                        if (targetAccountDetails == NULL || targetAccountDetails.size() == 0) {
                            Case emailCase = updateCaseRight(eMsg.ParentId, NULL);
                            emailCase.ContactId = lstSimilarContacts[0].Id;

                            UPDATE(emailCase);

                            System.debug('Case Owner Id AFTER update is: ' + emailCase.OwnerId);
                            System.debug('Case Account Id AFTER update is: ' + emailCase.AccountId);
                            System.debug('Case Contact Id AFTER update is: ' + emailCase.ContactId);
                            System.debug('Updated Case ID is: ' + emailCase.Id);
                        }
                        // Not the most eligible Contact but still has a target Account? Not likely but still including it
                        else {
                            Case emailCase = updateCaseRight(eMsg.ParentId, targetAccountDetails);
                            emailCase.ContactId = lstSimilarContacts[0].Id;

                            UPDATE(emailCase);

                            System.debug('Case Owner Id AFTER update is: ' + emailCase.OwnerId);
                            System.debug('Case Account Id AFTER update is: ' + emailCase.AccountId);
                            System.debug('Case Contact Id AFTER update is: ' + emailCase.ContactId);
                            System.debug('Updated Case ID is: ' + emailCase.Id);
                        }
                    }

                    //Most Eligible Contact is found! If multiple found, we are choosing the first one
                    else {
                        List < Account > targetAccountDetails = getTargetAccountDetails(mostEligibleContacts[0].Target_Account_E2C__c);

                        Case emailCase = updateCaseRight(eMsg.ParentId, targetAccountDetails);
                        emailCase.ContactId = mostEligibleContacts[0].Id;

                        UPDATE(emailCase);

                        System.debug('Case Owner Id AFTER update is: ' + emailCase.OwnerId);
                        System.debug('Case Account Id AFTER update is: ' + emailCase.AccountId);
                        System.debug('Case Contact Id AFTER update is: ' + emailCase.ContactId);
                        System.debug('Updated Case ID is: ' + emailCase.Id);
                    }
                }
            }

            //****************************Left part of the Flowchart**********************************
            else {
                System.debug('Entered the Left path because none of the 5 Emails is the To Email');

                Id caseOwnerId = getOwnerId(eMsg.ToAddress);
                Id caseContactId = getContactId(eMsg.FromAddress);

                Case emailCase = updateCaseLeft(eMsg.ParentId, caseOwnerId, caseContactId);
                System.debug('Case returned via Left method');

                UPDATE(emailCase);

                System.debug('Case Owner Id AFTER update is: ' + emailCase.OwnerId);
                System.debug('Case Account Id AFTER update is: ' + emailCase.AccountId);
                System.debug('Case Contact Id AFTER update is: ' + emailCase.ContactId);
                System.debug('Updated Case ID is: ' + emailCase.Id);
            }
         }
      }
       
       catch(Exception ex){
            new ApexDebugLog().createLog(
                new ApexDebugLog.Error(
                    'EmailtoCaseManager',
                    'manageEmail2CaseSync',
                     '[ Similar Contacts:' + String.join(lstSimilarContactsDebug, ',') + ']' +
                     '[ Email Messages:' + String.join(lstEmailMessages, ',') + ']',
                    ex
                )
            );
        }
    }


    //Internal Helper Methods
    //Method to update Case on the Right Side of Flow using details grabbed from Email message #
    private static Case updateCaseRight(Id caseId, List < Account > targetAccountDetails) {

        System.debug('Entered updateCaseRight method');

        //Get Catch All Queue
        Group grpCatchAllQueue = [
            SELECT  Id
            FROM    Group
            WHERE   Type = 'Queue' AND
                    DeveloperName = : CatchAllQueue
            LIMIT 1
        ];

        System.debug('Catch all queue ID : ' + grpCatchAllQueue.Id);

        //Get Case to be updated 
        List < Case > caseFromEmailMsg = [
            SELECT  Id,
                    AccountId,
                    ContactId,
                    OwnerId,
                    Origin
            FROM    Case
                    WHERE Id = : caseId
            LIMIT 1
        ];

        System.debug('Parent case found , ID is : ' + caseFromEmailMsg[0].Id);

        //Have to check for YBN Email Origin to avoid local cases getting updated          
        if (caseFromEmailMsg[0].Origin == 'YBN Email') {
            //Assign OwnerID and Target Account depending upon Target Account is NULL or Not
            if (targetAccountDetails != NULL && targetAccountDetails.size() != 0) {
                if (
                    targetAccountDetails[0].RecordType.DeveloperName == 'YBN_Corporate_Relationship' && 
                    targetAccountDetails[0].Lead_Consultant__c != NULL
                ) {
                    caseFromEmailMsg[0].OwnerId = targetAccountDetails[0].Lead_Consultant__c;
                } else if (
                    targetAccountDetails[0].RecordType.DeveloperName == 'Standard' && 
                    targetAccountDetails[0].IMS_Rep__c != NULL
                ) {
                    caseFromEmailMsg[0].OwnerId = targetAccountDetails[0].IMS_Rep__c;
                } else {
                    caseFromEmailMsg[0].OwnerId = grpCatchAllQueue.Id;
                }

                caseFromEmailMsg[0].AccountId = targetAccountDetails[0].Id;
            } else {
                caseFromEmailMsg[0].AccountId = NULL;
                caseFromEmailMsg[0].OwnerId = grpCatchAllQueue.Id;
            }

            caseFromEmailMsg[0].ContactId = NULL;
        }

        System.debug('Case Owner Id before update is: ' + caseFromEmailMsg[0].OwnerId);
        System.debug('Case Account Id before update is: ' + caseFromEmailMsg[0].AccountId);
        System.debug('Case Contact Id before update is: ' + caseFromEmailMsg[0].ContactId);

        return caseFromEmailMsg[0];
    }

    //Method to update Case on the Left Side of Flow using details grabbed from Email message 
    private static Case updateCaseLeft(Id caseId, Id caseOwnerId, Id caseContactId) {
        //Get Case to be updated 
        List < Case > caseFromEmailMsg = [
            SELECT  Id,
                    AccountId,
                    ContactId,
                    OwnerId,
                    Origin
            FROM    Case
            WHERE   Id = : caseId
            LIMIT   1
        ];

        if (caseFromEmailMsg[0].Origin == 'YBN Email') {
            caseFromEmailMsg[0].OwnerId = caseOwnerId;
            caseFromEmailMsg[0].ContactId = caseContactId;
            
            if(caseContactId != NULL){
                //Grab Contact account and target account details
                List < Contact > lstContactDetails = [
                    SELECT  Id,
                            Target_Account_E2C__c,
                            Email,
                            Alternate_Email__c,
                            AccountId
                    FROM    Contact
                    WHERE   Id = : caseContactId
                    LIMIT   50000
                ];
    
    
                YodleUtilities.flagEligibleContactByEmail(lstContactDetails);
    
                if (lstContactDetails[0].Target_Account_E2C__c != NULL) {
                    caseFromEmailMsg[0].AccountId = lstContactDetails[0].Target_Account_E2C__c;
                } else {
                    caseFromEmailMsg[0].AccountId = lstContactDetails[0].AccountId;
                }
            }
            else{
                caseFromEmailMsg[0].AccountId = NULL;
            }
        }

        return caseFromEmailMsg[0];
    }

    //Method to get Target Account Details to be used during Case creation  
    private static List < Account > getTargetAccountDetails(Id accountId) {

        List < Account > targetAccountDetails = [
            SELECT  RecordType.DeveloperName,
                    Lead_Consultant__c,
                    IMS_Rep__c
            FROM    Account
            WHERE   Id = : accountId
            LIMIT   50000
        ];

        return targetAccountDetails;
    }  
      
    //Method to get Owner ID for Case for the left part of flow
    private static Id getOwnerId(String toOwnerEmail) {
        System.debug('Left part: Entered the getOwnerId method using the emMsg.ToEmail');
        
        
        //Get Catch All Queue
        Group grpCatchAllQueue = [
            SELECT  Id
            FROM    Group
            WHERE   Type = 'Queue' AND
                    DeveloperName = : CatchAllQueue
            LIMIT 1
        ];

        //Query the To Email and find a user/(s) with that Email
        List < User > ownerLst = [
            SELECT  Id,
                    Email
            FROM    User
            WHERE   Email = : toOwnerEmail
            LIMIT   50000
        ];

        //Begin logic to find the owner of the Case
        Id caseOwnerId;

        if (ownerLst.size() == 0 || ownerLst == NULL) {
            caseOwnerId = grpCatchAllQueue.Id;
            System.debug('Owner user not found in Salesforce');
        } else {
            caseOwnerId = ownerLst[0].Id;
             System.debug('Owner user found and appropriately assigned in Salesforce');
        }

        return caseOwnerId;
    }

    //Method to get Contact ID for Case for the left part of flow
    private static Id getContactId(String fromContactEmail) {
        //Find all YBN Contacts which have the From Email in Email or Alternate Email field
        List < Contact > lstSimilarContacts = [
            SELECT  Id,
                    Email,
                    AccountId,
                    Alternate_Email__c,
                    Target_Account_E2C__c
            FROM    Contact
            WHERE   Email = : fromContactEmail OR 
                    Alternate_Email__c = : fromContactEmail
            LIMIT   50000
        ];

        System.debug('Left part: Number of Contacts found is: ' + lstSimilarContacts.size());
        System.debug('Left Part: list of Contacts is: ' + lstSimilarContacts);

        Set < Id > similarConsIds = new Set < Id > ();
        for (Contact con: lstSimilarContacts) {
            similarConsIds.add(con.Id);
        }

        Id caseContactId;
        if (lstSimilarContacts == NULL || lstSimilarContacts.size() == 0) {
            System.debug('***Left part: No Contacts found****** part entered');
            caseContactId = NULL;
        } else if (lstSimilarContacts.size() == 1) {
            System.debug(' **** Only one Contact found******  part entered');
            caseContactId = lstSimilarContacts[0].Id;
        } else {
            System.debug('******Multiple Contacts found********* part entered');
                    
            List < Contact > mostEligibleContacts = [
                SELECT  Id,
                        Target_Account_E2C__c
                FROM    Contact
                WHERE   Id IN: similarConsIds AND 
                        Most_Eligible_E2C__c = TRUE
                LIMIT   50000
            ];

            System.debug('Number of most eligible Contacts found is :' + mostEligibleContacts.size());

            if (mostEligibleContacts == NULL || mostEligibleContacts.size() == 0) {
                caseContactId = lstSimilarContacts[0].Id;
            } else {
                caseContactId = mostEligibleContacts[0].Id;
            }
        }

        return caseContactId;
    }

    //Get the Support Settings into a Set
    private static Set < String > getSupportSetting(String settingName) {
        Support_Setting__mdt supportSetting = [
            SELECT  Value__c
            FROM    Support_Setting__mdt
            WHERE   DeveloperName = :settingName
        ];

        Set < String > settingValues = new Set < String > ();

        //Split the text in the Value__c field with comma as the Delmiter
        settingValues.addAll(supportSetting.Value__c.split(','));

        return settingValues;
    }
}