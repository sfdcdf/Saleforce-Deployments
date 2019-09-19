@isTest(seeAllData=true)
private class AutoClosePANOrganicCasesTest
{
    private static testMethod void ClosePANOrganicCasesTest()
    {
        Id micCaseRecordTypeId = Schema.SObjectType.Organic_Analysis__c.getRecordTypeInfosByName().get('Maps Initial Claiming').getRecordTypeId();
        Id panCaseRecordTypeId = Schema.SObjectType.Organic_Analysis__c.getRecordTypeInfosByName().get('PIN Action Needed').getRecordTypeId();
        List<Id> micCaseIds = new List<Id>();
        
        Account acct = new Account();
        acct.Name = 'Test Account';
        insert acct;
        
        Organic_Analysis__c micCase = new Organic_Analysis__c();
        micCase.Account_Name__c = acct.Id;
        micCase.RecordTypeId = micCaseRecordTypeId;
        micCase.IsClosed__c = true;
        micCase.Google_Listing_Status__c = 'Owner-Verified/Managed';
        insert micCase;                 
        micCaseIds.add(micCase.Id);
        
        Organic_Analysis__c panCase = new Organic_Analysis__c();
        panCase.Account_Name__c = acct.Id;
        panCase.RecordTypeId = panCaseRecordTypeId;
        panCase.IsClosed__c = false;
        insert panCase;              
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        AutoClosePANOrganicCases.ClosePANOrganicCases(micCaseIds);
        
        Test.stopTest();
        
        panCase = [select Id, IsClosed__c, OwnerId, Status__c from Organic_Analysis__c where Id = :panCase.Id];
        
        
        system.assertEquals(true, panCase.IsClosed__c);         
        //system.assertEquals('Completed', panCase.Status);
    }
}