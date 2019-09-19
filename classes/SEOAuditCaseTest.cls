/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019*/
@isTest//(SeeAllData=true)
private class SEOAuditCaseTest {
    static testMethod void test_SEOAuditCaseBatch() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          SEOAuditCaseBatch  obj = new SEOAuditCaseBatch();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
    
    
        static testMethod void test_SEOAuditCaseJob() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          SEOAuditCaseJob  obj = new SEOAuditCaseJob();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
	
/*	@isTest static void testToday() {
		// Any user will do for this test
		User u = [SELECT Id FROM User WHERE isActive = true LIMIT 1];

		List<Account> accts = new List<Account>{
			new Account(Name='TEest 0', Live_Date__c=Date.today(), Sales_Director__c=u.id, Account_Director__c=u.id),
			new Account(Name='TEest 1', Live_Date__c=Date.today().addDays(-30), Sales_Director__c=u.id, Account_Director__c=u.id),
			new Account(Name='TEest 2', Live_Date__c=Date.today().addDays(-60), Sales_Director__c=u.id, Account_Director__c=u.id)
		};
		insert accts;

		Test.startTest();
			SEOAuditCaseBatch b = new SEOAuditCaseBatch();
			b.runJob([SELECT Id, Name, Account_Director__r.Email, 
						Sales_Director__r.Email, Live_Date__c
					 FROM 	Account 
					 WHERE 	Live_Date__c = :Date.today()
					 OR 	Live_Date__c = :Date.today().addDays(-30) 
					 OR 	Live_Date__c = :Date.today().addDays(-60)]);
		Test.stopTest();
	}*/
}