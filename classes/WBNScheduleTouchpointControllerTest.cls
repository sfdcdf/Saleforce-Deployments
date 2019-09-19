@isTest
private class WBNScheduleTouchpointControllerTest {
    
    @isTest static void test_scheduleWBNTouchPoint() {
        List<Account> newAccountList = new List<Account>();
        List<Case> newCaseList = new List<Case>();
        List<Event> newEventList = new List<Event>();
    
        Account partnerAccount = new Account();
        partnerAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner Master Account').getRecordTypeId();
        partnerAccount.Name = 'Partner Account Test Name';
        partnerAccount.Partner_Status__c = 'Customer';
        partnerAccount.Client_Type__c = 'YBN';
        partnerAccount.Marketo_ID__c = '32232';
        partnerAccount.Status__c = 'LIVE';
        partnerAccount.IMS_Rep__c = UserInfo.getUserId();
        newAccountList.add(partnerAccount);
        insert newAccountList;

        Case newCase = new Case();
        newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Outbound Touch Point').getRecordTypeId();
        newCase.AccountId = partnerAccount.Id;
        newCaseList.add(newCase);
        insert newCaseList;

        Event newEvent = new Event();
        newEvent.OwnerId = UserInfo.getUserId();
        newEvent.Subject = 'OOO';
        newEvent.StartDateTime = DateTime.now().addDays(1);
        newEvent.DurationInMinutes = 30;
        newEvent.Status__c = 'Scheduled';
        newEvent.RecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('WBN Calendar Blocker').getRecordTypeId();
        newEventList.add(newEvent);
        insert newEventList;

        PageReference pageRef = Page.WBNScheduleTouchpoint;
        Test.setCurrentPage(pageRef);
        //ApexPages.currentPage().getParameters().put('salesforceAccountId', partnerAccount.Id);

        WBNScheduleTouchpointController contr = new WBNScheduleTouchpointController();
        contr.getWBNAccounts();
        contr.getSupportedTimeZone();

        contr.selectedAccountId = partnerAccount.Id;
        contr.dateCaseWorkAround.StartDate__c = Date.today().addDays(7);

        //contr.populateUserAvailability();
        //contr.selectedAvailableTime = contr.userAvailableDateTimeMap.values()[0][0].temporaryId;
        //contr.scheduleTime();
    }

    @isTest static void test_scheduleOptOutWBNTouchPoint() {
        List<Account> newAccountList = new List<Account>();
        List<Case> newCaseList = new List<Case>();
        List<Event> newEventList = new List<Event>();
    
        Account partnerAccount = new Account();
        partnerAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner Master Account').getRecordTypeId();
        partnerAccount.Name = 'Partner Account Test Name';
        partnerAccount.Partner_Status__c = 'Customer';
        partnerAccount.Client_Type__c = 'YBN';
        partnerAccount.Marketo_ID__c = '32232';
        partnerAccount.Status__c = 'LIVE';
        partnerAccount.IMS_Rep__c = UserInfo.getUserId();
        newAccountList.add(partnerAccount);
        insert newAccountList;

        Case newCase = new Case();
        newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Outbound Touch Point').getRecordTypeId();
        newCase.AccountId = partnerAccount.Id;
        newCaseList.add(newCase);
        insert newCaseList;

        Event newEvent = new Event();
        newEvent.OwnerId = UserInfo.getUserId();
        newEvent.Subject = 'OOO';
        newEvent.StartDateTime = DateTime.now().addDays(1);
        newEvent.DurationInMinutes = 30;
        newEvent.Status__c = 'Scheduled';
        newEvent.RecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('WBN Calendar Blocker').getRecordTypeId();
        newEventList.add(newEvent);
        insert newEventList;

        PageReference pageRef = Page.WBNScheduleTouchpoint;
        Test.setCurrentPage(pageRef);
        //ApexPages.currentPage().getParameters().put('salesforceAccountId', partnerAccount.Id);

        WBNScheduleTouchpointController contr = new WBNScheduleTouchpointController();
        contr.getWBNAccounts();
        contr.getSupportedTimeZone();

        contr.selectedAccountId = partnerAccount.Id;
        contr.dateCaseWorkAround.StartDate__c = Date.today().addDays(7);

        //contr.populateUserAvailability();
        //contr.optOutOfCurrentTouchpoint();
    }

    @isTest static void test_scheduleUnOptOutWBNTouchPoint() {
        List<Account> newAccountList = new List<Account>();
        List<Case> newCaseList = new List<Case>();
        List<Event> newEventList = new List<Event>();
    
        Account partnerAccount = new Account();
        partnerAccount.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner Master Account').getRecordTypeId();
        partnerAccount.Name = 'Partner Account Test Name';
        partnerAccount.Partner_Status__c = 'Customer';
        partnerAccount.Client_Type__c = 'YBN';
        partnerAccount.Marketo_ID__c = '32232';
        partnerAccount.Status__c = 'LIVE';
        partnerAccount.IMS_Rep__c = UserInfo.getUserId();
        newAccountList.add(partnerAccount);
        insert newAccountList;

        Case newCase = new Case();
        newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Outbound Touch Point').getRecordTypeId();
        newCase.AccountId = partnerAccount.Id;
        newCaseList.add(newCase);
        insert newCaseList;

        Event newEvent = new Event();
        newEvent.OwnerId = UserInfo.getUserId();
        newEvent.Subject = 'OOO';
        newEvent.StartDateTime = DateTime.now().addDays(1);
        newEvent.DurationInMinutes = 30;
        newEvent.Status__c = 'Scheduled';
        newEvent.RecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('WBN Calendar Blocker').getRecordTypeId();
        newEventList.add(newEvent);
        insert newEventList;

        PageReference pageRef = Page.WBNScheduleTouchpoint;
        Test.setCurrentPage(pageRef);
        //ApexPages.currentPage().getParameters().put('salesforceAccountId', partnerAccount.Id);

        WBNScheduleTouchpointController contr = new WBNScheduleTouchpointController();
        contr.getWBNAccounts();
        contr.getSupportedTimeZone();

        contr.selectedAccountId = partnerAccount.Id;
        contr.dateCaseWorkAround.StartDate__c = Date.today().addDays(7);

        //contr.populateUserAvailability();
        //contr.optOutOfCurrentTouchpoint();

        Test.startTest();
        //contr.unOptOutOfCurrentTouchpoint();
        Test.stopTest();
    }
    
}