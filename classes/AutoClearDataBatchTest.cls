@isTest
private class AutoClearDataBatchTest {
	
	@isTest static void test_AutoClearDataBatch() {
		AutoClearDataCustomSetting__c autoClear = new AutoClearDataCustomSetting__c();
		autoClear.Name = 'Test Auto Clear';
		autoClear.Active__c = true;
		autoClear.SOQL__c = 'Select Id from Account';
		autoClear.Field_API_Name_To_Clear_Out__c = 'Client_ID__c';
		insert autoClear;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = '332233351';
		insert newAccount;

		Test.startTest();
		AutoClearDataSchedule sched = new AutoClearDataSchedule();
		sched.execute(null);
		Test.stopTest();
	}
	
}