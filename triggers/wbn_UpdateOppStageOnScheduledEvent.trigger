/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 4-Oct-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 4-Oct-2017
  Description ........: Apex Trigger which updates the Opportunity Stage if the following criteria is met:
  - Event's Activity Detail (Milestone__c) is 'IL Demo Scheduled' and Status__c is 'Scheduled'; Stage = M001
  - Event's Activity Detail (Milestone__c) is 'IL Demo Scheduled' and Status__c is 'Completed'; Stage = M002
*****************************************************************************/

trigger wbn_UpdateOppStageOnScheduledEvent on Event (After Insert, After Update) {
    
    Map<Id, Event> evtsMap = new Map<Id, Event>();
    Map<Id, Opportunity> oppsUpdateMap = new Map<Id, Opportunity>();
    List<Opportunity> dmlOpps = new List<Opportunity>();
    String updateStageNameM001 = 'M001 - Set Local Demo';
    String updateStageNameM002 = 'M002 - Complete local demo (IL)';
    String updateStageNameM003 = 'M003 - Contract (IL)';
    String activityDetailCriteria = 'IL Demo Scheduled';
    
    for(Event e : Trigger.new){
        
        // add matching criteria records to Map (Only Events related to Opportunities and Activity Detail (Milstone__c) is 'IL Demo Scheduled'
        if(e.WhatId != null && string.valueOf(e.WhatId).startsWith('006') && e.Milestone__c == activityDetailCriteria && (e.Status__c == 'Scheduled' || e.Status__c == 'Completed')){
            evtsMap.put(e.WhatId, e);
        }
    }
    
    // only execute if both Maps have data populated
    if(evtsMap.size() > 0){
    
        // add Opportunities to Opps Update Map
        for(Opportunity o : 
            [SELECT Id,
                    StageName,
                    AccountId,
                    IsClosed,
                    RecordType.DeveloperName
               FROM Opportunity
              WHERE Id IN :evtsMap.keySet()]){
        
            // make sure current Stage Name is properly filtered and populate Opps Update Map
            if(o.IsClosed == false){
                oppsUpdateMap.put(o.Id, o);
            }
        }
    
        if(oppsUpdateMap.size() > 0){
        
            for(Event e : evtsMap.values()){
                for(Opportunity opp : oppsUpdateMap.values()){
                        
                    // find only matching Tasks and Opportunities and update Map value
                    if(e.WhatId == opp.Id && e.AccountId == opp.AccountId){
                        
                        // Opps that update to Stage M001
                        if(e.Status__c == 'Scheduled'){
                            
                            if(opp.StageName != updateStageNameM001 && opp.StageName != updateStageNameM002 && opp.StageName != updateStageNameM003){
                                opp.StageName = updateStageNameM001;
                                
                                // add record to update list with modified Stage Name for DML Update
                                dmlOpps.add(opp);
                            }
                        }
                        
                        // Opps that update to Stage M002  
                        if(e.Status__c == 'Completed'){
                            
                            if(opp.StageName != updateStageNameM002 && opp.StageName != updateStageNameM003){
                                opp.StageName = updateStageNameM002;
                                
                                // add record to update list with modified Stage Name for DML Update
                                dmlOpps.add(opp);
                            }
                        }
                    }
                }
            }
                
            // update Opportunities in SFDC
            if(dmlOpps.size() > 0){
               update dmlOpps;
            }
            
            System.Debug('Number of records updated: ' + dmlOpps.size());
        }
    }
}