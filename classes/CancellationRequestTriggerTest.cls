@isTest
private class CancellationRequestTriggerTest {
    
    @isTest static void test_CancellationRequestTrigger() {
        Account newAccount = new Account();
        newAccount.Name = 'Tset Account';
        insert newAccount;

        Case newCase = new Case();
        newCase.Reason = 'CSC';
        newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
        newCase.AccountId = newAccount.Id;
        insert newCase;

        Cancellation_Request__c newCancellationRequest = new Cancellation_Request__c();
        newCancellationRequest.Account_Name__c = newAccount.Id;
        insert newCancellationRequest;

        /*newCancellationRequest.Outcome__c = 'Duplicate Retention Case';
        newCancellationRequest.Additional_Notes__c = 'Test Notes';
        update newCancellationRequest;

        newCancellationRequest.Outcome__c = 'In Progress';
        update newCancellationRequest;*/
    }

    @isTest static void test_CancellationRequestTriggerHandler() {
        Account newAccount = new Account();
        newAccount.Name = 'Tset Account';
        insert newAccount;

        Cancellation_Request__c newCancellationRequest = new Cancellation_Request__c();
        newCancellationRequest.Account_Name__c = newAccount.Id;
        insert newCancellationRequest;

        newCancellationRequest.Outcome__c = 'Duplicate Retention Case';
        newCancellationRequest.Additional_Notes__c = 'Test Notes';
        update newCancellationRequest;

        newCancellationRequest.Outcome__c = 'In Progress';
        update newCancellationRequest;
    }

    @isTest static void test_CancellationRequestTriggerEventCUDOperations() { 
        Id imsRepId = [SELECT Id FROM User WHERE Alias = 'sauto' LIMIT 1].Id;
        
        System.Debug('IMS Rep Id: ' + imsRepId);
        
        Account newAccount = new Account();
        newAccount.Name = 'Test Account for YO-62525 to span events for CancelRequest Updates';
        newAccount.Client_Type__c = 'Local';
        newAccount.IMS_Rep__c = imsRepId;  // To make Service_Model_Local__c ='Dedicated', populating underlying formula data
        insert newAccount;
        
        Account newAccount2 = new Account();
        newAccount2.Name = 'Test Account 2 for YO-62525 to span events for CancelRequest Updates';
        newAccount2.Client_Type__c = 'Local';
        newAccount2.IMS_Rep__c = imsRepId;  // To make Service_Model_Local__c ='Dedicated', populating underlying formula data
        insert newAccount2;

        Cancellation_Request__c newCancellationRequest = new Cancellation_Request__c();
        newCancellationRequest.Account_Name__c = newAccount2.Id;
        newCancellationRequest.Next_Scheduled_Contact_Date__c = DateTime.valueOf('2017-05-22 10:00:00'); 
        newCancellationRequest.Additional_Notes__c = 'Test scenario to Create a New Event from New Cancel Request Create';
        insert newCancellationRequest;
        
        newCancellationRequest.Next_Scheduled_Contact_Date__c = DateTime.valueOf('2017-05-19 09:00:00'); 
        newCancellationRequest.Additional_Notes__c = 'Test scenario of Update the NextSchedule Date , to create New event as no associated Event';
        update newCancellationRequest;
                
        newCancellationRequest.Next_Scheduled_Contact_Date__c = DateTime.valueOf('2017-05-19 11:00:00');  
        newCancellationRequest.Additional_Notes__c = 'Test scenario of Update the NextSchedule Date to valid Date , to update the associated Event';
        update newCancellationRequest;

        newCancellationRequest.Additional_Notes__c = 'Test scenario of NextScheduleDate not changed, however, Additional_Notes__c change, should not trigger any Event related code';
        update newCancellationRequest;

        newCancellationRequest.Next_Scheduled_Contact_Date__c = null; 
        newCancellationRequest.Additional_Notes__c = 'Test scenario of Update the NextSchedule Date to Null , to delete the associated Event';
        update newCancellationRequest;
        
                
    }
    
}