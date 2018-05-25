@isTest
private class AccountTriggerTest {

	/*
		Created by: Rustan Valino on 03-10-2016
		Last Modfied by: Rustan Valino on 03-15-2016
		Coverage:
			- AccountTrigger: 88% (100% if combined with SalesforceToQueueBatchTest)
	*/

	@isTest static void testPopulationData(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		Population_Data__c pop1 = new Population_Data__c();
		pop1.Zip_Code__c = '78751';
		pop1.Population__c = 'Major Metro - Over 1M';
		pop1.PPC_Eligibility__c = 'Full PPC Support';
		insert pop1;

		Population_Data__c pop2 = new Population_Data__c();
		pop2.Zip_Code__c = '75219';
		pop2.Population__c = 'Major Metro - Over 1M';
		pop2.PPC_Eligibility__c = 'Full PPC Support';
		insert pop2;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.BillingPostalCode = pop1.Zip_Code__c;
		insert newAccount;

		newAccount.BillingPostalCode = pop2.Zip_Code__c;
		update newAccount;
	}
	
	@isTest static void testGoogleMapsUrlFieldGNUpdate() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{ "success": true }';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));
		Map<String,Schema.RecordTypeInfo> acctRTMapByName = Schema.SObjectType.Account.getRecordTypeInfosByName();

		Account newAccount = new Account();
		//newAccount.RecordTypeId = acctRTMapByName.get('Inbound Sales').getRecordTypeId();
		newAccount.Name = 'Test Account Name';
		insert newAccount;

		newAccount.Google_Maps_URL__c = 'http://www.yodle.com';
		update newAccount;
	}

	@isTest static void testMarketoSyncServiceNewAccount() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"2b16#157fd5a582b","result":[{"id":20,"updatedAt":"2016-07-01T20:39:59Z","salesforceAccountID":null,"Client_ID":null,"GN_Prospect_ID":"205","yOStatus":"LIVE","email":"rustan.valino@yodle.com"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Prospect_ID__c = '205';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		insert newAccount;
	}

	@isTest static void testMarketoSyncServiceNewAccountErrorOnDupeMarketoId() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"2b16#157fd5a582b","result":[{"id":20,"updatedAt":"2016-07-01T20:39:59Z","salesforceAccountID":null,"Client_ID":null,"GN_Prospect_ID":"205","yOStatus":"LIVE","email":"rustan.valino@yodle.com"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account testAccount = new Account();
		testAccount.Marketo_ID__c = '20';
		testAccount.Name = 'testta';
		testAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@tes32323333t.com44';
		insert testAccount;

		Test.startTest();
		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Prospect_ID__c = '205';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		insert newAccount;
		Test.stopTest();
	}

	@isTest static void testMarketoSyncServiceNewAccountSyncWithEmail() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String emailText = String.valueof(DateTime.now().millisecondGMT()) + '@te32st.com';

		String responseExample = '{"requestId":"2b16#157fd5a582b","result":[{"id":20,"updatedAt":"2016-07-01T20:39:59Z","salesforceAccountID":null,"Client_ID":null,"GN_Prospect_ID":"205","yOStatus":"LIVE","email":"' + emailText + '"}, {"id":34,"updatedAt":"2016-07-01T20:39:59Z","salesforceAccountID":null,"Client_ID":"4344","GN_Prospect_ID":"205","yOStatus":"LIVE","email":"' + emailText + '"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = emailText;
		newAccount.Client_ID__c = '4344';
		newAccount.Client_Type__c = 'Local';
		insert newAccount;
	}

	@isTest static void testMarketoSyncServiceUpdateAccount() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		String emailText = String.valueof(DateTime.now().millisecondGMT()) + '@t32322est.com';

		String responseExample = '{"requestId":"2b16#157fd5a582b","result":[{"id":20,"updatedAt":"2016-07-01T20:39:59Z","salesforceAccountID":null,"Client_ID":null,"GN_Prospect_ID":"205","yOStatus":"LIVE","email":"' + emailText + '"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Client_Type__c = 'Local';
		insert newAccount;

		newAccount.Email__c = emailText;
		newAccount.Status__c = 'LIVE';
		update newAccount;
	}

	@isTest static void testMarketoSyncServiceUpdateAccountChangeValue() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":52,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Status__c = 'LIVE';
		newAccount.Marketo_ID__c = '52';
		insert newAccount;

		Test.startTest();
		newAccount.Name = 'Testing Account';
		update newAccount;
		Test.stopTest();
	}

	@isTest static void testMarketoSyncServiceRemoveSyncedAccountEmail() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		String emailText = String.valueof(DateTime.now().millisecondGMT()) + '@test.com322333';

		String responseExample = '{"requestId":"2b16#157fd5a582b","result":[{"id":20,"updatedAt":"2016-07-01T20:39:59Z","salesforceAccountID":null,"Client_ID":null,"GN_Prospect_ID":"205","yOStatus":"LIVE","email":"' + emailText + '"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = emailText;
		newAccount.Client_Type__c = 'Local';
		insert newAccount;

		try{
			newAccount.Email__c = '';
			update newAccount; 
		}catch(Exception E){

		}
	}

	@isTest static void test_LBWNestScheduledTouchpoint(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t3esf7eee88778t.4co4fasm';
		newAccount.Client_Type__c = 'Local';
		newAccount.Product_Type__c = 'LBW';
		//newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		newAccount.Sync_to_Marketo__c = true;
		newAccount.IMS_Rep__c = UserInfo.getUserId();
		insert newAccount;

		newAccount.Next_Scheduled_Touchpoint__c = Date.today().addDays(40);
		update newAccount;
	}

	@isTest static void test_LBWNextScheduledTouchpointOpenTPErrorTest() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t3esf788778t.4co4fasm';
		newAccount.Client_Type__c = 'Local';
		newAccount.Product_Type__c = 'LBW';
		//newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		newAccount.Sync_to_Marketo__c = true;
		newAccount.Next_Scheduled_Touchpoint__c = Date.today().addDays(40);
		insert newAccount;

		
		Case newCase = new Case();
		newCase.AccountId = newAccount.Id;
		newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
		newCase.Reason = 'CS Touch Plan';
		newCase.Status = 'New';
		newCase.OwnerId = UserInfo.getUserId();
		insert newCase;

		Test.startTest();
		newAccount.Next_Scheduled_Touchpoint__c = Date.today().addDays(6);
		try{
			update newAccount;
		}catch(Exception E){

		}
		Test.stopTest();
	}

	@isTest static void test_LBWNextScheduledTouchpoint30DayErrorTest() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t3esf788778t.4co4fasm';
		newAccount.Client_Type__c = 'Local';
		newAccount.Product_Type__c = 'LBW';
		//newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		newAccount.Sync_to_Marketo__c = true;
		insert newAccount;

		
		Case newCase = new Case();
		newCase.AccountId = newAccount.Id;
		newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
		newCase.Reason = 'CS Touch Plan';
		newCase.Status = 'Closed';
		newCase.OwnerId = UserInfo.getUserId();
		insert newCase;

		Test.startTest();
		newAccount.Next_Scheduled_Touchpoint__c = Date.today().addDays(6);
		try{
			update newAccount;
		}catch(Exception E){

		}
		Test.stopTest();
	}

	@isTest static void test_EmailForTouchplanDifferentEmailThenUpdateToSameEmail(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":70,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account parentAccount = new Account();
		parentAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('YBN Master Account').getRecordTypeId();
		parentAccount.Name = 'Hand & Stone - Master';
		insert parentAccount;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@te88008st.com';
		newAccount.Client_Type__c = 'YBN';
		newAccount.Status__c = 'LIVE';
		newAccount.Marketo_ID__c = '52';
		newAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
		newAccount.Individual_Location_Service_Level__c = 'Service Level A';
		newAccount.ParentId = parentAccount.Id;
		insert newAccount;

		Test.startTest();
		newAccount.Email_for_Touchplan__c = String.valueof(DateTime.now().millisecondGMT()) + '@te8338008st.com';
		update newAccount;

		newAccount.Email_for_Touchplan__c = newAccount.Email__c;
		update newAccount;
		Test.stopTest();
	}
	
}