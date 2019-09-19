@isTest
private class CPPLeadRegistrationChildSchedAndBatch {
	
	@isTest static void test_CPPLeadRegistrationChildAcctLinkSchedule() {
		Account partnerAccount = new Account();
		partnerAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner Master Account').getRecordTypeId();
		partnerAccount.Name = 'Test Partner Account';
		insert partnerAccount;

		Contact testContact = new Contact();
		testContact.FirstName = 'Test Name';
		testContact.LastName = 'Last Name';
		testContact.AccountId = partnerAccount.Id;
		insert testContact;

		CPP_Lead_Registration__c cppLead = new CPP_Lead_Registration__c();
		cppLead.Submitted_By__c = testContact.Id;
		cppLead.Partner_Account__c = partnerAccount.Id;
		cppLead.Date_Submitted__c = Date.today();
		cppLead.Name = 'Test Company Name';
		cppLead.Lead_Phone_Number__c = '343334333';
		cppLead.Expected_Close_Date__c = Date.today().addDays(5);
		insert cppLead;

		cppLead.Lead_Registration_Status__c = 'Approved';
		cppLead.Gold_Nugget_Client_ID__c = '4343';
		update cppLead;

		Account childAccount = new Account();
		childAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
		childAccount.Name = 'Test Partner Account';
		childAccount.Client_ID__c = '4343';
		insert childAccount;

		Test.startTest();
		CPPLeadRegistrationChildAcctLinkSchedule sched = new CPPLeadRegistrationChildAcctLinkSchedule();
		sched.execute(null);
		Test.stopTest();
	}
	
}