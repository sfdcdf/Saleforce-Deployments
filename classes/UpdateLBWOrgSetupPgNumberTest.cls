@isTest(seeAllData=true)
private class UpdateLBWOrgSetupPgNumberTest
{
    private static testMethod void updatePgNumberTest()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId();
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acctId;
        caseData.Services_Offered__c = 'Page 2 - Page2 \r\n TestPage 3 - Page3\r\nTestPage 4 - Page4Test';
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
        UpdateLBWOrgSetupPgNumber.UpdatePageNumbering(caseIds);
        
        Test.stopTest();
    }
}