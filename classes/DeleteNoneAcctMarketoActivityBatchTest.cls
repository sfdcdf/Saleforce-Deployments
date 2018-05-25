@isTest
private class DeleteNoneAcctMarketoActivityBatchTest {
	private static Map<String, String> activityTypeMap = new Map<String, String>{'6' => 'Send Email', '7' => 'Delivered Email', '8' => 'Bounced Email', '9' => 'Unsubscribed Email', '10' => 'Open Email', '11' => 'Click Email'};

	@isTest static void test_DeleteNoneAccountMarketoActivityBatch() {
		List<Activity_Type__c> activityTypeList = new List<Activity_Type__c>();
		for(String mapKey : activityTypeMap.keySet()){
			Activity_Type__c act = new Activity_Type__c();
			act.Name = activityTypeMap.get(mapKey);
			act.Activity_Type_ID__c = mapKey;
			activityTypeList.add(act);
		}
		insert activityTypeList;

		Account_Marketo_Activity__c acctMktAct = new Account_Marketo_Activity__c();
		acctMktAct.Activity_ID__c = '538';
		acctMktAct.Activity_Type_ID__c = '6';
		acctMktAct.Campaign_ID__c = '6052';
		acctMktAct.Marketo_Lead_ID__c = '70';
		insert acctMktAct;

		Test.startTest();
		DeleteNoneAccountMarketoActivitySchedule sched = new DeleteNoneAccountMarketoActivitySchedule();
		sched.execute(null);
		Test.stopTest();

		system.assert([select Id from Account_Marketo_Activity__c].size() == 0);
	}
	
}