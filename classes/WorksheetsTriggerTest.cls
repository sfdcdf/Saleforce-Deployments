@isTest
private class WorksheetsTriggerTest {
    
    @isTest static void test_beforeTriggerWithCompleteStatus() {
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

        List<Account> newAccountList = new List<Account>();
        List<Account> updateAccountList = new List<Account>();
        List<Case> newCaseList = new List<Case>();
        List<MLS__c> newMlsList = new List<MLS__c>();
        List<Account_MLS__c> newAcctMlsList = new List<Account_MLS__c>();
        List<Worksheets__c> newWkshtList = new List<Worksheets__c>();

        Account testAccount = new Account();
        testAccount.Name = 'Test Name';
        newAccountList.add(testAccount);
        insert newAccountList;

        Case testCase = new Case();
        testCase.RecordTypeId = Case.sObjectType.getDescribe().getRecordTypeInfosByName().get('NCS - AutoLaunch').getRecordTypeId();
        testCase.AccountId = testAccount.Id;
        newCaseList.add(testCase);
        insert newCaseList;

        MLS__c testMLS = new MLS__c();
        testMLS.Name = 'Test Name';
        testMLS.MLS_Code__c = 'tasdfdaf';
        //testMLS.State__c = 'TX';
        newMlsList.add(testMLS);
        insert newMlsList;

        Account_MLS__c testAcctMLS = new Account_MLS__c();
        testAcctMLS.Account__c = testAccount.Id;
        testAcctMLS.MLS__c = testMLS.Id;
        newAcctMlsList.add(testAcctMLS);
        insert newAcctMlsList;

        Test.startTest();
        Worksheets__c testWorksheet = new Worksheets__c();
        testWorksheet.RecordTypeId = Worksheets__c.sObjectType.getDescribe().getRecordTypeInfosByName().get('MLS Worksheet').getRecordTypeId();
        testWorksheet.Parent_Case__c = testCase.Id;
        testWorksheet.Account_Name__c = testAccount.Id;
        testWorksheet.Status__c = 'Complete';
        testWorksheet.All_Account_MLS_Have_Been_Activated__c = true;
        newWkshtList.add(testWorksheet);
        insert newWkshtList;

        testAccount.Status__c = 'PROVISIONING';
        updateAccountList.add(testAccount);
        update updateAccountList;
        Test.stopTest();
    }
    
    @isTest static void test_afterTrigger() {
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

        List<Account> newAccountList = new List<Account>();
        List<Account> updateAccountList = new List<Account>();
        List<Case> newCaseList = new List<Case>();
        List<MLS__c> newMlsList = new List<MLS__c>();
        List<Account_MLS__c> newAcctMlsList = new List<Account_MLS__c>();
        List<Worksheets__c> newWkshtList = new List<Worksheets__c>();

        Account testAccount = new Account();
        testAccount.Name = 'Test Name';
        newAccountList.add(testAccount);
        insert newAccountList;

        Case testCase = new Case();
        testCase.RecordTypeId = Case.sObjectType.getDescribe().getRecordTypeInfosByName().get('NCS - AutoLaunch').getRecordTypeId();
        testCase.AccountId = testAccount.Id;
        newCaseList.add(testCase);
        insert newCaseList;

        MLS__c testMLS = new MLS__c();
        testMLS.Name = 'Test Name';
        testMLS.MLS_Code__c = 'tasdfdaf';
        //testMLS.State__c = 'TX';
        newMlsList.add(testMLS);
        insert newMlsList;

        Account_MLS__c testAcctMLS = new Account_MLS__c();
        testAcctMLS.Account__c = testAccount.Id;
        testAcctMLS.MLS__c = testMLS.Id;
        newAcctMlsList.add(testAcctMLS);
        insert newAcctMlsList;

        Worksheets__c testWorksheet = new Worksheets__c();
        testWorksheet.RecordTypeId = Worksheets__c.sObjectType.getDescribe().getRecordTypeInfosByName().get('MLS Worksheet').getRecordTypeId();
        testWorksheet.Parent_Case__c = testCase.Id;
        testWorksheet.Account_Name__c = testAccount.Id;
        testWorksheet.Status__c = 'New';
        testWorksheet.All_Account_MLS_Have_Been_Activated__c = true;
        newWkshtList.add(testWorksheet);
        insert newWkshtList;

        testWorksheet.Status__c = 'Complete';
        updateAccountList.add(testAccount);
        update updateAccountList;
    }
}