@isTest
private class AccountMarketoActivityQueueableTest {

	private static Map<String, String> activityTypeMap = new Map<String, String>{'6' => 'Send Email', '7' => 'Delivered Email', '8' => 'Bounced Email', '9' => 'Unsubscribed Email', '10' => 'Open Email', '11' => 'Click Email'};
	
	@isTest static void test_AccountMarketoActivityQueueable() {	
		AdjustCustomCodeLimit__c calloutLimit = new AdjustCustomCodeLimit__c();
		calloutLimit.Name = 'AccountMarketoActivityQueueableLimit';
		calloutLimit.Limit__c = 5;
		insert calloutLimit;

		List<Account> testAccountList = new List<Account>();

		Account testAccount1 = new Account();
		testAccount1.Name = 'Test Name';
		testAccount1.Marketo_ID__c = '70';
		testAccount1.Email__c = 'testaccount1@testemail.com';
		testAccountList.add(testAccount1);

		Account testAccount2 = new Account();
		testAccount2.Name = 'Test Name';
		testAccount2.Marketo_ID__c = '11142';
		testAccount2.Email__c = 'testAccount2@testemail.com';
		testAccountList.add(testAccount2);

		Account testAccount3 = new Account();
		testAccount3.Name = 'Test Name';
		testAccount3.Marketo_ID__c = '11136';
		testAccount3.Email__c = 'testAccount3@testemail.com';
		testAccountList.add(testAccount3);

		Account testAccount4 = new Account();
		testAccount4.Name = 'Test Name';
		testAccount4.Marketo_ID__c = '11086';
		testAccount4.Email__c = 'testAccount4@testemail.com';
		testAccountList.add(testAccount4);

		insert testAccountList;

		List<Activity_Type__c> activityTypeList = new List<Activity_Type__c>();
		for(String mapKey : activityTypeMap.keySet()){
			Activity_Type__c act = new Activity_Type__c();
			act.Name = activityTypeMap.get(mapKey);
			act.Activity_Type_ID__c = mapKey;
			activityTypeList.add(act);
		}
		insert activityTypeList;

		String responseExample = [SELECT Id, Body FROM StaticResource WHERE Name = 'AccountMarketoActivityTestDataJSON' LIMIT 1].Body.toString();
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Test.startTest();
		AccountMarketoActivitySchedule sched = new AccountMarketoActivitySchedule();
		sched.execute(null);
		Test.stopTest();
	}

}