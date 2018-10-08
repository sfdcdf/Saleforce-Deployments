/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 25-Sept-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 8-Oct-2018
  Description ........: Class is used to parse the CTS Email contents/ details and
  update Case data and attachments on the Case record
  
  Oct 8 2018 Edit: Adding insert of EmailMessage on Auto Response message from CTS and
                   relates to Case record for visibility through UI in Email related list
                   on Page Layout; Error handling
*****************************************************************************/
global class ProcessCTSInboundMessage implements Messaging.InboundEmailHandler{

    List<Attachment> dmlAttachmentsToInsert = new List<Attachment>();
    Map<String, Integration_Configuration__mdt> configsMap = new Map<String, Integration_Configuration__mdt>();
    List<Case> dmlCasesToUpdateAR = new List<Case>();
    List<Case> dmlCasesToUpdateCC = new List<Case>();
    List<DebugInfo__c> dmlDebugLogsToInsert = new List<DebugInfo__c>();
    List<Task> dmlErrorTasks = new List<Task>();
    List<Task> dmlSuccessTasks = new List<Task>();
    List<String> notifToAddress = new List<String>();
    List<Messaging.SingleEmailMessage> notificationsLst = new List<Messaging.SingleEmailMessage>();
    List<EmailMessage> dmlEmailMsgs = new List<EmailMessage>();
    //String externalSystem = '';
    String ctsEmailConst = '';
    String sfdcEmailConst = '';
    String autoRespConst = '';
    String complTktConst = '';
    String kowensEmailConst = '';
    String itProAdmin1EmailConst = '';
    String sfdcSupportEmailConst = '';
    String fromAddress = '';
    String[] toAddresses;
    String toAddress = '';
    String subjectLine = '';
    String emailBody = '';
    String ctsTicketNumber = '';
    String sfdcCaseNumber = '';
    String notifFromAddress = '';
    String fromDisplayName = '';
    String notifSubjectLine = '';
    String notifBody = '';
    Integer ticketStart;
    Integer subjectLen;
    Integer caseStart;
    Integer caseEnd;
    Id automationAdminUser = [SELECT Id FROM User WHERE Alias = 'sauto' LIMIT 1].Id;
    Id itProQueue = [SELECT Id FROM Group WHERE Name = 'IT Pro SEO Optimization' LIMIT 1].Id;
    Id webCopywrite = [SELECT Id FROM User WHERE Alias = 'webcopy' LIMIT 1].Id;
    Id organicSetupId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Organic Setup').getRecordTypeId(); 
    Id lsAtvOrganicId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LS ATV Organic Setup').getRecordTypeId(); 
    Id lbwOrganicId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId(); 
    Set<Id> organicSetupIdsSet = new Set<Id>{organicSetupId, lsAtvOrganicId, lbwOrganicId};
    OrgWideEmailAddress[] owea = [SELECT Id FROM OrgWideEmailAddress WHERE Address = 'sfdc@yodle.com'];
       
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
            sfdcSupportEmailConst = configsMap.get('SupportEmail_sfdc').Configuration_Value__c;
            kowensEmailConst = configsMap.get('UserEmail_kowens').Configuration_Value__c;
            itProAdmin1EmailConst = configsMap.get('ITProEmail_agomez').Configuration_Value__c;
            //externalSystem = configsMap.get('ServiceAddressEmail_cts').External_System_Name__c;
        }
        
        //System.Debug('*** External System Name: ' + externalSystem);
        System.Debug('*** CTS Email: ' + ctsEmailConst);
        System.Debug('*** SFDC Email: ' + sfdcEmailConst);
        System.Debug('*** Auto Response Parse: ' + autoRespConst);
        System.Debug('*** Ticket Complete Parse: ' + complTktConst);
        System.Debug('*** Salesforce Support Email: ' + sfdcSupportEmailConst);
        System.Debug('*** Kami Owens Email: ' + kowensEmailConst);
        System.Debug('*** It Pro Admin A. Gomez Email: ' + itProAdmin1EmailConst);
        
        // set email message variable values
        fromAddress = email.fromAddress;
        toAddresses = email.toAddresses;
        subjectLine = email.subject;
        emailBody = email.plainTextBody;
        
        for(String s : toAddresses){
        
            toAddress += s + ', ';
        }
        
        toAddress = toAddress.removeEnd(', ');
        
        // parse the Email message properties for relevant Case data after validating
        try {
            
            for(String s : toAddresses){
                if(s == sfdcEmailConst){
                    
                    // start parsing to get data for validation and processing
                    subjectLen = subjectLine.Length();
                    ticketStart = subjectLine.LastIndexOf('tkt:');
                    ctsTicketNumber = subjectLine.substring(ticketStart, subjectLen).replace('tkt:', '').replace(']', '');
                    System.Debug('*** CTS Ticket Number: ' + ctsTicketNumber);
                        
                    // AUTO RESPONSE PROCESS
                    if(subjectLine.contains(autoRespConst)){
                        
                        caseStart = subjectLine.LastIndexOf('SFDCCase:');
                        caseEnd = subjectLine.IndexOf(']');
                        sfdcCaseNumber = subjectLine.substring(caseStart, caseEnd).replace('SFDCCase:', '').replace(']', '');
                        
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
                                
                                if(!String.IsBlank(arc.Id)){
                                
                                    // set update value
                                    arc.External_Ticket_ID__c = ctsTicketNumber;
                                    //arc.External_Ticket_System__c = externalSystem;
                                    
                                    // add to update list
                                    dmlCasesToUpdateAR.add(arc);
                                    
                                    // add to success task activity list
                                    Task newTsk = new Task();
                                    newTsk.OwnerId = automationAdminUser;
                                    newTsk.Description = 'Success receipt for Case # ' + arc.CaseNumber + ' from CTS Auto-response and updated the CTS Ticket # on the Case.';
                                    newTsk.Subject = 'SUCCESS: CTS Auto-response Message Received';
                                    newTsk.Priority = 'Normal';
                                    newTsk.Status = 'Completed';
                                    newTsk.WhatId = arc.Id;
                                    dmlSuccessTasks.add(newTsk);
                                    
                                    // add EmailMessage record related to Case
                                    EmailMessage newMsg = new EmailMessage();
                                    newMsg.FromAddress = ctsEmailConst;
                                    newMsg.ToAddress = sfdcEmailConst;
                                    newMsg.HtmlBody = 'CTS New Ticket # [' + ctsTicketNumber + '] auto-response notification confirming the receipt of SFDC Case details for new Ticket creation';
                                    newMsg.Incoming = true;
                                    newMsg.MessageDate = System.Now();
                                    newMsg.ParentId = arc.Id;
                                    newMsg.Status = '1';
                                    newMsg.Subject = subjectLine;
                                
                                    // add message to list for insert
                                    dmlEmailMsgs.add(newMsg);
                                
                                }
                            }
                        }
                        else{
                        
                            // send error email and log errors
                                
                            // both CTS Ticket Number and SFDC Case Number are missing
                            if(String.isBlank(sfdcCaseNumber) && String.isBlank(ctsTicketNumber)){
                                
                                System.Debug('**Error: Missing both Case and Ticket Number');
                                    
                                // prepare to write to Debug Info Log
                                DebugInfo__c debugInfo = new DebugInfo__c();
                                debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing CTS Ticket Number and SFDC Case Number';
                                dmlDebugLogsToInsert.add(debugInfo);
                                    
                                // send error email to SFDC Support
                                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                
                                notifFromAddress = sfdcSupportEmailConst;
                                fromDisplayName = 'Salesforce Notifications for CTS';
                                notifSubjectLine = 'CTS Integration Error: Both Case and Ticket Number Missing';
                                notifToAddress.add(sfdcSupportEmailConst);
                                notifBody = 'Below are the Error details related to the CTS Integration Process: <br/><br/>';
                                notifBody += '<b>Subject Line from Auto-response Message:</b> ' + subjectLine + '<br/><br/>';
                                notifBody += '<b>Error Details:</b> The Salesforce process <em>(ProcessCTSInboundMessage)</em> failed when receiving an auto-response email from CTS. The email subject line was missing the Case Number and Ticket Number<br/><br/>';
         
                                // set message content
                                message.setToAddresses(notifToAddress);
                                message.setReplyTo(notifFromAddress);
                                message.setOrgWideEmailAddressId(owea.get(0).Id);
                                message.setSubject(notifSubjectLine);
                                message.setHtmlBody(notifBody);
                                //message.ParentId = ;
    
                                notificationsLst.add(message);
                                    
                            }
                            // only CTS Ticket Number is missing
                            else if(!String.isBlank(sfdcCaseNumber) && String.isBlank(ctsTicketNumber)){
                                
                                System.Debug('**Error: Missing Ticket Number');
                                
                                String caseId = [SELECT Id FROM Case WHERE CaseNumber = :sfdcCaseNumber LIMIT 1].Id;
                                String concatNotifString = '';
                                
                                // prepare to write to Debug Info Log
                                DebugInfo__c debugInfo = new DebugInfo__c();
                                debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing CTS Ticket Number';
                                dmlDebugLogsToInsert.add(debugInfo);
                                
                                // send error email SFDC Support and create Error Task Activity on Case
                                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                
                                notifFromAddress = sfdcSupportEmailConst;
                                fromDisplayName = 'Salesforce Notifications for CTS';
                                notifSubjectLine = 'CTS Integration Error: Ticket Number Missing';
                                notifToAddress.add(sfdcSupportEmailConst);
                                notifBody = 'Below are the Error details related to the CTS Integration Process: <br/><br/>';
                                notifBody += '<b>Subject Line from Auto-response Message:</b> ' + subjectLine + '<br/><br/>';
                                notifBody += '<b>Error Details:</b> The Salesforce process <em>(ProcessCTSInboundMessage)</em> failed when receiving an auto-response email from CTS. The email subject line was missing the Ticket Number<br/><br/>';
         
                                // set message content
                                message.setToAddresses(notifToAddress);
                                message.setReplyTo(notifFromAddress);
                                message.setOrgWideEmailAddressId(owea.get(0).Id);
                                message.setSubject(notifSubjectLine);
                                message.setHtmlBody(notifBody);
                                
                                // add email notification to list to be sent
                                notificationsLst.add(message);
                                
                                for(String ns : notifToAddress){
                                    concatNotifString += ns + ', ';
                                }
                                
                                concatNotifString = concatNotifString.removeEnd(', ');
                                
                                // add email message to list to be related to Case
                                EmailMessage emailMsg = new EmailMessage();
                                emailMsg.ToAddress = concatNotifString;
                                emailMsg.Subject = notifSubjectLine;
                                emailMsg.HtmlBody = notifBody;
                                emailMsg.ParentId = caseId;
                                emailMsg.MessageDate = System.Now();
                                emailMsg.Status = '3';
                                dmlEmailMsgs.add(emailMsg);
                                
                                // add to error task activity list
                                Task newTsk = new Task();
                                newTsk.OwnerId = automationAdminUser;
                                newTsk.Description = 'Error receipt for Case # ' + sfdcCaseNumber + ' from CTS Auto-response. The CTS Ticket Number is Missing in the Subject Line.';
                                newTsk.Subject = 'CTS Auto-response Error Message';
                                newTsk.Priority = 'Normal';
                                newTsk.Status = 'Completed';
                                newTsk.WhatId = caseId;
                                dmlErrorTasks.add(newTsk);
                                
                            }
                            // only SFDC Case Number is missing
                            else{
                                
                                System.Debug('**Error: Missing Case Number');
                                    
                                // prepare to write to Debug Info Log
                                DebugInfo__c debugInfo = new DebugInfo__c();
                                debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing SFDC Case Number';
                                dmlDebugLogsToInsert.add(debugInfo);
                                    
                                // send error email to CTS and SFDC Support
                                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                
                                notifFromAddress = sfdcSupportEmailConst;
                                fromDisplayName = 'Salesforce Notifications for CTS';
                                notifSubjectLine = 'CTS Integration Error: Case Number Missing for CTS Ticket [tkt:' + ctsTicketNumber + ']';
                                notifToAddress.add(sfdcSupportEmailConst);
                                notifToAddress.add(ctsEmailConst);
                                notifBody = 'Below are the Error details related to the CTS Integration Process: <br/><br/>';
                                notifBody += '<b>Subject Line from Auto-response Message:</b> ' + subjectLine + '<br/><br/>';
                                notifBody += '<b>Error Details:</b> The Salesforce process <em>(ProcessCTSInboundMessage)</em> failed when receiving an auto-response email from CTS. The email subject line was missing the Case Number<br/><br/>';
         
                                // set message content
                                message.setToAddresses(notifToAddress);
                                message.setReplyTo(notifFromAddress);
                                message.setOrgWideEmailAddressId(owea.get(0).Id);
                                message.setSubject(notifSubjectLine);
                                message.setHtmlBody(notifBody);
    
                                notificationsLst.add(message);
                            }
                        }
                    }      
                    
                    // CONTENT COMPLETED RESPONSE PROCESS
                    if(subjectLine.contains(complTktConst)){
                        
                        // subject data validation; Need only Ticket # and need to check for attachment
                        if(!String.isBlank(ctsTicketNumber) && email.binaryAttachments != null && email.binaryAttachments.size() > 0){
                            
                            Id cId = [SELECT Id FROM Case WHERE External_Ticket_ID__c = :ctsTicketNumber LIMIT 1].Id;
                            Integer currDocCount = [SELECT COUNT() FROM ContentDocumentLink WHERE LinkedEntityId = :cId];
                            
                            System.Debug('*** Case Files Count: ' + String.valueOf(currDocCount));
                            
                            // make sure we have a valid Case before starting to process
                            if(!String.IsBlank(cId)){
                            
                                // get related Case and update the Owner if not already itProQue
                                for(Case ccc : 
                                    [SELECT Id,
                                            AccountId,
                                            External_Ticket_ID__c,
                                            External_Ticket_System__c,
                                            CaseNumber,
                                            Account.Client_ID__c,
                                            Account.Name,
                                            OwnerId
                                       FROM Case
                                      WHERE Id = :cId AND
                                            isClosed = false]){
                                    
                                    // Check for existing attachment and IT Pro owner
                                    if(!String.IsBlank(ccc.Id) && currDocCount > 0 && ccc.OwnerId == itProQueue){
                                    
                                        System.Debug('*** MORE THAN ONE SUBMISSION FOR CONTENT COMPLETE WITH ATTACHMENT');
                                    
                                        // Send CTS and Internal users error notification; another attachment request sent
                                        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                        
                                        notifFromAddress = sfdcSupportEmailConst;
                                        fromDisplayName = 'Salesforce Notifications for CTS';
                                        notifSubjectLine = 'CTS Integration Error: Multiple Attachment Requests for CTS Ticket # [tkt:' + ctsTicketNumber + ']';
                                        notifToAddress.add(sfdcSupportEmailConst);
                                        notifToAddress.add(ctsEmailConst);
                                        notifToAddress.add(kowensEmailConst);
                                        notifToAddress.add(itProAdmin1EmailConst);
                                        notifBody = 'Below are the Error details related to the CTS Integration Process: <br/><br/>';
                                        notifBody += '<b>Subject Line from Content Completed Message:</b> ' + subjectLine + '<br/><br/>';
                                        notifBody += '<b>Error Details:</b> Multiple attachment requests have been made for CTS Ticket #' + ctsTicketNumber + ' related to Salesforce Case #' + ccc.CaseNumber + '<br/><br/>';
                                        notifBody += '<b>Account Name:</b> ' + ccc.Account.Name + '<br/><br/>';
                                        notifBody += '<b>Client Id:</b> ' + ccc.Account.Client_ID__c + '<br/><br/>';
                                        notifBody += '<b>Case Number:</b> ' + ccc.CaseNumber + '<br/><br/>';
                                        notifBody += '<b>Ticket Number:</b> ' + ctsTicketNumber + '<br/><br/><br/>';
                                        notifBody += 'A new file has been added to this case. Please stop work if already In Progress and use the new file labeled <b>2_Final…</b> to complete the <b>LBW Content & BWT Tasks</b> process (for Lead Stream) or the <b>Content & BWT Tasks</b> process (for Yodle). If you have any questions, please reach out to Dana Parker or Kami Owens.<br/><br/>';
                 
                                        // set message content
                                        message.setToAddresses(notifToAddress);
                                        message.setReplyTo(notifFromAddress);
                                        message.setOrgWideEmailAddressId(owea.get(0).Id);
                                        message.setSubject(notifSubjectLine);
                                        message.setHtmlBody(notifBody);
                                        
                                        // add email notification to list to be sent
                                        notificationsLst.add(message);
                                        
                                        // add to attachment update list
                                        addAttachment(ccc, email);
                                        
                                        // add EmailMessage record related to Case
                                        EmailMessage newMsg = new EmailMessage();
                                        newMsg.FromAddress = notifFromAddress;
                                        newMsg.ToAddress = ctsEmailConst;
                                        newMsg.HtmlBody = notifBody;
                                        newMsg.Incoming = false;
                                        newMsg.MessageDate = System.Now();
                                        newMsg.ParentId = ccc.Id;
                                        newMsg.Status = '3';
                                        newMsg.Subject = 'CTS Integration Error: Multiple Attachment Requests for CTS Ticket # [tkt:' + ctsTicketNumber + ']';
                                    
                                        // add message to list for insert
                                        dmlEmailMsgs.add(newMsg);
                                    }
                                    
                                    // Check for existing attachment and owner; initial submission
                                    if(!String.IsBlank(ccc.Id) && ccc.OwnerId == webCopywrite){
                                        
                                        System.Debug('*** INITIAL SUBMISSION FOR CONTENT COMPLETE WITH ATTACHMENT; OWNER UPDATED');
                                        
                                        // set new owner value
                                        ccc.OwnerId = itProQueue;
                                            
                                        // add to update list
                                        dmlCasesToUpdateCC.add(ccc);
                                             
                                        // add to attachment update list
                                        addAttachment(ccc, email);
                                            
                                        // add to success task activity list
                                        Task newTsk = new Task();
                                        newTsk.OwnerId = automationAdminUser;
                                        newTsk.Description = 'Success receipt for Case # ' + ccc.CaseNumber + ' from CTS Content Completed and updated the Owner on the Case to IT Pro.';
                                        newTsk.Subject = 'SUCCESS: CTS Content Completed Message Received';
                                        newTsk.Priority = 'Normal';
                                        newTsk.Status = 'Completed';
                                        newTsk.WhatId = ccc.Id;
                                        dmlSuccessTasks.add(newTsk);
                                            
                                        // add EmailMessage record related to Case
                                        EmailMessage newMsg = new EmailMessage();
                                        newMsg.FromAddress = ctsEmailConst;
                                        newMsg.ToAddress = sfdcEmailConst;
                                        newMsg.HtmlBody = 'CTS Ticket # [' + ctsTicketNumber + '] Content Completed notification with valid attachment.';
                                        newMsg.Incoming = true;
                                        newMsg.MessageDate = System.Now();
                                        newMsg.ParentId = ccc.Id;
                                        newMsg.Status = '1';
                                        newMsg.Subject = subjectLine;
                                     
                                        // add message to list for insert
                                        dmlEmailMsgs.add(newMsg);
                                    }
                                    
                                    // Check for existing user; not Web Copy or IT Pro; do not process and send notification
                                    if(!String.IsBlank(ccc.Id) && ccc.OwnerId != webCopywrite && ccc.OwnerId != itProQueue){
                                        
                                        System.Debug('*** INITIAL SUBMISSION FOR CONTENT COMPLETE WITH ATTACHMENT; OWNER UPDATED');
                                        
                                        // set new owner value
                                        ccc.OwnerId = itProQueue;
                                            
                                        // add to update list
                                        dmlCasesToUpdateCC.add(ccc);
                                             
                                        // add to attachment update list
                                        addAttachment(ccc, email);
                                            
                                        // add to success task activity list
                                        Task newTsk = new Task();
                                        newTsk.OwnerId = automationAdminUser;
                                        newTsk.Description = 'Success receipt for Case # ' + ccc.CaseNumber + ' from CTS Content Completed and updated the Owner on the Case to IT Pro.';
                                        newTsk.Subject = 'SUCCESS: CTS Content Completed Message Received';
                                        newTsk.Priority = 'Normal';
                                        newTsk.Status = 'Completed';
                                        newTsk.WhatId = ccc.Id;
                                        dmlSuccessTasks.add(newTsk);
                                            
                                        // add EmailMessage record related to Case
                                        EmailMessage newMsg = new EmailMessage();
                                        newMsg.FromAddress = ctsEmailConst;
                                        newMsg.ToAddress = sfdcEmailConst;
                                        newMsg.HtmlBody = 'CTS Ticket # [' + ctsTicketNumber + '] Content Completed notification with valid attachment.';
                                        newMsg.Incoming = true;
                                        newMsg.MessageDate = System.Now();
                                        newMsg.ParentId = ccc.Id;
                                        newMsg.Status = '1';
                                        newMsg.Subject = subjectLine;
                                     
                                        // add message to list for insert
                                        dmlEmailMsgs.add(newMsg);
                                    }
                                }
                            }
                        }
                        else{
                            
                            // both CTS Ticket Number and attachment missing
                            if(String.isBlank(ctsTicketNumber) && email.binaryAttachments == null && email.binaryAttachments.size() < 1){
                                
                                System.Debug('**Error: Missing both Ticket Number and Attachment');
                                    
                                // prepare to write to Debug Info Log
                                DebugInfo__c debugInfo = new DebugInfo__c();
                                debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing CTS Ticket Number and Attachment';
                                dmlDebugLogsToInsert.add(debugInfo);
                                    
                                // send error email SFDC Support and create Error Task Activity on Case
                                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                
                                notifFromAddress = sfdcSupportEmailConst;
                                fromDisplayName = 'Salesforce Notifications for CTS';
                                notifSubjectLine = 'CTS Integration Error: Ticket Number and Attachment Missing';
                                notifToAddress.add(sfdcSupportEmailConst);
                                notifBody = 'Below are the Error details related to the CTS Integration Process: <br/><br/>';
                                notifBody += '<b>Subject Line from Content Completed Message:</b> ' + subjectLine + '<br/><br/>';
                                notifBody += '<b>Error Details:</b> The Salesforce process <em>(ProcessCTSInboundMessage)</em> failed when receiving an content completed email from CTS. The email subject line was missing the Ticket Number and the attachment was missing.<br/><br/>';
         
                                // set message content
                                message.setToAddresses(notifToAddress);
                                message.setReplyTo(notifFromAddress);
                                message.setOrgWideEmailAddressId(owea.get(0).Id);
                                message.setSubject(notifSubjectLine);
                                message.setHtmlBody(notifBody);
                                
                                // add email notification to list to be sent
                                notificationsLst.add(message);
                            }
                            // only CTS Ticket Number is missing
                            else if(String.isBlank(ctsTicketNumber) && email.binaryAttachments != null && email.binaryAttachments.size() > 0){
                                
                                System.Debug('**Error: Missing Ticket Number');
                                    
                                // prepare to write to Debug Info Log
                                DebugInfo__c debugInfo = new DebugInfo__c();
                                debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing CTS Ticket Number';
                                dmlDebugLogsToInsert.add(debugInfo);
                                    
                                // send error email to SFDC Support
                                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                
                                notifFromAddress = sfdcSupportEmailConst;
                                fromDisplayName = 'Salesforce Notifications for CTS';
                                notifSubjectLine = 'CTS Integration Error: CTS Ticket Number Missing';
                                notifToAddress.add(sfdcSupportEmailConst);
                                notifBody = 'Below are the Error details related to the CTS Integration Process: <br/><br/>';
                                notifBody += '<b>Subject Line from Content Completed Message:</b> ' + subjectLine + '<br/><br/>';
                                notifBody += '<b>Error Details:</b> The Salesforce process <em>(ProcessCTSInboundMessage)</em> failed when receiving an content completed email from CTS. The email subject line was missing the Ticket Number.<br/><br/>';
         
                                // set message content
                                message.setToAddresses(notifToAddress);
                                message.setReplyTo(notifFromAddress);
                                message.setOrgWideEmailAddressId(owea.get(0).Id);
                                message.setSubject(notifSubjectLine);
                                message.setHtmlBody(notifBody);
                                
                                // add email notification to list to be sent
                                notificationsLst.add(message);
                            }
                            // only attachment is missing
                            else{
                                
                                System.Debug('**Error: Missing Attachment');
                                
                                String caseId = [SELECT Id FROM Case WHERE External_Ticket_ID__c = :ctsTicketNumber LIMIT 1].Id;   
                                String cNumber = [SELECT CaseNumber FROM Case WHERE Id = :caseId LIMIT 1].Id;
                                String concatNotifString = '';
                                
                                // prepare to write to Debug Info Log
                                DebugInfo__c debugInfo = new DebugInfo__c();
                                debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing Attachment';
                                dmlDebugLogsToInsert.add(debugInfo);
                                    
                                // send error email to CTS and SFDC Support; create Error Task Activity on Case
                                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                
                                notifFromAddress = sfdcSupportEmailConst;
                                fromDisplayName = 'Salesforce Notifications for CTS';
                                notifSubjectLine = 'CTS Integration Error: Attachment Missing for CTS Ticket [tkt:' + ctsTicketNumber + ']';
                                notifToAddress.add(sfdcSupportEmailConst);
                                notifToAddress.add(ctsEmailConst);
                                notifBody = 'Below are the Error details related to the CTS Integration Process: <br/><br/>';
                                notifBody += '<b>Subject Line from Content Completed Message:</b> ' + subjectLine + '<br/><br/>';
                                notifBody += '<b>Error Details:</b> The Salesforce process <em>(ProcessCTSInboundMessage)</em> failed when receiving a Content Completed email from CTS. The email for Ticket #' + ctsTicketNumber + ' was missing the Attachment<br/><br/>';
         
                                // set message content
                                message.setToAddresses(notifToAddress);
                                message.setReplyTo(notifFromAddress);
                                message.setOrgWideEmailAddressId(owea.get(0).Id);
                                message.setSubject(notifSubjectLine);
                                message.setHtmlBody(notifBody);
    
                                notificationsLst.add(message);
                                
                                for(String ns : notifToAddress){
                                    concatNotifString += ns + ', ';
                                }
                                
                                concatNotifString = concatNotifString.removeEnd(', ');
                                
                                // add email message to list to be related to Case
                                EmailMessage emailMsg = new EmailMessage();
                                emailMsg.ToAddress = concatNotifString;
                                emailMsg.Subject = notifSubjectLine;
                                emailMsg.HtmlBody = notifBody;
                                emailMsg.ParentId = caseId;
                                emailMsg.MessageDate = System.Now();
                                emailMsg.Status = '3';
                                dmlEmailMsgs.add(emailMsg);
                                
                                // add to error task activity list
                                Task newTsk = new Task();
                                newTsk.OwnerId = automationAdminUser;
                                newTsk.Description = 'Error receipt for Case # ' + cNumber + ' from CTS Content Completed message. The attachment is missing from the email message.';
                                newTsk.Subject = 'ERROR: CTS Content Completed Error Message Generated';
                                newTsk.Priority = 'Normal';
                                newTsk.Status = 'Completed';
                                newTsk.WhatId = caseId;
                                dmlErrorTasks.add(newTsk);
                            }
                        }
                    }
                    
                    // CANNOT PROCESS MESSAGE BASED ON CONTENTS OF SUBJECT LINE
                    if(!subjectLine.contains(complTktConst) && !subjectLine.contains(autoRespConst)){
                    
                        System.Debug('**Error: Missing Keywords in Subject Line');
                                    
                        // prepare to write to Debug Info Log
                        DebugInfo__c debugInfo = new DebugInfo__c();
                        debugInfo.DebugData__c = 'Subject: ' + subjectLine + ' | Error: Missing Keywords in Subject Line to identify Auto Response or Completion';
                        dmlDebugLogsToInsert.add(debugInfo);
                        
                        // send error email to SFDC Support
                        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                            
                        notifFromAddress = sfdcSupportEmailConst;
                        fromDisplayName = 'Salesforce Notifications for CTS';
                        notifSubjectLine = 'CTS Integration Error: Keywords Missing in Subject Line';
                        notifToAddress.add(sfdcSupportEmailConst);
                        notifBody = 'Below are the Error details related to the CTS Integration Process: <br/><br/>';
                        notifBody += '<b>Subject Line from Content Completed Message:</b> ' + subjectLine + '<br/><br/>';
                        notifBody += '<b>Error Details:</b> The Salesforce process <em>(ProcessCTSInboundMessage)</em> failed when trying process an email from CTS. The Subject Line is missing keywords that identify the message.<br/><br/>';
                        
                        // set message content
                        message.setToAddresses(notifToAddress);
                        message.setReplyTo(notifFromAddress);
                        message.setOrgWideEmailAddressId(owea.get(0).Id);
                        message.setSubject(notifSubjectLine);
                        message.setHtmlBody(notifBody);
                                            
                        // add email notification to list to be sent
                        notificationsLst.add(message);
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
                    // Debug Info/ Errors Logged
                    if(dmlDebugLogsToInsert.size() > 0){
                        insert dmlDebugLogsToInsert;
                    }
                    // Task Successes Logged
                    if(dmlSuccessTasks.size() > 0){
                        insert dmlSuccessTasks;
                    }
                    // Task Errors Logged
                    if(dmlErrorTasks.size() > 0){
                        insert dmlErrorTasks;
                    }
                    // Send Notifications
                    if(notificationsLst.size() > 0){
                        Messaging.sendEmail(notificationsLst);
                    }
                    // Case Email Messages
                    if(dmlEmailMsgs.size() > 0){
                        insert dmlEmailMsgs;
                    }
                }
            }  
        }
        catch (Exception e) {
        
            System.debug('An Error occurred: ' + e);
            
            // log error
            DebugInfo__c debugInfo = new DebugInfo__c();
            debugInfo.DebugData__c = 'An error occurred Processing CTS Inbound email: ' + e.getMessage();
            dmlDebugLogsToInsert.add(debugInfo);
            
            // send error email to SFDC Support
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                                
            notifFromAddress = sfdcSupportEmailConst;
            fromDisplayName = 'Salesforce Notifications for CTS';
            notifSubjectLine = 'CTS Integration Error in ProcessCTSInboundMessage Apex Class';
            notifToAddress.add(sfdcSupportEmailConst);
            notifBody = 'Below are the Error details related to the CTS Integration Process: <br/><br/>';
            notifBody += '<b>Subject Line from Message:</b> ' + subjectLine + '<br/><br/>';
            notifBody += '<b>Error Details:</b> The Salesforce process <em>(ProcessCTSInboundMessage)</em> failed when trying process an email from CTS. ' + e.getMessage() + '<br/><br/>';
         
            // set message content
            message.setToAddresses(notifToAddress);
            message.setReplyTo(notifFromAddress);
            message.setOrgWideEmailAddressId(owea.get(0).Id);
            message.setSubject(notifSubjectLine);
            message.setHtmlBody(notifBody);
                                
            // add email notification to list to be sent
            notificationsLst.add(message);
            
            // Send Notifications
            if(notificationsLst.size() > 0){
                Messaging.sendEmail(notificationsLst);
            }
            // Debug Info/ Errors Logged
            if(dmlDebugLogsToInsert.size() > 0){
                insert dmlDebugLogsToInsert;
            }
        }
   
        // Set the result to true. No need to send an email back to the user with an error message
        result.success = true;
   
        // Return the result for the Apex Email Service
        return result;
    }
}