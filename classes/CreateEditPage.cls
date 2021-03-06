/**************************************************************************************************************
Name : Schedule_Split
Created By : Mahesh Bogila
Created Date : 03/13/2020
Modified Date :  
Purpose : Function for Editing Quantity and Revenue Schedule On Custom Object 
***************************************************************************************************************/ 
public class CreateEditPage {
 
   //Declare the Variables
    public list<Schedule_Split__c> scheduleSplitList = new list<Schedule_Split__c>();
    
    public id scheSpId{get;set;}
    public Integer rowNum{get;set;}
    public Decimal totalRevenue{set;get;}
    //Variable for list of Class IndexSplit
    public list<IndexSplit> indexSplitList{get;set;}
  //variable for validations    
    boolean isError = FALSE;
  //variables for Schedule data
    date startDateSched;
    date endDateSched;
    public decimal TotalPrice{get;set;}
    public decimal TotalQuantity{get;set;}
    Decimal amountSched = 0.0;
    Decimal amntSched = 0.0;
     public Decimal temptotalRevenue ;
    date StartdateTemp ;
    date EnddateTemp ;
    date tempstart;
    date tempend;
    decimal Amounttemp ;
    public integer count=1;
    public date EndDate;
    
    public String selectedRowIndex{get;set;} 
    public String recCount{get;set;} 
   list<Schedule_Split__c> existing = new list<Schedule_Split__c>();
    
   public CreateEditPage(ApexPages.StandardController controller) {
        //get OpportunityLine Id from URL.
      
          scheSpId = ApexPages.CurrentPage().getparameters().get('id');
     
       
        
        
        //intializing list of type Class IndexSplit.
        indexSplitList = new list<IndexSplit>();
        
        //Retrieve Splits of the Schedule based on Schedule Id from URL.
        
        if(scheSpId != null)
        {
            
            scheduleSplitList = [Select Id,Quantity__c,Avg_Revenue_Per_Unit_ARPU__c,Churn_Units__c,Comments__c,Revenue__c,Amount__c, End_date__c,Start_Date__c from Schedule_Split__c where OpportunityLineItemId__c= : scheSpId order by Start_Date__c];
         
            
          //  scheduleSplitList.sort();
            tempstart= scheduleSplitList[0].Start_Date__c;
         
            amntSched= scheduleSplitList [0].Revenue__c;
            scheduleSplitList[0].Revenue__c=amntSched;
            StartdateTemp =scheduleSplitList[0].Start_Date__c;
            Amounttemp =scheduleSplitList[0].Amount__c; 
        }
        
        if(scheduleSplitList != null && !scheduleSplitList.isEmpty()){
            startDateSched = scheduleSplitList[0].Start_Date__c;
            amountSched = scheduleSplitList[0].Revenue__c.setScale(0);
                        
            IndexSplit inSplit;
            for(Schedule_Split__c schSplit : scheduleSplitList){
                if(indexSplitList.isEmpty()){
                    inSplit = new IndexSplit();
                    inSplit.i = 0;
                    inSplit.scSplit = schSplit;
                    indexSplitList.add(inSplit);
                }else{
                    inSplit = new IndexSplit();
                    inSplit.i = indexSplitList.size();
                    inSplit.scSplit = schSplit;
                    indexSplitList.add(inSplit);                    
                }                
            }
        }
        
        getTotal();
    }
    
   

    
     //Method for saving Schedule Changes.
    public PageReference saveSchedule(){
        PageReference prSc;
        try{
             system.debug('#########'+scheSpId);
             list<Schedule_Split__c> Opsche = new list<Schedule_Split__c>();
             for(Schedule_Split__c Ex :[SELECT Id From Schedule_Split__c where OpportunityLineItemId__c =:scheSpId ]){
                  system.debug('####Ex'+Ex);
                    Opsche.add(Ex);               
                }                
                        
                delete existing;
                upsert scheduleSplitList[0];
                system.debug('Parent amount to update'+scheduleSplitList[0]); 
                prSc = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/apex/OpportunityLineItemRelatedList?scontrolCaching=1&id='+scheSpId);
            
            
        }catch(exception e){
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
     return prSc;
        
    
    }
    
    //Method to Save Splits
    
    public PageReference saveSplit()
    {
            PageReference pr;
        try{
            
            if(indexSplitList != null && !indexSplitList.isEmpty()){
                scheduleSplitList = new list<Schedule_Split__c>();
                isError = FALSE;
                for(IndexSplit indSplit : indexSplitList){
                     scheduleSplitList.add(indSplit.scSplit);
                                             
                     if(indSplit.scSplit.Start_Date__c == null ){                    
                        //scheduleSplitList.remove(i);
                        isError = TRUE;
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Start Date, End Date & Revenue should not be blank'));                    
                        break;
                    }
                   else if(scheduleSplitList[0].Start_Date__c > indSplit.scSplit.Start_Date__c){
                       
                            isError = TRUE;
                            String StartTemp=scheduleSplitList[0].Start_Date__c.format();
                            String EndTemp=scheduleSplitList[0].End_Date__c.format();
                            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Start Date of schedule should be between Start Date and End Date of Product : '+string.valueOf(StartTemp)+ '   &   ' +string.valueOf(EndTemp)));                        
                 }
                 else if(indSplit.scSplit.Start_Date__c < scheduleSplitList[0].Start_Date__c){
                       
                             isError = TRUE;
                             String StartTemp=StartdateTemp.format();
                             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Start Date should not be less than start date of Schedule : '+string.valueOf(StartTemp)));                        
                 }
                        
                            
                    }
                   
                   getTotal();    
                
                if(totalRevenue != null){
                    system.debug('789****totalRevenue'+totalRevenue);
                if(scheduleSplitList[0].Revenue__c==null){
                    system.debug('123***Start_Date'+scheduleSplitList[0].Revenue__c);                               
                    isError = TRUE;
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Amount Can not be blank ')); 
                } 
              
                }       
                
                if(!isError){                
                    if(scheduleSplitList != null && !scheduleSplitList.isEmpty()){                    
                        pr = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/apex/OpportunityLineItemRelatedList?scontrolCaching=1&id='+scheSpId);
                        upsert scheduleSplitList;
                        saveSchedule();
                    }
                                    
                }
                           
            }
             
            
        }
        catch(Exception ex){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,ex.getMessage()));
        }
        
         
        return pr;
    }
    
    //Reset Button 
    public PageReference reset()
{
         
        PageReference prSc;
        try{
            
                               
           
                system.debug('#########'+scheSpId);
                
                
                for(Schedule_Split__c Ex :[SELECT Id From Schedule_Split__c where OpportunityLineItemId__c =:scheSpId ]){
                 // system.debug('####Ex'+Ex);
                    
                        
                        existing.add(Ex);
                      //  system.debug('####existing'+existing);
                                   
                }                
                        
                delete existing;
               upsert scheduleSplitList[0];
               list<Schedule_Split__c> oplisc = new list<Schedule_Split__c>();
               for(Schedule_Split__c Oli:[SELECT Id From Schedule_Split__c where OpportunityLineItemId__c =:scheduleSplitList[0].OpportunityLineItemId__c])
               {
                   TotalPrice = scheduleSplitList[0].Revenue__c;
                   Oli.Start_Date__c = scheduleSplitList[0].Start_Date__c;
                   Oli.End_Date__c= scheduleSplitList[0].End_Date__c; 
                   // Oli.UnitPrice = SchedList[0].Amount__c;
                   //Modification made on 10th june to fix Updation Issue between standard and custom Products.
                   oli.Quantity__c=scheduleSplitList[0].Quantity__c;
                   oli.Avg_Revenue_Per_Unit_ARPU__c= scheduleSplitList[0].Avg_Revenue_Per_Unit_ARPU__c;
                   oli.Churn_Units__c=scheduleSplitList[0].Churn_Units__c;
                   oli.Comments__c=scheduleSplitList[0].Comments__c;
                   oplisc.add(oli);
               }
               update oplisc;
              
             List<Schedule_Split__c> SchSplLst = new List<Schedule_Split__c>();
          
            
                for(Schedule_Split__c Sp :[SELECT Id FROM Schedule_Split__c where OpportunityLineItemId__c =:scheSpId]){
                    SchSplLst.add(Sp);
                }
             
              
              Delete SchSplLst;
         
                
                             
                prSc = new PageReference('/'+scheSpId);
            
            
        }catch(exception e){
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        }
         
        
        return prSc;
        
    
    
}
    
    
       
    public PageReference cancelSplit(){
        return new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/apex/OpportunityLineItemRelatedList?scontrolCaching=1&id='+scheSpId);
    }
    
   
    public void addRow(){
        
        
        IndexSplit inSplit = new IndexSplit();
        inSplit.i = indexSplitList.size();
        inSplit.scSplit.OpportunityLineItemId__c = scheSpId;
        
        indexSplitList.add(inSplit);   
             
       
    }
   
    public void deleteRow(){
       
        system.debug('***splitDel-->'+apexpages.currentpage().getparameters().get('splitDel'));
        system.debug('***splitDel-->'+apexpages.currentpage().getparameters().get('indexOfSplit'));
        
        Integer indexI = Integer.ValueOf(apexpages.currentpage().getparameters().get('indexOfSplit'));
        
        if(apexpages.currentpage().getparameters().get('splitDel') != null && 
        apexpages.currentpage().getparameters().get('splitDel') != '' && 
        apexpages.currentpage().getparameters().get('indexOfSplit') != null && 
        apexpages.currentpage().getparameters().get('indexOfSplit') != ''){
            try{
                delete indexSplitList[indexI].scSplit;
            }catch(exception e){
                system.debug('exception Message---->'+e.getMessage());
            }
            
        }
        
        if(apexpages.currentpage().getparameters().get('indexOfSplit') != null && 
        apexpages.currentpage().getparameters().get('indexOfSplit') != ''){
            
           indexSplitList.remove(indexI); 
            
            for(integer i = indexI;i<indexSplitList.size();i++){
                indexSplitList[i].i = i;
            }
        }
        
        getTotal();
        //rowNum = Integer.valueOf(apexpages.currentpage().getparameters().get('index'));
        //scheduleSplitList.remove(rowNum);        
    }
    
    
      
    
    public PageReference getTotal(){        
        if(indexSplitList != null && !indexSplitList.isEmpty()){
            totalRevenue = 0.0;
            for(IndexSplit indSplit : indexSplitList){
                if(indSplit.scSplit.Revenue__c != null){
                    // totalRevenue+= ss.Revenue__c;
                    totalRevenue= totalRevenue+ indSplit.scSplit.Revenue__c;
                    system.debug('*123****totalRevenue'+totalRevenue);
                    //totalRevenue=totalRevenue.setScale(2);                   
                }
            }
            temptotalRevenue=totalRevenue;
            totalRevenue=totalRevenue.setScale(2);   
          //  totalRevenue=totalRevenue.round(System.RoundingMode.HALF_EVEN);
            
        }
        
              
          
        return null;
    }
    
    public PageReference getTotalARPU(){        
        if(indexSplitList != null && !indexSplitList.isEmpty()){
            totalRevenue = 0.0;
            for(IndexSplit indSplit : indexSplitList){
                if(indSplit.scSplit.Avg_Revenue_Per_Unit_ARPU__c != null){
                    // totalRevenue+= ss.Revenue__c;
                    indSplit.scSplit.Revenue__c= indSplit.scSplit.Quantity__c * indSplit.scSplit.Avg_Revenue_Per_Unit_ARPU__c;
                    system.debug('*123****totalRevenue'+totalRevenue);
                    //totalRevenue=totalRevenue.setScale(2);                   
                }
            }
          //  temptotalRevenue=totalRevenue;
          //  totalRevenue=totalRevenue.setScale(2);   
          //  totalRevenue=totalRevenue.round(System.RoundingMode.HALF_EVEN);
            
        }
        
              
          
        return null;
    }
    

    public class IndexSplit{
        public integer i{set;get;}
        public Schedule_Split__c scSplit{get;set;}
        public indexSplit(){
            scSplit = new Schedule_Split__c();
        }
        
    }
       
   
}