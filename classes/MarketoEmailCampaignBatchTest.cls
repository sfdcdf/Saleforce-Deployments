@isTest
private class MarketoEmailCampaignBatchTest {
	
	@isTest static void test_MarketoEmailCampaignBatch() {
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
		marketoEmailCampaignTemplate.RecordTypeId = Schema.SObjectType.Marketo_Email_Campaign__c.getRecordTypeInfosByName().get('Template').getRecordTypeId();
		marketoEmailCampaignTemplate.Name = 'Test Template';
		marketoEmailCampaignTemplate.Marketo_Campaign_ID__c = '5332';
		insert marketoEmailCampaignTemplate;

		Database.executeBatch(new MarketoEmailCampaignBatch('select Id, Marketo_ID__c from Account', marketoEmailCampaignTemplate.Id));
	}

	@isTest static void test_100PlusRecordsMarketoEmailCampaignBatch() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		List<Account> acctList = new List<Account>();
		for(Integer i = 0; i < 101; i++){
			Account newAccount = new Account();
			newAccount.Name = 'Test Account';
			newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT() + i);
			newAccount.Status__c = 'LIVE';
			//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
			newAccount.Client_Type__c = 'Local';
			newAccount.Budget_Ads__c = 700;
			newAccount.Live_Date__c = Date.today();
			acctList.add(newAccount);
		}
		insert acctList;

		Marketo_Email_Campaign__c marketoEmailCampaignTemplate = new Marketo_Email_Campaign__c();
		marketoEmailCampaignTemplate.RecordTypeId = Schema.SObjectType.Marketo_Email_Campaign__c.getRecordTypeInfosByName().get('Template').getRecordTypeId();
		marketoEmailCampaignTemplate.Name = 'Test Template';
		marketoEmailCampaignTemplate.Marketo_Campaign_ID__c = '5332';
		insert marketoEmailCampaignTemplate;

		Database.executeBatch(new MarketoEmailCampaignBatch('select Id, Marketo_ID__c from Account', marketoEmailCampaignTemplate.Id));
	}

	@isTest static void test_Failed100PlusRecordsMarketoEmailCampaignBatch() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"c5d4#158f51e8a90","success":false,"errors":[{"code":"1004","message":"Lead [544334] not found"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		List<Account> acctList = new List<Account>();
		for(Integer i = 0; i < 101; i++){
			Account newAccount = new Account();
			newAccount.Name = 'Test Account';
			newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT() + i + i);
			newAccount.Status__c = 'LIVE';
			//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
			newAccount.Client_Type__c = 'Local';
			newAccount.Budget_Ads__c = 700;
			newAccount.Live_Date__c = Date.today();
			acctList.add(newAccount);
		}
		insert acctList;

		Marketo_Email_Campaign__c marketoEmailCampaignTemplate = new Marketo_Email_Campaign__c();
		marketoEmailCampaignTemplate.RecordTypeId = Schema.SObjectType.Marketo_Email_Campaign__c.getRecordTypeInfosByName().get('Template').getRecordTypeId();
		marketoEmailCampaignTemplate.Name = 'Test Template';
		marketoEmailCampaignTemplate.Marketo_Campaign_ID__c = '5332';
		insert marketoEmailCampaignTemplate;

		Database.executeBatch(new MarketoEmailCampaignBatch('select Id, Marketo_ID__c from Account', marketoEmailCampaignTemplate.Id));
	}

	@isTest static void test_FailedMarketoEmailCampaignBatch() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"c5d4#158f51e8a90","success":false,"errors":[{"code":"1004","message":"Lead [544334] not found"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = '544334';
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Marketo_Email_Campaign__c marketoEmailCampaignTemplate = new Marketo_Email_Campaign__c();
		marketoEmailCampaignTemplate.RecordTypeId = Schema.SObjectType.Marketo_Email_Campaign__c.getRecordTypeInfosByName().get('Template').getRecordTypeId();
		marketoEmailCampaignTemplate.Name = 'Test Template';
		marketoEmailCampaignTemplate.Marketo_Campaign_ID__c = '5332';
		insert marketoEmailCampaignTemplate;

		Database.executeBatch(new MarketoEmailCampaignBatch('select Id, Marketo_ID__c from Account', marketoEmailCampaignTemplate.Id));
	}

	@isTest static void test_SchedulableJob() {
		Marketo_Email_Campaign__c marketoEmailCampaignTemplate = new Marketo_Email_Campaign__c();
		marketoEmailCampaignTemplate.RecordTypeId = Schema.SObjectType.Marketo_Email_Campaign__c.getRecordTypeInfosByName().get('Template').getRecordTypeId();
		marketoEmailCampaignTemplate.Name = 'Test Template';
		marketoEmailCampaignTemplate.Marketo_Campaign_ID__c = '5332';
		marketoEmailCampaignTemplate.Criteria__c = 'select Id, Marketo_ID__c from Account';
		marketoEmailCampaignTemplate.Active__c = true;
		insert marketoEmailCampaignTemplate;

		Test.startTest();
		MarketoEmailCampaignSchedule m = new MarketoEmailCampaignSchedule();
		m.execute(null);
		Test.stopTest();
	}
	
}