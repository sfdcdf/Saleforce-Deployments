@isTest
private class HermesAccountRedirectControllerExtTest {
	
	@isTest static void test_redirectToHermesPass() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		String responseExample = '[{"rel": "hermes", "href": "https://hermesbeta.web.com/index.php?m=customers&a=main&cprod_id=14926937"}, {"rel": "wrenBilling", "href": "https://hermesbeta.web.com/index.php?m=customers&a=main&cprod_id=14926937"}]';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account testAccount = new Account();
		testAccount.Name = 'Test Name';
		testAccount.Client_ID__c = '3322322';
		testAccount.wrenBilling__c = true;
		insert testAccount;

		Test.startTest();
		ApexPages.StandardController stdAcct = new ApexPages.StandardController(testAccount);
	    HermesAccountRedirectControllerExt contrExt  = new HermesAccountRedirectControllerExt(stdAcct);
	    contrExt.redirectToHermes();
	    Test.stopTest();
	}

	@isTest static void test_redirectToHermesFail() {
		//TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		//String responseExample = '{"respnose": "error"}}';
		//Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account testAccount = new Account();
		testAccount.Name = 'Test Name';
		testAccount.Client_ID__c = '3322322';
		testAccount.wrenBilling__c = true;
		insert testAccount;

		Test.startTest();
		ApexPages.StandardController stdAcct = new ApexPages.StandardController(testAccount);
	    HermesAccountRedirectControllerExt contrExt  = new HermesAccountRedirectControllerExt(stdAcct);
	    contrExt.redirectToHermes();
	    Test.stopTest();
	}
	
}