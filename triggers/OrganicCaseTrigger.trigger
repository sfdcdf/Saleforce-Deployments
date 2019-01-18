/*trigger OrganicCaseTrigger on Organic_Analysis__c (before insert, before update, after insert, after update) {
    if(trigger.isBefore && trigger.isInsert){
        for(Organic_Analysis__c oa : trigger.New){
            if(String.isNotBlank(oa.Reason_for_Submission__c)){
                oa.Submission_Reason__c = oa.Reason_for_Submission__c;
            }
        }
    } 
    
    if(trigger.isBefore && Integration_Settings__c.getInstance().Sync_Organic_Case_Data_With_Marketo__c && !OrganicCaseObjectHelper.alreadyFiredOrganicCaseObjectHelper){
        if(trigger.isInsert){
            OrganicCaseObjectHelper.syncOrganicCaseRecordLogic(trigger.New, new Map<Id, Organic_Analysis__c>());
        }else if(trigger.isUpdate){
            OrganicCaseObjectHelper.syncOrganicCaseRecordLogic(trigger.New, trigger.oldMap);
        }
    }else if(trigger.isAfter && Integration_Settings__c.getInstance().Sync_Organic_Case_Data_With_Marketo__c){
        if(trigger.isInsert){
            OrganicCaseObjectHelper.organicCaseMarketoSyncHelper(trigger.newMap, new Map<Id, Organic_Analysis__c>());
        }else if(trigger.isUpdate){
            OrganicCaseObjectHelper.organicCaseMarketoSyncHelper(trigger.newMap, trigger.oldMap);
        }
    }
}*/

trigger OrganicCaseTrigger on Organic_Analysis__c (after insert) {
    for (Organic_Analysis__c record : trigger.New)
    {
        CTSSyncService.CreateSFDCToCTSAsynchRequest('Organic_Analysis__c', record.Id);
    }                  
}