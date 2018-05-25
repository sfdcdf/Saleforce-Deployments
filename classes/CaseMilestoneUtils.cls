public class CaseMilestoneUtils {
    public static final String strResponse = 'Response';
    public static final String strResolution = 'Resolution';
    
    public static void CompleteMilestones(Map<Id, Set<String>> mapCaseId_MilestoneNames, DateTime dtCompletion){
        List<Case> lstCases = new List<Case>();
        List<CaseMilestone> lstCaseMilestones = [SELECT Id, CaseId, IsCompleted, ElapsedTimeInMins, CompletionDate, MilestoneType.Name 
                                                 FROM CaseMilestone 
                                                 WHERE CaseId IN :mapCaseId_MilestoneNames.keySet()
                                                 AND CompletionDate = null];
        system.debug('$$$ lstCaseMS: ' + lstCaseMilestones);                           
        
        if(lstCaseMilestones.size()>0){
            Set<Id> setMSids = new Set<Id>();
            List<CaseMilestone> lstUpdateMS = new List<CaseMilestone>();
            
            
            for(CaseMilestone cm: lstCaseMilestones){
                system.debug('$$$ MS: ' + cm);
                system.debug('$$$ MS Name: ' + cm.MilestoneType.Name);  
                
                for(String s: mapCaseId_MilestoneNames.get(cm.CaseId)){
                    if(cm.IsCompleted==false && cm.MilestoneType.Name.contains(s)){                        
                        cm.CompletionDate = dtCompletion;
                        lstUpdateMS.add(cm);
                        setMSids.add(cm.Id);
                        
                        lstCases.add(new Case(Id=cm.CaseId, ApexCaseUpdate__c=system.now()));
                    } 
                } 
            }         
            
            if(lstUpdateMS.size()>0){
                if(lstCases.size()>0)  update lstCases;
                update lstUpdateMS;
                
                // Generate CaseMilestoneSync
                if(setMSids.size()>0) { 
                    List<CaseMilestoneSync__c> lstCMSs = new List<CaseMileStoneSync__c>();                   
                    lstCaseMilestones = [SELECT Id, CaseId, IsCompleted, ElapsedTimeInMins, ElapsedTimeInHrs, ElapsedTimeInDays,
                                           BusinessHoursId, CompletionDate, StartDate, TargetDate, MilestoneType.Id, MilestoneType.Name 
                                         FROM CaseMilestone WHERE Id IN :setMSids];
                                   
                    for(CaseMilestone cm: lstCaseMilestones){
                        lstCMSs.add(new CaseMilestoneSync__c(
                                        Name = cm.MilestoneType.Name,
                                        BusinessHours__c = cm.BusinessHoursId,
                                        Case__c = cm.CaseId,
                                        StartDate__c = cm.StartDate,
                                        CompletionDate__c = cm.CompletionDate,
                                        TargetDate__c = cm.TargetDate,
                                        MilestoneTypeId__c = cm.MilestoneType.Id,
                                        ElapsedTimeInMins__c = cm.ElapsedTimeInMins,
                                        ElapsedTimeInHrs__c = cm.ElapsedTimeInHrs,
                                        ElapsedTimeInDays__c = cm.ElapsedTimeInDays
                                    ));
                    }

                    if(lstCMSs.size()>0)  insert lstCMSs;
                }
            }
        }                                      
    }
}