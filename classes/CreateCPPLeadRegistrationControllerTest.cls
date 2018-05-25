@isTest
private class CreateCPPLeadRegistrationControllerTest {
	
	@isTest static void test_saveAndNew() {
		ApexPages.StandardController stdContr = new ApexPages.StandardController(new CPP_Lead_Registration__c());
		CreateCPPLeadRegistrationController contrExtension = new CreateCPPLeadRegistrationController(stdContr);

		contrExtension.saveAndNew();
	}
	
}