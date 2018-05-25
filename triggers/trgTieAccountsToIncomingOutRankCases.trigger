trigger trgTieAccountsToIncomingOutRankCases on Case (before insert, before update) 


  {

    
    // Date : 12/2/2014
    // Author : Rehan Nayyer
    // Objective : The objective is to tie the correct Account to the cases coming in from OutRank Salesforce using S2S. 
    //             This trigger will populate the "Account ID" on Cases using the "Yodle ID" which is mapped with "Yodle Account ID" 
    //             in S2S mapping for Cases    
    
      
        // Define connection id for OutRank connection in S2S
        Id networkId; 
    
        try
          {
             networkId = clsS2SShareHelper.getConnectionId('Rogers Venture/ Local Digital');

          }
        catch(Exception excp)
          {          
    
          } 

         Set<Id> incomingCaseSet = new Set<Id>(); 
         List<Case> incomingCases = new List<Case>(); 
    
    
         // Only process records coming in from OutRank via S2S with Subject starting with 'O2Y' 
         for (Case newCase: TRIGGER.new) 
            { 
                if (newCase.ConnectionReceivedId == networkId  && newCase.Subject != null && newCase.Subject.startsWithIgnoreCase('O2Y') ) 
                   { 
                      incomingCaseSet.add(newCase.Id); 
                      incomingCases.add(newCase); 
                   } 
            }
    
         // Iterate through the incoming Case set
         if (incomingCaseSet.size() > 0) 
            { 
        
                for (Case newCase: incomingCases) 
                   { 
                      newCase.AccountId = newCase.Yodle_ID__c;
                   } 
                
         
             } 

  }