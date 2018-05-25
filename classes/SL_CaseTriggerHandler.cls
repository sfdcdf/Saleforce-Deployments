/**  
* \arg ClassName        : SL_CaseTriggerHandler
* \arg JIRATicket       : YODLET-1
* \arg CreatedOn        : 07/29/2015
* \arg LastModifiedOn   : 07/29/2015
* \arg CreatededBy      : Sathya
* \arg ModifiedBy       : 
* \arg Description      : Handler class for Case object.
*/
global class SL_CaseTriggerHandler extends SL_TriggerHandlerBase {
    public static Boolean runBeforeUpdate = true;
    public static Boolean runAfterUpdate = true;
    
    private static Map<String, Id> mapCaseRTs = new Map<String, Id>();
    
    public Map<String, Id> getCaseRecordTypes(){
        if(mapCaseRTs.size()<1){
            for(RecordType rt: [SELECT Id, Name FROM RecordType WHERE sObjectType = 'Case']){
                mapCaseRTs.put(rt.Name, rt.Id);
            }
        }
        return mapCaseRTs;
    }

    public override void beforeInsert(List<SObject> newListGeneric){
        List<Case> newList = (List<Case>) newListGeneric;
        /*BEFORE INSERT METHODS START*/
        //collectUpdatedCaseRecs(newList);
        AddEntitlementsToCase(newList, null);
        /*BEFORE INSERT METHODS END*/
    }
    
    public override void beforeUpdate(Map<Id, SObject> oldMapGeneric, Map<Id, SObject> newMapGeneric){
        Map<Id, Case> oldMap = (Map<Id, Case>) oldMapGeneric;
        Map<Id, Case> newMap = (Map<Id, Case>) newMapGeneric;
        /*BEFORE UPDATE METHODS START*/
        system.debug('$$$ before update');
        //collectUpdatedCaseRecs(newMap.values());
        
        if(runBeforeUpdate){
            runBeforeUpdate = false;
            updateCaseMilestones(newMap, oldMap);
            AddEntitlementsToCase(newMap.values(), oldMap);
        }
        /*BEFORE UPDATE METHODS END*/
    }
    
    public override void beforeDelete(Map<Id, SObject> oldMapGeneric){
        Map<Id, Case> oldMap = (Map<Id, Case>) oldMapGeneric;
        /*BEFORE DELETE METHODS START*/
        //collectUpdatedCaseRecs(oldMap.values());
        
        /*BEFORE DELETE METHODS END*/
    }
    
    public override void afterInsert(Map<Id, SObject> newMapGeneric){
        Map<Id, Case> newMap = (Map<Id, Case>) newMapGeneric;
        /*AFTER INSERT METHODS START*/
        collectUpdatedCaseRecs(newMap.values(), null);
        /*AFTER INSERT METHODS END*/
    }
    
    public override void afterUpdate(Map<Id, SObject> oldMapGeneric, Map<Id, SObject> newMapGeneric){
        Map<Id, Case> oldMap = (Map<Id, Case>) oldMapGeneric;
        Map<Id, Case> newMap = (Map<Id, Case>) newMapGeneric;
        /*AFTER UPDATE METHODS START*/
        collectUpdatedCaseRecs(newMap.values(), oldMap);
        
        if(runAfterUpdate){
            runAfterUpdate = false;
            updateCaseMilestones(newMap, oldMap);
        }
        /*AFTER UPDATE METHODS END*/
    }
    
    public override void afterDelete(Map<Id, SObject> oldMapGeneric){
        Map<Id, Case> oldMap = (Map<Id, Case>) oldMapGeneric;
        /*AFTER DELETE METHODS START*/
        collectUpdatedCaseRecs(oldMap.values(), null);
        
        /*AFTER DELETE METHODS END*/
    }
    
    public override void afterUndelete(Map<Id, SObject> newMapGeneric){
        Map<Id, Case> newMap = (Map<Id, Case>) newMapGeneric;
        /*AFTER UNDELETE METHODS START*/
        
        /*AFTER UNDELETE METHODS END*/
    }
    

    private void collectUpdatedCaseRecs(List<Case> lstNewCases, Map<Id, Case> mapOldCases) {
        Set<Id> casesToProcess = new Set<Id>();
        // Itrating over new Case records for filtering, whose status contains 'Closed', then collecting their Parent Case Ids
        for(Case c : lstNewCases){
          if(c.ParentId != null && c.Status.contains('Closed') && (mapOldCases==null || !mapOldCases.get(c.Id).Status.contains('Closed')))
            casesToProcess.add(c.ParentId);
        }

        // Calling this method to update the Parent Case's Status
        SL_CaseHandler.closeOut(casesToProcess);
    }
    
    /***
    Name: updateCaseMilestones
    Created: Ron Gong, 3/20/2016
    Description: Complete related CaseMilestones
    Updated: Ron Gong, 6/28/2016 - Reduced trigger to only case close.  Responses completion moved to separate
             EmailMessage and Task trigger.
    ***/
    private void updateCaseMilestones(Map<Id, Case> mapNewCases, Map<Id, Case> mapOldCases){
        String strResponse = CaseMilestoneUtils.strResponse;
        String strResolution = CaseMilestoneUtils.strResolution;    
        DateTime completionDate = system.now();    
        Map<Id, Set<String>> mapCaseId_msName = new Map<Id, Set<String>>();
    
        for(Case c: mapNewCases.values()){
            if((c.Status=='Closed' || (c.IsClosed==true && c.status!='Resolved in Another Case')) && c.SlaStartDate <= completionDate && c.SlaExitDate==null){
                if(Trigger.isBefore)  c.ApexCaseUpdate__c = system.now();    // Used in validation rule to prevent manual MS completion               
                else  mapCaseId_msName.put(c.Id, new Set<String>{strResolution});               
            }        
        }
        system.debug('$$$ mapCaseId_msName: ' + mapCaseId_msName);
        if(mapCaseId_msName.size()>0){
            CaseMilestoneUtils.CompleteMilestones(mapCaseId_msName, completionDate);
        }
    }
    
    /***
    Name: AddEntitlementsToCase
    Created: Ron Gong, 7/20/2016
    Description: Add Entitlements to a case
    Execute: Before Insert, Before Update
    ***/
    private void AddEntitlementsToCase(List<Case> lstNewCases, Map<Id, Case> mapOldCases){  
        system.debug('$$$ Enter AddEntitlementToCase');
        Id rtRequest = Utilities.GetRecTypeId('Case', 'YBN Request');      
        String strLocal = 'Local';
        String strYbn = 'YBN';
        String strYbnStd = 'YBNStd';
        String strYbnCus = 'YBNCus';
        String strPartner = 'Partner';
        Set<Id> setAccIds = new Set<Id>();    // Contains Relevant Case Account Id's             
        Set<Id> setYbnTypeIds = new Set<Id>();    // Contains YBN related case record type ids
        Set<Id> setLocTypeIds = new Set<Id>();    // Contains Local related case record type ids
        Set<Id> setParTypeIds = new Set<Id>();    // Contains Partner related case record type ids
        Set<String> setYbnTypes = new Set<String>();    // Contains YBN record type names, retrieved from settings
        Set<String> setLocTypes = new Set<String>();    // Contains Local record type names, retrieved from settings
        Set<String> setParTypes = new Set<String>();    // Contains Partner record type names, retrieved from settings
        Set<Id> setMissingCaseIds = new Set<Id>();    // Used to hold cases that do not have entitlements
        mapCaseRTs = getCaseRecordTypes();    // Contains all case record type ids
        
        List<EntitlementSetting__mdt> lstEntSettings = [SELECT DeveloperName, BusinessHourId__c, CaseRecordTypes__c FROM EntitlementSetting__mdt];
        for(EntitlementSetting__mdt es: lstEntSettings){
            if(es.DeveloperName == strLocal)  setLocTypes.addAll(es.CaseRecordTypes__c.split(','));
            else if(es.DeveloperName == strYbn)  setYbnTypes.addAll(es.CaseRecordTypes__c.split(','));
            else if(es.DeveloperName == strPartner)  setParTypes.addAll(es.CaseRecordTypes__c.split(','));   
        }
        system.debug('$$$ lstEntSettings: ' + lstEntSettings);
               
        for(String rt: mapCaseRTs.keySet()){
            if(setYbnTypes.contains(rt))  setYbnTypeIds.add(mapCaseRTs.get(rt));
            else if(setLocTypes.contains(rt))  setLocTypeIds.add(mapCaseRTs.get(rt));
            else if(setParTypes.contains(rt))  setParTypeIds.add(mapCaseRTs.get(rt));
        }
        system.debug('$$$ mapCaseRTs: ' + mapCaseRTs);  
        
        for(Case c: lstNewCases){
            if(((setYbnTypeIds.contains(c.RecordTypeId) || setLocTypeIds.contains(c.RecordTypeId) || setParTypeIds.contains(c.RecordTypeId)) 
                && c.AccountId != null && c.EntitlementId == null) 
                || (c.RecordTypeId == rtRequest && mapOldCases.get(c.Id) != null && c.WorkItemSLA__c != mapOldCases.get(c.Id).WorkItemSLA__c))
            {
                setAccIds.add(c.AccountId);
            }
        }
        system.debug('$$$ setAccIds: ' + setAccIds);
        
        if(setAccIds.size()>0){
            Map<Id, Map<String, Entitlement>> mapAcc_Ents = new Map<Id, Map<String, Entitlement>>();
            
            for(Entitlement ent: [SELECT Id, Name, AccountId, Type__c FROM Entitlement WHERE AccountId IN :setAccIds]){                                
                if(mapAcc_Ents.get(ent.AccountId)==null){
                    Map<String, Entitlement> mapTemp = new Map<String, Entitlement>{ent.Type__c=>ent};                   
                    mapAcc_Ents.put(ent.AccountId, mapTemp);
                } else {
                    mapAcc_Ents.get(ent.AccountId).put(ent.Type__c, ent);
                }
            }
            system.debug('$$$ mapAcc_Ents: ' + mapAcc_Ents);
            for(Case c: lstNewCases){
                if(setAccIds.contains(c.AccountId)) {
                    if(c.EntitlementId==null) {
                        if(mapAcc_Ents.get(c.AccountId)!=null){    // Has entitlements
                            if(setLocTypeIds.contains(c.RecordTypeId) && mapAcc_Ents.get(c.AccountId).get(strLocal)!=null){
                                c.EntitlementId = mapAcc_Ents.get(c.AccountId).get(strLocal).Id;
                            } else if(setParTypeIds.contains(c.RecordTypeId) && mapAcc_Ents.get(c.AccountId).get(strPartner)!=null){
                                c.EntitlementId = mapAcc_Ents.get(c.AccountId).get(strPartner).Id;
                            } else if(setYbnTypeIds.contains(c.RecordTypeId) && c.WorkitemSLA__c > 0 && mapAcc_Ents.get(c.AccountId).get(strYbnCus)!=null){
                                c.EntitlementId = mapAcc_Ents.get(c.AccountId).get(strYbnCus).Id;
                            } else if(setYbnTypeIds.contains(c.RecordTypeId) && c.WorkitemSLA__c == 0 && mapAcc_Ents.get(c.AccountId).get(strYbnStd)!=null){
                                c.EntitlementId = mapAcc_Ents.get(c.AccountId).get(strYbnStd).Id;
                            } else{
                                setMissingCaseIds.add(c.Id);    // Correct entitlement not available
                            }    
                        } else {    // No entitlements for this account
                            setMissingCaseIds.add(c.Id);
                        }
                    } else if(c.RecordTypeId == rtRequest && c.WorkitemSLA__c == 0 && mapOldCases.get(c.Id).WorkitemSLA__c > 0){    // Custom SLA going to a Standard SLA
                        if(mapAcc_Ents.get(c.AccountId).get(strYbnStd)!=null)  c.EntitlementId = mapAcc_Ents.get(c.AccountId).get(strYbnStd).Id;
                        else  setMissingCaseIds.add(c.Id);
                    } else if(c.RecordTypeId == rtRequest && c.WorkitemSLA__c > 0 && mapOldCases.get(c.Id).WorkitemSLA__c == 0){    // Standard SLA going to a Custom SLA
                        if(mapAcc_Ents.get(c.AccountId).get(strYbnCus)!=null)  c.EntitlementId = mapAcc_Ents.get(c.AccountId).get(strYbnCus).Id;
                        else  setMissingCaseIds.add(c.Id);
                    }
                }
                system.debug('$$$ c.EntitlementId: ' + c.EntitlementId);
            }
                                                    
            if(setMissingCaseIds.size()>0){    // Process Missing Entitlements
                CreateCaseEntitlements(setMissingCaseIds);
            }
        }
        system.debug('$$$ Exit AddEntitlementToCase');
    }
    
    @future
    private static void CreateCaseEntitlements(Set<Id> setCaseIds){
        Date dtStart = system.today();
        Date dtEnd = system.today().addYears(20);
        String strLocal = 'Local';
        String strYbn = 'YBN';
        String strYbnStd = 'YBNStd';
        String strYbnCus = 'YBNCus';
        String strPartner = 'Partner';
        String strSlaLocal = 'Local Entitlement Process';
        String strSlaPartner = 'Partner SLA';
        String strSlaYbnTier1 = 'YBN Tier 1';
        String strSlaYbnTier2 = 'YBN Tier 2';
        String strSlaYbnTier3 = 'YBN Tier 3';
        String strSlaYbnCustom = 'YBN Custom SLA';
        Id rtRequest = Utilities.GetRecTypeId('Case', 'YBN Request');  
        Set<String> setTier1 = new Set<String>{'Service Level A+'};
        Set<String> setTier2 = new Set<String>{'Service Level A', 'Service Level B'};
        Set<Id> setAccIds = new Set<Id>();    // Contains Relevant Case Account Id's             
        Set<Id> setYbnTypeIds = new Set<Id>();    // Contains YBN related case record type ids
        Set<Id> setLocTypeIds = new Set<Id>();    // Contains Local related case record type ids
        Set<Id> setParTypeIds = new Set<Id>();
        Set<String> setYbnTypes = new Set<String>();    // Contains YBN record type names, retrieved from settings
        Set<String> setLocTypes = new Set<String>();    // Contains Local record type names, retrieved from settings
        Set<String> setParTypes = new Set<String>();
        Map<String, Id> mapBusHours = new Map<String, Id>();
        Map<String, Id> mapSLAs = new Map<String, Id>();
        Map<String, Entitlement> mapAccType_Ents = new Map<String, Entitlement>();    // Contains the AccId/Type and the entitlment records      
                  
        List<EntitlementSetting__mdt> lstEntSettings = [SELECT DeveloperName, BusinessHourId__c, CaseRecordTypes__c FROM EntitlementSetting__mdt];
        for(EntitlementSetting__mdt es: lstEntSettings){
            if(es.DeveloperName == strLocal){
                setLocTypes.addAll(es.CaseRecordTypes__c.split(','));
                mapBusHours.put(strLocal, es.BusinessHourId__c);
            } else if(es.DeveloperName == strYbn){
                setYbnTypes.addAll(es.CaseRecordTypes__c.split(','));
                mapBusHours.put(strYbn, es.BusinessHourId__c);
            } else if(es.DeveloperName == strPartner){
                setParTypes.addAll(es.CaseRecordTypes__c.split(','));
                mapBusHours.put(strPartner, es.BusinessHourId__c);
            }    
        }
        
        if(mapCaseRTs.size()==0){
            for(RecordType rt: [SELECT Id, Name FROM RecordType WHERE sObjectType = 'Case']){
                mapCaseRTs.put(rt.Name, rt.Id);
            }
        } 
        
        for(String rt: mapCaseRTs.keySet()){
            if(setYbnTypes.contains(rt))  setYbnTypeIds.add(mapCaseRTs.get(rt));
            else if(setLocTypes.contains(rt))  setLocTypeIds.add(mapCaseRTs.get(rt));
            else if(setParTypes.contains(rt))  setParTypeIds.add(mapCaseRTs.get(rt));
        }
        
        List<SlaProcess> lstSLAs = new List<SlaProcess>([SELECT Id, Name FROM SlaProcess WHERE isActive = true AND IsVersionDefault = true]);
        for(SlaProcess sla: lstSLAs){
            mapSLAs.put(sla.Name, sla.Id);
        }
        
        List<Case> lstCases = [SELECT Id, RecordTypeId, WorkItemSLA__c, AccountId, Account.Name, Account.Individual_Location_Service_Level__c FROM Case WHERE Id IN :setCaseIds];               
        for(Case c: lstCases){
            String strAccType = '';
            if(setLocTypeIds.contains(c.RecordTypeId))  strAccType = String.valueOf(c.AccountId) + strLocal; 
            else if(setParTypeIds.contains(c.RecordTypeId))  strAccType = String.valueOf(c.AccountId) + strPartner; 
            else if(setYbnTypeIds.contains(c.RecordTypeId) && c.WorkItemSLA__c==0)  strAccType = String.valueOf(c.AccountId) + strYbnStd; 
            else if(c.RecordTypeId==rtRequest && c.WorkItemSLA__c>0)  strAccType = String.valueOf(c.AccountId) + strYbnCus; 
            system.debug('$$$ strAccType: ' + strAccType);
            
            if(strAccType!='' && mapAccType_Ents.get(strAccType)==null){
                Id busHourId;
                Id entProcessId;
                String entType = '';
                
                if(setLocTypeIds.contains(c.RecordTypeId)){
                    busHourId = mapBusHours.get(strLocal);                   
                    entType = strLocal;
                    entProcessId = mapSLAs.get(strSlaLocal);
                } else if(setParTypeIds.contains(c.RecordTypeId)){
                    busHourId = mapBusHours.get(strPartner);                    
                    entType = strPartner;
                    entProcessId = mapSLAs.get(strSlaPartner);
                } else if(setYbnTypeIds.contains(c.RecordTypeId) && c.WorkItemSLA__c==0){
                    busHourId = mapBusHours.get(strYbn);                   
                    entType = strYbnStd;
                    
                    if(setTier1.contains(c.Account.Individual_Location_Service_Level__c))  entProcessId = mapSLAs.get(strSlaYbnTier1);
                    else if(setTier2.contains(c.Account.Individual_Location_Service_Level__c))  entProcessId = mapSLAs.get(strSlaYbnTier2);
                    else   entProcessId = mapSLAs.get(strSlaYbnTier3);
                } else if(c.RecordTypeId==rtRequest && c.WorkItemSLA__c>0){
                    busHourId = mapBusHours.get(strYbn);                   
                    entType = strYbnCus;
                    entProcessId = mapSLAs.get(strSlaYbnCustom);
                }
                
                if(busHourId!=null && entProcessId!=null && entType!=''){ 
                    String entName = entType + ' - ' + c.Account.Name;                  
                    Entitlement ent = new Entitlement(Name=entName, AccountId=c.AccountId, Type__c=entType, BusinessHoursId=busHourId, SlaProcessId=entProcessId, StartDate=dtStart, EndDate=dtEnd);                    
                    mapAccType_Ents.put(strAccType, ent);
                }
            }
        }
        
        if(mapAccType_Ents.size()>0)  insert mapAccType_Ents.values();
        system.debug('$$$ mapAccType_Ents: ' + mapAccType_Ents);
        
        List<Case> lstCasesToUpdate = new List<Case>();        
        for(Case c: lstCases){
            String strAccType = '';
            if(setLocTypeIds.contains(c.RecordTypeId))  strAccType = String.valueOf(c.AccountId) + strLocal; 
            else if(setParTypeIds.contains(c.RecordTypeId))  strAccType = String.valueOf(c.AccountId) + strPartner; 
            else if(setYbnTypeIds.contains(c.RecordTypeId) && c.WorkItemSLA__c==0)  strAccType = String.valueOf(c.AccountId) + strYbnStd; 
            else if(c.RecordTypeId==rtRequest && c.WorkItemSLA__c>0)  strAccType = String.valueOf(c.AccountId) + strYbnCus; 
            
            if(strAccType!='' && mapAccType_Ents.get(strAccType)!=null){
                c.EntitlementId = mapAccType_Ents.get(strAccType).Id;
                lstCasesToUpdate.add(c);
            }
        }
        
        if(lstCasesToUpdate.size()>0)  update lstCasesToUpdate;
    }

    private Boolean closedStatus(String s){
        Set<String> statuses = new Set<String>{'Incomplete after 2nd Attempt', 'Closed - Multi Location Owner', 'Closed - Rescheduled', 'Completed', 'Completed on Callback'};
        return statuses.contains(s);
    }
}