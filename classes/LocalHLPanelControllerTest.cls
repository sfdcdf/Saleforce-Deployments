@isTest
private class LocalHLPanelControllerTest {
	
	@isTest static void test_method_one() {
		Account newAccount = new Account();
		newAccount.Name = 'Testing Cancellation Test';
		insert newAccount;

		Case newCase = new Case();
		newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LH Cancel Request').getRecordTypeId();
		newCase.AccountId = newAccount.Id;
		insert newCase;

		Organic_Analysis__c newOrgCase = new Organic_Analysis__c();
		newOrgCase.RecordTypeId = Schema.SObjectType.Organic_Analysis__c.getRecordTypeInfosByName().get('Maps Initial Claiming').getRecordTypeId();
		newOrgCase.Account_Name__c = newAccount.Id;
		newOrgCase.Google_Listing_Status__c = 'Awaiting PIN';
		insert newOrgCase;

		Test.startTest();
		ApexPages.StandardController stdAcct = new ApexPages.StandardController(newAccount);
	    LocalHLPanelController contrExt  = new LocalHLPanelController(stdAcct);
	    Test.stopTest();
	}
	
}