@isTest
private class MarketoHourlyEmailCampaignBatchTest {
	
	@isTest static void test_MarketoHourlyEmailCampaignBatch() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Marketo_Email_Campaign__c marketoEmailCampaignTemplate = new Marketo_Email_Campaign__c();
		marketoEmailCampaignTemplate.RecordTypeId = Schema.SObjectType.Marketo_Email_Campaign__c.getRecordTypeInfosByName().get('Hourly Template').getRecordTypeId();
		marketoEmailCampaignTemplate.Name = 'Test Template';
		marketoEmailCampaignTemplate.Marketo_Campaign_ID__c = '5332';
		marketoEmailCampaignTemplate.Hourly_Reminder_DateTime_Field__c = 'LastModifiedDate';
		marketoEmailCampaignTemplate.of_Hours_For_Reminder__c = -2;
		marketoEmailCampaignTemplate.Create_Case__c = true;
		marketoEmailCampaignTemplate.Active__c = true;
		marketoEmailCampaignTemplate.New_Record_Default_Values__c = '{"attributes":{"type":"Case"},"Reason":" Proactive Touch", "RecordTypeId":"012320000009ect","Reason_Detail__c":"Month 1 Check In","Priority":"Major","Status":"New"}';
		insert marketoEmailCampaignTemplate;

		Database.executeBatch(new MarketoHourlyEmailCampaignBatch('select Id, Marketo_ID__c from Account', marketoEmailCampaignTemplate.Id, DateTime.now()));
	}

	@isTest static void test_SchedulableJob() {
		Marketo_Email_Campaign__c marketoEmailCampaignTemplate = new Marketo_Email_Campaign__c();
		marketoEmailCampaignTemplate.RecordTypeId = Schema.SObjectType.Marketo_Email_Campaign__c.getRecordTypeInfosByName().get('Hourly Template').getRecordTypeId();
		marketoEmailCampaignTemplate.Name = 'Test Template';
		marketoEmailCampaignTemplate.Marketo_Campaign_ID__c = '5332';
		marketoEmailCampaignTemplate.Hourly_Reminder_DateTime_Field__c = 'LastModifiedDate';
		marketoEmailCampaignTemplate.of_Hours_For_Reminder__c = -2;
		marketoEmailCampaignTemplate.Create_Case__c = true;
		marketoEmailCampaignTemplate.Active__c = true;
		marketoEmailCampaignTemplate.Criteria__c = 'select Id, Marketo_ID__c from Account where Id != \'\'';
		marketoEmailCampaignTemplate.New_Record_Default_Values__c = '{"attributes":{"type":"Case"},"Reason":" Proactive Touch", "RecordTypeId":"012320000009ect","Reason_Detail__c":"Month 1 Check In","Priority":"Major","Status":"New"}';
		insert marketoEmailCampaignTemplate;

		Marketo_Email_Campaign__c marketoEmailCampaignTemplateRandomize = new Marketo_Email_Campaign__c();
		marketoEmailCampaignTemplateRandomize.RecordTypeId = Schema.SObjectType.Marketo_Email_Campaign__c.getRecordTypeInfosByName().get('Hourly Template').getRecordTypeId();
		marketoEmailCampaignTemplateRandomize.Name = 'Test Template Random';
		marketoEmailCampaignTemplateRandomize.Marketo_Campaign_ID__c = '5332';
		marketoEmailCampaignTemplateRandomize.Criteria__c = 'select Id, Marketo_ID__c from Account where Id != \'\'';
		marketoEmailCampaignTemplateRandomize.Active__c = true;
		marketoEmailCampaignTemplateRandomize.Randomize__c = true;
		marketoEmailCampaignTemplateRandomize.How_Many_Random_Records__c = 2;
		marketoEmailCampaignTemplateRandomize.Hourly_Reminder_DateTime_Field__c = 'LastModifiedDate';
		marketoEmailCampaignTemplateRandomize.of_Hours_For_Reminder__c = -2;
		insert marketoEmailCampaignTemplateRandomize;

		Test.startTest();
		MarketoHourlyEmailCampaignSchedule m = new MarketoHourlyEmailCampaignSchedule();
		m.execute(null);
		Test.stopTest();
	}
	
}