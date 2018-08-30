@isTest
private class OpportunityClosedWonActionsTest 
{

    private static testMethod void closedWonTest()
    {
        // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> oppList = Test.LoadData(Opportunity.sObjectType, 'testOpportunities');
        List<Id> oppIds = new List<Id>();
        List<Account> dmlAccts = new List<Account>();
        List<Opportunity> dmlOpps = new List<Opportunity>();
        List<Product2> dmlProds = new List<Product2>();
        List<PricebookEntry> dmlPBEs = new List<PricebookEntry>();
        List<OpportunityLineItem> dmlOppLines = new List<OpportunityLineItem>();
        Date todayDt = Date.Today();
        Id oppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('YBN - Individual Location').getRecordTypeId();
        Id oppOwner =  [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'Nationally Certified Sales Executive' LIMIT 1].Id;
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        acct.IMS_Rep__c = oppOwner;
        acct.Sales_Rep_Name_YL__c = 'Eugene Ross';
        dmlAccts.add(acct);
        update dmlAccts;
        
        Opportunity opp = (Opportunity)oppList[0];
        Id oppId = opp.Id;
        opp.RecordTypeId = oppRecordTypeId;
        opp.OwnerId = oppOwner;
        opp.AccountId = acctId;
        opp.StageName = 'New Opportunity';
        opp.CloseDate = todayDt.addDays(-3);
        dmlOpps.add(opp);
        update dmlOpps;
        
        oppIds.add(oppId);
        
        Id pricebookId = Test.getStandardPricebookId();
        
        //Create your product
        Product2 prod1 = new Product2(
             Name = 'Facebook Addition',
             ProductCode = 'WBN_FBK_100',
             isActive = true,
             Family = 'Facebook',
             Create_NCS_Case__c = true
        );
        dmlProds.add(prod1);
        
        //Create your product
        Product2 prod2 = new Product2(
             Name = 'PPC Addition',
             ProductCode = 'WBN_PPC_100',
             isActive = true,
             Family = 'Pay per Click',
             Create_NCS_Case__c = true
        );
        dmlProds.add(prod2);
        
        //Create your product
        Product2 prod3 = new Product2(
             Name = 'Foundations',
             ProductCode = 'WBN_FND_100',
             isActive = true,
             Family = 'Foundations',
             Create_NCS_Case__c = true
        );
        dmlProds.add(prod3);
        
        //Create your product
        Product2 prod4 = new Product2(
             Name = 'Website',
             ProductCode = 'WBN_WEB_100',
             isActive = true,
             Family = 'Web',
             Create_NCS_Case__c = true
        );
        dmlProds.add(prod4);
        
        //Create your product
        Product2 prod5 = new Product2(
             Name = 'Local Business Listing',
             ProductCode = 'WBN_LBL_100',
             isActive = true,
             Family = 'Local Business Listings',
             Create_NCS_Case__c = true
        );
        dmlProds.add(prod5);
        
        //Create your product
        Product2 prod6 = new Product2(
             Name = 'Local SEO Master SAB',
             ProductCode = 'WBN_LCL_SEO_400',
             isActive = true,
             Family = 'Local SEO',
             Create_NCS_Case__c = true
        );
        dmlProds.add(prod6);
        
        //Create your product
        Product2 prod7 = new Product2(
             Name = 'Local SEO Master Stationary Biz',
             ProductCode = 'WBN_LCL_SEO_401',
             isActive = true,
             Family = 'Local SEO',
             Create_NCS_Case__c = true
        );
        dmlProds.add(prod7);
        
        //Create your product
        Product2 prod8 = new Product2(
             Name = 'Local SEO Pro SAB',
             ProductCode = 'WBN_LCL_SEO_300',
             isActive = true,
             Family = 'Local SEO',
             Create_NCS_Case__c = true
        );
        dmlProds.add(prod8);
        
        //Create your product
        Product2 prod9 = new Product2(
             Name = 'Local SEO Pro Stationary Biz',
             ProductCode = 'WBN_LCL_SEO_301',
             isActive = true,
             Family = 'Local SEO',
             Create_NCS_Case__c = true
        );
        dmlProds.add(prod9);
        
        insert dmlProds;
        
        //Create your pricebook entry
        PricebookEntry pbEntry1 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = [SELECT Id FROM Product2 WHERE ProductCode = 'WBN_FBK_100' LIMIT 1].Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry1;
        
        //Create your pricebook entry
        PricebookEntry pbEntry2 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = [SELECT Id FROM Product2 WHERE ProductCode = 'WBN_PPC_100' LIMIT 1].Id,
             UnitPrice = 123.00,
             IsActive = true
        );
        insert pbEntry2;
        
        //Create your pricebook entry
        PricebookEntry pbEntry3 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = [SELECT Id FROM Product2 WHERE ProductCode = 'WBN_FND_100' LIMIT 1].Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry3;
        
        //Create your pricebook entry
        PricebookEntry pbEntry4 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = [SELECT Id FROM Product2 WHERE ProductCode = 'WBN_WEB_100' LIMIT 1].Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry4;
        
        //Create your pricebook entry
        PricebookEntry pbEntry5 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = [SELECT Id FROM Product2 WHERE ProductCode = 'WBN_LBL_100' LIMIT 1].Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry5;
        
        //Create your pricebook entry
        PricebookEntry pbEntry6 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = [SELECT Id FROM Product2 WHERE ProductCode = 'WBN_LCL_SEO_400' LIMIT 1].Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry6;
        
        //Create your pricebook entry
        PricebookEntry pbEntry7 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = [SELECT Id FROM Product2 WHERE ProductCode = 'WBN_LCL_SEO_401' LIMIT 1].Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry7;
        
        //Create your pricebook entry
        PricebookEntry pbEntry8 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = [SELECT Id FROM Product2 WHERE ProductCode = 'WBN_LCL_SEO_300' LIMIT 1].Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry8;
        
        //Create your pricebook entry
        PricebookEntry pbEntry9 = new PricebookEntry(
             Pricebook2Id = pricebookId,
             Product2Id = [SELECT Id FROM Product2 WHERE ProductCode = 'WBN_LCL_SEO_301' LIMIT 1].Id,
             UnitPrice = 0.00,
             IsActive = true
        );
        insert pbEntry9;
        
        
        OpportunityLineItem oli1 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry1.Id,
            TotalPrice = 1 * pbEntry1.UnitPrice,
            ProductChargeType__c = 'Recurring'
        );
        dmlOppLines.add(oli1);
        
        OpportunityLineItem oli2 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry2.Id,
            TotalPrice = 1 * pbEntry2.UnitPrice,
            ProductChargeType__c = 'Recurring'
        );
        dmlOppLines.add(oli2);
        
        OpportunityLineItem oli3 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry3.Id,
            TotalPrice = 1 * pbEntry3.UnitPrice,
            ProductChargeType__c = 'Recurring'
        );
        dmlOppLines.add(oli3);
        
        OpportunityLineItem oli4 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry4.Id,
            TotalPrice = 1 * pbEntry4.UnitPrice,
            ProductChargeType__c = 'Recurring'
        );
        dmlOppLines.add(oli4);
        
        OpportunityLineItem oli5 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry5.Id,
            TotalPrice = 1 * pbEntry5.UnitPrice,
            ProductChargeType__c = 'Recurring'
        );
        dmlOppLines.add(oli5);
        
        OpportunityLineItem oli6 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry6.Id,
            TotalPrice = 1 * pbEntry6.UnitPrice,
            ProductChargeType__c = 'Recurring'
        );
        dmlOppLines.add(oli6);
        
        OpportunityLineItem oli7 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry7.Id,
            TotalPrice = 1 * pbEntry7.UnitPrice,
            ProductChargeType__c = 'Recurring'
        );
        dmlOppLines.add(oli7);
        
        OpportunityLineItem oli8 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry8.Id,
            TotalPrice = 1 * pbEntry8.UnitPrice,
            ProductChargeType__c = 'Recurring'
        );
        dmlOppLines.add(oli8);
        
        OpportunityLineItem oli9 = new OpportunityLineItem(
            OpportunityId = oppId,
            Quantity = 1,
            PricebookEntryId = pbEntry9.Id,
            TotalPrice = 1 * pbEntry9.UnitPrice,
            ProductChargeType__c = 'Recurring'
        );
        dmlOppLines.add(oli9);
        
        insert dmlOppLines;
                
        opp.StageName = 'Closed Won';
        opp.Products__c = 'PPC Addition';
        
        update dmlOpps;
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        OpportunityClosedWonActions.wbnClosedWonEntities(oppIds);
        
        Test.stopTest();
    }

}