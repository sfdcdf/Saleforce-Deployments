@isTest
private class TouchplanAutoCloseBatchTest {
    
    @isTest static void test_TouchplanAutoCloseBatch() {
        List<Case> caseList = new List<Case>();

        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        insert newAccount;

        Case newCase = new Case();
        newCase.AccountId = newAccount.Id;
        newCase.Auto_Close_Date__c = Date.today().addDays(-1);
        newCase.Reason = 'Account';
        newCase.Reason_Detail__c = 'Account Acceptance';
        insert newCase;

        Case newCase2 = new Case();
        newCase2.AccountId = newAccount.Id;
        newCase2.Auto_Close_Date__c = Date.today().addDays(-1);
        newCase2.Scheduled_Call__c = Date.today().addDays(1);
        newCase2.Reason = 'Account';
        newCase2.Reason_Detail__c = 'Account Acceptance';
        insert newCase2;

        Test.startTest();
            Database.executeBatch(new TouchplanAutoCloseBatch());
        Test.stopTest();
    }
    
}