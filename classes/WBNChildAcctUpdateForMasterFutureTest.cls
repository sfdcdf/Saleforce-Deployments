@isTest(seeAllData=true)
private class WBNChildAcctUpdateForMasterFutureTest
{
    private static testMethod void accountUpdateTest()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<Id> acctIds = new List<Id>();
        List<Account> dmlMasterAccounts = new List<Account>();
        List<Account> dmlAccounts = new List<Account>();
        Date todayDt = Date.Today();
        Id acctMasterTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('YBN Master Account').getRecordTypeId();
        Id acctStandardTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
        Id acctDirectorId = [SELECT Id FROM User WHERE Alias = 'sauto' LIMIT 1].Id;
        String clientType = 'YBN';
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        acct.RecordTypeId = acctMasterTypeId;
        acct.Individual_Location_Service_Level__c = 'Service Level C';
        acct.Bulk_Bing_AccountPL__c = 'No';
        acct.Bulk_Google_AccountPL__c = 'Yes';
        acct.Account_Director__c = acctDirectorId;
        dmlMasterAccounts.add(acct);
        
        if(dmlMasterAccounts.size() > 0){
            update dmlMasterAccounts;
        }
        
        Account newChildAcct = new Account();
        newChildAcct.Name = 'WBN Test Child';
        newChildAcct.RecordTypeId = acctStandardTypeId;
        newChildAcct.ParentId = acctId;
        newChildAcct.Client_Type__c = clientType;
        newChildAcct.Individual_Location_Service_Level__c = '';
        dmlAccounts.add(newChildAcct);
        
        if(dmlAccounts.size() > 0){
            insert dmlAccounts;
        }
        
        for(Account ma : dmlMasterAccounts){
            ma.Bulk_Bing_AccountPL__c = 'Yes';
            
            acctIds.add(ma.Id);
        }
        
        update dmlMasterAccounts;
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        WBNChildAcctUpdateForMasterFuture.updatedFieldsForParent(acctIds);
        
        Test.stopTest();
    }
}