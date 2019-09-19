@isTest(seeAllData=true)
private class AutoCreateCaseEmailMessageTest
{
    private static testMethod void createEmailMessageTest()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        List<Account> dmlAccts = new List<Account>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LS ATV Organic Setup').getRecordTypeId();
        
        Account acctData = (Account)acctList[0];
        Id acctId = acctData.Id;
        String acctName = acctData.Name;
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acctId;
        caseData.Name_of_Business_for_Name_Campaign__c = acctName;
        caseData.Services_Offered__c = 'Business Law';
        dmlCases.add(caseData);
        
        System.Debug('Account from (Case): ' + caseData.Account.Name);
        
        if(dmlCases.size() > 0){
            update dmlCases;
            
            for(Case c : dmlCases){
                caseIds.add(c.Id);
            }
        }
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        AutoCreateCaseEmailMessage.CreateEmailMessage(caseIds);
        
        Test.stopTest();
    }
}