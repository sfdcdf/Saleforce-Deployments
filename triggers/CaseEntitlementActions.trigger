/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 01-May-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 01-May-2018
  Description ........: trigger to Add Entitlement to Case based on business criteria 
  and logic when met. Also, Closes Milestone if Case is being Closed
*****************************************************************************/
trigger CaseEntitlementActions on Case (Before Insert, Before Update, After Insert, After Update) {

    Map<String, EntitlementSetting__mdt> entSettingsMap = new Map<String, EntitlementSetting__mdt>();
    List<CaseMilestone> dmlCaseMilestones = new List<CaseMilestone>();
    List<CaseMilestoneSync__c> dmlMilestoneSync = new List<CaseMilestoneSync__c>();
    Id ybnInqRecTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Inbound Inquiry').getRecordTypeId();
    Set<Id> acctIds = new Set<Id>();
    Set<Id> caseIds = new Set<Id>();
    
    for(Case c : Trigger.new){
        
        // Add Entitlement to Case validation check
        if(c.AccountId != null && c.RecordType.Name != null && c.IsClosed == false && c.EntitlementId == null){
            acctIds.add(c.AccountId);
        }
        
        // Case Close/ End Entitlement Process validation check
        if(c.IsClosed == true && c.EntitlementId != null && c.Status != 'Resolved in Another Case' && c.Status != 'Delete Case' && c.SlaExitDate == null){
            
            if(Trigger.IsBefore){
                c.ApexCaseUpdate__c = System.Now();
            }
            
            caseIds.add(c.Id);
        }
    }
    
    // Add Entitlement to Case
    if(acctIds.size() > 0){
        // populate Entitlement settings Map
        for(EntitlementSetting__mdt es :
            [SELECT DeveloperName, 
                    BusinessHourId__c, 
                    CaseRecordTypes__c 
               FROM EntitlementSetting__mdt]){
                    
            entSettingsMap.put(es.DeveloperName, es);
        }
        
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
                    EndDate >= TODAY AND 
                    StartDate <= TODAY];
                    
        if(ents.size() > 0){
                    
            System.Debug('*** Entitlements number of rows: ' + String.valueOf(ents.size()));
            
            for(Case cs : Trigger.new){
            
                if(!String.IsEmpty(cs.AccountId) && String.IsEmpty(cs.EntitlementId)){
                
                    for(Entitlement e : ents){
                                
                        if(cs.AccountId == e.AccountId){
                                    
                            // YBN
                            if(entSettingsMap.get('YBN').CaseRecordTypes__c.contains(cs.RecordType.Name)){
                                        
                                System.Debug('*** Entered YBN');
                                System.Debug('*** Record Type: ' + cs.RecordType.Name);
                                System.Debug('*** Work Item SLA: ' + String.valueOf(cs.WorkitemSLA__c));
                                        
                                if(cs.RecordTypeId == ybnInqRecTypeId && e.Type__c == 'YBNStd'){
                                    cs.EntitlementId = e.Id;
                                                
                                    System.Debug('*** Entitlement Type: ' + e.Type__c);
                                    break;
                                }
                                else{
                                            
                                    if(cs.RecordTypeId != ybnInqRecTypeId && Integer.valueOf(cs.WorkitemSLA__c) == 0 && e.Type__c == 'YBNStd'){
                                                
                                        cs.EntitlementId = e.Id;
                                                    
                                        System.Debug('*** Entitlement Type: ' + e.Type__c);
                                        break;
                                                
                                    }
                                    if(cs.RecordTypeId != ybnInqRecTypeId && Integer.valueOf(cs.WorkitemSLA__c) > 0 && e.Type__c == 'YBNCus'){
                                                
                                        cs.EntitlementId = e.Id;
                                                    
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
                                                
                                    System.Debug('*** Entitlement Type: ' + e.Type__c);
                                    break;
                                }
                            }
                       }
                   }
               }
          }
       }
    }
    
    // End Milestone Process
    if(caseIds.size() > 0){
    
        System.Debug('*** Entering Case Closed/ End Entitlement Process');
        
        for(CaseMilestone cm :
            [SELECT Id, 
                    CaseId, 
                    IsCompleted, 
                    ElapsedTimeInMins, 
                    ElapsedTimeInHrs,
                    ElapsedTimeInDays,
                    TargetDate,
                    StartDate,
                    CompletionDate, 
                    MilestoneType.Id,
                    MilestoneType.Name,
                    BusinessHoursId
               FROM CaseMilestone 
              WHERE CaseId IN :caseIds AND 
                    CompletionDate = NULL AND
                    MilestoneType.Name LIKE '%Resolution%' AND
                    IsCompleted = false]){
                    
            if(cm.Id != null){
                
                System.Debug('*** Closed Process and added Sync record');
                           
                // Add updated Milestones to Sync table
                CaseMilestoneSync__c newMilestoneSync = new CaseMilestoneSync__c();
                newMilestoneSync.Name = cm.MilestoneType.Name;
                newMilestoneSync.BusinessHours__c = cm.BusinessHoursId;
                newMilestoneSync.Case__c = cm.CaseId;
                newMilestoneSync.StartDate__c = cm.StartDate;
                newMilestoneSync.CompletionDate__c = cm.CompletionDate;
                newMilestoneSync.TargetDate__c = cm.TargetDate;
                newMilestoneSync.MilestoneTypeId__c = cm.MilestoneType.Id;
                newMilestoneSync.ElapsedTimeInMins__c = cm.ElapsedTimeInMins;
                newMilestoneSync.ElapsedTimeInHrs__c = cm.ElapsedTimeInHrs;
                newMilestoneSync.ElapsedTimeInDays__c = cm.ElapsedTimeInDays;
                dmlMilestoneSync.add(newMilestoneSync);
            }
        }
        
        // insert Milestone Sync record 
        if(dmlMilestoneSync.size() > 0){
            insert dmlMilestoneSync;
        }
    }
}