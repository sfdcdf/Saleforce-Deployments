/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 21-Jun-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 16-Jul-2018
  Description ........: Schedulable class to execute WBN Notifications on a daily schedule.
*****************************************************************************/
global class wbnNationalNCSStatusNotificationSchedule Implements Schedulable {

    global void execute(SchedulableContext sc) {
  
        sendWBNNotification();
    
    }
    
    public void sendWBNNotification(){
    
        Set<Id> caseIds = new Set<Id>();
        List<Messaging.SingleEmailMessage> notificationsLst = new List<Messaging.SingleEmailMessage>();
        Set<String> toAddressSet = new Set<String>();
        List<String> toAddress = new List<String>();
        List<Apex_Debug_Log__c> dmlDebugLog = new List<Apex_Debug_Log__c>();
        Map<Id, User> ownerMgrsMap = new Map<Id, User>();
        String fromAddress = 'sfdc@yodle.com';
        String fromDisplayName = 'Salesforce Notifications';
        String subjectLine = '';
        OrgWideEmailAddress[] owea = [SELECT Id FROM OrgWideEmailAddress WHERE Address = 'sfdc@yodle.com'];
        
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
        
        // get records in Notification Log for current day only
        for(Notification_Log__c nl :
            [SELECT Record_Id__c
               FROM Notification_Log__c
              WHERE Record_Type_Name__c = 'National - New Client Setup' AND
                    SObject_Name__c = 'Case' AND
                    Trigger_Field_Name__c = 'Status' AND
                    Notification_Sent_Date__c = TODAY]){
            
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
                            CaseNumber,
                            Status
                       FROM Case
                      WHERE Id IN :caseIds]){
                          
                    // build list of email addresses to send to; first add to set to ensure unique values
                    if(!String.isBlank(c.Account.IMS_Rep__r.Email)){
                        toAddressSet.add(c.Account.IMS_Rep__r.Email);
                    }
                    if(ownerMgrsMap.containsKey(c.OwnerId) && !String.isBlank(ownerMgrsMap.get(c.OwnerId).Manager.Email)){
                        toAddressSet.add(ownerMgrsMap.get(c.OwnerId).Manager.Email);
                    }
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
                        String body = 'You are being sent this notification because the status of the Case detail listed below has not changed for at least 3 days. Please review and ensure no action is required.<br/><br/><br/>';
                        body += '<b>Case #:</b> ' + c.CaseNumber + '<br/><br/>';
                        body += '<b>Account:</b> ' + c.Account.Name + '<br/><br/>';
                        body += '<b>Case Status:</b> ' + c.Status + '<br/><br/>';
                        body += '<b>Case Owner:</b> ' + c.Owner.Name + '<br/><br/>';
                        body += '<b>Created Date:</b> ' + c.CreatedDate.format() + '<br/><br/>';
                        
                        // Dynamic Subject Line
                        subjectLine = c.Account.Name + ' - No Change to New Client Setup Case Status';
                        
                        // set message content
                        message.setToAddresses(toAddress);
                        message.setReplyTo(fromAddress);
                        message.setOrgWideEmailAddressId(owea.get(0).Id);
                        message.setSubject(subjectLine);
                        message.setHtmlBody(body);
                        
                        // add message to notification list
                        notificationsLst.add(message);
                        
                        // ensure there are messages to be sent
                        if(notificationsLst.size() > 0){
                        
                            // send notifications
                            Messaging.sendEmail(notificationsLst);
                        }
                    }
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