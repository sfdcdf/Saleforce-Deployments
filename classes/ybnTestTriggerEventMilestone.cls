@isTest
public with sharing class ybnTestTriggerEventMilestone {
	static testMethod void test() {
		Event e = new Event(Subject = 'Test', Milestone__c = 'M004 - Bla');
		e.DurationInMinutes = 1;
		e.ActivityDateTime = System.today();
		insert e;

		//e = [SELECT Modified_Milestone__c FROM Event WHERE Id = :e.Id LIMIT 1];
		//System.assertEquals('M004', e.Modified_Milestone__c);
		
		e.Milestone__c = 'M005 - Foo';
		update e;
		//e = [SELECT Modified_Milestone__c FROM Event WHERE Id = :e.Id LIMIT 1];
		//System.assertEquals('M005', e.Modified_Milestone__c);
	}

}