@isTest(seeAllData=true)
private class CompleteResolutionCaseMilestoneTest
{
    private static testMethod void completeCaseMilestoneTest()
    {
       // load test data from static resources
        //List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Request').getRecordTypeId();
        Id entAcctId = [SELECT AccountId FROM Entitlement WHERE Status = 'Active' LIMIT 1].AccountId;
        
        
        Account acct = 
            [SELECT Id, 
                    Name, 
                    Sales_Rep_Name_YL__c, 
                    Sales_Rep_Email__c, 
                    Sales_Channel_YL__c,
                    Secondary_Segments__c
               FROM Account
              WHERE Id = :entAcctId];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        System.Debug('Account from (Account): ' + acctName);
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acctId;
        caseData.Status = 'New';
        caseData.Type = 'Request';
        caseData.YBNRequestDetail__c = 'Company Changes - Address';
        caseData.YBNRequestReason__c = 'Operations';
        dmlCases.add(caseData);
        
        System.Debug('Account from (Case): ' + caseData.Account.Name);
        
        if(dmlCases.size() > 0){
            
            for(Case c : dmlCases){
                caseIds.add(c.Id);
                c.Status = 'Closed';
            }
            
            update dmlCases;
        }
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        CompleteResolutionCaseMilestone.CompleteMilestone(caseIds);
        
        Test.stopTest();
    }
}