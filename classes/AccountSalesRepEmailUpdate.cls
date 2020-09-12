/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 05-Dec-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 05-Dec-2017
  Description ........: Updates the Sales Rep Email address on the Account Level if the 
  Sales Rep is a valid licensed Salesforce user; Association to User object is based on Sales Rep Name
*****************************************************************************/

public class AccountSalesRepEmailUpdate
{
    @InvocableMethod
    public static void UpdateSalesRepEmail(List<Id> accountIds)
    {
        try
        {
            if(accountIds.size() > 0){
                Map<String, Account> salesRepAcctMap = new Map<String, Account>();
                Map<String, User> userObjMap = new Map<String, User>();
                List<Account> dmlAccounts = new List<Account>();
                
                // get relevant Account details
                for(Account a :
                    [SELECT Id,
                            Sales_Rep_Name_YL__c,
                            Sales_Rep_Email__c,
                            Client_Type__c
                       FROM Account
                      WHERE Id IN: accountIds]){
                    
                    if(!a.Client_Type__c.contains('YBN') && !a.Client_Type__c.contains('National')){
                    
                        // set email as blank
                        a.Sales_Rep_Email__c = null;
                        dmlAccounts.add(a);
                    
                        if(String.IsNotBlank(a.Sales_Rep_Name_YL__c)){
                            // Add to Map
                            salesRepAcctMap.put(a.Sales_Rep_Name_YL__c, a);
                        }
                    }
                }
                
                // update email to blank
                if(dmlAccounts.size() > 0){
                    update dmlAccounts;
                }
                
                if(salesRepAcctMap.size() > 0){
                  
                    // Populate User Map
                    for(User u :
                        [SELECT Id,
                               Name,
                               Email
                          FROM User
                         WHERE Name IN: salesRepAcctMap.keyset()]){
                    
                        userObjMap.put(u.Name, u);
                    }
                    
                    // loop through Accounts and update values in Map based on match from User object on Name
                    for(Account ua : salesRepAcctMap.values()){
                    
                        if(String.IsNotBlank(ua.Sales_Rep_Name_YL__c) && String.IsNotBlank(userObjMap.get(ua.Sales_Rep_Name_YL__c).Email)){
                            ua.Sales_Rep_Email__c = (ua.Sales_Rep_Name_YL__c == userObjMap.get(ua.Sales_Rep_Name_YL__c).Name && String.IsNotBlank(userObjMap.get(ua.Sales_Rep_Name_YL__c).Email) ? userObjMap.get(ua.Sales_Rep_Name_YL__c).Email : '');
                        }
                    }
                    
                    // PERFORM UPDATE TO SALESFORCE Account
                    update salesRepAcctMap.values();
                }
            }
        }
        catch(Exception e)
        {
            System.Debug('An error occurred: ' + e.getMessage());
        }
    }
}