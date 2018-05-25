trigger trgCaseNoteTimeStamp on Case (before Insert,before Update) {

    // 3/25/2015 Rehan Nayyer 
    // Trigger to append notes with User and Datetime Stamp on a separete field. These fields will only be used for escalation cases
    
    for(Case kase : Trigger.New)
    {       
            
       if (kase.Notes_Escalation__c <> null && kase.Notes_Escalation__c <> ''  )
         {        
                 
                 Datetime thisDT = System.Now().AddHours(1);
                 
                 String myDate = thisDT.format('dd-MMM-yyyy HH:mm', 'EST'); 
                 
                 if (kase.Logged_Notes__c == null)
                   {
                      kase.Logged_Notes__c = UserInfo.getName() + ' ' + myDate +' :'+ kase.Notes_Escalation__c ;
                      kase.Notes_Escalation__c  ='';
                   }
                   
                 else
                 
                   {
                      kase.Logged_Notes__c += '\n\n'+ UserInfo.getName() + ' ' + myDate +' :'+ kase.Notes_Escalation__c ;
                      kase.Notes_Escalation__c  ='';                   
                   
                   }
         
         }
         
        
    }
    
}