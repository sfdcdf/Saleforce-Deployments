@isTest
public with sharing class ybnTestTriggerTaskEmailUserSignUp {
	static testMethod void test() {
		Task t = new Task(
			Subject = 'Test', 
			Milestone__c = 'User Sign Up', 
			Activity_Type__c  = 'Network Communications Portal Notification',
			Relationship_Name__c = 'Foo');
		insert t;

		//t = [SELECT Modified_Milestone__c FROM Task WHERE Id = :t.Id LIMIT 1];
		//System.assertEquals('M004', t.Modified_Milestone__c);
		
	}
}