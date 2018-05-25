@isTest
private class CustomAutomationObjectHelperTest {
    
    @isTest static void test_LBWSaveMode() {
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
        Integration_Settings__c integrationSetting = Integration_Settings__c.getOrgDefaults();
        integrationSetting.Sync_Account_Data_With_Marketo__c = false;
        integrationSetting.Sync_Organic_Case_Data_With_Marketo__c = false;
        integrationSetting.Sync_Case_Data_With_Marketo__c = false;
        update integrationSetting;

        Account newAccount = new Account();
        newAccount.Name = 'Test Account';
        newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT()*0.4);
        newAccount.Status__c = 'LIVE';
        newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()*0.3) + '@t3esf78438778t.4co4f44asm';
        newAccount.Client_Type__c = 'Local';
        newAccount.Product_Plan_ID__c = 'LEADS_BY_WEB';
        newAccount.Client_Experience_Key__c = 'web.com-main';
        //newAccount.Budget_Ads__c = 700;
        newAccount.Live_Date__c = Date.today().addDays(-54);
        newAccount.Sync_to_Marketo__c = true;
        newAccount.Next_Scheduled_Touchpoint__c = Date.today().addDays(40);
        insert newAccount;

        Case tpCase = new Case();
        tpCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
        tpCase.Subject = 'LBW Monthly Touchplan';
        tpCase.Reason = 'CS Touch Plan';
        tpCase.AccountId = newAccount.Id;
        insert tpCase;

        Test.startTest();

        Cancellation_Request__c cancelRequest = new Cancellation_Request__c();
        cancelRequest.Account_Name__c = newAccount.Id;
        cancelRequest.Date_of_Cancellation_Request__c = date.today();
        cancelRequest.Initial_Product__c = 'Leads By Web';
        cancelRequest.Future_Product__c = 'Leads By Web';
        cancelRequest.Case__c = tpCase.Id;
        insert cancelRequest;

        cancelRequest = TestDataFactory.setOutcomeToSavedWithNoConcessions(cancelRequest);
        update cancelRequest;

        Test.stopTest();
    }

    @isTest static void test_TORCHXSaveMode() {
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
        Integration_Settings__c integrationSetting = Integration_Settings__c.getOrgDefaults();
        integrationSetting.Sync_Account_Data_With_Marketo__c = false;
        integrationSetting.Sync_Organic_Case_Data_With_Marketo__c = false;
        integrationSetting.Sync_Case_Data_With_Marketo__c = false;
        update integrationSetting;

        Account newAccount = new Account();
        newAccount.Name = 'Test Account';
        newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT()*0.44);
        newAccount.Status__c = 'LIVE';
        newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()*0.34) + '@t3esf784348778t.4co4f444asm';
        newAccount.Client_Type__c = 'Local';
        newAccount.Product_Type__c = 'TORCHX';
        //newAccount.Budget_Ads__c = 700;
        newAccount.Live_Date__c = Date.today().addDays(-54);
        newAccount.Sync_to_Marketo__c = true;
        newAccount.CSC_Completed_Date__c = Date.today().addDays(-40);
        insert newAccount;

        Case cscCase = new Case();
        cscCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
        cscCase.Subject = 'CSC - ';
        cscCase.Reason = 'CSC';
        cscCase.AccountId = newAccount.Id;
        cscCase.Status = 'Complete';
        insert cscCase;

        Case tpCase = new Case();
        tpCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
        tpCase.Subject = 'Schedule your next call: Monthly Review';
        tpCase.Reason = 'CS Touch Plan';
        tpCase.AccountId = newAccount.Id;
        insert tpCase;

        Test.startTest();

        newAccount.CSC_Completed_Date__c = Date.today().addDays(-40);
        update newAccount;

        Cancellation_Request__c cancelRequest = new Cancellation_Request__c();
        cancelRequest.Account_Name__c = newAccount.Id;
        cancelRequest.Date_of_Cancellation_Request__c = date.today();
        insert cancelRequest;

        cancelRequest = TestDataFactory.setOutcomeToSavedWithNoConcessions(cancelRequest);
        update cancelRequest;

        Test.stopTest();
    }

    /**@isTest static void test_AbortAutomation() {
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
        Integration_Settings__c integrationSetting = Integration_Settings__c.getOrgDefaults();
        integrationSetting.Sync_Account_Data_With_Marketo__c = false;
        integrationSetting.Sync_Organic_Case_Data_With_Marketo__c = false;
        integrationSetting.Sync_Case_Data_With_Marketo__c = false;
        update integrationSetting;

        Account newAccount = new Account();
        newAccount.Name = 'Test Account';
        newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT()*0.4454);
        newAccount.Status__c = 'LIVE';
        newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()*0.3544) + '@t3esf78438778t.4co4f454asm';
        newAccount.Client_Type__c = 'Local';
        newAccount.Product_Plan_ID__c = 'LEADS_BY_WEB';
        newAccount.Client_Experience_Key__c = 'web.com-main';
        //newAccount.Budget_Ads__c = 700;
        newAccount.Live_Date__c = Date.today().addDays(-54);
        newAccount.Sync_to_Marketo__c = true;
        newAccount.Next_Scheduled_Touchpoint__c = Date.today().addDays(40);
        insert newAccount;

        Case tpCase = new Case();
        tpCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
        tpCase.Subject = 'LBW Monthly Touchplan';
        tpCase.Reason = 'CS Touch Plan';
        tpCase.AccountId = newAccount.Id;
        insert tpCase;

        Test.startTest();

        Cancellation_Request__c cancelRequest = new Cancellation_Request__c();
        cancelRequest.Account_Name__c = newAccount.Id;
        cancelRequest.Date_of_Cancellation_Request__c = date.today();
        cancelRequest.Initial_Product__c = 'Leads By Web';
        cancelRequest.Future_Product__c = 'Leads By Web';
        cancelRequest.Case__c = tpCase.Id;
        insert cancelRequest;

        cancelRequest = TestDataFactory.setOutcomeToSavedWithNoConcessions(cancelRequest);
        cancelRequest.Outcome__c = 'Cancelled';
        update cancelRequest;

        cancelRequest.Outcome__c = 'In Progress';
        update cancelRequest;

        Test.stopTest();
    }**/
    
}