@isTest
public with sharing class ybnTestTriggerAccountLiveDate {
	static testMethod void testInsertChild() {
        Account parent = ybnTestUtils.getAccountCorporateRelationship();
        
        System.debug('***YBN*** ' + parent.Id);
        
        Account child1 = ybnTestUtils.getAccount(parent.Id);
        child1.Live_Date__c = System.today();
        //update child1;
        
        //parent = [SELECT Id, Live_Date__c FROM Account WHERE Id = :parent.Id];
        
        //System.assertEquals(child1.Live_Date__c, parent.Live_Date__c);
    }
    
    static testMethod void testUpdateChild() {
        Account parent = ybnTestUtils.getAccountCorporateRelationship();
        
        Account child1 = ybnTestUtils.getAccount(parent.Id);
        
        child1.Live_Date__c = System.today();
        //update child1;
        
        //parent = [SELECT Id, Live_Date__c FROM Account WHERE Id = :parent.Id];
        
        //System.assertEquals(child1.Live_Date__c, parent.Live_Date__c);
    }
    
    static testMethod void testUpdateChildWithSmallerDate() {
        //Account parent = ybnTestUtils.getAccountCorporateRelationship();
        
        //Account child1 = ybnTestUtils.getAccount(parent.Id);
        
        //child1.Live_Date__c = date.newInstance(2013, 1, 5);
        //update child1;
        
        //Account child2 = ybnTestUtils.getAccount(parent.Id);
        //child2.Live_Date__c = date.newInstance(2013, 1, 1);
        //update child2;
        
        //parent = [SELECT Id, Live_Date__c FROM Account WHERE Id = :parent.Id];
        
        //System.assertEquals(child2.Live_Date__c, parent.Live_Date__c);
    }
    
    static testMethod void testUpdateChildWithLargerDate() {
        //Account parent = ybnTestUtils.getAccountCorporateRelationship();
        
        //Account child1 = ybnTestUtils.getAccount(parent.Id); 
        //child1.Live_Date__c = date.newInstance(2013, 1, 5);
        //update child1;
        
        
        //Account child2 = ybnTestUtils.getAccount(parent.Id);
        //child2.Live_Date__c = date.newInstance(2013, 1, 10);
        //update child2;
        
       // parent = [SELECT Id, Live_Date__c FROM Account WHERE Id = :parent.Id];
        
        //System.assertEquals(child1.Live_Date__c, parent.Live_Date__c);
    }
    
    static testMethod void testMultipleUpdates() {
        //Account parent = ybnTestUtils.getAccountCorporateRelationship();
        //Account child1 = ybnTestUtils.getAccount(parent.Id);
        //Account child2 = ybnTestUtils.getAccount(parent.Id);
        //Account child3 = ybnTestUtils.getAccount(parent.Id);
        
        //child1.Live_Date__c = date.newInstance(2013, 1, 10);
        //child2.Live_Date__c = date.newInstance(2013, 1, 5);
        //child3.Live_Date__c = date.newInstance(2013, 1, 8);
        
        //update new List<Account>{child1, child2, child3};
        
        //parent = [SELECT Id, Live_Date__c FROM Account WHERE Id = :parent.Id];
        
        //System.assertEquals(child2.Live_Date__c, parent.Live_Date__c);
    }
}