public class ScheduleSplitGenerator {
    Public Id OliId {get;set;}
    
    Public String Type{get;set;}
    
    Public String QtySchedType{get;set;}
    Public Date StrtDate{get;set;}
    Public String SchQtyInstPer{get;set;}
    Public Integer QtyNoIns{get;set;}
    Public Decimal Quantity{get;set;}
    
    Public String RevSchedType{get;set;}
    Public Date RevStrtDate{get;set;}
    Public String RevSchInstPer{get;set;}
    Public Integer RevNoIns{get;set;}
    Public Decimal Revenue{get;set;}
    
    Public Date QtyEndDate;
    
    public ScheduleSplitGenerator(ApexPages.StandardController controller)
    {
        OliId = ApexPages.CurrentPage().getparameters().get('id');
        system.debug('@@@ RecordId id '+OliId);
       // QtyEndDate=StrtDate.addMonths(QtyNoIns);
        
        
        
    }
    
    //Method to send Picklist value to Type
    public List<SelectOption> getTypeOptions() {
        List<SelectOption> TypeOptions = new List<SelectOption>();
        TypeOptions.add(new SelectOption('Quantity and Revenue Schedules','Quantity and Revenue Schedules'));
        TypeOptions.add(new SelectOption('Quantity Schedule Only','Quantity Schedule Only'));
        TypeOptions.add(new SelectOption('Revenue Schedule Only','Revenue Schedule Only'));
        return TypeOptions;
    }
    
    //Method to send Picklist value to Quantity  and Revenue Type
    public List<SelectOption> getSchedTypeOptions() {
        List<SelectOption> SchedTypeOptions = new List<SelectOption>();
        SchedTypeOptions.add(new SelectOption('','-None-'));
        SchedTypeOptions.add(new SelectOption('Divide Amount into multiple installments','Divide Amount into multiple installments'));
        SchedTypeOptions.add(new SelectOption('Repeat Amount for each installment','Repeat Amount for each installment'));
        return SchedTypeOptions;
    }
    
     //Method to send Picklist value to Quantity and Revenue Period
    public List<SelectOption> getSchedInstOptions() 
    {
        List<SelectOption> SchedInstOptions = new List<SelectOption>();
        SchedInstOptions.add(new SelectOption('','-None-'));
        /*SchedInstOptions.add(new SelectOption('Daily','Daily'));
        SchedInstOptions.add(new SelectOption('Weekly','Weekly')); */
        SchedInstOptions.add(new SelectOption('Monthly','Monthly'));
       // SchedInstOptions.add(new SelectOption('Quarterly','Quarterly'));                                         
        return SchedInstOptions;
    }
    
  
    
    Public void MonthlySchedule()
    {
        if((Type=='Revenue Schedule Only' || Type=='Quantity and Revenue Schedules')&&( RevStrtDate <> null) &&  (RevStrtDate <> StrtDate))
        {
         integer monthdays;
         integer monthnow;
         Decimal MonthAmount;
         Decimal Totalamount;
         Decimal PerdayAmount;
         Date    currentDate;
         Date    enddate;
         Date    ScheduleDate;
         Date    LastDate; 
         Date    Startmonth;
         Date    RevLastDate; 
         integer startdate;
         integer startdatemonth;
         integer noofmonths;
         string RevSchSelType;
         
         List<Schedule_Split__c> newScheduleObjects = new List<Schedule_Split__c>();
         
         for(OpportunityLineitem a :[Select Id,TotalPrice From OpportunityLineItem where Id =: OliId]) 
         {    
             // check for value in Total Price fields and also check for values in Start Date  and End Date
             if((a.TotalPrice!=0))
             {
                 currentDate = RevStrtDate;
                 Startmonth= RevStrtDate;
                 
                 //startdate = currentDate.day();
                 Totalamount = a.TotalPrice;
                 //startdatemonth = currentDate.month();
                 RevLastDate=RevStrtDate.addMonths(RevNoIns);
                 System.debug('++RevLastDate'+RevLastDate);
                 noofmonths =RevStrtDate.monthsBetween(RevLastDate);                 
                 enddate = (RevLastDate.addMonths(1))-1;
                 system.debug('***************noofmonths***********'+noofmonths);
                 //integer currentyear = currentDate.year();
                 
                 PerdayAmount=(Revenue/((RevStrtDate.daysBetween(enddate))+1));
                 System.debug('+++++PerdayAmount'+PerdayAmount);
                 
                 for(integer i=1; i<=noofmonths;i++)
                 {
                     //List<Schedule__c> schedid =[SELECT Id, Name FROM Schedule__c where Id=:a.Id]; 
                    Schedule_Split__c monthschedule = new Schedule_Split__c();        
                    currentDate = currentDate;
                    if(currentDate.month()== enddate.month()&& currentDate.year()==enddate.year()){
                      LastDate=enddate;
                        system.debug('***LastDate%%%%***'+LastDate);
                     }
                     else{
                    LastDate = (currentDate.addMonths(1));
                    system.debug('***LastDate***'+LastDate);     
                     }
                     if(currentDate.month()==enddate.month()&& currentDate.year()==enddate.year()){
                         if(currentDate.month()==Startmonth.month()&& currentDate.year()==Startmonth.year()){
                            monthschedule.Start_Date__c =Startmonth ;
                            monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                       system.debug('*****lastmonthschedule*****'+monthschedule); 
                            }
                         else{monthschedule.Start_Date__c = enddate;
                              monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                       system.debug('*****lastmonthschedule*****'+monthschedule);   
                     }
                     }
                     else{
                    monthschedule.Start_Date__c = currentDate;
                    monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                    system.debug('*****monthschedule*****'+monthschedule);
                    }
                    //monthschedule.Id = a.Id;
                    //Totalamount = ((currentDate.daysBetween(LastDate))+1)*PerdayAmount;
                     if(RevSchedType=='Divide Amount into multiple installments')
                     {
                      Totalamount = Revenue/RevNoIns;
                      system.debug('********Totalamount******'+Totalamount);
                     }
                     else
                     {
                        Totalamount=Revenue;
                     }
                         //monthschedule.QtySchedType = 'Revenue';
                     monthschedule.Revenue__c = Totalamount.round(System.RoundingMode.HALF_EVEN);
                    system.debug('*********Revenue.....'+monthschedule); 
                    monthschedule.OpportunityLineItemId__c = a.Id;
                    system.debug('***-*-Opportunity--**-*-*'+monthschedule);    
                    newScheduleObjects.add(monthschedule);
                     system.debug('////neschedule////'+newScheduleObjects);
                    currentDate = (currentDate.addMonths(1));
                    system.debug('****currentDate****'+currentDate);
                    
                    
                 }
             }
           }
        
              if (newScheduleObjects!=null) {
                  system.debug('+++++Size is more than 0');
                  List<Schedule_Split__c> sList= [Select Id,OpportunityLineItemId__c from Schedule_Split__c Where OpportunityLineItemId__c =:OliId];
                  System.debug('DeleteList***'+sList);
                  if(sList!=null)
                  {
                      delete sList;
                  }
             try {
                  system.debug('+++++Try me');
              insert(newScheduleObjects);
                  system.debug('newScheduleObjects++++'+newScheduleObjects);
             } 
               catch (System.DmlException e) {
                  for (Integer ei = 0; ei < e.getNumDml(); ei++) {
                  System.debug(e.getDmlMessage(ei));
                  { ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'why not working here?'+e));}    
               } 
               // There should be something here to alert the user what failed!
              //
               } // End Catch 
         } // End If greater than 0  
    }
        
        
    if((Type=='Quantity Schedule Only' ||Type=='Quantity and Revenue Schedules' )&&( StrtDate <> null)  &&  (RevStrtDate <> StrtDate))
        {
         integer monthdays;
         integer monthnow;
         Decimal MonthAmount;
         Double TotalQuantity;
         Decimal PerdayAmount;
         Date    currentDate;
         Date    enddate;
         Date    ScheduleDate;
         Date    LastDate; 
         Date    Startmonth;
         Date    QtyLastDate; 
         integer startdate;
         integer startdatemonth;
         integer noofmonths;
         string RevSchSelType;
         
         List<Schedule_Split__c> newScheduleObjects = new List<Schedule_Split__c>();
         
         for(OpportunityLineitem a :[Select Id,TotalPrice,Quantity From OpportunityLineItem where Id =: OliId]) 
         {    
             // check for value in Total Price fields and also check for values in Start Date  and End Date
             if((a.Quantity!=0))
             {
                 currentDate = StrtDate;
                 Startmonth= StrtDate;
                 
                 //startdate = currentDate.day();
                 TotalQuantity = a.Quantity;
                 //startdatemonth = currentDate.month();
                 QtyLastDate=StrtDate.addMonths(QtyNoIns);
                 System.debug('++RevLastDate'+QtyLastDate);
                 noofmonths =StrtDate.monthsBetween(QtyLastDate);                 
                 enddate = (QtyLastDate.addMonths(1))-1;
                 system.debug('***************noofmonths***********'+noofmonths);
                 //integer currentyear = currentDate.year();
                 
               /*  PerdayAmount=(Revenue/((RevStrtDate.daysBetween(enddate))+1));
                 System.debug('+++++PerdayAmount'+PerdayAmount);*/
                 
                 for(integer i=1; i<=noofmonths;i++)
                 {
                     //List<Schedule__c> schedid =[SELECT Id, Name FROM Schedule__c where Id=:a.Id]; 
                    Schedule_Split__c monthschedule = new Schedule_Split__c();        
                    currentDate = currentDate;
                    if(currentDate.month()== enddate.month()&& currentDate.year()==enddate.year()){
                      LastDate=enddate;
                        system.debug('***LastDate%%%%***'+LastDate);
                     }
                     else{
                    LastDate = (currentDate.addMonths(1));
                    system.debug('***LastDate***'+LastDate);     
                     }
                     if(currentDate.month()==enddate.month()&& currentDate.year()==enddate.year()){
                         if(currentDate.month()==Startmonth.month()&& currentDate.year()==Startmonth.year()){
                            monthschedule.Start_Date__c =Startmonth ;
                            monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                       system.debug('*****lastmonthschedule*****'+monthschedule); 
                            }
                         else{monthschedule.Start_Date__c = enddate;
                              monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                       system.debug('*****lastmonthschedule*****'+monthschedule);   
                     }
                     }
                     else{
                    monthschedule.Start_Date__c = currentDate;
                    monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                    system.debug('*****monthschedule*****'+monthschedule);
                    }
                    //monthschedule.Id = a.Id;
                    //Totalamount = ((currentDate.daysBetween(LastDate))+1)*PerdayAmount;
                     if(QtySchedType=='Divide Amount into multiple installments')
                     {
                      TotalQuantity = Quantity/QtyNoIns;
                      system.debug('********Totalamount******'+TotalQuantity);
                     }
                     else
                     {
                        TotalQuantity=Quantity;
                     }
                         //monthschedule.QtySchedType = 'Revenue';
                     monthschedule.Quantity__c = TotalQuantity;
                    system.debug('*********Revenue.....'+monthschedule); 
                    monthschedule.OpportunityLineItemId__c = a.Id;
                    system.debug('***-*-Opportunity--**-*-*'+monthschedule);    
                    newScheduleObjects.add(monthschedule);
                     system.debug('////neschedule////'+newScheduleObjects);
                    currentDate = (currentDate.addMonths(1));
                    system.debug('****currentDate****'+currentDate);
                    
                    
                 }
             }
           }
        
              if (newScheduleObjects!=null) {
                  system.debug('+++++Size is more than 0');
                  List<Schedule_Split__c> sList= [Select Id,OpportunityLineItemId__c from Schedule_Split__c Where OpportunityLineItemId__c =:OliId];
                  System.debug('DeleteList***'+sList);
                  if(sList!=null)
                  {
                      delete sList;
                  }
             try {
                  system.debug('+++++Try me');
              insert(newScheduleObjects);
                  system.debug('newScheduleObjects++++'+newScheduleObjects);
             } 
               catch (System.DmlException e) {
                  for (Integer ei = 0; ei < e.getNumDml(); ei++) {
                  System.debug(e.getDmlMessage(ei));
                  { ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'why not working here?'+e));}    
               } 
               // There should be something here to alert the user what failed!
              //
               } // End Catch 
         } // End If greater than 0  
    } 
    
    if(Type=='Quantity and Revenue Schedules' && RevStrtDate <> null && StrtDate <> null &&  (RevStrtDate == StrtDate))
        {
         integer monthdays;
         integer monthnow;
         Decimal MonthAmount;
         Decimal Totalamount;
         Decimal PerdayAmount;
         Double TotalQuantity;
         Date    currentDate;
         Date    enddate;
         Date    ScheduleDate;
         Date    LastDate; 
         Date    Startmonth;
         Date    RevLastDate; 
         Date    QtyLastDate;
         integer startdate;
         integer startdatemonth;
         integer noofmonths;
         integer noofQtymonths;
         string RevSchSelType;
         
         List<Schedule_Split__c> newScheduleObjects = new List<Schedule_Split__c>();
         
         for(OpportunityLineitem a :[Select Id,TotalPrice,Quantity From OpportunityLineItem where Id =: OliId]) 
         {    
             // check for value in Total Price fields and also check for values in Start Date  and End Date
             if((a.TotalPrice!=0))
             {
                 currentDate = RevStrtDate;
                 Startmonth= RevStrtDate;
                 
                 //startdate = currentDate.day();
                 Totalamount = a.TotalPrice;
                 //startdatemonth = currentDate.month();
                 RevLastDate=RevStrtDate.addMonths(RevNoIns);
                 System.debug('++RevLastDate'+RevLastDate);
                 QtyLastDate=StrtDate.addMonths(QtyNoIns);
                 noofmonths =RevStrtDate.monthsBetween(RevLastDate); 
                 noofQtymonths=StrtDate.monthsBetween(QtyLastDate);
                 enddate = (RevLastDate.addMonths(1))-1;
                 system.debug('***************noofmonths***********'+noofmonths);
                 //integer currentyear = currentDate.year();
                 
                 PerdayAmount=(Revenue/((RevStrtDate.daysBetween(enddate))+1));
                 System.debug('+++++PerdayAmount'+PerdayAmount);
                 if(noofmonths>=noofQtymonths)
                 {
                     for(integer i=1; i<=noofmonths;i++)
                     {
                         //List<Schedule__c> schedid =[SELECT Id, Name FROM Schedule__c where Id=:a.Id]; 
                        Schedule_Split__c monthschedule = new Schedule_Split__c();        
                        currentDate = currentDate;
                        if(currentDate.month()== enddate.month()&& currentDate.year()==enddate.year()){
                          LastDate=enddate;
                            system.debug('***LastDate%%%%***'+LastDate);
                         }
                         else{
                        LastDate = (currentDate.addMonths(1));
                        system.debug('***LastDate***'+LastDate);     
                         }
                         if(currentDate.month()==enddate.month()&& currentDate.year()==enddate.year()){
                             if(currentDate.month()==Startmonth.month()&& currentDate.year()==Startmonth.year()){
                                monthschedule.Start_Date__c =Startmonth ;
                                monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                           system.debug('*****lastmonthschedule*****'+monthschedule); 
                                }
                             else{monthschedule.Start_Date__c = enddate;
                                  monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                           system.debug('*****lastmonthschedule*****'+monthschedule);   
                         }
                         }
                         else{
                        monthschedule.Start_Date__c = currentDate;
                        monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                        system.debug('*****monthschedule*****'+monthschedule);
                        }
                        //monthschedule.Id = a.Id;
                        //Totalamount = ((currentDate.daysBetween(LastDate))+1)*PerdayAmount;
                         if(RevSchedType=='Divide Amount into multiple installments')
                         {
                          Totalamount = Revenue/RevNoIns;
                          system.debug('********Totalamount******'+Totalamount);
                         }
                         else
                         {
                            Totalamount=Revenue;
                         }
                             //monthschedule.QtySchedType = 'Revenue';
                         monthschedule.Revenue__c = Totalamount.round(System.RoundingMode.HALF_EVEN);
                        system.debug('*********Revenue.....'+monthschedule); 
                        //Totalamount = ((currentDate.daysBetween(LastDate))+1)*PerdayAmount;
                         if(i<=noofQtymonths)
                         {
                          if(QtySchedType=='Divide Amount into multiple installments')
                             {
                              TotalQuantity = Quantity/QtyNoIns;
                              system.debug('********Totalamount******'+TotalQuantity);
                             }
                           else
                             {
                                TotalQuantity=Quantity;
                             }
                           monthschedule.Quantity__c = TotalQuantity;
                          }     
                        monthschedule.OpportunityLineItemId__c = a.Id;
                        system.debug('***-*-Opportunity--**-*-*'+monthschedule);    
                        newScheduleObjects.add(monthschedule);
                         system.debug('////neschedule////'+newScheduleObjects);
                        currentDate = (currentDate.addMonths(1));
                        system.debug('****currentDate****'+currentDate);
                        
                        
                     }
                 }
                 else
                 {
                     for(integer i=1; i<=noofQtymonths;i++)
                     {
                         //List<Schedule__c> schedid =[SELECT Id, Name FROM Schedule__c where Id=:a.Id]; 
                        Schedule_Split__c monthschedule = new Schedule_Split__c();        
                        currentDate = currentDate;
                        if(currentDate.month()== enddate.month()&& currentDate.year()==enddate.year()){
                          LastDate=enddate;
                            system.debug('***LastDate%%%%***'+LastDate);
                         }
                         else{
                        LastDate = (currentDate.addMonths(1));
                        system.debug('***LastDate***'+LastDate);     
                         }
                         if(currentDate.month()==enddate.month()&& currentDate.year()==enddate.year()){
                             if(currentDate.month()==Startmonth.month()&& currentDate.year()==Startmonth.year()){
                                monthschedule.Start_Date__c =Startmonth ;
                                monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                           system.debug('*****lastmonthschedule*****'+monthschedule); 
                                }
                             else{monthschedule.Start_Date__c = enddate;
                                  monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                           system.debug('*****lastmonthschedule*****'+monthschedule);   
                         }
                         }
                         else{
                        monthschedule.Start_Date__c = currentDate;
                        monthschedule.End_Date__c=(monthschedule.Start_Date__c.addMonths(1))-1;
                        system.debug('*****monthschedule*****'+monthschedule);
                        }
                        
                         if(i<=noofmonths)
                         {
                         //Totalamount = ((currentDate.daysBetween(LastDate))+1)*PerdayAmount;
                         if(RevSchedType=='Divide Amount into multiple installments')
                         {
                          Totalamount = Revenue/RevNoIns;
                          system.debug('********Totalamount******'+Totalamount);
                         }
                         else
                         {
                            Totalamount=Revenue;
                         }
                             //monthschedule.QtySchedType = 'Revenue';
                         monthschedule.Revenue__c = Totalamount.round(System.RoundingMode.HALF_EVEN);
                        system.debug('*********Revenue.....'+monthschedule); 
                         }     
                        //Totalamount = ((currentDate.daysBetween(LastDate))+1)*PerdayAmount;
                        
                          if(QtySchedType=='Divide Amount into multiple installments')
                             {
                              TotalQuantity = Quantity/QtyNoIns;
                              system.debug('********Totalamount******'+TotalQuantity);
                             }
                           else
                             {
                                TotalQuantity=Quantity;
                             }
                           monthschedule.Quantity__c = TotalQuantity;
                              
                        monthschedule.OpportunityLineItemId__c = a.Id;
                        system.debug('***-*-Opportunity--**-*-*'+monthschedule);    
                        newScheduleObjects.add(monthschedule);
                         system.debug('////neschedule////'+newScheduleObjects);
                        currentDate = (currentDate.addMonths(1));
                        system.debug('****currentDate****'+currentDate);
                        
                        
                     }
                 }
             }
           }
        
              if (newScheduleObjects!=null) {
                  system.debug('+++++Size is more than 0');                 
                  
                  List<Schedule_Split__c> sList= [Select Id,OpportunityLineItemId__c from Schedule_Split__c Where OpportunityLineItemId__c =:OliId];
                  System.debug('DeleteList***'+sList);
                  if(sList!=null)
                  {
                      delete sList;
                  }
             try {
                  system.debug('+++++Try me');
              insert(newScheduleObjects);
                  system.debug('newScheduleObjects++++'+newScheduleObjects);
             } 
               catch (System.DmlException e) {
                  for (Integer ei = 0; ei < e.getNumDml(); ei++) {
                  System.debug(e.getDmlMessage(ei));
                  { ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'why not working here?'+e));}    
               } 
               // There should be something here to alert the user what failed!
              //
               } // End Catch 
         } // End If greater than 0  
    }
        
        
        
    }
    
    public PageReference save(){
        MonthlySchedule();
        pageReference pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/apex/OpportunityLineItemRelatedList?scontrolCaching=1&id='+OliId);
        return pageRef;
    }
    
     public PageReference cancel(){
        pageReference pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/apex/OpportunityLineItemRelatedList?scontrolCaching=1&id='+OliId);
        return pageRef;
    }
    
    
    
}