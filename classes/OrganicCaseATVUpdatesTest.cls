@isTest(seeAllData=true)
private class OrganicCaseATVUpdatesTest
{
    private static testMethod void updateATVAttributesTest()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        List<Account> dmlAccounts = new List<Account>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LS ATV Organic Setup').getRecordTypeId();
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        acct.Product_Type__c = 'Lead Stream ATV';
        dmlAccounts.add(acct);
        
        if(dmlAccounts.size() > 0){
            update dmlAccounts;
        }
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acctId;
        caseData.Services_Offered__c = 'Divorce Law\r\n Family Law';
        dmlCases.add(caseData);
        
        if(dmlCases.size() > 0){
            update dmlCases;
            
            for(Case c : dmlCases){
                caseIds.add(c.Id);
            }
        }
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        OrganicCaseATVUpdates.LSATVUpdates(caseIds);
        
        Test.stopTest();
    }
}