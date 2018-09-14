/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 21-Jun-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 14-Sep-2018
  Description ........: Schedulable class to execute WBN Notifications on a daily schedule.
  
  14-Sep-18 ER: updates to recipient list; ensure list and set is cleared prioir to populating
*****************************************************************************/
global class wbnNationalNCSStatusNotificationSchedule Implements Schedulable {

    global void execute(SchedulableContext sc) {
  
        sendWBNNotification();
    
    }
    
    public void sendWBNNotification(){
    
        Id wbnLogRecordTypeId = Schema.SObjectType.Notification_Log__c.getRecordTypeInfosByName().get('WBN Log').getRecordTypeId();
        Set<Id> caseIds = new Set<Id>();
        List<Messaging.SingleEmailMessage> notificationsLst = new List<Messaging.SingleEmailMessage>();
        Set<String> toAddressSet = new Set<String>();
        List<String> toAddress = new List<String>();
        List<Apex_Debug_Log__c> dmlDebugLog = new List<Apex_Debug_Log__c>();
        Map<Id, User> ownerMgrsMap = new Map<Id, User>();
        String fromAddress = 'sfdc@yodle.com';
        String fromDisplayName = 'Salesforce Notifications';
        String subjectLine = '';
        String sfdcURL = System.Url.getSalesforceBaseURL().toExternalForm() + '/';
        String cecilyBEmail = 'cbolton@yodle.com';
        OrgWideEmailAddress[] owea = [SELECT Id FROM OrgWideEmailAddress WHERE Address = 'sfdc@yodle.com'];
        //Id emailTemplateId = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'WBN_NCS_Status_Has_Not_Changed' LIMIT 1].Id;
        
        // populate Managers from User into Map to obtain Case Owner Manager details
        for(User u : 
            [SELECT Id,
                    Name,
                    Email,
                    ManagerId,
                    Manager.Name,
                    Manager.Email
               FROM User
              WHERE IsActive = true]){
        
            ownerMgrsMap.put(u.Id, u);
        }
        
        // get records in Notification Log for WBN Log Record Type, Case object, National NCS Cases, 
        // based on status, and for the current day only
        for(Notification_Log__c nl :
            [SELECT Record_Id__c
               FROM Notification_Log__c
              WHERE RecordTypeId = :wbnLogRecordTypeId AND
                    Record_Type_Name__c = 'National - New Client Setup' AND
                    SObject_Name__c = 'Case' AND
                    Trigger_Field_Name__c = 'Status' AND
                    Notification_Sent_Date__c = TODAY]){
            
            // the Notification Log Record Id values are Case Ids
            caseIds.add(nl.Record_Id__c);
        }
        
        try{
        
            if(caseIds.size() > 0){
            
                for(Case c :
                    [SELECT Id,
                            CreatedDate, 
                            OwnerId,
                            Owner.Name, 
                            Owner.Email, 
                            Account.IMS_Rep__r.Name, 
                            Account.IMS_Rep__r.Email, 
                            Account.Name,
                            Account.Client_ID__c,
                            CaseNumber,
                            Subject,
                            Status,
                            Sub_Status__c,
                            Next_Action_Date__c,
                            SEO_Product__c,
                            Status_Notes__c,
                            Account.IMS_Rep__c,
                            Sales_Person__c,
                            Sales_Person__r.Name
                       FROM Case
                      WHERE Id IN :caseIds]){
                    
                    // build list of email addresses to send to; first add to set to ensure unique values
                    toAddressSet.add(cecilyBEmail); // Cecily Bolton
                    
                    if(!String.isBlank(c.Account.IMS_Rep__r.Email)){
                        toAddressSet.add(c.Account.IMS_Rep__r.Email);
                    }
                    /*if(ownerMgrsMap.containsKey(c.OwnerId) && !String.isBlank(ownerMgrsMap.get(c.OwnerId).Manager.Email)){
                        toAddressSet.add(ownerMgrsMap.get(c.OwnerId).Manager.Email);
                    }*/
                    if(!String.isBlank(c.Owner.Email)){
                        toAddressSet.add(c.Owner.Email);
                    }
                    
                    // loop through set and add to list
                    for(String s : toAddressSet){
                    
                        if(!String.isBlank(s)){
                            toAddress.add(s);
                        }
                    }
                    
                     // check to ensure there are recipients to send notification to
                    if(toAddress.size() > 0){
                    
                        // send notifications
                        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                        String body = 'Hello, <br/><br/>';
                        body += 'This NCS Case # ' + c.CaseNumber + ' needs review. The case status has not changed in 3 business days. Please add any pertinent notes as comments within the case for stakeholders to reference.<br/><br/>';
                        body += '<b>Account:</b> ' + c.Account.Client_ID__c + ' - ' + c.Account.Name + '<br/>';
                        body += '<b>Subject:</b> ' + c.Subject + '<br/><br/>';
                        body += '<b>Status:</b> ' + c.Status + '<br/>';
                        body += '<b>Sub Status:</b> ' + (String.isBlank(c.Sub_Status__c) ? null : c.Sub_Status__c) + '<br/></br>';
                        body += '<b>Next Action Date:</b> ' + (String.isBlank(String.valueOf(c.Next_Action_Date__c)) ? null : c.Next_Action_Date__c.format()) + '<br/><br/>';
                        body += '<b>Product:</b> ' + c.SEO_Product__c + '<br/>';
                        body += '<b>Status Notes:</b> ' + c.Status_Notes__c + '<br/></br>';
                        body += '<b>Case Owner:</b> ' + c.Owner.Name + '<br/>';
                        body += '<b>IMS Rep:</b> ' + c.Account.IMS_Rep__r.Name + '<br/>';
                        body += '<b>Sales Person:</b> ' + c.Sales_Person__r.Name + '<br/></br></br>';
                        body += '<b>Link to Case:</b> ' + sfdcURL + c.Id + '<br/>';
                        
                        // Dynamic Subject Line
                        subjectLine = 'NCS - Case Status Has Not Changed: ' + c.Account.Name + ' : ' + c.Status;
                        
                        // set message content
                        message.setToAddresses(toAddress);
                        message.setReplyTo(fromAddress);
                        message.setOrgWideEmailAddressId(owea.get(0).Id);
                        //message.setTemplateId(emailTemplateId);
                        message.setSubject(subjectLine);
                        message.setHtmlBody(body);
                        
                        // add message to notification list
                        notificationsLst.add(message);
                        
                        // clear recipient list
                        toAddressSet.clear(); // clear Set
                        toAddress.clear(); // clear list
                    }
                }
                
                // ensure there are messages to be sent
                if(notificationsLst.size() > 0){
                
                    // send notifications
                    Messaging.sendEmail(notificationsLst);
                }
            }
        }
        catch (Exception e){
        
            Apex_Debug_Log__c newDebugLog = new Apex_Debug_Log__c();
            newDebugLog.Apex_Class__c = 'wbnNationalNCSStatusNotificationSchedule';
            newDebugLog.Message__c = e.getMessage();
            newDebugLog.Method__c = 'sendWBNNotification';
            newDebugLog.Record_Id__c = 'Notification Log Records for ' + String.valueOf(System.TODAY());
            newDebugLog.Stack_Trace__c = e.getMessage();
            newDebugLog.Type__c = 'Error';
            dmlDebugLog.add(newDebugLog);
        
            if(dmlDebugLog.size() > 0){
                insert dmlDebugLog;
            }
        }
    }
}