@isTest(seeAllData=true)
private class AccountSalesRepEmailUpdateTest
{
    private static testMethod void updateSalesRepEmailTest()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<Id> acctIds = new List<Id>();
        List<Account> dmlAccounts = new List<Account>();
        
        String salesRepName = [SELECT Name FROM User WHERE IsActive = true LIMIT 1].Name;
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        String acctClientId = '123456799';
        string acctClientType = 'Local';
        
        acct.Sales_Rep_Email__c = 'test123@test.com';
        acct.Sales_Rep_Name_YL__c = salesRepName;
        acct.Client_Type__c = acctClientType;
        acct.Client_Id__c = acctClientId;
        dmlAccounts.add(acct);
        
        System.Debug('Account from (Account): ' + acctName);
        
        if(dmlAccounts.size() > 0){
            update dmlAccounts;
            
            for(Account a : dmlAccounts){
                acctIds.add(a.Id);
            }
        }
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        AccountSalesRepEmailUpdate.UpdateSalesRepEmail(acctIds);
        
        Test.stopTest();
    }
}