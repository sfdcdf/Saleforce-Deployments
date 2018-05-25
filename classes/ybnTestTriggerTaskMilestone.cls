@isTest
public with sharing class ybnTestTriggerTaskMilestone {
	static testMethod void test() {
		Task t = new Task(Subject = 'Test', Milestone__c = 'M004 - Bla');
		insert t;

		//t = [SELECT Modified_Milestone__c FROM Task WHERE Id = :t.Id LIMIT 1];
		//System.assertEquals('M004', t.Modified_Milestone__c);
		
		t.Milestone__c = 'M005 - Foo';
		update t;
		//t = [SELECT Modified_Milestone__c FROM Task WHERE Id = :t.Id LIMIT 1];
		//System.assertEquals('M005', t.Modified_Milestone__c);
	}

}