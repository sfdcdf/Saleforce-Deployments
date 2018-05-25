@isTest
private class TORCHxClientInfoWebFormControllerTest {
	
	@isTest static void test_TORCHxClientInfoWebFormController() {
		Account testAccount = new Account();
		testAccount.Name = 'Test Account Name';
		insert testAccount;

		Case testCase = new Case();
		testCase.AccountId = testAccount.Id;
		insert testCase;

		PageReference pageRef = Page.TORCHxClientInfoWebForm;
		Test.setCurrentPage(pageRef);

		ApexPages.currentPage().getParameters().put('ncsCaseID', testCase.Id);

		TORCHxClientInfoWebFormController contr = new TORCHxClientInfoWebFormController();

		contr.webForm.mlsId = 'fakeMLSId';
		contr.webForm.primaryUser = 'Primary User';
		contr.webForm.top5TargetAreas = 'target area';
		contr.webForm.filterList = 'filter list';
		contr.webForm.domainName = 'test domain name';
		contr.webForm.loginUsername = 'username';
		contr.webForm.loginPW = 'pw';

		contr.attachedLogo1.Name = 'test attachedLogo1';
		contr.attachedLogo1.body = Blob.valueof('Test test');

		contr.attachedLogo2.Name = 'test attachedLogo2';
		contr.attachedLogo2.body = Blob.valueof('Test test');

		contr.attachedLogo3.Name = 'test attachedLogo3';
		contr.attachedLogo3.body = Blob.valueof('Test test');

		contr.attachedLogo4.Name = 'test attachedLogo4';
		contr.attachedLogo4.body = Blob.valueof('Test test');

		contr.attachedLogo5.Name = 'test attachedLogo5';
		contr.attachedLogo5.body = Blob.valueof('Test test');

		contr.saveFormData();
	}

	@isTest static void test_TORCHxClientInfoWebFormControllerSubmitted() {
		Account testAccount = new Account();
		testAccount.Name = 'Test Account Name';
		insert testAccount;

		Case testCase = new Case();
		testCase.AccountId = testAccount.Id;
		insert testCase;

		PageReference pageRef = Page.TORCHxClientInfoWebForm;
		Test.setCurrentPage(pageRef);

		ApexPages.currentPage().getParameters().put('submitted', 'true');

		TORCHxClientInfoWebFormController contr = new TORCHxClientInfoWebFormController();
	}

	@isTest static void test_TORCHxClientInfoWebFormControllerError() {
		Account testAccount = new Account();
		testAccount.Name = 'Test Account Name';
		insert testAccount;

		Case testCase = new Case();
		testCase.AccountId = testAccount.Id;
		insert testCase;

		PageReference pageRef = Page.TORCHxClientInfoWebForm;
		Test.setCurrentPage(pageRef);

		ApexPages.currentPage().getParameters().put('ncsCaseID', 'true');

		TORCHxClientInfoWebFormController contr = new TORCHxClientInfoWebFormController();
	}
	
}