trigger TaskTrg_CompleteFirstResponse on Task (after insert) {
    String strResponse = CaseMilestoneUtils.strResponse;    
    Set<Id> setCaseIds = new Set<Id>();
    
    for (Task tsk : Trigger.new){
        if(tsk.WhatId!=null && String.valueOf(tsk.WhatId).StartsWith('500')){
            setCaseIds.add(tsk.WhatId);
        }    
    }
    
    if(setCaseIds.size()>0){
        List<Case> lstCases = [SELECT c.Id, c.Contact.Email, c.OwnerId, c.First_Response_Date_Time__c, c.Status,
                                      c.EntitlementId, c.SlaStartDate, c.SlaExitDate, c.ApexCaseUpdate__c
                               FROM Case c WHERE c.Id IN :setCaseIds];
        
        if(lstCases.size()>0){
            DateTime completionDate = system.now();
            List<Case> lstUpdateCases = new List<Case>();
            Map<Id, Set<String>> mapCase_Miles = new Map<Id, Set<String>>();
            for (Case c: lstcases) {
                if (c.First_Response_Date_Time__c == null && c.EntitlementId != null && c.SlaExitDate == null
                    && c.SlaStartDate <= completionDate && c.SlaStartDate != null)
                {
                    c.ApexCaseUpdate__c = completionDate;
                    lstUpdateCases.add(c);
                    mapCase_Miles.put(c.Id, new Set<String>{strResponse});
                }
            }    
               
            if(lstUpdateCases.size()>0 && mapCase_Miles.size()>0){
                update lstUpdateCases;
                CaseMilestoneUtils.CompleteMilestones(mapCase_Miles, completionDate); 
            }      
        }
    }    
}