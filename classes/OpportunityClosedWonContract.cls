/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 20-Oct-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 20-Oct-2017
  Description ........: Apex invocable method which creates Contracts and Contract Lines when
  an Opportunity is Closed Won.
*****************************************************************************/

public class OpportunityClosedWonContract
{
    @InvocableMethod
    public static void wbnClosedWonContracts(List<Id> oppIds)
    {
        if(oppIds.size() > 0){
         
            Id contractRecordTypeId = Schema.SObjectType.Contract.getRecordTypeInfosByName().get('Service Agreement').getRecordTypeId();
            Id oppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('YBN - Individual Location').getRecordTypeId();
            Map<Id, Opportunity> oppsMap = new Map<Id, Opportunity>();
            Map<Id, OpportunityLineItem> oppLinesMap = new Map<Id, OpportunityLineItem>();
            Map<Id, Integer> maxQuantityMap = new Map<Id, Integer>();
            Map<Id, Contract> newContractsMap = new Map<Id, Contract>();
            List<echosign_dev1__SIGN_Agreement__c> dmlAgreements = new List<echosign_dev1__SIGN_Agreement__c>();
            List<Contract> dmlContracts = new List<Contract>();
            List<ContractLineItem__c> dmlContractLines = new List<ContractLineItem__c>();
            Date todayDt = Date.today();
        
            // Opportunity Data
            for(Opportunity o : 
                [SELECT Id,
                        AccountId,
                        Account.Name,
                        Account.Parent.Name,
                        Account.Client_Id__c,
                        Name,
                        StageName,
                        OwnerId,
                        Owner.Name,
                        IsWon,
                        RecordTypeId,
                        CloseDate,
                        Amount,
                        Contract_Auto_Created__c,
                        Opportunity_Detail__c,
                        YBN_Sub_Type__c
                   FROM Opportunity
                  WHERE IsWon = true AND
                        Id in: oppIds AND
                        RecordTypeId = :oppRecordTypeId AND
                        Contract_Auto_Created__c = false]){
                        
                // add Opportunity to Map
                oppsMap.put(o.Id, o);
            }
            
            if(oppsMap.size() > 0){
            
                // Opportunity Line Items
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
        
                    // add Line Items to Map
                    oppLinesMap.put(oli.OpportunityId, oli);   
                }
            
                if(oppLinesMap.size() > 0){
                
                    // get max Quantity from Line Items for Opportunties
                    for(AggregateResult mq :
                        [SELECT OpportunityId,
                                MAX(Quantity) mQuantity
                           FROM OpportunityLineItem
                          WHERE OpportunityId IN :oppsMap.keySet()
                       GROUP BY OpportunityId]){
                    
                        // add aggregate results to Map
                        maxQuantityMap.put((Id) mq.get('OpportunityId'), Integer.valueOf(mq.get('mQuantity')));
                    }
                    
                    // loop through Opportunities and create New Contract
                    for(Opportunity o : oppsMap.values()){
                    
                        Contract nc = new Contract();
                        nc.Name = o.Name + ' ' + o.CloseDate.format();
                        nc.AccountId = o.AccountId;
                        nc.RecordTypeId = contractRecordTypeId;
                        nc.Opportunity__c = o.Id;
                        nc.StartDate = o.CloseDate;
                        nc.ContractTerm = (maxQuantityMap.get(o.Id) > 1 ? maxQuantityMap.get(o.Id) : Integer.valueOf('1'));
                        nc.Renewal_Term__c = (maxQuantityMap.get(o.Id) > 1 ? String.valueOf(maxQuantityMap.get(o.Id)) : '1');
                        nc.Description = o.Account.Name + ' | ' + o.Opportunity_Detail__c + ' - ' + o.YBN_Sub_Type__c + ' | $' + String.valueOf(o.Amount);
                        nc.Auto_Renewal__c = 'Yes';
                        nc.Contract_Oppty__c = true;
                        nc.OwnerId = o.OwnerId;
                        nc.Status = 'Draft';
                        
                        // add new Contract to Insert list
                        dmlContracts.add(nc);
                        
                        o.Contract_Auto_Created__c = true;
                    }
                    
                    if(dmlContracts.size() > 0){
                    
                        // INSERT CONTRACTS
                        insert dmlContracts;
                        
                        // Update Opportunity Contract Auto Created
                        update oppsMap.values();
                    
                        for(Contract nc :
                            [SELECT Id,
                                    ContractNumber,
                                    AccountId,
                                    Opportunity__c,
                                    Status,
                                    StartDate,
                                    EndDate
                               FROM Contract
                              WHERE Opportunity__c in: oppsMap.keySet()]){
                            
                            nc.Status = 'Activated';
                            
                            // add to New Contracts Map to add to associate Contract Lines
                            newContractsMap.put(nc.Opportunity__c, nc);
                        }
                        
                        // Create Contract Lines
                        for(OpportunityLineItem olic : 
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
                        
                            if(olic.OpportunityId == newContractsMap.get(olic.OpportunityId).Opportunity__c){
                            
                                ContractLineItem__c cli = new ContractLineItem__c();
                                cli.Contract__c = newContractsMap.get(olic.OpportunityId).Id;
                                cli.LineDescription__c = olic.ProductName__c;
                                cli.Opportunity__c = olic.OpportunityId;
                                cli.Product2__c = olic.Product2Id;
                                cli.Quantity__c = olic.Quantity;
                                cli.Total_Price__c = olic.Quantity * olic.UnitPrice;
                                cli.Start_Date__c = newContractsMap.get(olic.OpportunityId).StartDate;
                                cli.End_Date__c = newContractsMap.get(olic.OpportunityId).EndDate;
                                cli.Status__c = (newContractsMap.get(olic.OpportunityId).EndDate > todayDt ? 'Active' : 'Inactive');
                                    
                                // add Contract Line to insert list
                                dmlContractLines.add(cli);
                            }
                        }
                        
                        if(dmlContractLines.size() > 0){
                        
                            // INSERT CONTRACT LINES
                            insert dmlContractLines;
                                
                            // UPDATE CONTRACT STATUS
                            update newContractsMap.values();
                            
                            // Associate newly created Contracts with any related Agreements
                            for(echosign_dev1__SIGN_Agreement__c ag :
                            [SELECT Id, 
                                    Name, 
                                    echosign_dev1__Account__c, 
                                    echosign_dev1__Opportunity__c,
                                    echosign_dev1__Contract__c
                               FROM echosign_dev1__SIGN_Agreement__c
                              WHERE echosign_dev1__Opportunity__c IN :oppsMap.keySet()]){
                            
                                if(ag.echosign_dev1__Opportunity__c != null && ag.echosign_dev1__Contract__c == null && newContractsMap.get(ag.echosign_dev1__Opportunity__c).Opportunity__c == ag.echosign_dev1__Opportunity__c){
                                    
                                    ag.echosign_dev1__Contract__c = newContractsMap.get(ag.echosign_dev1__Opportunity__c).Id;
                                    
                                    // Add to Agreement update list
                                    dmlAgreements.add(ag);
                                }
                            }
                            
                            if(dmlAgreements.size() > 0){
                            
                                // UPDATE AGREEMENT/ ASSOCIATE TO CONTRACT
                                update dmlAgreements;
                            }
                        }
                    }
                }
            } 
        } 
    }
}