@isTest
public with sharing class ybnTestTriggerAccountServiceLevel {
	static testMethod void test() {
        Account parent = new Account(Name = 'P1', Individual_Location_Service_Level__c = 'b');
        insert parent;
        
        Account child1 = new Account(Name = 'C1', ParentId = parent.Id);
        Account child2 = new Account(Name = 'C2', ParentId = parent.Id);
        insert child1; insert child2;
        
        parent.Individual_Location_Service_Level__c = 'a';
        update parent;
        
        /*
        System.assertEquals(
        	'a', 
        	[SELECT Individual_Location_Service_Level__c 
        	FROM Account 
        	WHERE Name = 'C1' LIMIT 1].Individual_Location_Service_Level__c);
        System.assertEquals(
        	'a', 
        	[SELECT Individual_Location_Service_Level__c 
        	FROM Account 
        	WHERE Name = 'C2' LIMIT 1].Individual_Location_Service_Level__c);
        */
        //parent.Individual_Location_Service_Level__c = 'b';
        //update parent;
        
        //User user = [SELECT Id FROM User LIMIT 1];
        //parent.Account_Director__c = user.Id;
        //parent.Lead_Analyst__c = user.Id;
        //parent.Sales_Director__c = user.Id;
        //update parent;
        
        
        /*
        System.assertEquals(
        	'b', 
        	[SELECT Individual_Location_Service_Level__c 
        	FROM Account 
        	WHERE Name = 'C1' LIMIT 1].Individual_Location_Service_Level__c);
        System.assertEquals(
        	'b', 
        	[SELECT Individual_Location_Service_Level__c 
        	FROM Account 
        	WHERE Name = 'C2' LIMIT 1].Individual_Location_Service_Level__c);
        */
    }
}