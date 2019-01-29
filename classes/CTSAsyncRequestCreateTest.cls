/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 28-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 28-Jan-2019
  Description ........: Test Class for CTSAsyncRequestCreate
*****************************************************************************/
@isTest(seeAllData=true)
private class CTSAsyncRequestCreateTest
{
    
    private static testMethod void createAsyncCase()
    {
        List<Id> caseIds = new List<Id>();
        List<Account> dmlAccounts = new List<Account>();
        Id acctId;
        List<Case> dmlCases = new List<Case>();
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id IMSRepId = [SELECT Id FROM User WHERE Profile.Name = 'System Administrator' AND IsActive = true LIMIT 1].Id;
        Id businessHrsId = [SELECT Id FROM BusinessHours WHERE Name = 'Local Business' LIMIT 1].Id;
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
        
        Account acct = new Account();
        acct.Name = 'Test Class Account 1';
        acct.Product_Type__c = 'LBW';
        acct.Secondary_Segments__c = 'Lawyer';
        acct.Status__c = 'LIVE';
        acct.Email__c = 'fake@faketest.com';
        acct.Initial_Live_Date__c = liveDate;
        acct.Live_Date__c = liveDate;
        dmlAccounts.add(acct);
        
        if(dmlAccounts.size() > 0){
        
            insert dmlAccounts;
            
            for(Account a : dmlAccounts){
                
                acctId = a.Id;
            }
        }
        
        System.Debug('Account from (Account): ' + acct.Name);
        
        Case caseData = new Case();
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acctId;
        caseData.Reason = 'CS Touch Plan';
        caseData.Origin = 'Touch Plan 1';
        caseData.OwnerId = IMSRepId;
        caseData.Status = 'New';
        caseData.Priority = 'Major';
        caseData.Subject = 'Lead Stream TP 1';
        dmlCases.add(caseData);
        
        System.Debug('Account from (Case): ' + caseData.Account.Name);
        
        if(dmlCases.size() > 0){
            insert dmlCases;
            
            for(Case c : dmlCases){
                
                caseIds.add(c.Id);
            }
        }
        
        // start test
        Test.StartTest();
        
        // execute Invocable method
        CTSAsyncRequestCreate.CreateNewAsyncRequest(caseIds);
        
        Test.stopTest();
    }
    
    private static testMethod void createAsyncOrganicCase()
    {
        List<Account> dmlAccounts = new List<Account>();
        Id acctId;
        List<Id> orgCaseIds = new List<Id>();
        List<Organic_Analysis__c> dmlOrgCases = new List<Organic_Analysis__c>();
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id orgCaseRecordTypeId = Schema.SObjectType.Organic_Analysis__c.getRecordTypeInfosByName().get('PIN Action Needed').getRecordTypeId();
        
        Account acct = new Account();
        acct.Name = 'Test Class Account 1';
        acct.Product_Type__c = 'LBW';
        acct.Secondary_Segments__c = 'Lawyer';
        acct.Status__c = 'LIVE';
        acct.Email__c = 'fake@faketest.com';
        acct.Initial_Live_Date__c = liveDate;
        acct.Live_Date__c = liveDate;
        dmlAccounts.add(acct);
        
        if(dmlAccounts.size() > 0){
        
            insert dmlAccounts;
            
            for(Account a : dmlAccounts){
                
                acctId = a.Id;
            }
        }
        
        System.Debug('Account from (Account): ' + acct.Name);
        
        Organic_Analysis__c orgCaseData = new Organic_Analysis__c();
        orgCaseData.RecordTypeId = orgCaseRecordTypeId;
        orgCaseData.Account_Name__c = acctId;
        orgCaseData.Subject__c = 'PAN - Maps Contact - Comanage';
        orgCaseData.Status__c = 'New';
        dmlOrgCases.add(orgCaseData);
        
        System.Debug('Account from (Organic Case): ' + orgCaseData.Account_Name__r.Name);
        
        if(dmlOrgCases.size() > 0){
            insert dmlOrgCases;
            
            for(Organic_Analysis__c oc : dmlOrgCases){
                
                orgCaseIds.add(oc.Id);
            }
        }
        
        // start test
        Test.StartTest();
        
        // execute Invocable method
        CTSAsyncRequestCreate.CreateNewAsyncRequest(orgCaseIds);
        
        Test.stopTest();
    }
    
    private static testMethod void createAsyncQualityCase()
    {
        List<Account> dmlAccounts = new List<Account>();
        Id acctId;
        List<Id> qualityCaseIds = new List<Id>();
        List<Quality_Case__c> dmlQualityCases = new List<Quality_Case__c>();
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id qualityCaseRecordTypeId = Schema.SObjectType.Quality_Case__c.getRecordTypeInfosByName().get('Closing Script - Auto Launch').getRecordTypeId();
        
        Account acct = new Account();
        acct.Name = 'Test Class Account 1';
        acct.Product_Type__c = 'LBW';
        acct.Secondary_Segments__c = 'Lawyer';
        acct.Status__c = 'LIVE';
        acct.Email__c = 'fake@faketest.com';
        acct.Initial_Live_Date__c = liveDate;
        acct.Live_Date__c = liveDate;
        dmlAccounts.add(acct);
        
        if(dmlAccounts.size() > 0){
        
            insert dmlAccounts;
            
            for(Account a : dmlAccounts){
                
                acctId = a.Id;
            }
        }
        
        System.Debug('Account from (Account): ' + acct.Name);
        
        Quality_Case__c qualityCaseData = new Quality_Case__c();
        qualityCaseData.RecordTypeId = qualityCaseRecordTypeId;
        qualityCaseData.Account_Name__c = acctId;
        qualityCaseData.Subject__c = 'QA Closing Script TEST';
        qualityCaseData.Status__c = 'New';
        dmlQualityCases.add(qualityCaseData);
        
        System.Debug('Account from (Quality Case): ' + qualityCaseData.Account_Name__r.Name);
        
        if(dmlQualityCases.size() > 0){
            insert dmlQualityCases;
            
            for(Quality_Case__c qc : dmlQualityCases){
                
                qualityCaseIds.add(qc.Id);
            }
        }
        
        // start test
        Test.StartTest();
        
        // execute Invocable method
        CTSAsyncRequestCreate.CreateNewAsyncRequest(qualityCaseIds);
        
        Test.stopTest();
    }
    
    private static testMethod void createAsyncCustomerSurvey()
    {
        List<Account> dmlAccounts = new List<Account>();
        Id acctId;
        List<Id> custSurveyIds = new List<Id>();
        List<Customer_Surveys__c> dmlCustSurveys = new List<Customer_Surveys__c>();
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id custSurveyRecordTypeId = Schema.SObjectType.Customer_Surveys__c.getRecordTypeInfosByName().get('NPS Survey LBW').getRecordTypeId();
        
        Account acct = new Account();
        acct.Name = 'Test Class Account 1';
        acct.Product_Type__c = 'LBW';
        acct.Secondary_Segments__c = 'Lawyer';
        acct.Status__c = 'LIVE';
        acct.Email__c = 'fake@faketest.com';
        acct.Initial_Live_Date__c = liveDate;
        acct.Live_Date__c = liveDate;
        dmlAccounts.add(acct);
        
        if(dmlAccounts.size() > 0){
        
            insert dmlAccounts;
            
            for(Account a : dmlAccounts){
                
                acctId = a.Id;
            }
        }
        
        System.Debug('Account from (Account): ' + acct.Name);
        
        Customer_Surveys__c custSurveyData = new Customer_Surveys__c();
        custSurveyData.RecordTypeId = custSurveyRecordTypeId;
        custSurveyData.Account__c = acctId;
        custSurveyData.Status__c = 'New';
        dmlCustSurveys.add(custSurveyData);
        
        System.Debug('Account from (Customer Survey): ' + custSurveyData.Account__r.Name);
        
        if(dmlCustSurveys.size() > 0){
            insert dmlCustSurveys;
            
            for(Customer_Surveys__c cs : dmlCustSurveys){
                
                custSurveyIds.add(cs.Id);
            }
        }
        
        // start test
        Test.StartTest();
        
        // execute Invocable method
        CTSAsyncRequestCreate.CreateNewAsyncRequest(custSurveyIds);
        
        Test.stopTest();
    }
}