trigger CaseThreadingLimit on EmailMessage (before insert, after insert) {
    if(trigger.isInsert && trigger.isBefore && CheckRecursive.runBeforeInsert()==false)  return;    // Prevent newly created emails from running through method
    else if(trigger.isInsert && trigger.isAfter && CheckRecursive.runAfterInsert()==false)  return;
    
    public static Map<String, Case> mapStr_NewCases = new Map<String, Case>(); 
    //Set<String> setSettingNames = new Set<String>{'EmailThreadingLocalLimit', 'EmailThreadingLocalPrevent'};
    Map<Id, EmailMessage> mapCase_EMs = new Map<Id, EmailMessage>();   
               
    for(EmailMessage em: trigger.New){
        if(em.incoming == true && em.ParentId != null){
            mapCase_EMs.put(em.ParentId, em);
        }
    }
    system.debug('$$$ mapCase_EMs: ' + mapCase_EMs);
    if(mapCase_EMs.size()>0){ 
        Map<Id, DateTime> mapRt_ThreadDate = new Map<Id, DateTime>();              
        Map<String, Id> mapRTs = new Map<String, Id>();
        Id rtMaster;
        //String strOrigin = 'Email Thread';
        // Using getDescribe gave an incorrect Id for Master case record type, so using SOQL.
        List<RecordType> lstRTs = [SELECT Id, Name FROM RecordType WHERE SobjectType='Case' AND IsActive=true];
        for(RecordType rt: lstRTs){
            mapRTs.put(rt.Name, rt.Id);
            if(rt.Name=='Master')  rtMaster = rt.Id;
        }
        
        List<CaseThreadSettings__mdt> lstESettings = [SELECT DeveloperName, CaseRecordType__c, ClosedHours__c, DisableThreading__c 
                                                      FROM CaseThreadSettings__mdt];
        if(lstESettings.size()>0){
            for(CaseThreadSettings__mdt es: lstESettings){
                DateTime dt;
                // If num value not available, set date as way in past
                if(es.DisableThreading__c==true)  dt = system.now().addYears(1);
                else if(es.ClosedHours__c>=0) dt = system.now().addHours(-Integer.valueOf(es.ClosedHours__c));
                
                system.debug('$$$ dt: ' + dt);
                List<String> lstString = es.CaseRecordType__c.split(',');
                for(String s: lstString){
                    String str = s.trim();
                    if(mapRTs.get(str)!=null){
                        mapRt_ThreadDate.put(mapRTs.get(str), dt);
                    }
                }
            }
        }
        
        List<Case> lstCases = [SELECT Id, RecordTypeId, AccountId, Origin, ClosedDate, CreatedDate FROM Case 
                               WHERE Id IN :mapCase_EMs.keySet()
                               AND RecordTypeId IN :mapRt_ThreadDate.keySet()];
        system.debug('$$$ lstCases: ' + lstCases);
        if(lstCases.size()>0){       
            for(Case c: lstCases){
                system.debug('$$$ c.RecordTypeId: ' + c.RecordTypeId);
                system.debug('$$$ c.ClosedDate: ' + c.ClosedDate);

                if(mapRt_ThreadDate.get(c.RecordTypeId)!=null 
                    && ((c.CreatedDate<system.now().addMinutes(-1) && mapRt_ThreadDate.get(c.RecordTypeId)>system.now())
                        || c.ClosedDate < mapRt_ThreadDate.get(c.RecordTypeId))
                ){
                    system.debug('$$$ case: ' + c);
                    EmailMessage em = mapCase_EMs.get(c.Id);
                    Case newCase = new Case(Subject=em.Subject, 
                                            Description=em.textBody, 
                                            RecordTypeId=rtMaster,
                                            AccountId=c.AccountId,
                                            Origin=String.valueOf(em.ToAddress).left(40),
                                            SuppliedEmail=em.FromAddress
                                            );
                    // Run through assignment rules
                    Database.DMLOptions dmo = new Database.DMLOptions();
                    dmo.assignmentRuleHeader.useDefaultRule = true;
                    newCase.setOptions(dmo);
                                            
                    mapStr_NewCases.put(c.Id + em.FromAddress, newCase);
                }
            }
        }
        system.debug('$$$ mapStr_NewCases: ' + mapStr_NewCases);
        if(mapStr_NewCases.size()>0){  
            if(trigger.isAfter)  insert mapStr_NewCases.values();
            
            List<EmailMessage> lstNewEMs = new List<EmailMessage>();                                  
            for(EmailMessage em: trigger.New){
                if(mapStr_NewCases.get(em.ParentId + em.FromAddress)!=null){
                    if(trigger.isAfter){
                        // Create new email and attach to new case
                        EmailMessage newEM = em.clone(false, true);
                        newEM.ParentId = mapStr_NewCases.get(em.ParentId + em.FromAddress).Id;
                        
                        String subStr = '';
                        if(newEM.textBody!=null)  subStr = 'ref:_' + newEM.textBody.substringBetween('ref:_', ':ref') + ':ref';
                        else if(newEM.htmlBody!=null) subStr = 'ref:_' + newEM.htmlBody.substringBetween('ref:_', ':ref') + ':ref';
                        
                        if(subStr!='' && newEM.textBody!=null)  newEM.textBody = newEM.textBody.replace(subStr, '');
                        if(subStr!='' && newEM.htmlBody!=null)  newEM.htmlBody = newEM.htmlBody.replace(subStr, '');
                        
                        lstNewEMs.add(newEM);
                    } else {
                        em.DoNotReopen__c = true;  
                    }                  
                }
            } 

            if(trigger.isAfter && lstNewEMs.size()>0)  insert lstNewEMs;                           
        }
    }
}