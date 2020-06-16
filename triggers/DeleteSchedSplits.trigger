trigger DeleteSchedSplits on OpportunityLineItem (before delete) 
{
   if(trigger.isdelete)
   {
       list<Schedule_Split__c> scSplit= new list<Schedule_Split__c>();
       for(Schedule_Split__c Temp: [select id from Schedule_Split__c where OpportunityLineItemId__c in: trigger.oldMap.keyset()])
       {
           scSplit.add(Temp);
       }
       if(!scSplit.isEmpty())
       {
           delete scSplit;
       }   
       
   }
}