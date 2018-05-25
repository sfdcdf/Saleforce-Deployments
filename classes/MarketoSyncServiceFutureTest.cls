@isTest
private class MarketoSyncServiceFutureTest {
	
	@isTest static void test_getLeadById() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getLeadById('32');
	}
	
	@isTest static void test_getMultipleLeadsbyFilterType() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getMultipleLeadsbyFilterType('id', new List<String>{'50'}, new List<String>{'Name'}, '');
	}

	@isTest static void test_getMultipleLeadsByListId() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getMultipleLeadsByListId('50', new List<String>{'firstName'});
	}

	@isTest static void test_getMultipleLeadsByProgramId() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getMultipleLeadsByProgramId('50', new List<String>{'firstName'});
	}

	@isTest static void test_changeLeadProgramStatus() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.changeLeadProgramStatus('50', 'Read', new List<String>{'51'});
	}
	
	@isTest static void test_createUpdateLeads() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"2b16#157fd5a582b","result":[{"id":20,"updatedAt":"2016-07-01T20:39:59Z","salesforceAccountID":null,"Client_ID":null,"GN_Prospect_ID":"205","yOStatus":"LIVE","email":"rustan.valino@yodle.com"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Prospect_ID__c = '205';
		insert newAccount;
	}

	@isTest static void test_createUpdateLeadsFailed() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"d42c#158f8e7be4c","result":[{"status":"skipped","reasons":[{"code":"1004","message":"Lead not found"}]}],"success":true}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = String.valueof(DateTime.now().millisecondGMT()+322);
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t333est.c32om';
		newAccount.Client_Type__c = 'Local';
		newAccount.Prospect_ID__c = '205';
		insert newAccount;
	}

	@isTest static void test_associateLead() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.associateLead('50');
	}

	@isTest static void test_mergeLead() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.mergeLead('50', '42', new List<String>{'123'}, true);
	}

	@isTest static void test_getListById() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getListById('50');
	}

	@isTest static void test_getMultipleLists() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getMultipleLists('Id', new List<String>{'43'});
	}

	@isTest static void test_addLeadsToList() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.addLeadsToList('32', new List<String>{'43'});
	}

	@isTest static void test_removeLeadsFromList() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.removeLeadsFromList('32', new List<String>{'43'});
	}

	@isTest static void test_memberOfList() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.memberOfList('32', new List<String>{'43'});
	}

	@isTest static void test_getCampaignById() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getCampaignById('50');
	}

	@isTest static void test_getMultipleCampaigns() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getMultipleCampaigns('id', new List<String>{'50'});
	}

	@isTest static void test_requestCampaign() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.requestCampaign('53', new List<String>{'50'}, JSON.serialize(new List<MarketoSyncService.MarketoSyncServiceToken>()));
	}

	@isTest static void test_describe() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.describe();
	}

	@isTest static void test_getActivityTypes() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getActivityTypes();
	}

	@isTest static void test_getLeadActivities() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getLeadActivities(new List<String>{'Read'}, '32', new List<String>{'40'}, DateTime.now());
	}

	@isTest static void test_getDailyUsage() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getDailyUsage();
	}

	@isTest static void test_getLast7DaysUsage() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getLast7DaysUsage();
	}

	@isTest static void test_getDailyErrors() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getDailyErrors();
	}

	@isTest static void test_getLast7DaysErrors() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getLast7DaysErrors();
	}

	@isTest static void test_deleteLead() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.deleteLead(new List<String>{'20'});
	}

	@isTest static void test_getDeletedLeads() {
		new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		MarketoSyncServiceFuture.getDeletedLeads(DateTime.now());
	}

	@isTest static void test_reauthenticateWithMarketo(){
		String responseExample = '{"access_token": "cdf01657-110d-4155-99a7-f986b2ff13a0:int","token_type": "bearer","expires_in": 3599,"scope": "rustan.valino@yodle.com"}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));
		MarketoSyncService.reauthenticateWithMarketo(Integration_Settings__c.getOrgDefaults());
	}

}