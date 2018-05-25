@isTest
private class CPPAccountHelperTest {
	
	@isTest static void test_currentQuarterChildAccountTrueUpInsertLiveAccount() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account partnerAccount = new Account();
		partnerAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner Master Account').getRecordTypeId();
		partnerAccount.Name = 'Partner Account Test Name';
		partnerAccount.Partner_Status__c = 'Customer';
		insert partnerAccount;

		Account childAccount = new Account();
		childAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
		childAccount.Name = 'Child Partner Account Test Name';
		childAccount.ParentId = partnerAccount.Id;
		childAccount.Status__c = 'LIVE';
		insert childAccount;
	}

	@isTest static void test_currentQuarterChildAccountTrueUpRemoveLiveAccount() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account partnerAccount = new Account();
		partnerAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner Master Account').getRecordTypeId();
		partnerAccount.Name = 'Partner Account Test Name';
		partnerAccount.Partner_Status__c = 'Customer';
		insert partnerAccount;

		Account childAccount = new Account();
		childAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
		childAccount.Name = 'Child Partner Account Test Name';
		childAccount.ParentId = partnerAccount.Id;
		childAccount.Status__c = 'LIVE';
		insert childAccount;

		Test.startTest();
		childAccount.Status__c = 'OFF';
		update childAccount;
		Test.stopTest();
	}
	
}