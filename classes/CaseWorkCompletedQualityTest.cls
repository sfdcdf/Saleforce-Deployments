@isTest(seeAllData=true)
private class CaseWorkCompletedQualityTest
{
    private static testMethod void completeQualityCaseWorkTest()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        //List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        List<Case> dmlInsertChildCases = new List<Case>();
        Date todayDt = Date.Today();
        Id IMSRepId = [SELECT Id FROM User WHERE Profile.Name = 'System Administrator' AND IsActive = true LIMIT 1].Id;
        Id businessHrsId = [SELECT Id FROM BusinessHours WHERE Name = 'Local Business' LIMIT 1].Id;
        Id caseMasterRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LH Master').getRecordTypeId();
        Id caseChildRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Account Update').getRecordTypeId();
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        System.Debug('Account from (Account): ' + acctName);
        
        Case caseData = new Case();
        caseData.RecordTypeId = caseMasterRecordTypeId;
        caseData.AccountId = acctId;
        caseData.Reason = 'Account';
        caseData.Status = 'New';
        caseData.Priority = 'Major';
        caseData.Subject = 'Master Case Test';
        dmlCases.add(caseData);
        
        System.Debug('Account from (Case): ' + caseData.Account.Name);
        
        if(dmlCases.size() > 0){
            insert dmlCases;
            
            for(Case c : dmlCases){
                
                Case newChildCase = new Case();
                newChildCase.AccountId = acctId;
                newChildCase.RecordTypeId = caseChildRecordTypeId;
                newChildCase.ParentId = c.Id;
                newChildCase.BusinessHoursId = businessHrsId;
                newChildCase.IMS_Rep__c = IMSRepId;
                newChildCase.Status = 'New';
                newChildCase.Subject = 'Test Child Case';
                newChildCase.Requested_Updates__c = 'Address Update';
                newChildCase.Requested_Campaign_Updates__c = 'None';
                newChildCase.Requested_Website_Updates__c = 'None';
                newChildCase.New_Business_Address__c = '1234 Plaza Drive North';
                dmlInsertChildCases.add(newChildCase);
                
                caseIds.add(c.Id);
            }
            
            insert dmlInsertChildCases;
            
            for(Case cc : dmlInsertChildCases){
                caseIds.add(cc.Id);
            }
        }
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        CaseWorkCompletedQuality.UpdateQltyParentCaseWorkCompleted(caseIds);
        
        Test.stopTest();
    }
}