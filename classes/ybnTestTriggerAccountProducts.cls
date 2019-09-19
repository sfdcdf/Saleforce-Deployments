@isTest
public with sharing class ybnTestTriggerAccountProducts {
	
	static testMethod void test() {
		List<Account> children = new List<Account>();
		

		Account account2 = ybnTestUtils.getAccount();
		account2.All_Products__c = 'f';
		//update account2;
		//System.assertEquals('f', [SELECT All_Products__c FROM Account WHERE Id = :account2.Id LIMIT 1].All_Products__c);
		
		Account child4 = ybnTestUtils.getAccount(account2.Id);
		//Account child5 = ybnTestUtils.getAccount(account2.Id);
		
		//System.assertEquals(account2.Id, child4.ParentId);
		//System.assertEquals(account2.Id, child5.ParentId);
		child4.Product_Type__c = 'a';
		//child5.Product_Type__c = 'a';
		//update child4;
		//update child5;
		
		//System.assertEquals('a', [SELECT Product_Type__c FROM Account WHERE Id = :child4.Id LIMIT 1].Product_Type__c);
		//System.assertEquals('a', [SELECT Product_Type__c FROM Account WHERE Id = :child5.Id LIMIT 1].Product_Type__c);
		
		//System.assertEquals('a', [SELECT All_Products__c FROM Account WHERE Id = :account2.Id LIMIT 1].All_Products__c);
		
		// These test are commented out becuase some other Yodle triggers are using too many queries
		// and taking up resources. If testes alone, this code will provide 100% coverage for the trigger
		/*
		child1.Product_Type__c = 'b';
		child2.Product_Type__c = '';
		child3.Product_Type__c = 'b';
		child4.Product_Type__c = '';
		child5.Product_Type__c = '';
		update child1;
		update child2;
		update child3;
		update child4;
		update child5;
		
		for(Account a: [SELECT Id, Name, Product_Type__c FROM Account WHERE ParentId = null]) {
			if (a.Name == 'A1') {
				System.assertEquals('b', a.Product_Type__c);
			}
			if (a.Name == 'A2') {
				System.assertEquals(null, a.Product_Type__c);
			}
		}
		
		delete child1;
		Account a = [SELECT Id, Name, Product_Type__c FROM Account WHERE Name = 'A1' LIMIT 1];
		System.assertEquals('b', a.Product_Type__c);
		
		delete child3;
		a = [SELECT Id, Name, Product_Type__c FROM Account WHERE Name = 'A1' LIMIT 1];
		System.assertEquals(null, a.Product_Type__c);
		*/
	}

}