/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 12-Oct-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 24-Mar-2018
  Modifications.......: Added new products for NCS Cases to be created and assets/ contracts associated to account.
  Description ........: Apex invocable method which executes various business taks automatically when an Opportunity is Closed/ Won for WBN.
  5/20/2018 - AMM added to each section <Case>.Opportunityname__c= oli.OpportunityId;
              Changed 1-GCC to new Status 1-Client Setup Call
*****************************************************************************/

public class OpportunityClosedWonActions
{
    @InvocableMethod
    public static void wbnClosedWonEntities(List<Id> oppIds)
    {
        if(oppIds.size() > 0){
        
            Id ncseProfileId = [SELECT Id FROM Profile WHERE Name = 'Nationally Certified Sales Executive' LIMIT 1].Id;
            Id adminProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1].Id;
            Id businessHrsId = [SELECT Id FROM BusinessHours WHERE Name = 'Local Business' LIMIT 1].Id;
            Id oppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('YBN - Individual Location').getRecordTypeId();
            Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('National - New Client Setup').getRecordTypeId();
            Map<Id, Opportunity> oppsMap = new Map<Id, Opportunity>();
            Map<Id, OpportunityLineItem> oppLinesMap = new Map<Id, OpportunityLineItem>();
            Map<Id,User> ownerMap = new Map<Id, User>();
            List<OpportunityLineItem> assetProds = new List<OpportunityLineItem>();
            List<Asset> dmlAssets = new List<Asset>();
            List<Case> dmlCases = new List<Case>();
            Set<Id> oppOwnerIds = new Set<Id>();
            Decimal ppcBudget = 0.00;
        
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
                  WHERE RecordTypeId = :oppRecordTypeId AND
                        IsWon = true AND
                        Id in: oppIds]){
                        
                // add Opportunity to Map and Populate Owner Id Set
                oppsMap.put(o.Id, o);
                oppOwnerIds.add(o.OwnerId);
            }
            
            if(oppsMap.size() > 0){
            
                // Opportunity Owner data
                for(User u :
                    [SELECT Id,
                            ProfileId,
                            Profile.Name,
                            IsActive
                       FROM User
                      WHERE Id IN :oppOwnerIds OR
                            Profile.Name = 'System Administrator']){
                    
                    // add Users to Map
                    ownerMap.put(u.Id, u);
                }
                
                // Opportunity Line Item data PPC Only
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
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Pay per Click' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    // add Line Items to Map
                    oppLinesMap.put(oli.OpportunityId, oli);
                    
                    if(oli.Id != null && oli.Converted_to_Asset__c == false){
                    
                        ppcBudget = oli.UnitPrice;
                                                
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
                
                // Opportunity Line Item data Foundations Only
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
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Foundations' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    // add Line Items to Map
                    oppLinesMap.put(oli.OpportunityId, oli);
                    
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
                
                // Opportunity Line Item data FB Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Facebook' AND
                            ProductCode = 'WBN_FBK_100' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            // Create NCS Case
                            Case fbCase = new Case();
                            fbCase.RecordTypeId = caseRecordTypeId;
                            fbCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            fbCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            fbCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            fbCase.BusinessHoursId = businessHrsId;
                            fbCase.Origin = 'New Client';
                            fbCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            fbCase.Channel_Type__c = 'National';
                            fbCase.Budget__c = 0.00;
                            fbCase.Status = '1-Client Setup Call';
                            fbCase.SEO_Product__c = 'Facebook Ads';
                            fbCase.Subject = 'NCS - Facebook Ads';
                            fbCase.Facebook_Ad_Objective__c = 'Website Clicks';
                            fbCase.Opportunityname__c= oli.OpportunityId;
                                                            
                            // add Case to Insert List
                            dmlCases.add(fbCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Opportunity Line Item data LBL Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Local Business Listings' AND
                            ProductCode = 'WBN_LBL_100' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            System.Debug('*** Creating Local Business Listing (LBL) Case');
                                
                            // Create NCS Case
                            Case lblCase = new Case();
                            lblCase.RecordTypeId = caseRecordTypeId;
                            lblCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            lblCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            lblCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            lblCase.BusinessHoursId = businessHrsId;
                            lblCase.Origin = 'New Client';
                            lblCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            lblCase.Channel_Type__c = 'National';
                            lblCase.Budget__c = 0.00;
                            lblCase.Status = '1-Client Setup Call';
                            lblCase.SEO_Product__c = oli.ProductName__c;
                            lblCase.Subject = 'NCS - ' + oli.ProductName__c;
                            lblCase.Opportunityname__c= oli.OpportunityId;
                                                                    
                            // add Case to Insert List
                            dmlCases.add(lblCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Opportunity Line Item data Local SEO Stationary Biz Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Local SEO' AND
                            ProductCode = 'WBN_LCL_SEO_201' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            System.Debug('*** Creating Local SEO Stationary Biz Case');
                                
                            // Create NCS Case
                            Case seoStationaryBizCase = new Case();
                            seoStationaryBizCase.RecordTypeId = caseRecordTypeId;
                            seoStationaryBizCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoStationaryBizCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            seoStationaryBizCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            seoStationaryBizCase.BusinessHoursId = businessHrsId;
                            seoStationaryBizCase.Origin = 'New Client';
                            seoStationaryBizCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoStationaryBizCase.Channel_Type__c = 'National';
                            seoStationaryBizCase.Budget__c = 0.00;
                            seoStationaryBizCase.Status = '1-Client Setup Call';
                            seoStationaryBizCase.SEO_Product__c = oli.ProductName__c;
                            seoStationaryBizCase.Subject = 'NCS - ' + oli.ProductName__c;
                            seoStationaryBizCase.Opportunityname__c= oli.OpportunityId;
                                                                    
                            // add Case to Insert List
                            dmlCases.add(seoStationaryBizCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Opportunity Line Item data Website Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Web' AND
                            ProductCode = 'WBN_WEB_100' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            System.Debug('*** Creating Website Case');
                                
                            // Create NCS Case
                            Case websiteCase = new Case();
                            websiteCase.RecordTypeId = caseRecordTypeId;
                            websiteCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            websiteCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            websiteCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            websiteCase.BusinessHoursId = businessHrsId;
                            websiteCase.Origin = 'New Client';
                            websiteCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            websiteCase.Channel_Type__c = 'National';
                            websiteCase.Budget__c = 0.00;
                            websiteCase.Status = '1-Client Setup Call';
                            websiteCase.SEO_Product__c = oli.ProductName__c;
                            websiteCase.Subject = 'NCS - ' + oli.ProductName__c;
                            websiteCase.Opportunityname__c= oli.OpportunityId;
                                                                    
                            // add Case to Insert List
                            dmlCases.add(websiteCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Opportunity Line Item data Local SEO SAB Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Local SEO' AND
                            ProductCode = 'WBN_LCL_SEO_200' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            System.Debug('*** Creating Local SEO SAB Case');
                                
                            // Create NCS Case
                            Case seoSABCase = new Case();
                            seoSABCase.RecordTypeId = caseRecordTypeId;
                            seoSABCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoSABCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            seoSABCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            seoSABCase.BusinessHoursId = businessHrsId;
                            seoSABCase.Origin = 'New Client';
                            seoSABCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoSABCase.Channel_Type__c = 'National';
                            seoSABCase.Budget__c = 0.00;
                            seoSABCase.Status = '1-Client Setup Call';
                            seoSABCase.SEO_Product__c = oli.ProductName__c;
                            seoSABCase.Subject = 'NCS - ' + oli.ProductName__c;
                            seoSABCase.Opportunityname__c= oli.OpportunityId;
                                                                    
                            // add Case to Insert List
                            dmlCases.add(seoSABCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Opportunity Line Item data Local SEO Pro Stationary Biz Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Local SEO' AND
                            ProductCode = 'WBN_LCL_SEO_301' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            System.Debug('*** Creating Local SEO Pro Stationary Biz Case');
                                
                            // Create NCS Case
                            Case seoProStationaryBizCase = new Case();
                            seoProStationaryBizCase.RecordTypeId = caseRecordTypeId;
                            seoProStationaryBizCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoProStationaryBizCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            seoProStationaryBizCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            seoProStationaryBizCase.BusinessHoursId = businessHrsId;
                            seoProStationaryBizCase.Origin = 'New Client';
                            seoProStationaryBizCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoProStationaryBizCase.Channel_Type__c = 'National';
                            seoProStationaryBizCase.Budget__c = 0.00;
                            seoProStationaryBizCase.Status = '1-Client Setup Call';
                            seoProStationaryBizCase.SEO_Product__c = oli.ProductName__c;
                            seoProStationaryBizCase.Subject = 'NCS - ' + oli.ProductName__c;
                            seoProStationaryBizCase.Opportunityname__c= oli.OpportunityId;
                                                                    
                            // add Case to Insert List
                            dmlCases.add(seoProStationaryBizCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Opportunity Line Item data Local SEO Pro SAB Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Local SEO' AND
                            ProductCode = 'WBN_LCL_SEO_300' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            System.Debug('*** Creating Local SEO Pro SAB Case');
                                
                            // Create NCS Case
                            Case seoProSABCase = new Case();
                            seoProSABCase.RecordTypeId = caseRecordTypeId;
                            seoProSABCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoProSABCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            seoProSABCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            seoProSABCase.BusinessHoursId = businessHrsId;
                            seoProSABCase.Origin = 'New Client';
                            seoProSABCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoProSABCase.Channel_Type__c = 'National';
                            seoProSABCase.Budget__c = 0.00;
                            seoProSABCase.Status = '1-Client Setup Call';
                            seoProSABCase.SEO_Product__c = oli.ProductName__c;
                            seoProSABCase.Subject = 'NCS - ' + oli.ProductName__c;
                            seoProSABCase.Opportunityname__c= oli.OpportunityId;
                                                                    
                            // add Case to Insert List
                            dmlCases.add(seoProSABCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Opportunity Line Item data Local SEO Master Stationary Biz Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Local SEO' AND
                            ProductCode = 'WBN_LCL_SEO_401' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            System.Debug('*** Creating Local SEO Master Stationary Biz Case');
                                
                            // Create NCS Case
                            Case seoMasterStationaryBizCase = new Case();
                            seoMasterStationaryBizCase.RecordTypeId = caseRecordTypeId;
                            seoMasterStationaryBizCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoMasterStationaryBizCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            seoMasterStationaryBizCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            seoMasterStationaryBizCase.BusinessHoursId = businessHrsId;
                            seoMasterStationaryBizCase.Origin = 'New Client';
                            seoMasterStationaryBizCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoMasterStationaryBizCase.Channel_Type__c = 'National';
                            seoMasterStationaryBizCase.Budget__c = 0.00;
                            seoMasterStationaryBizCase.Status = '1-Client Setup Call';
                            seoMasterStationaryBizCase.SEO_Product__c = oli.ProductName__c;
                            seoMasterStationaryBizCase.Subject = 'NCS - ' + oli.ProductName__c;
                            seoMasterStationaryBizCase.Opportunityname__c= oli.OpportunityId;
                                                                    
                            // add Case to Insert List
                            dmlCases.add(seoMasterStationaryBizCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Opportunity Line Item data Local SEO Master SAB Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Local SEO' AND
                            ProductCode = 'WBN_LCL_SEO_400' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            System.Debug('*** Creating Local SEO Master SAB Case');
                                
                            // Create NCS Case
                            Case seoMasterSABCase = new Case();
                            seoMasterSABCase.RecordTypeId = caseRecordTypeId;
                            seoMasterSABCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoMasterSABCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            seoMasterSABCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            seoMasterSABCase.BusinessHoursId = businessHrsId;
                            seoMasterSABCase.Origin = 'New Client';
                            seoMasterSABCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoMasterSABCase.Channel_Type__c = 'National';
                            seoMasterSABCase.Budget__c = 0.00;
                            seoMasterSABCase.Status = '1-Client Setup Call';
                            seoMasterSABCase.SEO_Product__c = oli.ProductName__c;
                            seoMasterSABCase.Subject = 'NCS - ' + oli.ProductName__c;
                            seoMasterSABCase.Opportunityname__c= oli.OpportunityId;
                                                                    
                            // add Case to Insert List
                            dmlCases.add(seoMasterSABCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Opportunity Line Item data Local SEO Upgrade Only
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
                            ProductCode,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Family = 'Local SEO' AND
                            ProductCode = 'WBN_LCL_SEO_100' AND
                            Product2.Create_NCS_Case__c = true]){
        
                    if(oli.Id != null){
                    
                        if(oli.Product2.Create_NCS_Case__c == true && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                                                    
                            System.Debug('*** Creating Local SEO Upgrade Case');
                                
                            // Create NCS Case
                            Case seoUpgradeCase = new Case();
                            seoUpgradeCase.RecordTypeId = caseRecordTypeId;
                            seoUpgradeCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoUpgradeCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            seoUpgradeCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            seoUpgradeCase.BusinessHoursId = businessHrsId;
                            seoUpgradeCase.Origin = 'New Client';
                            seoUpgradeCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            seoUpgradeCase.Channel_Type__c = 'National';
                            seoUpgradeCase.Budget__c = 0.00;
                            seoUpgradeCase.Status = '1-Client Setup Call';
                            seoUpgradeCase.SEO_Product__c = oli.ProductName__c;
                            seoUpgradeCase.Subject = 'NCS - ' + oli.ProductName__c;
                            seoUpgradeCase.Opportunityname__c= oli.OpportunityId;
                                                                    
                            // add Case to Insert List
                            dmlCases.add(seoUpgradeCase);
                        }
                        
                        if(oli.Converted_to_Asset__c == false){
                        
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
                }
                
                // Get any other products and add Assets to Account
                for(OpportunityLineItem olia : 
                    [SELECT Id, 
                            OpportunityId,
                            Quantity, 
                            UnitPrice, 
                            ProductName__c, 
                            Description, 
                            Product2Id,
                            Product2.Family,
                            Product2.Create_NCS_Case__c,
                            Converted_to_Asset__c
                       FROM OpportunityLineItem 
                      WHERE OpportunityId IN :oppsMap.keySet() AND
                            Product2.Create_NCS_Case__c = false AND
                            Converted_to_Asset__c = false]){
                          
                    if(olia.Id != null){
                        
                        Asset a = new Asset();
                        a.AccountId = oppsMap.get(olia.OpportunityId).AccountId;
                        a.Product2Id = olia.Product2Id;
                        a.Quantity = olia.Quantity;
                        a.Price =  olia.UnitPrice;
                        a.PurchaseDate = oppsMap.get(olia.OpportunityId).CloseDate;
                        a.Status = 'Purchased';
                        a.Description = olia.Description;
                        a.Name = olia.ProductName__c;
                                        
                        // add new Asset to list
                        dmlAssets.add(a);
                        olia.Converted_to_Asset__c = true;
                        assetProds.add(olia);
                    }     
                }
                
                // Define Hybrid Case Products
                Integer numHybridProds = 
                    [SELECT COUNT() 
                            FROM OpportunityLineItem
                           WHERE OpportunityId IN :oppsMap.keySet() AND
                                 Product2.Family IN ('Pay per Click', 'Foundations') AND
                                 Product2.Create_NCS_Case__c = true];
                                 
                System.Debug('(combo) numHybridProds result: ' + string.valueOf(numHybridProds));
                
                if(oppLinesMap.size() > 0){
                
                    System.Debug('Number of Products: ' + String.valueOf(oppLinesMap.size()));
                
                    // Prepare Non-Facebook Cases to insert
                    for(OpportunityLineItem oli : oppLinesMap.values()){
                    
                        // Pay per Click and Foundations Product Family on same Opp
                        if(numHybridProds > 1 && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                        
                            System.Debug('Creating Hybrid Case');
                            
                            // Create NCS Case
                            Case fppcCase = new Case();
                            fppcCase.RecordTypeId = caseRecordTypeId;
                            fppcCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                            fppcCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                            fppcCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                            fppcCase.BusinessHoursId = businessHrsId;
                            fppcCase.Origin = 'New Client';
                            fppcCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                            fppcCase.Channel_Type__c = 'National';
                            fppcCase.Budget__c = ppcBudget;
                            fppcCase.Status = '1-Client Setup Call';
                            fppcCase.SEO_Product__c = 'Yodle Ads + YBN Foundations';
                            fppcCase.Subject = 'NCS - Yodle Ads + YBN Foundations';
                            fppcCase.Opportunityname__c= oli.OpportunityId;
                                        
                            // add Case to Insert List
                            dmlCases.add(fppcCase);
                        }
                        else{
                            // Foundations Only Product Family
                            if(oli.Product2.Family == 'Foundations' && oli.Product2.Create_NCS_Case__c == true && oppsMap.get(oli.OpportunityId).Id == oli.OpportunityId && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                            
                                System.Debug('Creating Foundations Case');
                                
                                // Create NCS Case
                                Case fndCase = new Case();
                                fndCase.RecordTypeId = caseRecordTypeId;
                                fndCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                                fndCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                                fndCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                                fndCase.BusinessHoursId = businessHrsId;
                                fndCase.Origin = 'New Client';
                                fndCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                                fndCase.Channel_Type__c = 'National';
                                fndCase.Budget__c = 0.00;
                                fndCase.Status = '1-Client Setup Call';
                                fndCase.SEO_Product__c = 'YBN Foundations';
                                fndCase.Subject = 'NCS - YBN Foundations';
                                fndCase.Opportunityname__c= oli.OpportunityId;
                                        
                                // add Case to Insert List
                                dmlCases.add(fndCase);
                            }
                            // Pay per Click Only Product Family Product
                            if(oli.Product2.Family == 'Pay per Click' && oli.Product2.Create_NCS_Case__c == true && oppsMap.get(oli.OpportunityId).Id == oli.OpportunityId && (ownerMap.get(oli.Opportunity.OwnerId).ProfileId == ncseProfileId || ownerMap.get(oli.Opportunity.OwnerId).ProfileId == adminProfileId)){
                            
                                System.Debug('Creating PPC Case');
                                        
                                // Create NCS Case
                                Case ppcCase = new Case();
                                ppcCase.RecordTypeId = caseRecordTypeId;
                                ppcCase.OwnerId = oppsMap.get(oli.OpportunityId).OwnerId;
                                ppcCase.AccountId = oppsMap.get(oli.OpportunityId).AccountId;
                                ppcCase.Franchise_Name__c = (oppsMap.get(oli.OpportunityId).Account.Parent.Name != null ? oppsMap.get(oli.OpportunityId).Account.Parent.Name : oppsMap.get(oli.OpportunityId).Account.Name);
                                ppcCase.BusinessHoursId = businessHrsId;
                                ppcCase.Origin = 'New Client';
                                ppcCase.Sales_Person__c = oppsMap.get(oli.OpportunityId).OwnerId;
                                ppcCase.Channel_Type__c = 'National';
                                ppcCase.Budget__c = ppcBudget;
                                ppcCase.Status = '1-Client Setup Call';
                                ppcCase.SEO_Product__c = 'Yodle Ads';
                                ppcCase.Subject = 'NCS - Yodle Ads';
                                ppcCase.Opportunityname__c= oli.OpportunityId;
                                        
                                // add Case to Insert List
                                dmlCases.add(ppcCase);
                            }
                        }
                    }
                }
                
                // INSERT ASSETS
                if(dmlAssets.size() > 0){
                    System.Debug('Inserting Assets for Account');
                    
                    // perform DML Operation to insert Assets
                    insert dmlAssets;
                    
                    //update Line Item as Converted to Asset
                    update assetProds;
                }
                
                //INSERT CASES
                if(dmlCases.size() > 0){
                    System.Debug('Inserting Cases');
                    
                    
                    // perform DML Operation to insert Cases
                    insert dmlCases;
                }
            }
        }
    }
}