@isTest
public with sharing class ybnTestTriggerOpportunityMilestone {
	static testMethod void testInsertUpdateOpp() {
        Account acc = new Account(Name = 'My Account');
        insert acc;
        
        Opportunity opp = new Opportunity(Name = 'My Opp');
        opp.AccountId = acc.Id;
        opp.StageName = 'Qualification';
        opp.CloseDate = date.today().addDays(1);
        opp.Milestone__c = 'MS01 - First';
        //insert opp;
        
        //opp = [SELECT Id, Modified_Milestone__c FROM Opportunity WHERE Id = :opp.Id];
        //System.assertEquals('MS01', opp.Modified_Milestone__c);
        
        opp.Milestone__c = 'MS02 - Second';
        //update opp;
        //opp = [SELECT Id, Modified_Milestone__c FROM Opportunity WHERE Id = :opp.Id];
        //System.assertEquals('MS02', opp.Modified_Milestone__c);
        
        opp.Milestone__c = 'MS01 - First';
        //update opp;
        //opp = [SELECT Id, Modified_Milestone__c FROM Opportunity WHERE Id = :opp.Id];
        //System.assertEquals('MS01', opp.Modified_Milestone__c);
        
        List<Milestone__c> milestones = 
        	[SELECT Id, Name, Previous_Milestone__c FROM Milestone__c WHERE Opportunity__c = :opp.Id];
        //System.assertEquals(2, milestones.size());
        
        for (Milestone__c ms: milestones) {
        	if (ms.Name == 'MS01') {
        		//System.assertEquals(null, ms.Previous_Milestone__c);
        	}
        	if (ms.Name == 'MS02') {
        		//System.assertEquals('MS01', ms.Previous_Milestone__c);
        	}
        }
        
    }
}