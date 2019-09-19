@isTest
public with sharing class ybnTestTriggerAccountServiceLevelTask {
	static testMethod void testLevelA() {

		Account p = new Account(Name = 'P');		
		insert p;
		
        Account a = new Account(
        	Name = 'P1', 
        	ParentId = p.Id, 
        	Individual_Location_Service_Level__c = 'Service Level A');
        	
        insert a;
        
        a.Days_Live__c = 1;
        update a;
        //System.assertEquals(0, [SELECT COUNT() FROM Task WHERE WhatId = :a.Id]);

		a.Days_Live__c = 26;
        //update a;
       // System.assertEquals(1, [SELECT COUNT() FROM Task WHERE WhatId = :a.Id]);

		a.Days_Live__c = 55;
        //update a;
        //System.assertEquals(1, [SELECT COUNT() FROM Task WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 56;
        //update a;
        //System.assertEquals(2, [SELECT COUNT() FROM Task WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 85;
        //update a;
        //System.assertEquals(2, [SELECT COUNT() FROM Task WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 86;
       // update a;
        //System.assertEquals(3, [SELECT COUNT() FROM Task WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 116;
        //update a;
        //System.assertEquals(4, [SELECT COUNT() FROM Task WHERE WhatId = :a.Id]);
	}
	
	static testMethod void testLevelB() {
		Account p = new Account(Name = 'P');		
		insert p;
		
        Account a = new Account(
        	Name = 'P1', 
        	ParentId = p.Id, 
        	Individual_Location_Service_Level__c = 'Service Level B');
        	
        insert a;
        
        //a.Days_Live__c = 1;
        update a;
        //System.assertEquals(0, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);

		a.Days_Live__c = 26;
        update a;
        //System.assertEquals(1, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);

		a.Days_Live__c = 55;
        //update a;
        //System.assertEquals(1, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 56;
        //update a;
        //System.assertEquals(2, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 85;
        //update a;
        //System.assertEquals(2, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 86;
        //update a;
        //System.assertEquals(2, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 116;
        //update a;
        //System.assertEquals(3, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);
	}
	
	static testMethod void testLevelC() {
		Account p = new Account(Name = 'P');		
		insert p;
		
        Account a = new Account(
        	Name = 'P1', 
        	ParentId = p.Id, 
        	Individual_Location_Service_Level__c = 'Service Level C');
        	
        insert a;
        
        a.Days_Live__c = 1;
        //update a;
        //System.assertEquals(0, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);

		a.Days_Live__c = 26;
        //update a;
        //System.assertEquals(1, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);

        a.Days_Live__c = 85;
        update a;
        //System.assertEquals(1, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 86;
        //update a;
        //System.assertEquals(2, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 175;
        //update a;
        //System.assertEquals(2, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);
        
        a.Days_Live__c = 176;
        //update a;
        //System.assertEquals(3, [SELECT COUNT() FROM TASK WHERE WhatId = :a.Id]);
	}
}