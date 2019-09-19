/*
//Reason : “BeaconHS1Migration” : Inactivated the complete class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
//*/
@isTest
private class CustomAutomationObjectHelperTest {
    
    static testMethod void test_CustomAutomationObjectHelper() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          CustomAutomationObjectHelper  obj = new CustomAutomationObjectHelper();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
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