@istest
public class ScheduleSplitGenerator_Test 
{
    static public account acc;
    static public Opportunity opp;
    Static public id sched;
    //static public  Schedule_Split__c SchedS,SchedS2 ,SchedS3;
    
    Public Id OliId {get;set;}
    
    Public String Type='Quantity and Revenue Schedules';
    Public String QtySchedType='Divide Amount into multiple installments';
    Public Date StrtDate= date.newInstance(2020,02,10);
    Public String SchQtyInstPer='Monthly';
    Public Integer QtyNoIns=6;
    Public Decimal Quantity=600.00;
    
    Public String RevSchedType='Repeat Amount for each installment';
    Public Date RevStrtDate=date.newInstance(2020,02,10);
    Public String RevSchInstPer='Monthly';
    Public Integer RevNoIns=6;
    Public Decimal Revenue=12;
    
    Public Date QtyEndDate;
    
    
    static public  PricebookEntry priceBookEntryNew ;
    public static List<OpportunityLineItem> shedlst =new List<OpportunityLineItem> (); 
    public static List<Schedule_Split__c> shedsplitlst =new List<Schedule_Split__c> ();    
    
    
    public static testMethod void ScheduleSplitGenerator_Test() {
        PageReference pageRef = Page.EstablishSchedulePage;
        Test.setCurrentPage(pageRef);
        test.startTest();
        // create new test account for opportunity.
        acc= new Account(Name = 'testAcc',BillingStreet='testStreet',BillingCity ='tectcity',BillingState='testState',BillingPostalCode='123',BillingCountry='testcountry',Description='testdesc');
        insert acc;
        
        
        //create new test opportunity
        opp= new Opportunity(AccountId=acc.id,Amount=1234.00,Description='testdesc',Name='testOpp',StageName='Prospecting',CloseDate = System.Today());
        insert opp;
        
        //create new test pricebook
        PriceBook2 pb2 = new PriceBook2 (Name='test priceBook',Description = 'test',isActive = true);
        insert pb2;
        
        //get value of id from recently created pricebook
        List<PriceBook2> pblist = [Select id from PriceBook2 where isStandard = true limit 1];
        system.debug('==pricebook2details=='+pblist);
        //store recently created pricebook id in other pricebook
        PriceBook2 pricebooktest = new PriceBook2 ();
        if(pblist != null && pblist.size()>0){
            pricebooktest = pblist.get(0);
        }
        
        //create new test product 
        Product2 product = new Product2();
        product.name = 'Test';
        product.isActive = true;
        insert product;
        
        Id pricebookId = Test.getStandardPricebookId();
        
        //now create new Pricebook Entry for Opportunity line item
        priceBookEntryNew = new PricebookEntry();
        priceBookEntryNew.Product2Id = product.Id;
        priceBookEntryNew.PriceBook2Id =pricebookId;
        priceBookEntryNew.UnitPrice = 20.00;
        //priceBookEntryNew.UseStandardPrice = True;
        priceBookEntryNew.isactive = true;
        insert priceBookEntryNew;
        
        //finally create new test Opportunity line item for Opportunity
        OpportunityLineItem oli = new OpportunityLineItem
            (OpportunityId = opp.Id,PricebookEntryId = priceBookEntryNew.Id,Quantity = 1,UnitPrice = priceBookEntryNew.UnitPrice,ServiceDate = System.today());
        insert oli;
        
        Apexpages.StandardController stdController = new Apexpages.StandardController(oli);
        
        ScheduleSplitGenerator controller = new ScheduleSplitGenerator(stdController);
        
        
        
        // Add parameters to page URL
        ApexPages.currentPage().getParameters().put('qp', 'yyyy');
        
        // Instantiate a new controller with all parameters in the page
        controller = new ScheduleSplitGenerator(stdController); 
        
        controller.OliId=oli.id;
        controller.Type='Quantity and Revenue Schedules';
        controller.QtySchedType='Divide Amount into multiple installments';
        controller.StrtDate= date.newInstance(2020,02,10);
        controller.SchQtyInstPer='Monthly';
        controller.QtyNoIns=6;
        controller.Quantity=600.00;
        
        controller.RevSchedType='Repeat Amount for each installment';
        controller.RevStrtDate=date.newInstance(2020,02,10);
        controller.RevSchInstPer='Monthly';
        controller.RevNoIns=6;
        controller.Revenue=12;
        controller.save();
        
        controller = new ScheduleSplitGenerator(stdController); 
        
        controller.OliId=oli.id;
        controller.Type='Quantity and Revenue Schedules';
        controller.QtySchedType='Divide Amount into multiple installments';
        controller.StrtDate= date.newInstance(2020,02,10);
        controller.SchQtyInstPer='Monthly';
        controller.QtyNoIns=12;
        controller.Quantity=600.00;
        
        controller.RevSchedType='Divide Amount into multiple installments';
        controller.RevStrtDate=date.newInstance(2020,02,10);
        controller.RevSchInstPer='Monthly';
        controller.RevNoIns=6;
        controller.Revenue=12;
        controller.save();
        
        
        
        controller = new ScheduleSplitGenerator(stdController); 
        
        controller.OliId=oli.id;
        controller.Type='Quantity and Revenue Schedules';
        controller.QtySchedType='Divide Amount into multiple installments';
        controller.StrtDate= date.newInstance(2020,02,10);
        controller.SchQtyInstPer='Monthly';
        controller.QtyNoIns=12;
        controller.Quantity=600.00;
        
        controller.RevSchedType='Repeat Amount for each installment';
        controller.RevStrtDate=date.newInstance(2020,02,11);
        controller.RevSchInstPer='Monthly';
        controller.RevNoIns=6;
        controller.Revenue=12;
        controller.save();
        
        controller = new ScheduleSplitGenerator(stdController); 
        
        controller.OliId=oli.id;
        controller.Type='Quantity Schedule Only';
        controller.QtySchedType='Divide Amount into multiple installments';
        controller.StrtDate= date.newInstance(2020,02,10);
        controller.SchQtyInstPer='Monthly';
        controller.QtyNoIns=12;
        controller.Quantity=600.00;
        controller.save();
        
        
        controller = new ScheduleSplitGenerator(stdController); 
        
        controller.OliId=oli.id;
        controller.Type='Revenue Schedule Only';
        controller.RevSchedType='Repeat Amount for each installment';
        controller.RevStrtDate=date.newInstance(2020,02,11);
        controller.RevSchInstPer='Monthly';
        controller.RevNoIns=6;
        controller.Revenue=12;
        controller.save();
        
        
        
        controller.getSchedInstOptions();
        controller.getSchedTypeOptions();
        controller.getTypeOptions();
        controller.cancel();
        
        
        PageReference pageRef2 = Page.CreateEditPage;
        pageRef2.getparameters().put('scheSpId',oli.id);
        
        Test.setCurrentPage(pageRef2);
        
        ApexPages.CurrentPage().getParameters().put('id',oli.id);
        ApexPages.Standardcontroller sc = new ApexPages.Standardcontroller(oli);
        
        Apexpages.StandardController stdController2 = new Apexpages.StandardController(oli);
        CreateEditPage  controller3 = new CreateEditPage(stdController2);
        
        controller3.cancelSplit();
        // controller3.saveSplit();
        controller3.addRow();
        Integer i = controller3.indexSplitList.size();
        system.debug('indexSplitList-->>'+controller3.indexSplitList);
        controller3.indexSplitList[0].scSplit.Start_Date__c = date.newInstance(2020,02,10);
        controller3.indexSplitList[0].scSplit.End_Date__c = date.newInstance(2020,02,10).addDays(61);
        controller3.saveSplit();
        controller3.saveSchedule();
        ApexPages.currentPage().getParameters().put('indexOfSplit','0');
        controller3.indexSplitList[1].scSplit.Start_Date__c = date.newInstance(2020,02,10);
        controller3.indexSplitList[1].scSplit.End_Date__c = date.newInstance(2020,02,10).addDays(61);
        ApexPages.currentPage().getParameters().put('indexOfSplit','1');
        controller3.deleteRow();
        controller3.reset();
        test.stopTest();
        
    }
    
    static testMethod void testScheduleScheduleSplit2(){
        test.startTest();
        
        // create new test account for opportunity.
        acc= new Account(Name = 'testAcc',BillingStreet='testStreet',BillingCity ='tectcity',BillingState='testState',BillingPostalCode='123',BillingCountry='testcountry',Description='testdesc');
        insert acc;
        
        
        //create new test opportunity
        opp= new Opportunity(AccountId=acc.id,Amount=1234.00,Description='testdesc',Name='testOpp',StageName='Prospecting',CloseDate = System.Today());
        insert opp;
        
        //create new test pricebook
        PriceBook2 pb2 = new PriceBook2 (Name='test priceBook',Description = 'test',isActive = true);
        insert pb2;
        
        //get value of id from recently created pricebook
        List<PriceBook2> pblist = [Select id from PriceBook2 where isStandard = true limit 1];
        system.debug('==pricebook2details=='+pblist);
        //store recently created pricebook id in other pricebook
        PriceBook2 pricebooktest = new PriceBook2 ();
        if(pblist != null && pblist.size()>0){
            pricebooktest = pblist.get(0);
        }
        
        //create new test product 
        Product2 product = new Product2();
        product.name = 'Test';
        product.isActive = true;
        insert product;
        
        Id pricebookId = Test.getStandardPricebookId();
        
        //now create new Pricebook Entry for Opportunity line item
        priceBookEntryNew = new PricebookEntry();
        priceBookEntryNew.Product2Id = product.Id;
        priceBookEntryNew.PriceBook2Id =pricebookId;
        priceBookEntryNew.UnitPrice = 20.00;
        //priceBookEntryNew.UseStandardPrice = True;
        priceBookEntryNew.isactive = true;
        insert priceBookEntryNew;
        
        //finally create new test Opportunity line item for Opportunity
        OpportunityLineItem oli = new OpportunityLineItem
            (OpportunityId = opp.Id,PricebookEntryId = priceBookEntryNew.Id,Quantity = 1,UnitPrice = priceBookEntryNew.UnitPrice,ServiceDate = System.today());
        insert oli;
        
        Apexpages.StandardController stdController = new Apexpages.StandardController(oli);
        
        ScheduleSplitGenerator controller = new ScheduleSplitGenerator(stdController);
        
        
        
        // Add parameters to page URL
        ApexPages.currentPage().getParameters().put('qp', 'yyyy');
        
        // Instantiate a new controller with all parameters in the page
        controller = new ScheduleSplitGenerator(stdController); 
        
        controller.OliId=oli.id;
        controller.Type='Quantity and Revenue Schedules';
        controller.QtySchedType='Divide Amount into multiple installments';
        controller.StrtDate= date.newInstance(2020,02,10);
        controller.SchQtyInstPer='Monthly';
        controller.QtyNoIns=6;
        controller.Quantity=600.00;
        
        controller.RevSchedType='Repeat Amount for each installment';
        controller.RevStrtDate=date.newInstance(2020,02,10);
        controller.RevSchInstPer='Monthly';
        controller.RevNoIns=6;
        controller.Revenue=12;
        controller.save();
        
        PageReference pageRef2 = Page.CreateEditPage;
        pageRef2.getparameters().put('scheSpId',oli.id);
        
        Test.setCurrentPage(pageRef2);
        
        ApexPages.CurrentPage().getParameters().put('id',oli.id);
        ApexPages.Standardcontroller sc = new ApexPages.Standardcontroller(oli);
        
        Apexpages.StandardController stdController2 = new Apexpages.StandardController(oli);
        CreateEditPage  controller2 = new CreateEditPage(stdController2);
        
        controller2.cancelSplit();
        controller2.saveSplit();
        controller2.addRow();
        Integer i = controller2.indexSplitList.size();
        system.debug('indexSplitList-->>'+controller2.indexSplitList);
        controller2.indexSplitList[0].scSplit.Start_Date__c = date.newInstance(2021,02,10);
        controller2.indexSplitList[0].scSplit.End_Date__c = date.newInstance(2020,02,10).addDays(91);
        controller2.saveSplit();
        ApexPages.currentPage().getParameters().put('indexOfSplit','0');
        controller2.deleteRow();
        controller2.reset();
              
        controller2.getTotalARPU();
        
        list<Schedule_Split__c> temp=[Select Id from Schedule_Split__c where OpportunityLineItemId__c =:oli.Id limit 2 ];
       delete temp;
        
        
        
        
        
        
        
        test.stopTest();
    }
    
    static testMethod void testRelatedList(){
        test.startTest();
        
         PageReference pageRef2 = Page.OpportunityLineItemRelatedList;
        // create new test account for opportunity.
        acc= new Account(Name = 'testAcc',BillingStreet='testStreet',BillingCity ='tectcity',BillingState='testState',BillingPostalCode='123',BillingCountry='testcountry',Description='testdesc');
        insert acc;
        
        
        //create new test opportunity
        opp= new Opportunity(AccountId=acc.id,Amount=1234.00,Description='testdesc',Name='testOpp',StageName='Prospecting',CloseDate = System.Today());
        insert opp;
        
        //create new test pricebook
        PriceBook2 pb2 = new PriceBook2 (Name='test priceBook',Description = 'test',isActive = true);
        insert pb2;
        
        //get value of id from recently created pricebook
        List<PriceBook2> pblist = [Select id from PriceBook2 where isStandard = true limit 1];
        system.debug('==pricebook2details=='+pblist);
        //store recently created pricebook id in other pricebook
        PriceBook2 pricebooktest = new PriceBook2 ();
        if(pblist != null && pblist.size()>0){
            pricebooktest = pblist.get(0);
        }
        
        //create new test product 
        Product2 product = new Product2();
        product.name = 'Test';
        product.isActive = true;
        insert product;
        
        Id pricebookId = Test.getStandardPricebookId();
        
        //now create new Pricebook Entry for Opportunity line item
        priceBookEntryNew = new PricebookEntry();
        priceBookEntryNew.Product2Id = product.Id;
        priceBookEntryNew.PriceBook2Id =pricebookId;
        priceBookEntryNew.UnitPrice = 20.00;
        //priceBookEntryNew.UseStandardPrice = True;
        priceBookEntryNew.isactive = true;
        insert priceBookEntryNew;
        
        //finally create new test Opportunity line item for Opportunity
        OpportunityLineItem oli = new OpportunityLineItem
            (OpportunityId = opp.Id,PricebookEntryId = priceBookEntryNew.Id,Quantity = 1,UnitPrice = priceBookEntryNew.UnitPrice,ServiceDate = System.today());
        insert oli;
        
        Apexpages.StandardController stdController = new Apexpages.StandardController(oli);
        
        ScheduleSplitGenerator controller = new ScheduleSplitGenerator(stdController);
        
        
        
        // Add parameters to page URL
        ApexPages.currentPage().getParameters().put('qp', 'yyyy');
        
        // Instantiate a new controller with all parameters in the page
        controller = new ScheduleSplitGenerator(stdController); 
        
        controller.OliId=oli.id;
        controller.Type='Quantity and Revenue Schedules';
        controller.QtySchedType='Divide Amount into multiple installments';
        controller.StrtDate= date.newInstance(2020,02,10);
        controller.SchQtyInstPer='Monthly';
        controller.QtyNoIns=6;
        controller.Quantity=600.00;
        
        controller.RevSchedType='Repeat Amount for each installment';
        controller.RevStrtDate=date.newInstance(2020,02,10);
        controller.RevSchInstPer='Monthly';
        controller.RevNoIns=6;
        controller.Revenue=12;
        controller.save();
        
        Test.setCurrentPage(pageRef2);

        pageRef2.getparameters().put('id',oli.id);
        ApexPages.StandardController sc = new ApexPages.standardController(oli);
       
        ScheduleRelatedListController  controller2 = new ScheduleRelatedListController(sc);
        controller2.OleId=oli.id;
        controller2.newSchedule();
        controller2.editSchedule();
        controller2.DeleteSchedule();
        
        Apexpages.StandardController stdController2 = new Apexpages.StandardController(oli);
        
        ScheduleSplitGenerator controller3 = new ScheduleSplitGenerator(stdController);
        
        
        
        // Add parameters to page URL
        ApexPages.currentPage().getParameters().put('qp', 'yyyy');
        
        controller3 = new ScheduleSplitGenerator(stdController2); 
        
        controller3.OliId=oli.id;
        controller3.Type='Quantity and Revenue Schedules';
        controller3.QtySchedType='Divide Amount into multiple installments';
        controller3.StrtDate= date.newInstance(2020,02,10);
        controller3.SchQtyInstPer='Monthly';
        controller3.QtyNoIns=6;
        controller3.Quantity=600.00;
        
        controller3.RevSchedType='Repeat Amount for each installment';
        controller3.RevStrtDate=date.newInstance(2020,02,10);
        controller3.RevSchInstPer='Monthly';
        controller3.RevNoIns=6;
        controller3.Revenue=12;
        controller3.save();
        delete oli;
        
        test.stopTest();
    }
    
    
    
}