@isTest
private class DailyScheduledRecordAutoCreateBatchTest {
		
	@isTest static void test_DailyScheduledRecordAutoCreateBatch() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t3esf7388778t.4co4333fasm';
		newAccount.Client_Type__c = 'Local';
		newAccount.Product_Type__c = 'LBW';
		newAccount.Live_Date__c = Date.today().addDays(-37);
		//newAccount.Sync_to_Marketo__c = true;
		//newAccount.Next_Scheduled_Touchpoint__c = DateTime.newInstance(Date.today().addDays(3).year(), Date.today().addDays(3).month(), Date.today().addDays(3).day(), 12, 0, 0);
		insert newAccount;

		Test.startTest();
		DailyScheduledRecordAutoCreateSchedule sched = new DailyScheduledRecordAutoCreateSchedule();
		sched.execute(null);
		Test.stopTest();
	}
		
}