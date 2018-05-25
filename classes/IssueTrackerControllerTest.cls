@isTest
private class IssueTrackerControllerTest {
	
	@isTest static void test_method_one() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = [select body from StaticResource where Name = 'IssueTrackerJSONTest'].body.toString();
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account testAccount = new Account();
		testAccount.Name = 'Test Account Test';
		testAccount.Client_ID__c = '55253';
		insert testAccount;

		Test.startTest();
		PageReference pageRef = Page.IssueTracker;
		Test.setCurrentPage(pageRef);
		ApexPages.currentPage().getParameters().put('Client_ID__c', testAccount.Client_ID__c);

		IssueTrackerController contr = new IssueTrackerController();
		Test.stopTest();
	}
	
}