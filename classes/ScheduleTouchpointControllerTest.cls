@isTest
private class ScheduleTouchpointControllerTest {
    
    @isTest static void test_ScheduleTouchpointController() {
        List<Account> newAccountList = new List<Account>();
        List<Case> newCaseList = new List<Case>();
        List<Event> newEventList = new List<Event>();
        
        Account acct = new Account();
        acct.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
        acct.Name = 'Partner Account Test Name';
        acct.Partner_Status__c = 'Customer';
        acct.Client_Type__c = 'Local';
        acct.Marketo_ID__c = '32232';
        acct.Status__c = 'LIVE';
        acct.IMS_Rep__c = UserInfo.getUserId();
        newAccountList.add(acct);
        insert newAccountList;

        Case newCase = new Case();
        newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
        newCase.Reason = 'CS Touch Plan';
        newCase.AccountId = acct.Id;
        newCaseList.add(newCase);
        insert newCaseList;

        Event newEvent = new Event();
        newEvent.OwnerId = UserInfo.getUserId();
        newEvent.Subject = 'OOO';
        newEvent.StartDateTime = DateTime.now().addDays(1);
        newEvent.DurationInMinutes = 30;
        newEvent.Status__c = 'Scheduled';
        newEvent.RecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('Calendar Blocker').getRecordTypeId();
        newEventList.add(newEvent);
        insert newEventList;

        Test.startTest();

        PageReference pageRef = Page.SchedulePerformanceReviewCall;
        Test.setCurrentPage(pageRef);
        //ApexPages.currentPage().getParameters().put('salesforceAccountId', partnerAccount.Id);

        ScheduleTouchpointController contr = new ScheduleTouchpointController();
        contr.getAvailableAccounts();
        contr.getSupportedTimeZone();

        contr.selectedAccountId = acct.Id;
        contr.dateCaseWorkAround.StartDate__c = Date.today().addDays(7);

        contr.populateUserAvailability();
        contr.selectedAvailableTime = contr.userAvailableDateTimeMap.values()[0][0].temporaryId;
        contr.scheduleTime();

        Test.stopTest();
    }
    
    @isTest static void test_method_two() {
        List<Account> newAccountList = new List<Account>();
        List<Case> newCaseList = new List<Case>();
        List<Event> newEventList = new List<Event>();
    
        Account acct = new Account();
        acct.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
        acct.Name = 'Partner Account Test Name';
        acct.Partner_Status__c = 'Customer';
        acct.Client_Type__c = 'Local';
        acct.Marketo_ID__c = '32232';
        acct.Status__c = 'LIVE';
        acct.IMS_Rep__c = UserInfo.getUserId();
        acct.tz__Timezone_IANA__c = 'America/Chicago';
        newAccountList.add(acct);
        insert newAccountList;

        Case newCase = new Case();
        newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
        newCase.Reason = 'CS Touch Plan';
        newCase.AccountId = acct.Id;
        newCaseList.add(newCase);
        insert newCaseList;

        Event newEvent = new Event();
        newEvent.OwnerId = UserInfo.getUserId();
        newEvent.Subject = 'OOO';
        newEvent.StartDateTime = DateTime.now().addDays(1);
        newEvent.DurationInMinutes = 30;
        newEvent.Status__c = 'Scheduled';
        newEvent.RecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('Calendar Blocker').getRecordTypeId();
        newEventList.add(newEvent);
        insert newEventList;

        PageReference pageRef = Page.SchedulePerformanceReviewCall;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('salesforceAccountId', acct.Id);

        ScheduleTouchpointController contr = new ScheduleTouchpointController();
        contr.getAvailableAccounts();
        contr.getSupportedTimeZone();

        contr.selectedAccountId = acct.Id;
        contr.dateCaseWorkAround.StartDate__c = Date.today().addDays(7);

        //contr.populateUserAvailability();
        //contr.unscheduleCurrentTouchpoint();
    }
    
}