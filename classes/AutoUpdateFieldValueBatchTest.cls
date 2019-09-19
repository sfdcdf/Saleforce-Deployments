@isTest
private class AutoUpdateFieldValueBatchTest {
	
	@isTest static void AutoUpdateFieldValueScheduleAndBatchTest() {
		Account acct = new Account();
		acct.Name = 'Test Name';
		insert acct;

		AutoUpdateFieldValueCustomSetting__c newUpdateFieldValueCS = new AutoUpdateFieldValueCustomSetting__c();
		newUpdateFieldValueCS.Name = 'Account Name Change';
		newUpdateFieldValueCS.SOQL__c = 'select Id from';
		newUpdateFieldValueCS.Additional_SOQL_Criteria__c = 'Account';
		newUpdateFieldValueCS.Active__c = true;
		newUpdateFieldValueCS.Field_Value_Update__c = 'Name:TestName';
		insert newUpdateFieldValueCS;

		Test.startTest();
		AutoUpdateFieldValueSchedule sched = new AutoUpdateFieldValueSchedule();
		sched.execute(null);
		Test.stopTest();
		System.assertEquals([select Name from Account where Id = :acct.Id].Name, 'TestName');
	}
	
}