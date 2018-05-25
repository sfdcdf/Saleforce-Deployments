@isTest
private class OrganicCustomContentSetupCaseBatchTest {
	
	@isTest static void test_OrganicCustomContentSetupCaseBatch() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		Batch_Automation_Settings__c batchSetting = new Batch_Automation_Settings__c();
		batchSetting.Name = 'Organic Custom Content Setup Case';
		batchSetting.SOQL_Criteria__c = 'select Id, Client_ID__c from Account where Status__c = \'LIVE\' and Product_Plan_Id__c = \'LEADS_BY_WEB\' and Client_Experience_Key__c = \'web.com-main\' and Days_Since_Live__c = 3';
		batchSetting.Default_Values__c = 'RecordTypeId:' + Schema.SObjectType.Case.getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId() + ', OwnerId:00G60000001kt6g, Subject:Organic Custom Content Setup, Description:Please write custom content for the homepage and all listed service pages outlined in this case';
		insert batchSetting;

		String responseExample = '{"235470": { "clientId": 235470, "businessName": "Court\'s Snaggle Tooth DDS", "servingAreaTagline": "Austin, TX", "segmentName": "Dentist", "sellingPropositions": ["Highly trained staff", "Comfortable, relaxing environment", "Friendly and helpful office staff" ], "serviceGroups": [{"id": 177239071, "name": "General Dentistry","keyword": "dental care" },{ "id": 225193704, "name": "Emergency Dentistry", "keyword": "emergency dentist"}]}}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = '235470';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()*0.05) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Status__c = 'LIVE';
		newAccount.Marketo_ID__c = '235470';
		newAccount.Product_Plan_Id__c = 'LEADS_BY_WEB';
		newAccount.Client_Experience_Key__c = 'web.com-main';
		newAccount.Live_Date__c = Date.today().addDays(-3);
		insert newAccount;

		Test.startTest();
		OrganicCustomContentSetupCaseSchedule s = new OrganicCustomContentSetupCaseSchedule();
		s.execute(null);
		Test.stopTest();
	}

	@isTest static void test_OrganicCustomContentSetupCaseBatchError() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		Batch_Automation_Settings__c batchSetting = new Batch_Automation_Settings__c();
		batchSetting.Name = 'Organic Custom Content Setup Case';
		batchSetting.SOQL_Criteria__c = 'select Id, Client_ID__c from Account where Status__c = \'LIVE\' and Product_Plan_Id__c = \'LEADS_BY_WEB\' and Client_Experience_Key__c = \'web.com-main\' and Days_Since_Live__c = 3';
		batchSetting.Default_Values__c = 'RecordTypeId:' + Schema.SObjectType.Case.getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId() + ', OwnerId:00G60000001kt6g, Subject:Organic Custom Content Setup, Description:Please write custom content for the homepage and all listed service pages outlined in this case';
		insert batchSetting;

		String responseExample = '{"235470": { "clientId": 235470, "businessName": "Court\'s Snaggle Tooth DDS", "servingAreaTagline": "Austin, TX", "segmentName": "Dentist", "sellingPropositions": ["Highly trained staff", "Comfortable, relaxing environment", "Friendly and helpful office staff" ], "serviceGroups": [{"id": 177239071, "name": "General Dentistry","keyword": "dental care" },{ "id": 225193704, "name": "Emergency Dentistry", "keyword": "emergency dentist"}]}}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = '3';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()*0.08) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Status__c = 'LIVE';
		newAccount.Marketo_ID__c = '23547430';
		newAccount.Product_Plan_Id__c = 'LEADS_BY_WEB';
		newAccount.Client_Experience_Key__c = 'web.com-main';
		newAccount.Live_Date__c = Date.today().addDays(-3);
		insert newAccount;

		Test.startTest();
		OrganicCustomContentSetupCaseSchedule s = new OrganicCustomContentSetupCaseSchedule();
		s.execute(null);
		Test.stopTest();
	}
	
}