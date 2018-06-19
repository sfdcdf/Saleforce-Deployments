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
        List<Case> ncsCaseNotificationsList = new List<Case>();
        
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
        
        if(caseHistMap.size() > 0 && scope.size() > 0){
        
            // compare National NCS Cases to Case History
            for(Case c : (List<Case>) scope){
                if(!caseHistMap.containsKey(c.Id)){
                    ncsCaseNotificationsList.add(c);
                }
            }
        }
    }
   
    global void finish(Database.BatchableContext BC) 
    {

    }

}