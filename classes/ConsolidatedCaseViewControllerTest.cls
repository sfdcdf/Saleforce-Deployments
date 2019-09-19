@isTest
private class ConsolidatedCaseViewControllerTest {
	
	@isTest static void test_ConsolidatedCaseViewController() {
		Account acct = new Account();
		acct.Name = 'Test Account';
		insert acct;

		Case newCase = new Case();
		newCase.AccountId = acct.Id;
		insert newCase;

		Test.startTest();

		PageReference currentPage = Page.ConsolidatedCaseView;
		Test.setCurrentPage(currentPage);

		ConsolidatedCaseViewController contr = new ConsolidatedCaseViewController();
		contr.getCaseList();

		Test.stopTest();
	}
	
}