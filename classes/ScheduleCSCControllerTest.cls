@isTest
private class ScheduleCSCControllerTest {
	
	@isTest static void test_ScheduleCSCController() {
		Account acct = new Account();
		acct.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
		acct.Name = 'Partner Account Test Name';
		acct.Partner_Status__c = 'Customer';
		acct.Client_Type__c = 'Local';
		acct.Marketo_ID__c = '32232';
		acct.Status__c = 'LIVE';
		acct.IMS_Rep__c = UserInfo.getUserId();
		insert acct;

		Case newCase = new Case();
		newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
		newCase.Reason = 'CSC';
		newCase.AccountId = acct.Id;
		insert newCase;

		Event newEvent = new Event();
		newEvent.OwnerId = UserInfo.getUserId();
		newEvent.Subject = 'OOO';
		newEvent.StartDateTime = DateTime.now().addDays(1);
		newEvent.DurationInMinutes = 30;
		newEvent.Status__c = 'Scheduled';
		newEvent.RecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('Calendar Blocker').getRecordTypeId();
		insert newEvent;

		PageReference pageRef = Page.ScheduleCSC;
		Test.setCurrentPage(pageRef);
		//ApexPages.currentPage().getParameters().put('salesforceAccountId', partnerAccount.Id);

		ScheduleCSCController contr = new ScheduleCSCController();
		contr.getSupportedTimeZone();

		contr.selectedAccountId = acct.Id;
		contr.dateCaseWorkAround.StartDate__c = Date.today().addDays(7);

		contr.populateUserAvailability();
		contr.selectedAvailableTime = contr.userAvailableDateTimeMap.values()[0][0].temporaryId;
		contr.scheduleTime();
	}
	
	@isTest static void test_ScheduleCSCControllerUnschedule() {
		Account acct = new Account();
		acct.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
		acct.Name = 'Partner Account Test Name';
		acct.Partner_Status__c = 'Customer';
		acct.Client_Type__c = 'Local';
		acct.Marketo_ID__c = '32232';
		acct.Status__c = 'LIVE';
		acct.IMS_Rep__c = UserInfo.getUserId();
		acct.tz__Timezone_IANA__c = 'America/Chicago';
		insert acct;

		Case newCase = new Case();
		newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
		newCase.Reason = 'CSC';
		newCase.AccountId = acct.Id;
		insert newCase;

		Event newEvent = new Event();
		newEvent.OwnerId = UserInfo.getUserId();
		newEvent.Subject = 'OOO';
		newEvent.StartDateTime = DateTime.now().addDays(1);
		newEvent.DurationInMinutes = 30;
		newEvent.Status__c = 'Scheduled';
		newEvent.RecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('Calendar Blocker').getRecordTypeId();
		insert newEvent;

		PageReference pageRef = Page.ScheduleCSC;
		Test.setCurrentPage(pageRef);
		ApexPages.currentPage().getParameters().put('salesforceAccountId', acct.Id);

		ScheduleCSCController contr = new ScheduleCSCController();
		contr.getSupportedTimeZone();

		contr.selectedAccountId = acct.Id;
		contr.dateCaseWorkAround.StartDate__c = Date.today().addDays(7);

		contr.populateUserAvailability();
		contr.unscheduleCurrentTouchpoint();
	}
	
}