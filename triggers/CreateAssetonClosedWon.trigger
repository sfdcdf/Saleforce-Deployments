trigger CreateAssetonClosedWon on Opportunity (after insert, after update) {
     /**for(Opportunity o: trigger.new){ 
      if(o.isWon == true && o.HasOpportunityLineItem == true){
         String opptyId = o.Id;
         OpportunityLineItem[] OLI = [Select UnitPrice, Quantity, PricebookEntry.Product2Id, PricebookEntry.Product2.Name, Description, Converted_to_Asset__c  
                                      From OpportunityLineItem 
                                      where OpportunityId = :opptyId  and Converted_to_Asset__c = false];
         Asset[] ast = new Asset[]{};
         Asset a = new Asset();
         for(OpportunityLineItem ol: OLI){
            a = new Asset();
        a.AccountId = o.AccountId;
            a.Product2Id = ol.PricebookEntry.Product2Id;
            a.Quantity = ol.Quantity;
            a.Price =  ol.UnitPrice;
            a.PurchaseDate = o.CloseDate;
            a.Status = 'Purchased';
            a.Description = ol.Description;
            a.Name = ol.PricebookEntry.Product2.Name;
            ast.add(a);
            ol.Converted_to_Asset__c = true;
       }
      update OLI; 
      insert ast;
     }
    }**/
}