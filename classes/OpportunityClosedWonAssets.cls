/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 12-Oct-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 12-Oct-2017
  Description ........: Apex invocable method which adds products as Assets for non YBN-Individual Location Opps
  *****************************************************************************/
  
public class OpportunityClosedWonAssets
{
    @InvocableMethod
    public static void closedWonAssets(List<Id> oppIds)
    {
        if(oppIds.size() > 0){
        
            Id oppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('YBN - Individual Location').getRecordTypeId();
            Map<Id, Opportunity> oppsMap = new Map<Id, Opportunity>();
            Map<Id, OpportunityLineItem> oppLinesMap = new Map<Id, OpportunityLineItem>();
            List<OpportunityLineItem> assetProds = new List<OpportunityLineItem>();
            List<Asset> dmlAssets = new List<Asset>();
            
            // Opportunity Data
            for(Opportunity o : 
                [SELECT Id,
                        AccountId,
                        Account.Name,
                        Account.Parent.Name,
                        StageName,
                        OwnerId,
                        IsWon,
                        RecordTypeId,
                        CloseDate
                   FROM Opportunity
                  WHERE RecordTypeId != :oppRecordTypeId AND
                        IsWon = true AND
                        Id in: oppIds]){
                        
                // add Opportunity to Map and Populate Owner Id Set
                oppsMap.put(o.Id, o);
            }
            
            if(oppsMap.size() > 0){
            
                // Opportunity Line Item data
                for(OpportunityLineItem oli : 
                    [SELECT Id, 
                            OpportunityId,
                            Opportunity.OwnerId,
                            Quantity, 
                            UnitPrice, 
                            ProductName__c, 
                            Description, 
                            Product2Id,
                            Product2.Family,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet()]){
                    
                    if(oli.Id != null && oli.Converted_to_Asset__c == false){
                                                
                        Asset a = new Asset();
                        a.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                        a.Product2Id = oli.Product2Id;
                        a.Quantity = oli.Quantity;
                        a.Price =  oli.UnitPrice;
                        a.PurchaseDate = oppsMap.get(oli.OpportunityId).CloseDate;
                        a.Status = 'Purchased';
                        a.Description = oli.Description;
                        a.Name = oli.ProductName__c;
                                    
                        // add new Asset to list
                        dmlAssets.add(a);
                        oli.Converted_to_Asset__c = true;
                        assetProds.add(oli);
                    }
                }
                
                // INSERT ASSETS and Update Product Converted to Asset checkbox
                if(dmlAssets.size() > 0){
                
                    insert dmlAssets;
                    update assetProds;
                }
            }
        }
    }
}