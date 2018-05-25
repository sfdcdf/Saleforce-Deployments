@isTest(SeeAllData=true)
private class SEOAuditCaseTest {
	
	@isTest static void testToday() {
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
	}
}