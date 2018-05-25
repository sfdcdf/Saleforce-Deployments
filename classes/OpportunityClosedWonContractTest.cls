@isTest
private class OpportunityClosedWonContractTest 
{

    private static testMethod void contractAndLinesTest()
    {
        // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> oppList = Test.LoadData(Opportunity.sObjectType, 'testOpportunities');
        List<Id> oppIds = new List<Id>();
        Date todayDt = Date.Today();
        Id oppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('YBN - Individual Location').getRecordTypeId();
        Id oppOwner =  [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'Nationally Certified Sales Executive' LIMIT 1].Id;
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        acct.IMS_Rep__c = oppOwner;
        acct.Sales_Rep_Name_YL__c = 'Eugene Ross';
        update acct;
        
        Opportunity opp = (Opportunity)oppList[0];
        Id oppId = opp.Id;
        opp.RecordTypeId = oppRecordTypeId;
        opp.OwnerId = oppOwner;
        opp.AccountId = acctId;
        opp.StageName = 'New Opportunity';
        opp.CloseDate = todayDt.addDays(-3);
        opp.Contract_Auto_Created__c = false;
        update opp;
        
        oppIds.add(oppId);
        
        Id pricebookId = Test.getStandardPricebookId();
        
        //Create your product
        Product2 prod1 = new Product2(
             Name = 'Facebook Addition',
             ProductCode = 'FBA',
             isActive = true,
             Family = 'Facebook',
             Create_NCS_Case__c = true,
             ProductChargeType__c = 'Recurring'
        );
        insert prod1;
        
        //Create your pricebook entry
        PricebookEntry pbEntry1 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = prod1.Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry1;
        
        OpportunityLineItem oli1 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry1.Id,
            TotalPrice = 1 * pbEntry1.UnitPrice,
            ContractLength__c = 1
        );
        insert oli1;
        
        //opp.StageName = 'Closed Won';
        //opp.Products__c = 'PPC Addition';
        //update opp;
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        OpportunityClosedWonContract.wbnClosedWonContracts(oppIds);
        
        Test.stopTest();
    }

}