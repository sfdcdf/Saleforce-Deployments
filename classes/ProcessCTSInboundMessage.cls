/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 25-Sept-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 25-Sept-2018
  Description ........: Class is used to parse the CTS Email contents/ details and
  update Case data and attachments on the Case record
*****************************************************************************/
global class ProcessCTSInboundMessage implements Messaging.InboundEmailHandler{

    List<Attachment> dmlAttachmentsToInsert = new List<Attachment>();

    //Method to add Voicemail attachment to the create Case
    void addAttachment(Case insertedCase, Messaging.InboundEmail email){
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
            for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
                Attachment attachment = new Attachment();
                    
                // Attach to the newly created Case record
                attachment.ParentId = insertedCase.Id;
                attachment.Name = email.binaryAttachments[i].filename;
                attachment.Body = email.binaryAttachments[i].body;
                dmlAttachmentsToInsert.add(attachment);
            }
        }
    }

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
 
        // Define variables used
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        List<Case> dmlCasesToUpdateAR = new List<Case>();
        List<Case> dmlCasesToUpdateCC = new List<Case>();
        String ctsEmailConst = 'copywritingcts@web.com';
        String sfdcEmailConst = 'copywritingsfdc@web.com';
        String autoRespConst = 'ARMail';
        String complTktConst = 'ContentCompleted';
        String fromAddress = '';
        String[] toAddresses;
        String subjectLine = '';
        String emailBody = '';
        String ctsTicketNumber = '';
        String sfdcCaseNumber = '';
        Integer ticketStart;
        Integer subjectLen;
        Integer caseStart;
        Integer caseEnd;
        Id itProQueue = [SELECT Id FROM Group WHERE Name = 'IT Pro SEO Optimization' LIMIT 1].Id;
        Id organicSetupId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Organic Setup').getRecordTypeId(); 
        Id lsAtvOrganicId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LS ATV Organic Setup').getRecordTypeId(); 
        Id lbwOrganicId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId(); 
        Set<Id> organicSetupIdsSet = new Set<Id>{organicSetupId, lsAtvOrganicId, lbwOrganicId};
        
        // set email message variable values
        fromAddress = email.fromAddress;
        toAddresses = email.toAddresses;
        subjectLine = email.subject;
        emailBody = email.plainTextBody;
        
        // parse the Email message properties for relevant Case data after validating
        try {
            
            if(fromAddress == ctsEmailConst){
                for(String s : toAddresses){
                    if(s == sfdcEmailConst){
                    
                        // start parsing to get data for validation and processing
                        subjectLen = subjectLine.Length();
                        ticketStart = subjectLine.LastIndexOf('tkt:');
                        ctsTicketNumber = subjectLine.substring(ticketStart, subjectLen).replace('tkt:', '').replace(']', '');
                        caseStart = subjectLine.LastIndexOf('SFDCCase:');
                        caseEnd = subjectLine.IndexOf(']');
                        sfdcCaseNumber = subjectLine.substring(caseStart, caseEnd).replace('SFDCCase:', '').replace(']', '');
                        
                        System.Debug('**** CTS Ticket Number: ' + ctsTicketNumber);
                        
                        // AUTO RESPONSE PROCESS
                        if(subjectLine.contains(autoRespConst)){
                        
                            // subject data validation; Need both Case and Ticket #
                            if(!String.isBlank(sfdcCaseNumber) && !String.isBlank(ctsTicketNumber)){
                            
                                // get related Case by Case Number and update Ticket Number field
                                for(Case arc : 
                                    [SELECT Id,
                                            AccountId,
                                            CTS_Ticket_Number__c,
                                            CaseNumber,
                                            OwnerId
                                       FROM Case
                                      WHERE CaseNumber = :sfdcCaseNumber AND
                                            CTS_Ticket_Number__c = NULL]){
                                
                                    // set update value
                                    arc.CTS_Ticket_Number__c = ctsTicketNumber;
                                    
                                    // add to update list
                                    dmlCasesToUpdateAR.add(arc);
                                }
                            }
                            else{
                                // send error email template and log errors
                                
                                // both CTS Ticket Number and SFDC Case Number are missing
                                if(String.isBlank(sfdcCaseNumber) && String.isBlank(ctsTicketNumber)){
                                
                                }
                                // only CTS Ticket Number is missing
                                else if(String.isBlank(sfdcCaseNumber) && !String.isBlank(ctsTicketNumber)){
                                
                                }
                                // only SFDC Case Number is missing
                                else{
                                
                                }
                            }
                        }
                            
                        // CONTENT COMPLETED RESPONSE PROCESS
                        if(subjectLine.contains(complTktConst)){
                        
                            // subject data validation; Need only Ticket # and need to check for attachment
                            if(!String.isBlank(ctsTicketNumber) && email.binaryAttachments != null && email.binaryAttachments.size() > 0){
                            
                                // get related Case by CTS Ticket Number and update the Owner
                                for(Case ccc : 
                                    [SELECT Id,
                                            AccountId,
                                            CTS_Ticket_Number__c,
                                            CaseNumber,
                                            OwnerId
                                       FROM Case
                                      WHERE CaseNumber = :sfdcCaseNumber AND
                                            CTS_Ticket_Number__c = NULL]){
                                
                                    // set update value
                                    ccc.OwnerId = itProQueue;
                                    
                                    // add to update list
                                    dmlCasesToUpdateCC.add(ccc);
                                    
                                    // add to attachment update list
                                    addAttachment(ccc, email);
                                }
                            }
                            else{
                                // send error email template and log errors; CTS Ticket Number is missing
                                
                                // both CTS Ticket Number and attachment missing
                                if(String.isBlank(ctsTicketNumber) && email.binaryAttachments == null && email.binaryAttachments.size() < 1){
                                
                                }
                                // only CTS Ticket Number is missing
                                else if(String.isBlank(ctsTicketNumber) && email.binaryAttachments != null && email.binaryAttachments.size() > 0){
                                
                                }
                                // only attachment is missing
                                else{
                                
                                }
                            }
                        }
                        
                        // DML OPERATIONS
                        // Auto Response Case Update
                        if(dmlCasesToUpdateAR.size() > 0){
                            update dmlCasesToUpdateAR;
                        }
                        // Content Complete Case Update
                        if(dmlCasesToUpdateCC.size() > 0){
                            update dmlCasesToUpdateCC;
                        }
                        // Content Complete Attachment
                        if(dmlAttachmentsToInsert.size() > 0){
                            insert dmlAttachmentsToInsert;
                        }
                    }
                }                
            }
        }
        catch (Exception e) {
            System.debug('Issue: ' + e);
        }
   
        // Set the result to true. No need to send an email back to the user with an error message
        result.success = true;
   
        // Return the result for the Apex Email Service
        return result;
    }
}