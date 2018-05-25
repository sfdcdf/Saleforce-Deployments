/**  
* \arg ClassName        : SL_EmailMessageTriggerHandler
* \arg CreatededBy      : Ron Gong, 06/29/2016
* \arg Description      : Handler class for EmailMessage object.
*/
global class SL_EmailMessageTriggerHandler extends SL_TriggerHandlerBase {        
    public static Boolean runBeforeInsert = true;
    public static Boolean runBeforeUpdate = true;
    public static Boolean runAfterInsert = true;
    public static Boolean runAfterUpdate = true;
        
    public override void beforeInsert(List<SObject> newListGeneric){
        if(!runBeforeInsert)  return;
        runBeforeInsert = false;
        system.debug('$$$ Enter SL_EmailMessageTriggerHandler beforeInsert');
        List<EmailMessage> newList = (List<EmailMessage>) newListGeneric;
        
        /*BEFORE INSERT METHODS START*/               
        CaseThreadingLimit(newList);
        CombineEmailToCase(newList);
        /*BEFORE INSERT METHODS END*/
    }
    
    public override void beforeUpdate(Map<Id, SObject> oldMapGeneric, Map<Id, SObject> newMapGeneric){
        if(!runBeforeUpdate)  return;
        runBeforeUpdate = false;
        
        Map<Id, EmailMessage> oldMap = (Map<Id, EmailMessage>) oldMapGeneric;
        Map<Id, EmailMessage> newMap = (Map<Id, EmailMessage>) newMapGeneric;
        
        /*BEFORE UPDATE METHODS START*/
               
        /*BEFORE UPDATE METHODS END*/
    }
    
    public override void beforeDelete(Map<Id, SObject> oldMapGeneric){
        Map<Id, EmailMessage> oldMap = (Map<Id, EmailMessage>) oldMapGeneric;
        /*BEFORE DELETE METHODS START*/
        
        /*BEFORE DELETE METHODS END*/
    }
    
    public override void afterInsert(Map<Id, SObject> newMapGeneric){
        if(!runAfterInsert)  return;
        runAfterInsert = false;
        system.debug('$$$ Enter SL_EmailMessageTriggerHandler afterInsert');
        Map<Id, EmailMessage> newMap = (Map<Id, EmailMessage>) newMapGeneric;
        
        /*AFTER INSERT METHODS START*/
        system.debug('$$$ emailmessage trigger after insert');
        CompleteResponseMS(newMap);
        CaseThreadingLimit(newMap.values());
        /*AFTER INSERT METHODS END*/
    }
    
    public override void afterUpdate(Map<Id, SObject> oldMapGeneric, Map<Id, SObject> newMapGeneric){
        if(!runAfterUpdate)  return;
        runAfterUpdate = false;
        
        Map<Id, EmailMessage> oldMap = (Map<Id, EmailMessage>) oldMapGeneric;
        Map<Id, EmailMessage> newMap = (Map<Id, EmailMessage>) newMapGeneric;
        
        /*AFTER UPDATE METHODS START*/

        /*AFTER UPDATE METHODS END*/
    }
    
    public override void afterDelete(Map<Id, SObject> oldMapGeneric){
        Map<Id, EmailMessage> oldMap = (Map<Id, EmailMessage>) oldMapGeneric;
        /*AFTER DELETE METHODS START*/
        
        /*AFTER DELETE METHODS END*/
    }
    
    public override void afterUndelete(Map<Id, SObject> newMapGeneric){
        Map<Id, EmailMessage> newMap = (Map<Id, EmailMessage>) newMapGeneric;
        /*AFTER UNDELETE METHODS START*/
        
        /*AFTER UNDELETE METHODS END*/
    }
 
/***** START HANDLER METHODS *****/ 
    
    /***
    Name: CaseThreadingLimit
    Created: Ron Gong, 6/29/2016
    Description: Complete related CaseMilestones
    ***/ 
    public static Map<String, Case> mapStr_NewCases = new Map<String, Case>();
    
    private void CaseThreadingLimit(List<EmailMessage> lstNewEmails){         
        Map<Id, EmailMessage> mapCase_EMs = new Map<Id, EmailMessage>();   
        system.debug('$$$ entry handler');           
        for(EmailMessage em: lstNewEmails){
            if(em.incoming == true && em.ParentId != null && em.ClonedEmail__c == false){
                mapCase_EMs.put(em.ParentId, em);
            }
        }
        system.debug('$$$ mapCase_EMs: ' + mapCase_EMs);
        if(mapCase_EMs.size()>0){ 
            Id rtMaster;
            Map<Id, DateTime> mapRt_ThreadDate = new Map<Id, DateTime>();              
            Map<String, Id> mapRTs = new Map<String, Id>();
            Map<String, String> mapEmail_CaseOrigin = new Map<String, String>();
            
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
                    
                    if(es.DisableThreading__c==true)  dt = system.now().addYears(1);  // Set into the future
                    else if(es.ClosedHours__c>=0) dt = system.now().addHours(-Integer.valueOf(es.ClosedHours__c));  // Minus threading hours
                    
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
            
            List<CaseThreadOrigin__mdt> lstCaseOrigins = [SELECT EmailAddress__c, CaseOrigin__c FROM CaseThreadOrigin__mdt];
            
            if(lstCaseOrigins.size()>0){
                for(CaseThreadOrigin__mdt co: lstCaseOrigins){
                    mapEmail_CaseOrigin.put(co.EmailAddress__c, co.CaseOrigin__c);
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
                        String strOrigin = c.Origin;
                        
                        // Set Case Origin of New Case
                        for(String orig: em.ToAddress.split(';')){
                            if(mapEmail_CaseOrigin.get(orig)!=null){
                                strOrigin = mapEmail_CaseOrigin.get(orig);
                                break;
                            }
                        }               
                        
                        Case newCase = new Case(Subject=em.Subject, 
                                                Description=em.textBody, 
                                                RecordTypeId=rtMaster,
                                                AccountId=c.AccountId,
                                                Origin=strOrigin,
                                                SuppliedEmail=em.FromAddress
                                                );
                        // Run through assignment rules
                        Database.DMLOptions dmo = new Database.DMLOptions();
                        dmo.assignmentRuleHeader.useDefaultRule = true;
                        dmo.EmailHeader.triggerAutoResponseEmail = true;
                        newCase.setOptions(dmo);
                      
                        mapStr_NewCases.put(c.Id + em.FromAddress, newCase);
                    }
                }
            }
            system.debug('$$$ mapStr_NewCases: ' + mapStr_NewCases);
            if(mapStr_NewCases.size()>0){  
                if(trigger.isAfter)  insert mapStr_NewCases.values();
                
                List<EmailMessage> lstNewEMs = new List<EmailMessage>();                                  
                for(EmailMessage em: lstNewEmails){
                    if(mapStr_NewCases.get(em.ParentId + em.FromAddress)!=null){
                        if(trigger.isAfter){
                            // Create new email and attach to new case
                            EmailMessage newEM = em.clone(false, true);
                            newEM.ClonedEmail__c = true;
                            newEM.OriginalEmailId__c = String.valueOf(em.Id);
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
        
    /***
    Name: CompleteResponseMS
    Created: Ron Gong, 6/29/2016
    Description: Complete related CaseMilestones
    ***/
    private void CompleteResponseMS(Map<Id, EmailMessage> mapNewEmails){
        String strResponse = CaseMilestoneUtils.strResponse;    
        Set<Id> setCaseIds = new Set<Id>();
        
        for (EmailMessage em : mapNewEmails.values()){
            if(em.Incoming == false){
                setCaseIds.add(em.ParentId);
            }    
        }
        system.debug('$$$ completeresponsems');
        if(setCaseIds.size()>0){
            List<Case> lstCases = [SELECT Id, Contact.Email, OwnerId, Status, EntitlementId,
                                          SlaStartDate, SlaExitDate, ApexCaseUpdate__c
                                   FROM Case WHERE Id IN :setCaseIds AND First_Response_Date_Time__c = null];
            
            if(lstCases.size()>0){
                DateTime completionDate = system.now();
                List<Case> lstUpdateCases = new List<Case>();
                Map<Id, Set<String>> mapCase_Miles = new Map<Id, Set<String>>();
                for (Case c: lstcases) {
                    if (c.EntitlementId != null && c.SlaExitDate == null && c.SlaStartDate != null
                        && c.SlaStartDate <= completionDate)
                    {
                        mapCase_Miles.put(c.Id, new Set<String>{strResponse});
                    }
                }    
                   
                if(mapCase_Miles.size()>0){
                    CaseMilestoneUtils.CompleteMilestones(mapCase_Miles, completionDate); 
                }      
            }
        }
    }
    
    /***
    Name: CombineEmailToCase
    Created: Ron Gong, 12/20/2016
    Description: Combines incoming emails with existing case.
    Description: Currently used for Web Legacy and their SharePoint system. (1/31/2017)
    ***/
    private void CombineEmailToCase(List<EmailMessage> lstNewEmails){
        Set<String> setCaseNums = new Set<String>();
    
        for(EmailMessage em: lstNewEmails){
            if(em.FromAddress == 'sharepoint@ccaglobal.com' || em.FromAddress == 'ron.gong@yodle.com'){            
                String cnum = em.TextBody.subStringAfter('Vendor Ticket ID:').subStringBefore('Start Date:').remove('Edited').remove('\n').trim();
                if(cnum.length()>0)  setCaseNums.add(cnum);      
            }
        }

        if(setCaseNums.size()>0){
            List<Case> lstCases = [SELECT Id, CaseNumber, First_Response_Date_Time__c FROM Case WHERE CaseNumber IN :setCaseNums];
        
            if(lstCases.size()>0){
                String strResponse = CaseMilestoneUtils.strResponse;    
                Set<Id> setCasesToDel = new Set<Id>();
                Map<String, Case> mapNumId = new Map<String, Case>();
                Map<Id, Set<String>> mapCase_Miles = new Map<Id, Set<String>>();
                
                for(Case c: lstCases){
                    mapNumId.put(c.CaseNumber, c);
                }
            
                for(EmailMessage em: lstNewEmails){
                    if(em.FromAddress == 'sharepoint@ccaglobal.com' || em.FromAddress == 'ron.gong@yodle.com'){
                        // Combine into case
                        String cnum = em.TextBody.subStringAfter('Vendor Ticket ID:').subStringBefore('Start Date:').remove('Edited').remove('\n').trim();
                        if(cnum.length()>0 && mapNumId.get(cnum)!=null){
                            setCasesToDel.add(em.ParentId);    // Set old parent to be deleted
                            em.ParentId = mapNumId.get(cnum).Id;    // Assign new parent case, must go after original case deletion
                        
                            // Determine if a resonse was initiated
                            if(mapNumId.get(cnum).First_Response_Date_Time__c == null){ 
                                String strRequest = em.TextBody.subStringAfter('Person Requesting:').subStringBefore('Assigned To:').trim().remove('\n');
                                //String strAssnTo = em.TextBody.subStringAfter('Assigned To:').subStringBefore('Issue Type:').trim().remove('\n');
                                String strStatus = em.TextBody.subStringAfter('Status:').subStringBefore('Notes:').trim().remove('\n');
                                String strNotes = em.TextBody.subStringAfter('Notes:').subStringBefore('Last Modified').trim().remove('\n');
                                String strLastMod = em.TextBody.subStringAfter('Last Modified').subStringAfter('by ').trim().remove('\n');
                                
                                if(!strLastMod.contains(strRequest)){
                                    if(strStatus.endsWith('Edited') || strNotes.endsWith('Edited')){
                                        mapCase_Miles.put(em.ParentId, new Set<String>{strResponse});
                                    }
                                }       
                            }
                        }
                    }
                }
                
                if(mapCase_Miles.size()>0)  CaseMilestoneUtils.CompleteMilestones(mapCase_Miles, system.now()); 
                if(setCasesToDel.size()>0)  DeleteCases(setCasesToDel);
            }
        }
    }
    
    @future
    public static void DeleteCases(Set<Id> setIds){
        if(setIds.size()>0){
            List<Case> lstCasesToDel = new List<Case>();
            List<Case> lstNewCases = [SELECT Id, (SELECT Id FROM EmailMessages) FROM Case WHERE Id IN :setIds];
            
            for(Case c: lstNewCases){
                if(c.EmailMessages.size()<1)  lstCasesToDel.add(c);
            }
            
            if(lstCasesToDel.size()>0)  delete lstCasesToDel;
        }
    }
}