@isTest
private class CPPAccountPickerComponentControllerTest {
	
	@isTest static void test_method_one() {
		Account partnerAccount = new Account();
		partnerAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner Master Account').getRecordTypeId();
		partnerAccount.Name = 'Partner Account Test Name';
		partnerAccount.Partner_Status__c = 'Customer';
		insert partnerAccount;

		PageReference pageRef = Page.PartnerMarketingDevelopmentFundsTab;
		Test.setCurrentPage(pageRef);
		ApexPages.currentPage().getParameters().put('clientAccountId', partnerAccount.Id);

		CPPAccountPickerComponentController contr = new CPPAccountPickerComponentController();
		contr.getCPPAcctList();
		contr.selectAcct();
	}
	
}