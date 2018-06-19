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
    public String query = 'SELECT Id, CreatedDate, Owner.Name, Owner.Email, Account.IMS_Rep__r.Name, Account.IMS_Rep__r.Email, Account.IMS_Rep__r.Manager.Name, Account.IMS_Rep__r.Manager.Email,' +
                          'AccountId, Account.Name, CaseNumber, Status, RecordType.Name ' +
                          'FROM Case ' +
                          'WHERE RecordType.Name IN :recordTypeNameIncludeSet AND ' +
                          'IsClosed = false AND ' +
                          'Status NOT IN :statusExcludeSet AND ' +
                          'Owner.Type IN :ownerTypeIncludeSet AND ' +
                          'AccountId NOT IN :acctIdsExcludeSet AND ' +
                          'Owner.Profile.Name NOT IN :profileExcludeSet AND ' +
                          'AccountId != NULL AND ' +
                          'CreatedDate = :Date.TODAY().addDays(-3)';
    
    global database.querylocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
        List<Case_Status_Change_Log__c> dmlChangeLogs = new List<Case_Status_Change_Log__c>();
        
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
                    CreatedDate = LAST_N_DAYS: 30 AND 
                    Case.RecordType.Name = 'National - New Client Setup' 
           ORDER BY CreatedDate DESC]){
        
            caseHistMap.put(ch.CaseId, ch);
        }
        
        // put Case History data into Map
        Map<Id, Case_Status_Change_Log__c> caseChangeLogMap = new Map<Id, Case_Status_Change_Log__c>();
        for(Case_Status_Change_Log__c cl :
            [SELECT Id,
                    CaseId__c,
                    Case_Status__c,
                    Notification_Sent_Date__c
               FROM Case_Status_Change_Log__c
              WHERE Notification_Sent_Date__c = :Date.TODAY().addDays(-3)]){
            
            caseChangeLogMap.put(cl.CaseId__c, cl);
        }
        
        if(scope.size() > 0){
        
            // compare National NCS Cases to Case History & Case Change Log
            for(Case c : (List<Case>) scope){
                if(!caseHistMap.containsKey(c.Id) || (caseChangeLogMap.get(c.Id).CaseId__c == c.Id && caseChangeLogMap.get(c.Id).Case_Status__c == c.Status)){
                
                    Case_Status_Change_Log__c newChangeLog = new Case_Status_Change_Log__c();
                    newChangeLog.CaseId__c = c.Id;
                    newChangeLog.Case_Status__c = c.Status;
                    newChangeLog.Notification_Sent_Date__c = System.Now();
                    dmlChangeLogs.add(newChangeLog);
                }
            }
        }
    }
   
    global void finish(Database.BatchableContext BC) 
    {
        // send notifications from change log from current day
    }

}