@isTest
public with sharing class ybnTestTriggerOpportunityToAccountFields {
	static testMethod void testInsertUpdateOpp() {
		
		Id recordTypeId = 
			[SELECT Id 
			FROM RecordType 
			WHERE SobjectType = 'Opportunity' AND Name = 'YBN - Initial Transaction' LIMIT 1].Id;
		
		
        Account acc = new Account(Name = 'My Account');
        insert acc;
        
        Opportunity opp = new Opportunity(Name = 'My Opp');
        opp.AccountId = acc.Id;
        opp.StageName = 'Qualification';
        opp.CloseDate = date.today().addDays(1);
        opp.RecordTypeId = recordTypeId;
        opp.Mutually_Agreed_Upon_Success_Metrics__c = 'Test 123';
        opp.Forecasted_Revenue__c = 1.0;
        insert opp;

        //acc = [SELECT Id, Mutually_Agreed_Upon_Success_Metrics__c FROM Account WHERE Id = :acc.Id];
        //System.assert(opp.Mutually_Agreed_Upon_Success_Metrics__c == acc.Mutually_Agreed_Upon_Success_Metrics__c);
        
        opp.New_Customers_per_Month_Goal__c =  321;
        update opp;
        
        //acc = [SELECT Id, New_Customers_per_Month_Goal__c FROM Account WHERE Id = :acc.Id];
        //System.assert(opp.New_Customers_per_Month_Goal__c == acc.New_Customers_per_Month_Goal__c);
        
    }
}