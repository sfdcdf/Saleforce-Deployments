/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 23-Oct-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 23-Oct-2018
  Description ........: Class contains invocable method to update child Account 
  specific fields based Parent Account.
*****************************************************************************/
public class WBNParentAcctUpdateForStandard
{
    @InvocableMethod
    public static void newParentForStandard(List<Id> acctIds)
    {
        try{
            
            Set<Id> parentIdsSet = new Set<Id>();
            Map<Id, Account> childAcctsMap = new Map<Id, Account>();
            Map<Id, Account> parentAcctsMap = new Map<Id, Account>();
            List<Account> dmlAccounts = new List<Account>();
            
            for(Account a :
                [SELECT ParentId,
                        Id,
                        Individual_Location_Service_Level__c,
                        Bulk_Bing_AccountPL__c,
                        Bulk_Google_AccountPL__c,
                        Lead_Analyst__c,
                        Sales_Director__c
                   FROM Account
                  WHERE Id IN :acctIds]){
                
                System.Debug('*** Parent Id: ' + a.ParentId);
                      
                if(!String.IsBlank(a.ParentId)){
                    
                    // populate child map
                    childAcctsMap.put(a.Id, a);
                          
                    // add parent Id to Set
                    parentIdsSet.add(a.ParentId);
                }
            }
            
            if(parentIdsSet.size() > 0){
            
                // populate Map based on Parent Ids
                for(Account a :
                    [SELECT ParentId,
                            Id,
                            Individual_Location_Service_Level__c,
                            Bulk_Bing_AccountPL__c,
                            Bulk_Google_AccountPL__c,
                            Lead_Analyst__c,
                            Sales_Director__c
                       FROM Account
                      WHERE Id IN :parentIdsSet]){
                    
                    // populate parent Map
                    parentAcctsMap.put(a.Id, a);
                }
            
                // loop through Account Maps
                for(Account pa : parentAcctsMap.values()){
                
                    for(Account ca : childAcctsMap.values()){
                    
                       System.Debug('*** Inside Parent/ Child: ' + pa.Individual_Location_Service_Level__c + '/ ' + ca.Individual_Location_Service_Level__c);
                    
                        if(pa.Id == ca.ParentId){
                            
                            // check for Service Level being blank on child and update only if blank
                            if(String.IsBlank(ca.Individual_Location_Service_Level__c) && !String.IsBlank(pa.Individual_Location_Service_Level__c)){
                            
                                // update child value to match parent
                                ca.Individual_Location_Service_Level__c = pa.Individual_Location_Service_Level__c;
                            }
                            
                            // update child value to match parent
                            ca.Bulk_Bing_AccountPL__c = pa.Bulk_Bing_AccountPL__c;
                            
                            // update child value to match parent
                            ca.Bulk_Google_AccountPL__c = pa.Bulk_Google_AccountPL__c;
                            
                            // add Account to update list
                            dmlAccounts.add(ca);
                        }
                    }
                }
                
                // check for necessary updates and execute
                if(dmlAccounts.size() > 0){
                    update dmlAccounts;
                }
            }
        }
        catch(Exception ex){
        
            List<Apex_Debug_Log__c> dmlDebugLogs  = new List<Apex_Debug_Log__c>();
            System.Debug('An error occurred: ' + ex.getMessage());
            
            Apex_Debug_Log__c dbLog = new Apex_Debug_Log__c();
            dbLog.Apex_Class__c = 'CreateCasesCSC';
            dbLog.Message__c = ex.getMessage();
            dbLog.Method__c = 'CreateCasesCSC(Invocable)';
            dbLog.Record_Id__c = '';
            dbLog.Stack_Trace__c = ex.getMessage();
            dbLog.Type__c = 'Error';
        
            dmlDebugLogs.add(dbLog);
            
            if(dmlDebugLogs.size() > 0){
                insert dmlDebugLogs;
            }
        }
    }
}