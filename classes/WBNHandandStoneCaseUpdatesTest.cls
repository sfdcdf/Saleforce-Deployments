@isTest
private class WBNHandandStoneCaseUpdatesTest
{
    private static testMethod void ybnInboundInquiryHSTest()
    {
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Inbound Inquiry').getRecordTypeId();
        Id imsRepId = [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'System Administrator' LIMIT 1].Id;
        
        Account acct = new Account();
        acct.Name = 'Test Account';
        acct.IMS_Rep__c = imsRepId;
        insert acct;
        
        Id acctId = acct.Id;
        
        System.Debug('Account from (Account): ' + acct.Name);
        
        Contact cont = new Contact();
        cont.AccountId = acctId;
        cont.FirstName = 'TestFName';
        cont.LastName = 'TestLName';
        cont.Email = 'testflname@test.com';
        insert cont;
        
        Case caseData = new Case();
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.Origin = 'HandandStoneSupport@web.com';
        caseData.AccountId = acctId;
        insert CaseData;
        
        caseIds.add(CaseData.Id);
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        WBNHandandStoneCaseUpdates.UpdateHandandStoneCaseAttributes(caseIds);
        
        Test.stopTest();
    }
}