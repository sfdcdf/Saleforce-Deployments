@isTest
private class CustomAutomationScheduleBatchesTest {
	
	@isTest static void test_CustomAutomationScheduleBatches() {
		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Integration_Settings__c integrationSetting = Integration_Settings__c.getOrgDefaults();
		integrationSetting.Sync_Account_Data_With_Marketo__c = false;
		integrationSetting.Sync_Organic_Case_Data_With_Marketo__c = false;
		integrationSetting.Sync_Case_Data_With_Marketo__c = false;
		update integrationSetting;

		Marketo_Email_Campaign__c marketoEmailCampaignTemplate = new Marketo_Email_Campaign__c();
		marketoEmailCampaignTemplate.RecordTypeId = Schema.SObjectType.Marketo_Email_Campaign__c.getRecordTypeInfosByName().get('Template').getRecordTypeId();
		marketoEmailCampaignTemplate.Name = 'Test Template';
		marketoEmailCampaignTemplate.Marketo_Campaign_ID__c = '5332';
		marketoEmailCampaignTemplate.Criteria__c = 'select Id, Marketo_ID__c from Account';
		marketoEmailCampaignTemplate.Active__c = true;
		marketoEmailCampaignTemplate.Custom_Automation_API_Reference__c = 'TORCHX_MONTHLY_REVIEW_EVERY_30';
		marketoEmailCampaignTemplate.Create_Case__c = true;
		insert marketoEmailCampaignTemplate;

		List<Account> newAccountList = new List<Account>();

		Account lbwAccount = new Account();
		lbwAccount.Name = 'Test Account';
		lbwAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT()*0.444564);
		lbwAccount.Status__c = 'LIVE';
		lbwAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()*0.343) + '@t3esf784338778t.4co4f444asm';
		lbwAccount.Client_Type__c = 'Local';
		lbwAccount.Product_Plan_ID__c = 'LEADS_BY_WEB';
		lbwAccount.Client_Experience_Key__c = 'web.com-main';
		//newAccount.Budget_Ads__c = 700;
		lbwAccount.Live_Date__c = Date.today().addDays(-54);
		lbwAccount.Sync_to_Marketo__c = true;
		lbwAccount.Next_Scheduled_Touchpoint__c = Date.today().addDays(40);
		newAccountList.add(lbwAccount);

		Account torchxAccount = new Account();
		torchxAccount.Name = 'Test Account';
		torchxAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT()*0.4443);
		torchxAccount.Status__c = 'LIVE';
		torchxAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()*0.3334) + '@t3esf7844348778t.4co4f4444asm';
		torchxAccount.Client_Type__c = 'Local';
		torchxAccount.Product_Type__c = 'TORCHX';
		//newAccount.Budget_Ads__c = 700;
		torchxAccount.Live_Date__c = Date.today().addDays(-54);
		torchxAccount.Sync_to_Marketo__c = true;
		torchxAccount.CSC_Completed_Date__c = Date.today().addDays(-40);
		newAccountList.add(torchxAccount);

		insert newAccountList;

		Custom_Automation__c lbwCA = new Custom_Automation__c();
		lbwCA.Account__c = newAccountList[0].Id;
		lbwCA.Automation_Type__c = 'Daily_Scheduled_Record_Auto_Create__mdt';
		lbwCA.Automation_Trigger_Date__c = Date.today();
		lbwCA.Automation_Status__c = 'Scheduled';
		lbwCA.Automation_Type_API_Name_External_ID__c = 'Create_Monthly_LBW_Account_Performance';
		insert lbwCA;

		Custom_Automation__c torchxCA = new Custom_Automation__c();
		torchxCA.Account__c = newAccountList[1].Id;
		torchxCA.Automation_Type__c = 'Marketo_Email_Campaign__c';
		torchxCA.Automation_Trigger_Date__c = Date.today();
		torchxCA.Automation_Status__c = 'Scheduled';
		torchxCA.Automation_Type_API_Name_External_ID__c = 'TORCHX_MONTHLY_REVIEW_EVERY_30';
		insert torchxCA;

		Test.startTest();
		CustomAutomationScheduleBatches sched = new CustomAutomationScheduleBatches();
		sched.execute(null);
		Test.stopTest();
	}
	
}