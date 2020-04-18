/**************************************************************************************************************
Name : Schedule_Split
Created By : Mahesh Bogila
Created Date : 03/13/2020
Modified Date :  
Purpose : Function for displaying Quantity and Revenue Schedule On Custom Object 
***************************************************************************************************************/ 
public class ScheduleRelatedListController {     

    public List<Schedule_Split__c> Schedules{get;set;} 

    public OpportunityLineItem OpportunityLineItems{get;set;} 

    public OpportunityLineItem Ole {get;set;} 
    
    Public id OleId{get;set;}

     

    //Constructor 

    public ScheduleRelatedListController(ApexPages.StandardController controller) { 

       Ole = (OpportunityLineItem)controller.getRecord();    
        
      System.debug('+++Mahesh OLE'+Ole);

       OpportunityLineItems = [SELECT id FROM OpportunityLineItem WHERE id=: Ole.id]; 
       

       Schedules= [SELECT id,OpportunityLineItemId__c, Start_Date__c, End_Date__c,Revenue__c,Quantity__c,Avg_Revenue_Per_Unit_ARPU__c,Churn_Units__c,Comments__c  FROM Schedule_Split__c WHERE OpportunityLineItemId__c= :OpportunityLineItems.id ORDER BY Start_Date__c];     

} 

    //This method is to Establish 

    public pageReference newSchedule(){  
        for(OpportunityLineItem a:[SELECT id FROM OpportunityLineItem WHERE id=: Ole.id])
         {
          OleId=OpportunityLineItems.Id;
         }

        pageReference pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/apex/EstablishSchedulePage?scontrolCaching=1&id='+OleId);  

        return pageRef ; 

    } 

    //This method is to edit the existing contact record while clicking the Edit link 

    public pageReference editSchedule(){  

        for(OpportunityLineItem a:[SELECT id FROM OpportunityLineItem WHERE id=: Ole.id])
         {
          OleId=OpportunityLineItems.Id;
         }
        
        list<Schedule_Split__c> cSchedule =[Select id from Schedule_Split__c where OpportunityLineItemId__c=:OleId];
        System.debug('cSchedule List'+cSchedule);
        pageReference pageRef;
        if(cSchedule.size()>0 )
        {
         pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/apex/CreateEditPage?scontrolCaching=1&id='+OleId);  
        }
        else
        {   
            pageRef=ApexPages.currentPage();
            ApexPages.Message Msg = new ApexPages.message(ApexPages.severity.INFO,'No Schedules to Edit');
            apexpages.addmessage(msg);
        }
        return pageRef ;

    }    

 //This method is to delete the contact record while clicking the Del link 

    public pageReference deleteSchedule(){  
        for(OpportunityLineItem a:[SELECT id FROM OpportunityLineItem WHERE id=: Ole.id])
         {
          OleId=OpportunityLineItems.Id;
         }
        //String SchedId = Apexpages.currentpage().getParameters().get('OpportunityLineItemId__c');  

        list<Schedule_Split__c> SchedSplitList = new List<Schedule_Split__c>();
        for(Schedule_Split__c Temp:[SELECT Id FROM Schedule_Split__c WHERE OpportunityLineItemId__c = : OleId])
        {
            SchedSplitList.add(Temp);
        }
        
        if (SchedSplitList!=null) {
                  system.debug('+++++Size is more than 0');
             try {
                  system.debug('+++++Try me');
              delete(SchedSplitList);
                  system.debug('newScheduleObjects++++'+SchedSplitList);
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
       

        

        pageReference pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/apex/OpportunityLineItemRelatedList?scontrolCaching=1&id='+OleId);  
       // window.load(pageRef);

        return pageRef; 

    }  

}