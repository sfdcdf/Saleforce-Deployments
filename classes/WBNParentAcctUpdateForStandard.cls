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
            Id ybnMasterAcct = Schema.SObjectType.Account.getRecordTypeInfosByName().get('YBN Master Account').getRecordTypeId();
            
            for(Account a :
                [SELECT ParentId,
                        Id,
                        Individual_Location_Service_Level__c,
                        Bulk_Bing_AccountPL__c,
                        Bulk_Google_AccountPL__c,
                        Lead_Analyst__c,
                        Sales_Director__c,
                        Account_Director__c
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
            
            System.Debug('*** Parent Id Set Size: ' + String.valueOf(parentIdsSet.size()));
            
            if(parentIdsSet.size() > 0){
            
                // populate Map based on Parent Ids
                for(Account a :
                    [SELECT ParentId,
                            Id,
                            Individual_Location_Service_Level__c,
                            Bulk_Bing_AccountPL__c,
                            Bulk_Google_AccountPL__c,
                            Lead_Analyst__c,
                            Sales_Director__c,
                            Account_Director__c
                       FROM Account
                      WHERE Id IN :parentIdsSet AND
                            RecordTypeId = :ybnMasterAcct]){
                    
                    // populate parent Map
                    parentAcctsMap.put(a.Id, a);
                }
            
                // loop through Account Maps
                for(Account pa : parentAcctsMap.values()){
                
                    for(Account ca : childAcctsMap.values()){
                    
                       System.Debug('*** Inside Parent/ Child Maps Loop');
                    
                        if(pa.Id == ca.ParentId){
                            
                            System.Debug('*** Match on Parent Child Maps');
                            
                            // check for Service Level being blank on child and update only if blank
                            if(String.IsBlank(ca.Individual_Location_Service_Level__c) && !String.IsBlank(pa.Individual_Location_Service_Level__c)){
                            
                                System.Debug('*** Individual Location Update Criteria Met');
                            
                                // update child value to match parent
                                ca.Individual_Location_Service_Level__c = pa.Individual_Location_Service_Level__c;
                            }
                            
                            // check for Account Director being blank on child and update only if blank
                            if(String.IsBlank(ca.Account_Director__c) && !String.IsBlank(pa.Account_Director__c)){
                            
                                System.Debug('*** Account Director Criteria Met');
                            
                                // update child value to match parent
                                ca.Account_Director__c= pa.Account_Director__c;
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
        
            System.Debug('An error occurred: ' + ex.getMessage());
        }
    }
}