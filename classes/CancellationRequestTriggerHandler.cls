public without sharing class CancellationRequestTriggerHandler {

    private static final Map<Id, User> activeStandardUserIdMap = new Map<Id, User>([select Id from User where IsActive = true and UserType = 'Standard']);
    private static final List<Schema.PicklistEntry> ple = Cancellation_Request__c.Day_Of_Next_SLA_Touch__c.getDescribe().getPicklistValues();

    public static Map<String, Integer> orderMap(){
        Map<String, Integer> oMap = new Map<String, Integer>();

        Integer orderValue = 0;
        for(Schema.PicklistEntry f : ple){
            oMap.put(f.getLabel(), orderValue);
            orderValue++;
        }

        return oMap;
    }

    public static List<String> orderList(){
        List<String> oList = new List<String>();

        for(Schema.PicklistEntry f : ple){
            oList.add(f.getLabel());
        }
        return oList;
    }

    public static void beforeUpdateSLACheck(Map<Id, Cancellation_Request__c> newMapValues,  Map<Id, Cancellation_Request__c> oldMapValues){
        for(Cancellation_Request__c cancelRequest : newMapValues.values()){
            Cancellation_Request__c oldCancelRequest = oldMapValues.get(cancelRequest.Id);

            //system.debug(orderList().get(orderMap().get(cancelRequest.Day_Of_Next_SLA_Touch__c)+1));

            if(cancelRequest.OwnerId != oldCancelRequest.OwnerId){
                cancelRequest.Day_Of_Next_SLA_Touch__c = '1';
                if(DateTime.now().hourGMT() < DateTime.newInstanceGmt(1, 1, 1, 22, 0, 0).hourGMT()){
                    cancelRequest.Day_SLA_Equivalent__c = 1;
                }else{
                    cancelRequest.Day_SLA_Equivalent__c = 0;
                }
            }else if(cancelRequest.Outcome__c == 'In Progress' && cancelRequest.Outcome__c != oldCancelRequest.Outcome__c){
                cancelRequest.Day_Of_Next_SLA_Touch__c = '1';
                if(DateTime.now().hourGMT() < DateTime.newInstanceGmt(1, 1, 1, 22, 0, 0).hourGMT()){
                    cancelRequest.Day_SLA_Equivalent__c = 1;
                }else{
                    cancelRequest.Day_SLA_Equivalent__c = 0;
                }
            }

            if(String.isNotBlank(cancelRequest.Day_Of_Next_SLA_Touch__c) && Double.valueof(cancelRequest.Day_Of_Next_SLA_Touch__c) < cancelRequest.Day_SLA_Equivalent__c){
                cancelRequest.Within_SLA__c = 'No';
            }else if(String.isNotBlank(cancelRequest.Day_Of_Next_SLA_Touch__c) && Double.valueof(cancelRequest.Day_Of_Next_SLA_Touch__c) >= cancelRequest.Day_SLA_Equivalent__c){
                cancelRequest.Within_SLA__c = 'Yes';
            }
        }
    }

    public static void afterUpdate(Map<Id, Cancellation_Request__c> newMapValues,  Map<Id, Cancellation_Request__c> oldMapValues){
        updateCustomAutomationRecordsAndCheckIfAccountInPauseMode(newMapValues, oldMapValues);
    }

    public static void afterInsert(Map<Id, Cancellation_Request__c> newMapValues){
        Set<Id> accountIdSet = relatedAccountIdList(newMapValues.values());

        if(accountIdSet.isEmpty()){
            return;
        }

        Map<Id, Account> accountTORCHXandLBWMap = AccountObjectHelper.getTORCHXandLBWAccountMap(accountIdSet);

        if(accountTORCHXandLBWMap.isEmpty()){
            return;
        }

        createCustomAutomationRecords(newMapValues, accountTORCHXandLBWMap);
    }

    public static Set<Id> relatedAccountIdList(List<Cancellation_Request__c> cancelRequestList){
        Set<Id> accountIdSet = new Set<Id>();

        for(Cancellation_Request__c record : cancelRequestList){
            if(String.isNotBlank(record.Account_Name__c)){
                accountIdSet.add(record.Account_Name__c);
            }
        }

        return accountIdSet;
    }

    /*public static Map<Id, Account> getTORCHXandLBWAccountMap(Set<Id> accountIdSet){
        Map<Id, Account> accountTORCHXandLBWMap = new Map<Id, Account>();
        for(Account record : (List<Account>)Database.query(Label.AccountTORCHXandLBWMapQuery)){
            accountTORCHXandLBWMap.put(record.Id, record);
        }

        return accountTORCHXandLBWMap;
    }*/

    public static void createCustomAutomationRecords(Map<Id, Cancellation_Request__c> newMapValues, Map<Id, Account> accountTORCHXandLBWMap){
        List<Custom_Automation__c> customAutomationList = new List<Custom_Automation__c>();

        List<Account> updateCSCCompleteDateOnAccountList = new List<Account>();

        for(Cancellation_Request__c record : newMapValues.values()){
            if(accountTORCHXandLBWMap.containsKey(record.Account_Name__c)){
                Account acctRecord = accountTORCHXandLBWMap.get(record.Account_Name__c);
                acctRecord.Pause_Touchplan__c = true;

                Custom_Automation__c newCustomAutomation = new Custom_Automation__c();
                newCustomAutomation.Account__c = record.Account_Name__c;
                newCustomAutomation.Cancellation_Request__c = record.Id;
                newCustomAutomation.Automation_Status__c = 'Waiting on Outcome';

                if(acctRecord.Product_Type_Transactional__c.containsIgnoreCase('Leads By Web') || acctRecord.Product_Type_Transactional__c.containsIgnoreCase('Lead Stream ATV')){
                    newCustomAutomation.Days_Since_Live_Equivalent_on_Request__c = acctRecord.Days_Since_Live__c;
                }else if(acctRecord.Product_Type_Transactional__c.containsIgnoreCase('TORCHx') && !acctRecord.Cases.isEmpty()){
                    //newCustomAutomation.Days_Since_Live_Equivalent_on_Request__c = acctRecord.Cases[0].ClosedDate.date().daysBetween(Date.today());
                    if(acctRecord.Days_Live_Equivalent__c != null){
                        newCustomAutomation.Days_Since_Live_Equivalent_on_Request__c = acctRecord.Days_Live_Equivalent__c;
                    }else{
                        newCustomAutomation.Days_Since_Live_Equivalent_on_Request__c = acctRecord.Cases[0].ClosedDate.date().daysBetween(Date.today());

                        if(acctRecord.CSC_Completed_Date__c == null){
                            acctRecord.CSC_Completed_Date__c = acctRecord.Cases[0].ClosedDate.date();
                            //updateCSCCompleteDateOnAccountList.add(acctRecord);
                        }

                        //newCustomAutomation.Days_Since_Live_Equivalent_on_Request__c = acctRecord.Cases[0].Auto_Close_Date__c.daysBetween(Date.today());
                    }
                }

                if(newCustomAutomation.Days_Since_Live_Equivalent_on_Request__c == null || newCustomAutomation.Days_Since_Live_Equivalent_on_Request__c == 0){
                    continue;
                }

                customAutomationList.add(newCustomAutomation);
                updateCSCCompleteDateOnAccountList.add(acctRecord);
            }
        }

        if(!customAutomationList.isEmpty()){
            insert customAutomationList;

                if(!updateCSCCompleteDateOnAccountList.isEmpty()){
                    Database.update(updateCSCCompleteDateOnAccountList, false);
                }
        }
    }

    private static void updateCustomAutomationRecordsAndCheckIfAccountInPauseMode(Map<Id, Cancellation_Request__c> newMapValues,  Map<Id, Cancellation_Request__c> oldMapValues){
        List<Cancellation_Request__c> cancellationRequestWithChangedOutcome = new List<Cancellation_Request__c>();
        Set<Id> accountIdSetForPauseModeCheck = new Set<Id>();

        for(Cancellation_Request__c record : newMapValues.values()){
            Cancellation_Request__c oldRecord = oldMapValues.get(record.Id);

            if(String.isNotBlank(record.Outcome__c) && String.isNotBlank(oldRecord.Outcome__c) && record.Outcome__c != oldRecord.Outcome__c/* && oldRecord.Outcome__c.equalsIgnoreCase('In Progress')*/){
                cancellationRequestWithChangedOutcome.add(record);
            }

            if(String.isNotBlank(record.Account_Name__c) && record.Outcome__c != oldRecord.Outcome__c){
                accountIdSetForPauseModeCheck.add(record.Account_Name__c);
            }
        }

        if(!cancellationRequestWithChangedOutcome.isEmpty()){
            CustomAutomationObjectHelper.setAutomationStatusFromCancellationRequest(cancellationRequestWithChangedOutcome);
        }

        if(!accountIdSetForPauseModeCheck.isEmpty()){
            AccountObjectHelper.checkIfAccountListInPauseMode(accountIdSetForPauseModeCheck);
        }
    }

    /* Subba Gadhamsetty, Added for YO-62417 Start */
    public static Map<Id, Account> getCRAccntsMap(Map<Id, Cancellation_Request__c> newMapValues){       
        Set<String> accountNameSet = New Set<String>();
        // Initialize all related Accounts, if not Blank
        for(Cancellation_Request__c cr : newMapValues.values()){
            if ( String.isNotBlank(cr.Account_Name__c))
            accountNameSet.add(cr.Account_Name__c); 
        }           
        //Create Account Map for the Identified Accounts
        Map<Id, Account> accountCancelRequestMap = new Map<Id, Account>([
            SELECT Id, Client_Type__c, Service_Model_Local__c FROM Account WHERE Id IN :accountNameSet]);       
        return  accountCancelRequestMap;
    } 

    public static Map<String, Event> getExistingEventsMap(Map<Id, Cancellation_Request__c> newMapValues){               
        List<Event> existingEventsList = new List<Event>([select WhatId,Id,RecordTypeId,Subject,Status__c,StartDateTime,OwnerId  from Event where WhatId in :newMapValues.keySet() 
            and RecordType.ID = :Schema.SObjectType.Event.getRecordTypeInfosByName().get('Calendar Blocker').getRecordTypeId() and Subject = 'CR Follow Up' and Status__c = 'Scheduled']);
        Map<String, Event> existingEventsMap = new Map<String, Event>();
        for(Event eventRecord : existingEventsList){
            existingEventsMap.put(eventRecord.WhatId,eventRecord);      
        }       
        return  existingEventsMap;
    } 
    
    public static Event getCREvent(Cancellation_Request__c cancelRequest) {
        //Create New Event Instance
        Event e = new Event();
        e.RecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('Calendar Blocker').getRecordTypeId();
        e.internal_external_activity__c = 'External';
        e.ShowAs = 'Busy';
        e.Subject = 'CR Follow Up';
        e.Status__c = 'Scheduled';
        e.StartDateTime = cancelRequest.Next_Scheduled_Contact_Date__c;
        e.DurationInMinutes = 30;        
        e.WhatId = cancelRequest.Id;
        e.OwnerId = cancelRequest.ownerId;
        return e;    
    }

    public static void createNewEvents(Map<Id, Cancellation_Request__c> newMapValues,  Map<Id, Cancellation_Request__c> oldMapValues) {
        Map<Id, Account> accountCancelRequestMap = getCRAccntsMap(newMapValues);
        //  For the Mathching Cancellation Requests Create Events
        List<Event> newEventList = new List<Event>();
        for(Cancellation_Request__c cancelRequest : newMapValues.values()){         
            // If Accont exists and meets specified criteria and NextScheduled Date populated and OwnerId is a User, not a Queue(start with 005) 
            if(String.isNotBlank(cancelRequest.Account_Name__c) && cancelRequest.Next_Scheduled_Contact_Date__c != null && String.valueof(cancelRequest.ownerId).startsWith('005')              
                && accountCancelRequestMap.get(cancelRequest.Account_Name__c).Client_Type__c=='Local' && accountCancelRequestMap.get(cancelRequest.Account_Name__c).Service_Model_Local__c=='Dedicated'){               
                Event e =  getCREvent(cancelRequest);   
                newEventList.add(e);                                
            }
        }
        
        if(!newEventList.isEmpty()){
            insert newEventList;
        }       
    }

    public static void processUpdateEvents(Map<Id, Cancellation_Request__c> newMapValues,  Map<Id, Cancellation_Request__c> oldMapValues) {     
        Map<Id, Account> accountCancelRequestMap = getCRAccntsMap(newMapValues);
        Map<String, Event> existingEventsMap = getExistingEventsMap(newMapValues);      
        List<Event> newEventList = new List<Event>();
        List<Event> updateEventList = new List<Event>();
        List<Event> deleteEventList = new List<Event>();
        for(Cancellation_Request__c cancelRequest : newMapValues.values()){         
            if(String.isNotBlank(cancelRequest.Account_Name__c) 
                && accountCancelRequestMap.get(cancelRequest.Account_Name__c).Client_Type__c=='Local' 
                && accountCancelRequestMap.get(cancelRequest.Account_Name__c).Service_Model_Local__c=='Dedicated'){
                Event exstngEvnt = existingEventsMap.get(cancelRequest.Id);
                // If NextScheduled Date not populated or CR OwnerId is Queue, delete if there is an existing event
                if( (cancelRequest.Next_Scheduled_Contact_Date__c == null || !String.valueof(cancelRequest.ownerId).startsWith('005')))
                {
                        if(exstngEvnt != null && String.isNotBlank((exstngEvnt).Id))
                            deleteEventList.add(exstngEvnt);
                }
                else if(cancelRequest.Next_Scheduled_Contact_Date__c != null    //Check if CancllationRequest.Next_Scheduled_Contact_Date__c or Owner Changed , then only trigger
                    && ((cancelRequest.Next_Scheduled_Contact_Date__c != oldMapValues.get(cancelRequest.Id).Next_Scheduled_Contact_Date__c) || (cancelRequest.OwnerId != oldMapValues.get(cancelRequest.Id).OwnerId))){
                        Datetime existingEventStartDateTime = null;
                        if (exstngEvnt != null)
                            existingEventStartDateTime = exstngEvnt.StartDateTime;
                        if(existingEventStartDateTime == null)
                        {
                            //No Event exists, so, create new event
                            Event e =  getCREvent(cancelRequest);   
                            newEventList.add(e);
                        }
                        else if(cancelRequest.Next_Scheduled_Contact_Date__c != existingEventStartDateTime || cancelRequest.ownerId != exstngEvnt.OwnerId){
                            //Event exists and if has different Schedule Date or different Owner Id than Cancel Request, then, update it.
                            Event e =  exstngEvnt; 
                            e.StartDateTime = cancelRequest.Next_Scheduled_Contact_Date__c;  
                            e.OwnerId = cancelRequest.ownerId; 
                            updateEventList.add(e);
                        }
                }               
            }
        }

        if(!newEventList.isEmpty()){
            insert newEventList;
        }   
        if(!updateEventList.isEmpty()){
            update updateEventList;
        }   
        if(!deleteEventList.isEmpty()){
            delete deleteEventList;
        }           
    }
    /* Subba Gadhamsetty, Added for YO-62417 ,End */
}