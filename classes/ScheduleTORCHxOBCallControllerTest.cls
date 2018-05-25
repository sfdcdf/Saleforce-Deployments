@isTest
private class ScheduleTORCHxOBCallControllerTest {
	
	@isTest static void test_ScheduleTORCHxOBCallController() {
		List<AdjustCustomCodeLimit__c> limitList = new List<AdjustCustomCodeLimit__c>();
		AdjustCustomCodeLimit__c txLimit = new AdjustCustomCodeLimit__c();
		txLimit.Name = 'TORCHxMedicalOBCallLimit:01:00 PM';
		txLimit.Limit__c = 1;
		limitList.add(txLimit);

		AdjustCustomCodeLimit__c txLimit1 = new AdjustCustomCodeLimit__c();
		txLimit1.Name = 'TORCHxMedicalOBCallLimit:12:00 PM';
		txLimit1.Limit__c = 1;
		limitList.add(txLimit1);

		AdjustCustomCodeLimit__c txLimit2 = new AdjustCustomCodeLimit__c();
		txLimit2.Name = 'TORCHxMedicalOBCallLimit:11:00 AM';
		txLimit2.Limit__c = 1;
		limitList.add(txLimit2);

		AdjustCustomCodeLimit__c txLimit3 = new AdjustCustomCodeLimit__c();
		txLimit3.Name = 'TORCHxMedicalOBCallLimit:10:00 AM';
		txLimit3.Limit__c = 1;
		limitList.add(txLimit3);

		insert limitList;

		Account testAccount = new Account();
		testAccount.Name = 'Test Name';
		testAccount.Product_Type__c = 'TORCHX';
		testAccount.Secondary_Segments__c = 'Dentist';
		insert testAccount;

		Case testCase = new Case();
		testCase.AccountId = testAccount.Id;
		testCase.Scheduled_Call__c = DateTime.newInstance(Date.today().addDays(10).toStartOfWeek().addDays(2), Time.newInstance(12, 0, 0, 0));
		testCase.Subject = 'TORCHx CSC - Setup Call';
		insert testCase;

		Lighthouse_Worksheets__c lhws = new Lighthouse_Worksheets__c();
		lhws.Practice_Name__c = testAccount.Id;
		lhws.CSC_Date__c = Date.today().addDays(10).toStartOfWeek().addDays(2);
		lhws.CSC_Time__c = '2:00pm EST';
		lhws.RecordTypeId = Schema.SObjectType.Lighthouse_Worksheets__c.getRecordTypeInfosByName().get('CSC Worksheet - Dental').getRecordTypeId();
		insert lhws;

		Test.startTest();

		PageReference pageRef = Page.ScheduleTORCHxOBCall;
		Test.setCurrentPage(pageRef);

		ApexPages.currentPage().getParameters().put('salesforceAccountId', testAccount.Id);

		ScheduleTORCHxOBCallController contr = new ScheduleTORCHxOBCallController();
		contr.getSupportedTimeZone();
		contr.getOpenCases();

		contr.dateCaseWorkAround.StartDate__c = Date.today().addDays(10);
		contr.selectDateFilter();

		contr.selectedAvailableTime = contr.selectTempIdToAvailableDateTimeMap.values()[0].selectDateTimeId;
		contr.scheduleDateTime();

		Test.stopTest();
	}
	
}