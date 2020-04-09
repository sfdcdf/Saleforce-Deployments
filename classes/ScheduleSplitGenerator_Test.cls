@istest
public class ScheduleSplitGenerator_Test 
{
    static public account acc;
    static public Opportunity opp;
    Static public id sched;
    static public  Schedule_Split__c SchedS,SchedS2 ,SchedS3;
    static public  PricebookEntry priceBookEntryNew ;
    public static List<Schedule_Split__c> shedlst =new List<Schedule_Split__c> (); 
    public static List<Schedule_Split__c> shedsplitlst =new List<Schedule_Split__c> ();     
    
        static testMethod void testScheduleScheduleSplit(){
            test.startTest();
            
            createdatamethod();
            ApexPages.currentPage().getParameters().put('ScheduleID',sched);
            ApexPages.standardController sc = new ApexPages.standardController(SchedS);  
                  
            CreateEditPage  controller = new CreateEditPage(sc);
            controller.cancelSplit();
            controller.saveSplit();
            controller.addRow();
            Integer i = controller.indexSplitList.size();
            system.debug('indexSplitList-->>'+controller.indexSplitList);
            controller.indexSplitList[0].scSplit.Start_Date__c = SchedS.Start_Date__c;
            controller.indexSplitList[0].scSplit.End_Date__c = SchedS.Start_Date__c.addDays(61);
            controller.saveSplit();
            ApexPages.currentPage().getParameters().put('indexOfSplit','0');
            controller.deleteRow();
            controller.reset();
            
            CreateEditPage  controller1 = new CreateEditPage();
            test.stopTest();
        }
          
         static testMethod void testScheduleScheduleSplit2(){
            test.startTest();
            
            createdatamethod();
             
           // Sched.Start_Date__c =System.today().addyears(1);
          //  Sched.End_Date__c =System.today();
          //  Sched.Amount__c= priceBookEntryNew.UnitPrice;  
          //  shedlst.add(Sched);
          //  update shedlst;
          
            SchedS2 = new Schedule_Split__c(Revenue__c=shedlst[0].Amount__c/2, Start_Date__c =System.today().addyears(2) ,End_Date__c =System.today().addyears(3));
            insert SchedS2; 
             
             SchedS3 = new Schedule_Split__c(Revenue__c=null, Start_Date__c =null ,End_Date__c =null );
            insert SchedS3;   
            shedsplitlst.add(SchedS3); 
             
           //  for(i=)
            ApexPages.currentPage().getParameters().put('ScheduleID',shedlst[0].Id);
            ApexPages.standardController sc = new ApexPages.standardController(shedsplitlst[1]);  
                  
            CreateEditPage  controller = new CreateEditPage(sc);
            controller.cancelSplit();
            controller.saveSplit();
            controller.addRow();
            Integer i = controller.indexSplitList.size();
            system.debug('indexSplitList-->>'+controller.indexSplitList);
            controller.indexSplitList[0].scSplit.Start_Date__c = SchedS.Start_Date__c;
            controller.indexSplitList[0].scSplit.End_Date__c = SchedS.Start_Date__c.addDays(61);
            controller.saveSplit();
            ApexPages.currentPage().getParameters().put('indexOfSplit','0');
            controller.deleteRow();
            controller.reset();
            
            CreateEditPage  controller1 = new CreateEditPage();
            test.stopTest();
        }
          
        
        
        public static void createdatamethod() {
        
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
        
            List<OpportunityLineItem>  OliLst = new List<OpportunityLineItem>();
            OliLst.add(oli);
           
            
            
            oli.Quantity = 2;
            oli.UnitPrice = priceBookEntryNew.UnitPrice;
            oli.ServiceDate = System.today().addyears(1);
            update OliLst;       
            
            sched=oli.Id;

           
            
            
            }       
          
}