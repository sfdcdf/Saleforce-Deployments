/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 23-Oct-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 23-Oct-2017
  Description ........: Apex Trigger which assigns the Product Charge Type on the Opportunity Line Item
  to match the Product Charge Type of the Product2 line selected
*****************************************************************************/

trigger ProductChargeTypeAssignment on OpportunityLineItem (After Insert) {

    Id oppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('YBN - Individual Location').getRecordTypeId();
    Map<Id, Product2> prod2Map = new Map<Id, Product2>();
    Set<Id> prod2Ids = new Set<Id>();
    Set<Id> oppIds = new Set<Id>();
    List<OpportunityLineItem> dmlOppLineItems = new List<OpportunityLineItem>();
    
    for(OpportunityLineItem oli : Trigger.new){
    
        // add to Product2Id to Set List
        prod2Ids.add(oli.Product2Id);
        
        // add Opportunity Ids to Set List
        oppIds.add(oli.OpportunityId);
    }
    
    //System.Debug('Number of Products: ' + prod2Ids.size());
    
    try{
    
        if(prod2Ids.size() > 0 && oppIds.size() > 0){
            
            // Opportunity Line Item Products from Product2 Object
            for(Product2 prod :
                [SELECT Id,
                        ProductChargeType__c
                   FROM Product2
                  WHERE Id in :prod2Ids]){
            
                // add Products to Map
                prod2Map.put(prod.Id, prod); 
            }
            
            // Get Opportunity LineItems
            for(OpportunityLineItem oli :
                [SELECT Id,
                        Product2Id,
                        ProductChargeType__c,
                        OpportunityId,
                        Opportunity.RecordTypeId
                   FROM OpportunityLineItem
                  WHERE OpportunityId in :oppIds AND
                        Product2Id in :prod2Ids]){
                
                // check for YBN Ind Location Opp Record Type
                if(oli.Id != null && oli.Product2Id != null){
                     
                     // match Charge Type from Product2 object
                     oli.ProductChargeType__c = prod2Map.get(oli.Product2Id).ProductChargeType__c;
                     
                     // add Opportunity Line to update list
                     dmlOppLineItems.add(oli);
                 }
             }
             
             // UPDATE OPPORTUNITY LINES
             if(dmlOppLineItems.size() > 0){
             
                 update dmlOppLineItems;
             }
        }
    
    }
    catch(Exception e){
    
        System.Debug('An error occurred: ' + e.getMessage());
    
    }
}