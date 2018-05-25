@isTest(SeeAllData=True)
public with sharing class ybnTestBatchableSatisfactionScores {

	public static testMethod void testBatch() {
		
		List<Account> accounts = new List<Account>();
		Set<Id> accountIds = new Set<Id>();
		List<Task> tasks = new List<Task>();
		
		for(Integer i = 0; i < 1; i++) {
			Account a = ybnTestUtils.getAccountCorporateRelationship();
			accountIds.add(a.Id);
			accounts.add(a);
		}
				
		for(Account a: accounts) {
			Task t = new Task(
				Subject = 'Test', 
				Status = 'Completed', 
				CS_Customer_Satisfaction_Score__c = 5,
				Sales_Customer_Satisfaction_Score__c = 5,
				ActivityDate = System.today(),
				WhatId = a.Id,
				Milestone__c = 'Internal Meeting',
				Description = 'test');
			t.RecordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipTaskRecordTypeId();
			tasks.add(t);
			
			t = new Task(
				Subject = 'Test', 
				Status = 'Completed', 
				CS_Customer_Satisfaction_Score__c = 7,
				Sales_Customer_Satisfaction_Score__c = 7,
				ActivityDate = System.today().addDays(-85),
				WhatId = a.Id,
				RecordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipTaskRecordTypeId(),
				Milestone__c = 'Internal Meeting',
				Description = 'test');
			//tasks.add(t);
			
			t = new Task(
				Subject = 'Test', 
				Status = 'Completed', 
				CS_Customer_Satisfaction_Score__c = 9,
				Sales_Customer_Satisfaction_Score__c = 9,
				ActivityDate = System.today().addDays(-115),
				WhatId = a.Id,
				RecordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipTaskRecordTypeId(),
				Milestone__c = 'Internal Meeting',
				Description = 'test');
			//tasks.add(t);
		}
		
		insert tasks;
		
		//System.assertEquals(30, [SELECT COUNT() FROM Task WHERE WhatId IN :accountIds]);
		
		test.startTest();
		ybnBatchableSatisfactionScores b = new ybnBatchableSatisfactionScores('SELECT Id FROM Account WHERE RecordTypeId = \'' + ybnUtils.getInstance().getYbnCorporateRelationshipAccountRecordTypeId() + '\' LIMIT 10');
		Id batchprocessid = Database.executeBatch(b);
		
		//accounts = [
		//	SELECT Id, 
		//		Customer_Sat_Score_Past_45_Days__c, Sales_Rated_Sat_Score_Past_45_Days__c, CS_Satisfaction_Score_Past_45_Da__c,
		//		Customer_Sat_Score_Past_90_Days__c, Sales_Rated_Sat_Score_Past_90_Days__c, CS_Satisfaction_Score_Past_90_Days__c,
		//		Customer_Sat_Score_Past_120_Days__c, Sales_Rated_Sat_Score_Past_120_Days__c, CS_Sat_Score_Past_120_Day__c
		//	FROM Account
		//	WHERE Id IN :accountIds];
		
		//System.assertEquals(10, accounts.size());
		
		//for(Account a: accounts) {
			//System.assertEquals(5, a.CS_Satisfaction_Score_Past_45_Da__c);
			//System.assertEquals(5, a.Sales_Rated_Sat_Score_Past_45_Days__c);
			//System.assertEquals(6, a.CS_Satisfaction_Score_Past_90_Days__c);
			//System.assertEquals(6, a.Sales_Rated_Sat_Score_Past_90_Days__c);
			//System.assertEquals(7, a.CS_Sat_Score_Past_120_Day__c);
			//System.assertEquals(7, a.Sales_Rated_Sat_Score_Past_120_Days__c);
		//}
		Test.StopTest();
	}
}