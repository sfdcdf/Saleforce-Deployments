/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 19-Dec-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 19-Dec-2017
  Description ........: Class contains invocable method to end Case Milestone SLA Process based on resolution.
  Response SLA Closure in in Email and Task Triggers.
*****************************************************************************/
public class CompleteResolutionCaseMilestone
{
    @InvocableMethod
    public static void CompleteMilestone(List<Id> caseIds)
    {
        try{
        
            if(caseIds.size() > 0){
            
                Set<Id> caseIdSet = new Set<Id>();
                Set<Id> milestoneSyncIdSet = new Set<Id>();
                List<Case> dmlCases = new List<Case>();
                List<CaseMilestone> dmlCaseMilestones = new List<CaseMilestone>();
                List<CaseMilestoneSync__c> dmlMilestoneSync = new List<CaseMilestoneSync__c>();
                
                // get logically filtered Case data
                for(Case c : 
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
                            WorkitemSLA__c,
                            ApexCaseUpdate__c
                       FROM Case
                      WHERE Id IN :caseIds AND
                            IsClosed = true AND
                            Status != 'Resolved in Another Case' AND
                            SlaStartDate <= TODAY AND
                            SlaExitDate = NULL]){
                            
                    if(c.Id != null && c.EntitlementId != null){
                        
                        c.ApexCaseUpdate__c = System.Now(); // Used in validation rule to prevent manual MS completion    
                    
                        caseIdSet.add(c.Id);
                        dmlCases.add(c);
                    }
                }
                
                if(dmlCases.size() > 0){
                
                    // UPDATE CASE DATA
                    update dmlCases;
                }
                
                if(caseIdSet.size() > 0){
                
                    // get Case Milestones for Resolution only; no Response Time milestones
                    for(CaseMilestone cm :
                        [SELECT Id, 
                                CaseId, 
                                IsCompleted, 
                                ElapsedTimeInMins, 
                                CompletionDate, 
                                MilestoneType.Name 
                           FROM CaseMilestone 
                          WHERE CaseId IN :caseIdSet AND 
                                CompletionDate = NULL AND
                                MilestoneType.Name LIKE '%Resolution%' AND
                                IsCompleted = false]){
                    
                        if(cm.Id != null){
                            
                            // add CaseMilestone Id to Set
                            milestoneSyncIdSet.add(cm.Id);
                            cm.CompletionDate = System.Now();
                            
                            // add Milestone to update List
                            dmlCaseMilestones.add(cm);
                        }
                    }
                    
                    if(dmlCaseMilestones.size() > 0){
                    
                        // update Case Milestones
                        update dmlCaseMilestones;
                        
                        // get list of updated milestones to add to sync table
                        for(CaseMilestone cms : 
                            [SELECT Id, 
                                    CaseId, 
                                    IsCompleted, 
                                    ElapsedTimeInMins, 
                                    ElapsedTimeInHrs, 
                                    ElapsedTimeInDays,
                                    BusinessHoursId, 
                                    CompletionDate, 
                                    StartDate, 
                                    TargetDate, 
                                    MilestoneType.Id, 
                                    MilestoneType.Name 
                               FROM CaseMilestone WHERE Id IN :milestoneSyncIdSet]){
                        
                            // Add updated Milestones to Sync table
                            CaseMilestoneSync__c newMilestoneSync = new CaseMilestoneSync__c();
                            newMilestoneSync.Name = cms.MilestoneType.Name;
                            newMilestoneSync.BusinessHours__c = cms.BusinessHoursId;
                            newMilestoneSync.Case__c = cms.CaseId;
                            newMilestoneSync.StartDate__c = cms.StartDate;
                            newMilestoneSync.CompletionDate__c = cms.CompletionDate;
                            newMilestoneSync.TargetDate__c = cms.TargetDate;
                            newMilestoneSync.MilestoneTypeId__c = cms.MilestoneType.Id;
                            newMilestoneSync.ElapsedTimeInMins__c = cms.ElapsedTimeInMins;
                            newMilestoneSync.ElapsedTimeInHrs__c = cms.ElapsedTimeInMins;
                            newMilestoneSync.ElapsedTimeInDays__c = cms.ElapsedTimeInDays;
                            dmlMilestoneSync.add(newMilestoneSync);
                        }
                        
                        if(dmlMilestoneSync.size() > 0){
                        
                            // INSERT Sync Records
                            insert dmlMilestoneSync;
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