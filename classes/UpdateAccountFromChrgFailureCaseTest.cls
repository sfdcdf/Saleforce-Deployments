@isTest(seeAllData=true)
private class UpdateAccountFromChrgFailureCaseTest
{
    private static testMethod void updateAccountTest()
    {
       // load test data from static resources
        /*List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Charge Failure').getRecordTypeId();
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        System.Debug('Account from (Account): ' + acctName);
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acctId;
        update caseData;
        
        System.Debug('Account from (Case): ' + caseData.Account.Name);
        
        Cancellation_Request__c newCancellationRequest = new Cancellation_Request__c();
        newCancellationRequest.Account_Name__c = acctId;
        newCancellationRequest.Next_Scheduled_Contact_Date__c = DateTime.valueOf('2017-05-22 10:00:00'); 
        newCancellationRequest.Additional_Notes__c = 'Test scenario to Create a New Event from New Cancel Request Create';
        insert newCancellationRequest;
        
        caseIds.add(caseId);
        
        System.Debug('Account from (Cancel Form): ' + newCancellationRequest.Account_Name__r.Name);
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        UpdateAccountFromChrgFailureCase.updateAccountCancelFormFields(caseIds);
        
        
        Test.stopTest();*/
    }
}