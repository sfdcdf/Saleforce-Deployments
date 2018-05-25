trigger CloneEmailAttachment on Attachment (after insert) {    
    if(CheckRecursive.runAfterInsert()==false)  return;
    system.debug('$$$ Enter CloneEmailAttachment');
    
    String strPrefix = EmailMessage.sObjecttype.getDescribe().getKeyPrefix();
    Set<Id> setEmailIds = new Set<Id>();
    for(Attachment att: Trigger.new){
        if(String.valueOf(att.ParentId).startsWith(strPrefix))  setEmailIds.add(att.ParentId);
    }    
    
    if(setEmailIds.size()>0){
        DateTime dt = system.now().addMinutes(-30);
        Map<Id, EmailMessage> mapOld_EMs = new Map<Id, EmailMessage>();
        for(EmailMessage em: [SELECT Id, OriginalEmailId__c FROM EmailMessage 
                              WHERE CreatedDate > :dt
                              AND OriginalEmailId__c IN :setEmailIds 
                              AND ClonedEmail__c = true])
        {
            mapOld_EMs.put(em.OriginalEmailId__c, em);
        }
        
        system.debug('$$$ mapOld_EMs: ' + mapOld_EMs);
        if(mapOld_EMs.size()>0){
            List<Attachment> lstAttsToInsert = new List<Attachment>();
            for(Attachment att: Trigger.new){
                if(mapOld_EMs.get(att.ParentId)!=null){
                    Attachment newAtt = att.clone(false, true);
                    newAtt.ParentId = mapOld_EMs.get(att.ParentId).Id;
                    lstAttsToInsert.add(newAtt);
                }
            }
            system.debug('$$$ stAttsToInsert: ' + lstAttsToInsert);
            if(lstAttsToInsert.size()>0)  insert lstAttsToInsert;
        }
    }    
    system.debug('$$$ Enter CloneEmailAttachment');
}