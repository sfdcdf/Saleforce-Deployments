@isTest
private class RetentionSLAEvaluationBatchTest {
	
	@isTest static void test_RetentionSLAEvaluationBatch() {
		Account newAccount = new Account();
		newAccount.Name = 'Tset Account';
		insert newAccount;

		Cancellation_Request__c newCancellationRequest = new Cancellation_Request__c();
		newCancellationRequest.Account_Name__c = newAccount.Id;
		insert newCancellationRequest;

		Test.startTest();
		RetentionSLAEvaluationSchedule scheduleExecute = new RetentionSLAEvaluationSchedule();
		scheduleExecute.execute(null);
		Test.stopTest();
	}
	
}