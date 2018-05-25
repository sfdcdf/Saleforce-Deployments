/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 15-Dec-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 03-Apr-2018
  Description ........: Class contains invocable method to Add Entitlement to Case on business criteria 
  and logic when met.
*****************************************************************************/
public without sharing class AutoCreateCaseEntitlement
{
    @InvocableMethod
    public static void CreateCaseEntitlement(List<Id> caseIds)
    {
        try{
        
            if(caseIds.size() > 0){
            
                Map<String, EntitlementSetting__mdt> entSettingsMap = new Map<String, EntitlementSetting__mdt>();
                Id ybnInqRecTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Inbound Inquiry').getRecordTypeId(); 
                List<Case> dmlCases = new List<Case>();
                Set<Id> acctIds = new Set<Id>();
                
                // populate Entitlement settings Map
                for(EntitlementSetting__mdt es :
                    [SELECT DeveloperName, 
                            BusinessHourId__c, 
                            CaseRecordTypes__c 
                       FROM EntitlementSetting__mdt]){
                
                    entSettingsMap.put(es.DeveloperName, es);
                }
                
                // populate Account Ids set from Case; no Web to Case
                for(Case c :
                    [SELECT Id,
                            AccountId
                       FROM Case
                      WHERE Id IN :caseIds]){
                
                    acctIds.add(c.AccountId);
                }
                
                if(acctIds.size() > 0){
                
                    List<Entitlement> ents = 
                        [SELECT Id,
                                Name,
                                StartDate,
                                EndDate,
                                Status,
                                Type__c,
                                AccountId
                           FROM Entitlement
                          WHERE AccountId IN :acctIds AND
                                Status = 'Active'];
                
                    if(ents.size() > 0){
                    
                        System.Debug('*** Entitlements number of rows: ' + String.valueOf(ents.size()));
                    
                        for(Case cs : 
                            [SELECT Id,
                                    AccountId,
                                    RecordTypeId,
                                    RecordType.Name,
                                    SlaStartDate,
                                    SlaExitDate,
                                    EntitlementId,
                                    BusinessHoursId,
                                    Status,
                                    IsClosed,
                                    WorkitemSLA__c
                               FROM Case
                              WHERE Id IN :caseIds AND
                                    IsClosed = false]){
                        
                            if(!String.IsEmpty(cs.AccountId) && String.IsEmpty(cs.EntitlementId) && cs.RecordTypeId != null){
                            
                                for(Entitlement e : ents){
                                
                                    if(cs.AccountId == e.AccountId){
                                    
                                        // YBN
                                        if(entSettingsMap.get('YBN').CaseRecordTypes__c.contains(cs.RecordType.Name)){
                                        
                                            System.Debug('*** Entered YBN');
                                            System.Debug('*** Record Type: ' + cs.RecordType.Name);
                                            System.Debug('*** Work Item SLA: ' + String.valueOf(cs.WorkitemSLA__c));
                                        
                                            if(cs.RecordTypeId == ybnInqRecTypeId && e.Type__c == 'YBNStd'){
                                                cs.EntitlementId = e.Id;
                                                dmlCases.add(cs);
                                                
                                                System.Debug('*** Entitlement Type: ' + e.Type__c);
                                                break;
                                            }
                                            else{
                                            
                                                if(cs.RecordTypeId != ybnInqRecTypeId && Integer.valueOf(cs.WorkitemSLA__c) == 0 && e.Type__c == 'YBNStd'){
                                                
                                                    cs.EntitlementId = e.Id;
                                                    dmlCases.add(cs);
                                                    
                                                    System.Debug('*** Entitlement Type: ' + e.Type__c);
                                                    break;
                                                
                                                }
                                                if(cs.RecordTypeId != ybnInqRecTypeId && Integer.valueOf(cs.WorkitemSLA__c) > 0 && e.Type__c == 'YBNCus'){
                                                
                                                    cs.EntitlementId = e.Id;
                                                    dmlCases.add(cs);
                                                    
                                                    System.Debug('*** Entitlement Type: ' + e.Type__c);
                                                    break;
                                                
                                                }
                                            }
                                        }
                                        // Local
                                        if(entSettingsMap.get('Local').CaseRecordTypes__c.contains(cs.RecordType.Name)){
                                            
                                            System.Debug('*** Entered Local');
                                            System.Debug('*** Record Type: ' + cs.RecordType.Name);
                                                
                                            if(e.Type__c == 'Local'){
                                                cs.EntitlementId = e.Id;
                                                dmlCases.add(cs);
                                                
                                                System.Debug('*** Entitlement Type: ' + e.Type__c);
                                                break;
                                            }
                                        }
                                        // Partner
                                        if(entSettingsMap.get('Partner').CaseRecordTypes__c.contains(cs.RecordType.Name)){
                                            
                                            System.Debug('*** Entered Partner');
                                            System.Debug('*** Record Type: ' + cs.RecordType.Name);
                                                
                                            if(e.Type__c == 'Partner'){
                                                cs.EntitlementId = e.Id;
                                                dmlCases.add(cs);
                                                
                                                System.Debug('*** Entitlement Type: ' + e.Type__c);
                                                break;
                                            }
                                        }

                                    }
                                }
                            }
                        }
                        
                        // Perform Update to Case to add proper Entitlement
                        if(dmlCases.size() > 0){
                            update dmlCases;
                        }
                    }
                }
            }
        }
        catch(Exception e){
            System.Debug('An error occurred: ' + e.getMessage());
        }
    }
}