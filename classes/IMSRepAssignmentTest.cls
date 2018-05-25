@isTest
private class IMSRepAssignmentTest 
{

    private static testMethod void assignmentTest()
    {
        // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<SObject> lhWkshtList = Test.LoadData(Lighthouse_Worksheets__c.sObjectType, 'testLHWorksheets');
        List<Id> caseIds = new List<Id>();
        List<Case> updateCaseList = new List<Case>();
        List<Lighthouse_Worksheets__c> updateWkshtList = new List<Lighthouse_Worksheets__c>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LH Master').getRecordTypeId();
        
        // Quick Debug test to ensure static resource loads correctly
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        System.Debug('Account Name from loaded static resource is:' + acctName);
        
        // Assign Case Id from static resource first entry
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        caseData.RecordTypeId = caseRecordTypeId;
        updateCaseList.add(caseData);
        //update updateCaseList;
        
        caseIds.add(caseId);
        
        // Ensure LHS Worksheet MS_Date will always meet criteria regardless of date within static resource
        Lighthouse_Worksheets__c lhWksht = (Lighthouse_Worksheets__c)lhWkshtList[0];
        lhWksht.MA_Date__c = todayDt;
        lhWksht.Practice_Name__c = acctId;
        updateWkshtList.add(lhWksht);
        //update updateWkshtList;
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        IMSRepAssignment.assignIMSRepFromCSCRep(caseIds);
        
        // assert what is expected from test data
        for(Case cs : [SELECT Id FROM Case WHERE Id in: caseIds]){
            System.assertEquals(cs.Id, caseId);
        }
        
        Test.stopTest();
    }

}