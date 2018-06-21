/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 19-Jun-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 19-Jun-2018
  Description ........: Sends a notification to specified internal users if the status of a
  National - New Client Setup Case has not changed within the last 3 days
*****************************************************************************/
global class wbnNationalNCSStatusNotificationBatch implements Database.Batchable<sObject> 
{
    public Set<String> acctIdsExcludeSet = new Set<String>{'0013200001ASiCOAA1', '0013200001CEoFOAA1', '0013200001IypE7AAJ'}; // Test Accounts
    public Set<String> statusExcludeSet = new Set<String>{'Client Problem', 'Never Launched', 'LIVE', 'On Hold'};
    public Set<String> recordTypeNameIncludeSet = new Set<String>{'National - New Client Setup'};
    public Set<String> ownerTypeIncludeSet = new Set<String>{'User'};
    public Set<String> profileExcludeSet = new Set<String>{'System Administrator', 'API Integration Read/Write'};
    public Id logRecordTypeId = Schema.SObjectType.Notification_Log__c.getRecordTypeInfosByName().get('WBN Log').getRecordTypeId();
    public String query = 'SELECT Id, Status, RecordType.Name ' +
                          'FROM Case ' +
                          'WHERE RecordType.Name IN :recordTypeNameIncludeSet AND ' +
                          'IsClosed = false AND ' +
                          'Status NOT IN :statusExcludeSet AND ' +
                          'Owner.Type IN :ownerTypeIncludeSet AND ' +
                          'AccountId NOT IN :acctIdsExcludeSet AND ' +
                          'Owner.Profile.Name NOT IN :profileExcludeSet AND ' +
                          'AccountId != NULL AND ' +
                          'CreatedDate = LAST_N_DAYS: 4';
    
    // BATCH START
    global database.querylocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator(query);
    }
    
    // BATCH EXECUTION
    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
        List<Notification_Log__c> dmlChangeLogs = new List<Notification_Log__c>();
        Date d = System.Today().addDays(-3);
        
        // put Case History data into Map
        Map<Id, CaseHistory> caseHistMap = new Map<Id, CaseHistory>();
        for(CaseHistory ch :
            [SELECT Id, 
                    CreatedDate, 
                    CaseId, 
                    Case.CaseNumber, 
                    Case.AccountId, 
                    Field, 
                    OldValue, 
                    NewValue 
               FROM CaseHistory 
              WHERE Field = 'Status' AND 
                    CreatedDate = LAST_N_DAYS: 4 AND 
                    Case.RecordType.Name = 'National - New Client Setup' 
           ORDER BY CreatedDate DESC]){
        
            caseHistMap.put(ch.CaseId, ch);
        }
        
        // put current Notification Log data into Map
        Map<Id, Notification_Log__c> notificationLogMap = new Map<Id, Notification_Log__c>();
        for(Notification_Log__c nlm :
            [SELECT Id,
                    Notification_Sent_Date__c,
                    Record_Id__c,
                    Record_Type_Name__c,
                    SObject_Name__c,
                    Trigger_Field_Name__c,
                    Trigger_Value__c
               FROM Notification_Log__c
              WHERE Notification_Sent_Date__c = LAST_N_DAYS: 4]){
            
            notificationLogMap.put(nlm.Record_Id__c, nlm);
        }
        
        // compare National NCS Cases to Case History & Notification Log
        for(Case c : (List<Case>) scope){
            
            // only check Cases created 3 days ago from the in scope list of Cases
            if(c.CreatedDate.date() == d){
            
                // check for the Case not in the current Case History or Case record being in the Notification Log and the Status not changed
                if(!caseHistMap.containsKey(c.Id) || (notificationLogMap.get(c.Id).Record_Id__c == c.Id && notificationLogMap.get(c.Id).Trigger_Value__c == c.Status)){
                    
                    // Add new record to List
                    Notification_Log__c newChangeLog = new Notification_Log__c();
                    newChangeLog.RecordTypeId = logRecordTypeId;
                    newChangeLog.Record_Id__c = c.Id;
                    newChangeLog.Record_Type_Name__c = 'National - New Client Setup';
                    newChangeLog.SObject_Name__c = 'Case';
                    newChangeLog.Trigger_Field_Name__c = 'Status';
                    newChangeLog.Trigger_Value__c = c.Status;
                    newChangeLog.Notification_Sent_Date__c = System.Now();
                    dmlChangeLogs.add(newChangeLog);
                }
            }
        }
            
        if(dmlChangeLogs.size() > 0){
        
            // Insert New Log Records from List
            insert dmlChangeLogs;
        }
    }
    
    // BATCH FINISH
    global void finish(Database.BatchableContext BC) 
    {
        Set<Id> caseIds = new Set<Id>();
        List<Messaging.SingleEmailMessage> notificationsLst = new List<Messaging.SingleEmailMessage>();
        List<String> toAddress = new List<String>();
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
            
                // build list of email addresses to send to
                if(!String.isBlank(c.Account.IMS_Rep__r.Email)){
                    toAddress.add(c.Account.IMS_Rep__r.Email);
                }
                if(!String.isBlank(ownerMgrsMap.get(c.OwnerId).Manager.Email)){
                    toAddress.add(ownerMgrsMap.get(c.OwnerId).Manager.Email);
                }
                if(!String.isBlank(c.Owner.Email)){
                    toAddress.add(c.Owner.Email);
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
}