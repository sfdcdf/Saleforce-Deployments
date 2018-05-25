@isTest(seeAllData=true)
private class SendCaseDMCNotifcationTest
{
    private static testMethod void sendCaseNoticationTest()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Account> dmlAccts = new List<Account>();
        List<Case> dmlCases = new List<Case>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Charge Failure').getRecordTypeId();
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        acct.Sales_Rep_Name_YL__c = 'John Doe';
        acct.Sales_Rep_Email__c = 'sfdc@yodle.com';
        acct.Sales_Channel_YL__c = 'FIELD_SALES';
        dmlAccts.add(acct);
        
        if(dmlAccts.size() > 0){
            update dmlAccts;
        }
        
        System.Debug('Account from (Account): ' + acctName);
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acctId;
        caseData.Status = 'In Progress';
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
        SendCaseDMCNotifcation.SendDMCNotification(caseIds);
        
        Test.stopTest();
    }
}