@isTest
private class OpportunityClosedWonAssetsTest 
{

    private static testMethod void assetsOnlyTest()
    {
        // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> oppList = Test.LoadData(Opportunity.sObjectType, 'testOpportunities');
        List<Id> oppIds = new List<Id>();
        Date todayDt = Date.Today();
        Id oppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('YBN - Renewal').getRecordTypeId();
        Id oppOwner =  [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'Nationally Certified Sales Executive' LIMIT 1].Id;
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        acct.IMS_Rep__c = oppOwner;
        update acct;
        
        Opportunity opp = (Opportunity)oppList[0];
        Id oppId = opp.Id;
        opp.RecordTypeId = oppRecordTypeId;
        opp.OwnerId = oppOwner;
        opp.AccountId = acctId;
        opp.StageName = 'Adoption';
        opp.CloseDate = todayDt.addDays(-3);
        update opp;
        
        oppIds.add(oppId);
        
        Id pricebookId = Test.getStandardPricebookId();
        
        //Create your product
        Product2 prod1 = new Product2(
             Name = 'Facebook Addition',
             ProductCode = 'FBA',
             isActive = true,
             Family = 'Facebook',
             Create_NCS_Case__c = true
        );
        insert prod1;
        
        //Create your product
        Product2 prod2 = new Product2(
             Name = 'PPC Addition',
             ProductCode = 'PPCA',
             isActive = true,
             Family = 'Pay per Click',
             Create_NCS_Case__c = true
        );
        insert prod2;
        
        //Create your product
        Product2 prod3 = new Product2(
             Name = 'Foundations',
             ProductCode = 'FNDS',
             isActive = true,
             Family = 'Foundations',
             Create_NCS_Case__c = true
        );
        insert prod3;
        
        //Create your product
        Product2 prod4 = new Product2(
             Name = 'Product X',
             ProductCode = 'Pro-X',
             isActive = true,
             Family = 'Yodle Ads',
             Create_NCS_Case__c = false
        );
        insert prod4;
        
        //Create your pricebook entry
        PricebookEntry pbEntry1 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = prod1.Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry1;
        
        //Create your pricebook entry
        PricebookEntry pbEntry2 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = prod2.Id,
             UnitPrice = 123.00,
             IsActive = true
        );
        insert pbEntry2;
        
        //Create your pricebook entry
        PricebookEntry pbEntry3 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = prod3.Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry3;
        
        //Create your pricebook entry
        PricebookEntry pbEntry4 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = prod4.Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry4;
        
        OpportunityLineItem oli1 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry1.Id,
            TotalPrice = 1 * pbEntry1.UnitPrice,
            ContractLength__c = 1
        );
        insert oli1;
        
        opp.StageName = 'Closed Won';
        opp.Products__c = 'PPC Addition';
        update opp;
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        OpportunityClosedWonAssets.closedWonAssets(oppIds);
        
        Test.stopTest();
    }

}