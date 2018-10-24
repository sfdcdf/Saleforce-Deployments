/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 23-Oct-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 23-Oct-2018
  Description ........: Class contains invocable method to update child Account 
  specific fields based Parent Account.
*****************************************************************************/
public class WBNChildAcctUpdateForMaster
{
    @InvocableMethod
    public static void updatedFieldsForParent(List<Id> acctIds)
    {
        try{
            
            Map<Id, Account> childAcctsMap = new Map<Id, Account>();
            Map<Id, Account> parentAcctsMap = new Map<Id, Account>();
            List<Account> dmlAccounts = new List<Account>();
            
            for(Account a :
                [SELECT Id,
                        Bulk_Bing_AccountPL__c,
                        Bulk_Google_AccountPL__c
                   FROM Account
                  WHERE Id IN :acctIds]){
                      
                if(!String.IsBlank(a.Id)){
                    
                    // populate Parent/ Master map
                    parentAcctsMap.put(a.Id, a);
                }
            }
            
            System.Debug('*** Parent Map Size: ' + String.valueOf(parentAcctsMap.size()));
            
            if(parentAcctsMap.size() > 0){
            
                // populate Child Map based on Parent Ids
                for(Account a :
                    [SELECT ParentId,
                            Id,
                            Bulk_Bing_AccountPL__c,
                            Bulk_Google_AccountPL__c
                       FROM Account
                      WHERE ParentId IN :acctIds]){
                    
                    // populate Child Map
                    childAcctsMap.put(a.Id, a);
                }
            
                // loop through Account Maps
                for(Account pa : parentAcctsMap.values()){
                
                    for(Account ca : childAcctsMap.values()){
                    
                        System.Debug('*** Inside Parent/ Child Maps Loop');
                    
                        if(pa.Id == ca.ParentId){
                            
                            // update child field values to match parent
                            ca.Bulk_Bing_AccountPL__c = pa.Bulk_Bing_AccountPL__c;
                            ca.Bulk_Google_AccountPL__c = pa.Bulk_Google_AccountPL__c;
                            
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