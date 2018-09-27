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
    Map<String, Integration_Configuration__mdt> configsMap = new Map<String, Integration_Configuration__mdt>();
    List<Case> dmlCasesToUpdateAR = new List<Case>();
    List<Case> dmlCasesToUpdateCC = new List<Case>();
    List<DebugInfo__c> dmlDebugLogsToInsert = new List<DebugInfo__c>();
    //String externalSystem = '';
    String ctsEmailConst = '';
    String sfdcEmailConst = '';
    String autoRespConst = '';
    String complTktConst = '';
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
        
    // Method to add attachment to related Case
    void addAttachment(Case relatedCase, Messaging.InboundEmail email){
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
            for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
                Attachment attachment = new Attachment();
                    
                // Attach to the related Case record
                attachment.ParentId = relatedCase.Id;
                attachment.Name = email.binaryAttachments[i].filename;
                attachment.Body = email.binaryAttachments[i].body;
                dmlAttachmentsToInsert.add(attachment);
            }
        }
    }

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
 
        // Define variables used
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        // Populate Configuration Map
        for(Integration_Configuration__mdt ic :
            [SELECT Id, 
                    External_System_Name__c, 
                    MasterLabel, 
                    Configuration_Label__c, 
                    Data_Type__c, 
                    Configuration_Value__c 
               FROM Integration_Configuration__mdt 
              WHERE Is_Active__c = true AND
                    External_System_Name__c = 'CTS']){
                
            configsMap.put(ic.Configuration_Label__c, ic);
        }
        
        for(Integration_Configuration__mdt conf : configsMap.values()){
        
            // set configuration variables from integration configuration metadata
            ctsEmailConst = configsMap.get('ServiceAddressEmail_cts').Configuration_Value__c;
            sfdcEmailConst = configsMap.get('ServiceAddressEmail_sfdc').Configuration_Value__c;
            autoRespConst = configsMap.get('SubjectLineParse_armail').Configuration_Value__c;
            complTktConst = configsMap.get('SubjectLineParse_contentcomplete').Configuration_Value__c;
            //externalSystem = configsMap.get('ServiceAddressEmail_cts').External_System_Name__c;
        }
        
        //System.Debug('*** External System Name: ' + externalSystem);
        System.Debug('*** CTS Email: ' + ctsEmailConst);
        System.Debug('*** SFDC Email: ' + sfdcEmailConst);
        System.Debug('*** Auto Response Parse: ' + autoRespConst);
        System.Debug('*** Ticket Complete Parse: ' + complTktConst);
        
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
                        
                        System.Debug('*** CTS Ticket Number: ' + ctsTicketNumber);
                        
                        // AUTO RESPONSE PROCESS
                        if(subjectLine.contains(autoRespConst)){
                        
                            // subject data validation; Need both Case and Ticket #
                            if(!String.isBlank(sfdcCaseNumber) && !String.isBlank(ctsTicketNumber)){
                            
                                // get related Case by Case Number and update Ticket Number field
                                for(Case arc : 
                                    [SELECT Id,
                                            AccountId,
                                            External_Ticket_ID__c,
                                            External_Ticket_System__c,
                                            CaseNumber,
                                            OwnerId
                                       FROM Case
                                      WHERE CaseNumber = :sfdcCaseNumber AND
                                            External_Ticket_ID__c = NULL AND
                                            isClosed = false]){
                                
                                    // set update value
                                    arc.External_Ticket_ID__c = ctsTicketNumber;
                                    //arc.External_Ticket_System__c = externalSystem;
                                    
                                    // add to update list
                                    dmlCasesToUpdateAR.add(arc);
                                }
                            }
                            else{
                                // send error email template and log errors
                                
                                // both CTS Ticket Number and SFDC Case Number are missing
                                if(String.isBlank(sfdcCaseNumber) && String.isBlank(ctsTicketNumber)){
                                
                                    System.Debug('**Error: Missing both Case and Ticket Number');
                                    
                                    // prepare to write to Debug Info Log
                                    DebugInfo__c debugInfo = new DebugInfo__c();
                                    debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing CTS Ticket Number and SFDC Case Number';
                                    dmlDebugLogsToInsert.add(debugInfo);
                                    
                                    // send error email to CTS and SFDC Support
                                    
                                }
                                // only CTS Ticket Number is missing
                                else if(String.isBlank(sfdcCaseNumber) && !String.isBlank(ctsTicketNumber)){
                                
                                    System.Debug('**Error: Missing Ticket Number');
                                    
                                    // prepare to write to Debug Info Log
                                    DebugInfo__c debugInfo = new DebugInfo__c();
                                    debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing CTS Ticket Number';
                                    dmlDebugLogsToInsert.add(debugInfo);
                                    
                                    // send error email to CTS and SFDC Support
                                }
                                // only SFDC Case Number is missing
                                else{
                                
                                    System.Debug('**Error: Missing Case Number');
                                    
                                    // prepare to write to Debug Info Log
                                    DebugInfo__c debugInfo = new DebugInfo__c();
                                    debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing SFDC Case Number';
                                    dmlDebugLogsToInsert.add(debugInfo);
                                    
                                    // send error email to CTS and SFDC Support
                                }
                            }
                        }
                            
                        // CONTENT COMPLETED RESPONSE PROCESS
                        if(subjectLine.contains(complTktConst)){
                        
                            // subject data validation; Need only Ticket # and need to check for attachment
                            if(!String.isBlank(ctsTicketNumber) && email.binaryAttachments != null && email.binaryAttachments.size() > 0){
                            
                                // get related Case by CTS Ticket Number and update the Owner if not already itProQue
                                for(Case ccc : 
                                    [SELECT Id,
                                            AccountId,
                                            External_Ticket_ID__c,
                                            External_Ticket_System__c,
                                            CaseNumber,
                                            OwnerId
                                       FROM Case
                                      WHERE External_Ticket_ID__c = :ctsTicketNumber AND
                                            OwnerId != :itProQueue AND
                                            isClosed = false]){
                                
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
                                
                                    System.Debug('**Error: Missing both Ticket Number and Attachment');
                                    
                                    // prepare to write to Debug Info Log
                                    DebugInfo__c debugInfo = new DebugInfo__c();
                                    debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing CTS Ticket Number and Attachment';
                                    dmlDebugLogsToInsert.add(debugInfo);
                                    
                                    // send error email to CTS and SFDC Support
                                }
                                // only CTS Ticket Number is missing
                                else if(String.isBlank(ctsTicketNumber) && email.binaryAttachments != null && email.binaryAttachments.size() > 0){
                                
                                    System.Debug('**Error: Missing Ticket Number');
                                    
                                    // prepare to write to Debug Info Log
                                    DebugInfo__c debugInfo = new DebugInfo__c();
                                    debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing CTS Ticket Number';
                                    dmlDebugLogsToInsert.add(debugInfo);
                                    
                                    // send error email to CTS and SFDC Support
                                }
                                // only attachment is missing
                                else{
                                
                                    System.Debug('**Error: Missing Attachment');
                                    
                                    // prepare to write to Debug Info Log
                                    DebugInfo__c debugInfo = new DebugInfo__c();
                                    debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing Attachment';
                                    dmlDebugLogsToInsert.add(debugInfo);
                                    
                                    // send error email to CTS and SFDC Support
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
            System.debug('An Error occurred: ' + e);
        }
   
        // Set the result to true. No need to send an email back to the user with an error message
        result.success = true;
   
        // Return the result for the Apex Email Service
        return result;
    }
}