@isTest
private class NCSCaseCSCDateToMarketoBatchTest {
    
    @isTest static void test_NCSCaseCSCDateToMarketoBatch() {
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

        String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"updated"}]}';
        Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

        Account newAccount = new Account();
        newAccount.Name = 'Test Account';
        newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT()*2);
        newAccount.Status__c = 'LIVE';
        newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t3es78843778434t.444com';
        newAccount.Client_Type__c = 'Local';
        newAccount.Product_Type__c = 'LBW';
        newAccount.Live_Date__c = Date.today();
        newAccount.Sync_to_Marketo__c = true;
        insert newAccount;

        Case newCase = new Case();
        newCase.AccountId = newAccount.Id;
        newCase.RecordTypeId = [select Id, Name, DeveloperName, SobjectType from RecordType where Name = 'NCS - AutoLaunch' and SObjectType = 'Case'].Id;
        newCase.Reason = 'New Client Setup';
        newCase.Status = '1-MA Setup AutoLaunch';
        newCase.Sub_Status__c = 'New';
        newCase.OwnerId = UserInfo.getUserId();
        insert newCase;

        //newCase.GCC1_Date_Time__c = DateTime.now().addDays(2);
        //update newCase;

        Test.startTest();
        Database.executeBatch(new NCSCaseCSCDateToMarketoBatch());
        Test.stopTest();
    }
    
}