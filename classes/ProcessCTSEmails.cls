/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 6-Dec-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 6-Dec-2018
  Description ........: Class is used to parse the CTS Email contents/ details and
  update Case data and attachments on the Case record
*****************************************************************************/
global class ProcessCTSEmails implements Messaging.InboundEmailHandler{

    List<Attachment> dmlAttachmentsToInsert = new List<Attachment>();
    List<Case> dmlCasesToUpdate = new List<Case>();
    List<Organic_Analysis__c> dmlOrganicCasesToUpdate = new List<Organic_Analysis__c>();
    List<Quality_Case__c> dmlQualityCasesToUpdate = new List<Quality_Case__c>();
    List<Customer_Surveys__c> dmlCustSurveysToUpdate = new List<Customer_Surveys__c>();
    List<Task> dmlTasksNew = new List<Task>();
    Integer objIdSubjStart;
    Integer objIdSubjEnd;
    String closedStatus;
    String objIdSubj;
    String fromAddress;
    String[] toAddresses;
    String subjectLine;
    String complTktConst;
    String sfdcListenerEmail;
    Id automationAdminUser = [SELECT Id FROM User WHERE Alias = 'sauto' LIMIT 1].Id;

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
 
        // Define variables used
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
   
        complTktConst = CTSSyncService.GetConfigValue('SubjectLineParse_contentcomplete');
        System.Debug('Completed Ticket Config Value: ' + complTktConst);
        
        sfdcListenerEmail = CTSSyncService.GetConfigValue('ListenerEmailSrvc_sfdc');
        System.Debug('SFDC Listener Config Value: ' + sfdcListenerEmail);
        
        fromAddress = email.fromAddress;
        toAddresses = email.toAddresses;
        subjectLine = email.subject;         
   
        try
        {
            // only process if Subject Line contains correct pattern/ Keyword(s)
            if(subjectLine.contains(complTktConst)){
                
                objIdSubjStart = subjectLine.LastIndexOf(': ');
                objIdSubjEnd = subjectLine.trim().length();
                objIdSubj = subjectLine.substring(objIdSubjStart, objIdSubjEnd);
                
                // Get proper Closed status based on SFDC Object being updated
                if(objIdSubj.contains('Survey-')){
                    closedStatus = CTSSyncService.GetConfigValue('CustomerSurveyStatus_closed');
                }
                else{
                    closedStatus = CTSSyncService.GetConfigValue('DefaultStatus_closed');
                }
                
                System.Debug('Closed Status selected: ' + closedStatus);
                    
                // Organic Case
                if(objIdSubj.contains('YO-')){
                    
                    for(Organic_Analysis__c oa :
                        [SELECT Id,
                                Name,
                                Status__c,
                                IsClosed__c
                           FROM Organic_Analysis__c
                          WHERE Name = :objIdSubj AND
                                IsClosed__c = false
                          LIMIT 1]){
                    
                        if(!String.isBlank(oa.Id)){
                            oa.Status__c = closedStatus;
                            dmlOrganicCasesToUpdate.add(oa);
                            
                            // add to new task activity list
                            Task newTsk = new Task();
                            newTsk.OwnerId = automationAdminUser;
                            newTsk.Description = 'CTS Inbound processing updated the status of Organic Case ' + oa.Name;
                            newTsk.Subject = 'Organic Case Status Updated by Automation';
                            newTsk.Priority = 'Normal';
                            newTsk.Status = 'Completed';
                            newTsk.WhatId = oa.Id;
                            dmlTasksNew.add(newTsk);
                        }  
                    }
                }
                // Quality Case
                else if(objIdSubj.contains('Q-')){
                
                    for(Quality_Case__c qc :
                        [SELECT Id,
                                Name,
                                Status__c,
                                IsClosed__c
                           FROM Quality_Case__c
                          WHERE Name = :objIdSubj AND
                                IsClosed__c = false
                          LIMIT 1]){
                    
                        if(!String.isBlank(qc.Id)){
                            qc.Status__c = closedStatus;
                            dmlQualityCasesToUpdate.add(qc);
                            
                            // add to new task activity list
                            Task newTsk = new Task();
                            newTsk.OwnerId = automationAdminUser;
                            newTsk.Description = 'CTS Inbound processing updated the status of Quality Case ' + qc.Name;
                            newTsk.Subject = 'Quality Case Status Updated by Automation';
                            newTsk.Priority = 'Normal';
                            newTsk.Status = 'Completed';
                            newTsk.WhatId = qc.Id;
                            dmlTasksNew.add(newTsk);
                        }  
                    }
                }
                // Customer Survey
                else if(objIdSubj.contains('Survey-')){
                
                    for(Customer_Surveys__c cs :
                        [SELECT Id,
                                Name,
                                Status__c
                           FROM Customer_Surveys__c
                          WHERE Name = :objIdSubj
                          LIMIT 1]){
                    
                        if(!String.isBlank(cs.Id)){
                            cs.Status__c = closedStatus;
                            dmlCustSurveysToUpdate.add(cs);
                            
                            // add to new task activity list
                            Task newTsk = new Task();
                            newTsk.OwnerId = automationAdminUser;
                            newTsk.Description = 'CTS Inbound processing updated the status of Customer Survey ' + cs.Name;
                            newTsk.Subject = 'Customer Survey Status Updated by Automation';
                            newTsk.Priority = 'Normal';
                            newTsk.Status = 'Completed';
                            newTsk.WhatId = cs.Id;
                            dmlTasksNew.add(newTsk);
                        }  
                    }
                }
                // Case
                else{
                
                    for(Case c :
                        [SELECT Id,
                                CaseNumber,
                                Status,
                                IsClosed
                           FROM Case
                          WHERE CaseNumber = :objIdSubj AND
                                IsClosed = false]){
                                
                        if(!String.isBlank(c.Id)){
                            c.Status = closedStatus;
                            dmlCasesToUpdate.add(c);
                            
                            // add to new task activity list
                            Task newTsk = new Task();
                            newTsk.OwnerId = automationAdminUser;
                            newTsk.Description = 'CTS Inbound processing updated the status of Case ' + c.CaseNumber;
                            newTsk.Subject = 'Case Status Updated by Automation';
                            newTsk.Priority = 'Normal';
                            newTsk.Status = 'Completed';
                            newTsk.WhatId = c.Id;
                            dmlTasksNew.add(newTsk);
                        }
                    }
                }
                
                // Update Cases
                if(dmlCasesToUpdate.size() > 0){
                    update dmlCasesToUpdate;
                }
                // Update Organic Cases
                if(dmlOrganicCasesToUpdate.size() > 0){
                    update dmlOrganicCasesToUpdate;
                }
                // Update Quality Cases
                if(dmlQualityCasesToUpdate.size() > 0){
                    update dmlQualityCasesToUpdate;
                }
                // Update Customer Surveys
                if(dmlCustSurveysToUpdate.size() > 0){
                    update dmlCustSurveysToUpdate;
                }
                // Create Task
                if(dmlTasksNew.size() > 0){
                    insert dmlTasksNew;
                }
                
                System.Debug('# Cases Updated: ' + String.valueOf(dmlCasesToUpdate.size()));
                System.Debug('# Organic Cases Updated: ' + String.valueOf(dmlOrganicCasesToUpdate.size()));
                System.Debug('# Quality Cases Updated: ' + String.valueOf(dmlQualityCasesToUpdate.size()));
                System.Debug('# Customer Surveys Updated: ' + String.valueOf(dmlCustSurveysToUpdate.size()));
            }  
        }
        catch(Exception e)
        {
            System.debug('An Error occurred in method handleInboundEmail: ' + e);
        }
   
        // Set the result to true. No need to send an email back to the user with an error message
        result.success = true;
   
        // Return the result for the Apex Email Service
        return result;
    }
    
    // Method to add attachment to related SObject
    void addAttachment(SObject relatedObject, Messaging.InboundEmail email){
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
            for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
                Attachment attachment = new Attachment();
                    
                // Attach to the related Object record
                attachment.ParentId = relatedObject.Id;
                attachment.Name = email.binaryAttachments[i].filename;
                attachment.Body = email.binaryAttachments[i].body;
                dmlAttachmentsToInsert.add(attachment);
            }
        }
    }
}