/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 06-Feb-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 06-Feb-2019
  Description ........: Test class for LaunchSalesWizardController
*****************************************************************************/
@isTest
private class LaunchSalesWizardTest 
{
    private static testMethod void launchSalesWizardTest()
    {
         // load test data from static resources
        List<SObject> oppList = Test.LoadData(Opportunity.sObjectType, 'testOpportunities');
        List<Id> oppIds = new List<Id>();
        List<Account> dmlAccounts = new List<Account>();
        List<Opportunity> dmlOpps = new List<Opportunity>();
        List<Product2> dmlProds = new List<Product2>();
        List<PricebookEntry> dmlPBEs = new List<PricebookEntry>();
        List<OpportunityLineItem> dmlOppLines = new List<OpportunityLineItem>();
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id acctId;
        Id oppId;
        Id oppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('YBN - Individual Location').getRecordTypeId();
        Id oppOwner =  [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'Nationally Certified Sales Executive' LIMIT 1].Id;
        
        Account acct = new Account();
        acct.Name = 'Test Class Account YBN';
        acct.IMS_Rep__c = oppOwner;
        acct.Product_Type__c = 'PPC';
        acct.Client_Type__c = 'YBN';
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
        
        Opportunity opp = new Opportunity();
        opp.RecordTypeId = oppRecordTypeId;
        opp.OwnerId = oppOwner;
        opp.AccountId = acctId;
        opp.Name = 'Test Opp 1';
        opp.StageName = 'New Opportunity';
        opp.CloseDate = todayDt.addDays(-3);
        dmlOpps.add(opp);
        
        if(dmlOpps.size() > 0){
        
            insert dmlOpps;
            
            for(Opportunity o : dmlOpps){
                
                oppId = o.Id;
            }
        }
        
        // start test
        Test.startTest();
        
        // setup and call controller
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        LaunchSalesWizardController contr = new LaunchSalesWizardController(sc);
        
        Test.stopTest();
    }
}