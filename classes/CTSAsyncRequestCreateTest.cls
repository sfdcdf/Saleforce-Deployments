/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 28-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 28-Jan-2019
  Description ........: Test Class for CTSAsyncRequestCreate
*****************************************************************************/
@isTest
private class CTSAsyncRequestCreateTest
{       
    private static testMethod  void createAsyncCase()
    {
                
        Id acctId;        
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id IMSRepId = [SELECT Id FROM User WHERE Profile.Name = 'System Administrator' AND IsActive = true LIMIT 1].Id;
        Id businessHrsId = [SELECT Id FROM BusinessHours WHERE Name = 'Local Business' LIMIT 1].Id;
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
        
        Account acct = new Account();
        acct.Name = 'Test Class Account 1';
        //acct.Product_Type__c = 'LBW';
        acct.Secondary_Segments__c = 'Lawyer';
        acct.Status__c = 'LIVE';
        acct.Email__c = 'fake@faketest.com';
        acct.Initial_Live_Date__c = liveDate;
        acct.Live_Date__c = liveDate;                                       
        insert acct;                       
        
        Case caseData = new Case();
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acct.Id;
        caseData.Reason = 'CS Touch Plan';
        caseData.Origin = 'Touch Plan 1';
        caseData.OwnerId = IMSRepId;
        caseData.Status = 'New';
        caseData.Priority = 'Major';
        caseData.Subject = 'Lead Stream TP 1';
        insert caseData;
        
        Test.StartTest();
        CTSAsyncRequestCreate.CreateNewAsyncRequest(new List<Id> { caseData.Id });
        Test.stopTest();
                
        List<SFDCToCTSAsynchRequest__c> asyncRecords = [SELECT Id FROM SFDCToCTSAsynchRequest__c WHERE ObjectId__c = :caseData.Id];
        System.Debug('Case Async Records: ' + asyncRecords);
                
        System.Assert(asyncRecords != null && asyncRecords.Size() == 1);
                                                      
    }
    
    private static testMethod void createAsyncOrganicCase()
    {
        
        Id acctId;                
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id orgCaseRecordTypeId = Schema.SObjectType.Organic_Analysis__c.getRecordTypeInfosByName().get('PIN Action Needed').getRecordTypeId();
        
        Account acct = new Account();
        acct.Name = 'Test Class Account 1';
        //acct.Product_Type__c = 'LBW';
        acct.Secondary_Segments__c = 'Lawyer';
        acct.Status__c = 'LIVE';
        acct.Email__c = 'fake@faketest.com';
        acct.Initial_Live_Date__c = liveDate;
        acct.Live_Date__c = liveDate;
        insert acct;                
        
        Organic_Analysis__c orgCaseData = new Organic_Analysis__c();
        orgCaseData.RecordTypeId = orgCaseRecordTypeId;
        orgCaseData.Account_Name__c = acctId;
        orgCaseData.Subject__c = 'PAN - Maps Contact - Comanage';
        orgCaseData.Status__c = 'New';
        insert orgCaseData;
          
        // start test
        Test.StartTest();        
        // execute Invocable method
        CTSAsyncRequestCreate.CreateNewAsyncRequest(new List<Id> {orgCaseData.Id});        
        Test.stopTest();
        
        List<SFDCToCTSAsynchRequest__c> asyncRecords = [SELECT Id FROM SFDCToCTSAsynchRequest__c WHERE ObjectId__c = :orgCaseData.Id];
        System.Debug('Organic Case Async Records: ' + asyncRecords);
                
        System.Assert(asyncRecords != null && asyncRecords.Size() == 1);
    }
    
    private static testMethod void createAsyncQualityCase()
    {        
        Id acctId;                
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id qualityCaseRecordTypeId = Schema.SObjectType.Quality_Case__c.getRecordTypeInfosByName().get('Closing Script - Auto Launch').getRecordTypeId();
        
        Account acct = new Account();
        acct.Name = 'Test Class Account 1';
        //acct.Product_Type__c = 'LBW';
        acct.Secondary_Segments__c = 'Lawyer';
        acct.Status__c = 'LIVE';
        acct.Email__c = 'fake@faketest.com';
        acct.Initial_Live_Date__c = liveDate;
        acct.Live_Date__c = liveDate;
        insert acct;              
        
        Quality_Case__c qualityCaseData = new Quality_Case__c();
        qualityCaseData.RecordTypeId = qualityCaseRecordTypeId;
        qualityCaseData.Account_Name__c = acctId;
        qualityCaseData.Subject__c = 'QA Closing Script TEST';
        qualityCaseData.Status__c = 'New';
        insert qualityCaseData;
               
        // start test
        Test.StartTest();
        
        // execute Invocable method
        CTSAsyncRequestCreate.CreateNewAsyncRequest(new List<Id> {qualityCaseData.Id});
        
        Test.stopTest();
        
        List<SFDCToCTSAsynchRequest__c> asyncRecords = [SELECT Id FROM SFDCToCTSAsynchRequest__c WHERE ObjectId__c = :qualityCaseData.Id];
        System.Debug('Quality Case Async Records: ' + asyncRecords);
                
        System.Assert(asyncRecords != null && asyncRecords.Size() == 1);
    }
    
    private static testMethod void createAsyncCustomerSurvey()
    {                     
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id custSurveyRecordTypeId = Schema.SObjectType.Customer_Surveys__c.getRecordTypeInfosByName().get('Exit Survey').getRecordTypeId();
        
        Account acct = new Account();
        acct.Name = 'Test Class Account 1';
        //acct.Product_Type__c = 'LBW';
        acct.Secondary_Segments__c = 'Lawyer';
        acct.Status__c = 'LIVE';
        acct.Email__c = 'fake@faketest.com';
        acct.Initial_Live_Date__c = liveDate;
        acct.Live_Date__c = liveDate;
        insert acct;    
        
        Customer_Surveys__c custSurveyData = new Customer_Surveys__c();
        custSurveyData.RecordTypeId = custSurveyRecordTypeId;
        custSurveyData.Account__c = acct.Id;
        custSurveyData.Status__c = 'New';
        insert custSurveyData;
                           
        // start test
        Test.StartTest();
        
        // execute Invocable method
        CTSAsyncRequestCreate.CreateNewAsyncRequest(new List<Id> {custSurveyData.Id});
        
        Test.stopTest();
        
         List<SFDCToCTSAsynchRequest__c> asyncRecords = [SELECT Id FROM SFDCToCTSAsynchRequest__c WHERE ObjectId__c = :custSurveyData.Id];
        System.Debug('Customer Survey Async Records: ' + asyncRecords);
                
        System.Assert(asyncRecords != null && asyncRecords.Size() == 1);
    }
}