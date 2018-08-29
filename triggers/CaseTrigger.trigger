trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
    if(trigger.isBefore && Integration_Settings__c.getInstance().Sync_Case_Data_With_Marketo__c && !CaseObjectHelper.alreadyFiredCaseObjectHelper && !System.isFuture()){
        if(trigger.isInsert){
            CaseObjectHelper.syncCaseRecordLogic(trigger.New, new Map<Id, Case>());
        }else if(trigger.isUpdate){
            CaseObjectHelper.syncCaseRecordLogic(trigger.New, trigger.oldMap);
        }
    }else if(trigger.isAfter && Integration_Settings__c.getInstance().Sync_Case_Data_With_Marketo__c && !CaseObjectHelper.alreadyFiredCaseObjectHelper && !System.isFuture() && !System.isBatch()){
        if(trigger.isInsert){
            CaseObjectHelper.caseMarketoSyncHelper(trigger.newMap, new Map<Id, Case>());
        }else if(trigger.isUpdate){
            CaseObjectHelper.caseMarketoSyncHelper(trigger.newMap, trigger.oldMap);
        }
    }

    // move to trigger handler format once it's been implemented
    Id wbnOutboundTouchpointRecordType = Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Outbound Touch Point').getRecordTypeId();
    Id outboundCallCaseId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
    Id lbwOrganicSetupRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId();
    Id optimizationRTID = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Optimization').getRecordTypeId();

    Set<String> wbnClientTypeSet = new Set<String>{'YBN', 'National Account', 'National Master Account'};

    if(trigger.isBefore){
        Id masterCaseRecordTypeId = [select Id, Name from RecordType where sobjecttype = 'Case' and Name = 'Master' limit 1].Id;

        Set<Id> accountIdSetForLHFSSelfSignUp = new Set<Id>();
        Set<Id> accountIdSetForYBNIMSRepRequestCaseOwner = new Set<Id>();
        for(Case record : trigger.New){
            if(record.Reason == 'CSC' && record.Channel_Type__c == 'Lighthouse' && String.isNotBlank(record.AccountId)){
                accountIdSetForLHFSSelfSignUp.add(record.AccountId);
            }
            if(String.isNotBlank(record.AccountId) && String.isNotBlank(record.YBNRequestReason__c) && String.isNotBlank(record.YBNRequestDetail__c) && record.YBNRequestReason__c.equalsIgnoreCase('Miscellaneous') && record.YBNRequestDetail__c.equalsIgnoreCase('SE Request')){
                accountIdSetForYBNIMSRepRequestCaseOwner.add(record.AccountId);
            }
        }

        Map<Id, Account> accountIdMapWithSelfSignUp = new Map<Id, Account>([select Id from Account where LHFS_Self_Sign_Up__c = true and Id in : accountIdSetForLHFSSelfSignUp]);
        Map<Id, Account> accountIdMapForYBNRequestCaseIMSRep = new Map<Id, Account>([select Id, IMS_Rep__c from Account where Id in: accountIdSetForYBNIMSRepRequestCaseOwner and IMS_Rep__c != null]);

        if(trigger.isInsert){
            //Id masterCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Master').getRecordTypeId();
            Id lhfsQueueId = [select Id from Group where DeveloperName = 'Lighthouse_Field_Service' and Type = 'Queue'].Id;
            String lhfsMobileCaseReason = 'Inbound Inquiry';
            String lhfsReasonDetail = 'Other';

            Set<String> clientIdSetForLHUpsellWalkMe = new Set<String>();
            Set<Id> accountIdSetForCSTouchPlanReason = new Set<Id>();

            Set<Id> organicSetupCaseParentAccountId = new Set<Id>();
            Set<Id> accountIdForClientIdSOQL = new Set<Id>();

            Set<String> segmentNamesForAssignment = new Set<String>();

            // LHFS Mobile App case setting
            Set<String> clientIdSet = new Set<String>();
            for(Case record : trigger.New){
                if(record.RecordTypeId == optimizationRTID && !wbnClientTypeSet.contains(record.Client_Type__c)){
                    segmentNamesForAssignment.add(record.Partner_Segment__c);
                }

                if(String.isNotBlank(record.Client_ID__c) && (record.Origin == 'LHFS Android App' || record.Origin == 'LHFS iOS App')){
                    clientIdSet.add(record.Client_ID__c);
                }

                if(accountIdMapWithSelfSignUp.containsKey(record.AccountId) && (String.isBlank(record.Sales_Notes__c) || !record.Sales_Notes__c.containsIgnoreCase('LHFS Self Sign-Up'))){
                    record.Sales_Notes__c = '(LHFS Self Sign-Up) ' + (String.isNotBlank(record.Sales_Notes__c) ? record.Sales_Notes__c : '');
                }

                if(String.isNotBlank(record.AccountId) && accountIdMapForYBNRequestCaseIMSRep.containsKey(record.AccountId) && String.isNotBlank(record.YBNRequestReason__c) && String.isNotBlank(record.YBNRequestDetail__c) && record.YBNRequestReason__c.equalsIgnoreCase('Miscellaneous') && record.YBNRequestDetail__c.equalsIgnoreCase('SE Request')){
                    record.OwnerId = accountIdMapForYBNRequestCaseIMSRep.get(record.AccountId).IMS_Rep__c;
                }

                // CURRENTLY THE PRODUCT SETS THE LHFS CSC DATE TO BE DEFAULT TO 3 DAYS AFTER NCS CASE IS CREATED. NEEDS TO BE NULLED OUT FOR SCHEDULING TOOL!
                if(accountIdMapWithSelfSignUp.containsKey(record.AccountId) && record.Reason == 'CSC' && System.isBatch() && record.Scheduled_Call__c != null){
                    record.Scheduled_Call__c = null;
                }

                if(record.RecordTypeId == outboundCallCaseId && String.isNotBlank(record.Channel_Type__c)){
                    record = CaseScriptAssignmentUtil.setCallScript(record);
                }

                if(String.isNotBlank(record.Reason) && record.RecordTypeId == outboundCallCaseId && record.Reason.equalsIgnoreCase('CS Touch Plan')){
                    /*if(record.Auto_Close_Date__c == null){
                        record.Auto_Close_Date__c = (record.Scheduled_Call__c != null) ? record.Scheduled_Call__c.date().addDays(14) : Date.today().addDays(14);
                    }*/
                    if(String.isNotBlank(record.AccountId)){
                        accountIdSetForCSTouchPlanReason.add(record.AccountId);
                    }
                }

                if(String.isNotBlank(record.Origin) && (record.Origin.equalsIgnoreCase('LH Upsell - Walkme') || record.Origin.equalsIgnoreCase('New Homeowner - WalkMe')) && String.isBlank(record.AccountId)){
                    clientIdSetForLHUpsellWalkMe.add(record.Client_ID__c);
                }

                if(record.RecordTypeId == lbwOrganicSetupRecordTypeId){
                    record.Homepage__c = record.Geographic_Areas_To_Service__c + ' ' + record.Segment__c;
                    if(String.isNotBlank(record.AccountId)){
                        organicSetupCaseParentAccountId.add(record.AccountId);
                    }
                }

                if(String.isBlank(record.Client_ID__c) && String.isNotBlank(record.AccountId)){
                    accountIdForClientIdSOQL.add(record.AccountId);
                }
            }

            Map<String, Id> clientIdSalesforceIdMap = new Map<String, Id>();
            if(!clientIdSet.isEmpty()){
                for(Account record : [select Id, Client_ID__c from Account where Client_ID__c in : clientIdSet and Client_ID__c != null]){
                    clientIdSalesforceIdMap.put(record.Client_ID__c, record.Id);
                }
            }

            Map<String, Account> cliendIdAccountMap = new Map<String, Account>();
            if(!clientIdSetForLHUpsellWalkMe.isEmpty()){
                for(Account acct : [select Id, Client_ID__c, Phone from Account where Client_ID__c in :clientIdSetForLHUpsellWalkMe and Client_ID__c != null]){
                    cliendIdAccountMap.put(acct.Client_ID__c, acct);
                }
            }

            Map<Id, Account> accountCSTouchDateMap = new Map<Id, Account>();
            if(!accountIdSetForCSTouchPlanReason.isEmpty()){
                for(Account acct : [select Id, Next_Scheduled_Touchpoint__c from Account where Id in : accountIdSetForCSTouchPlanReason and Next_Scheduled_Touchpoint__c > TODAY and (Product_Type_Transactional__c like 'Leads By Web' OR Product_Type_Transactional__c = 'Lead Stream ATV')]){
                    accountCSTouchDateMap.put(acct.Id, acct);
                }
            }

            Map<Id, Account> accountOrganicSetupCountMap = new Map<Id, Account>();
            if(!organicSetupCaseParentAccountId.isEmpty()){
                for(Account acct : [select Id, Client_ID__c, (select Id from Cases where RecordTypeId =: lbwOrganicSetupRecordTypeId) from Account where Id in: organicSetupCaseParentAccountId and (Product_Plan_Id__c = 'LEADS_BY_WEB' OR Product_Plan_Id__c LIKE '%ATV%') and Client_Experience_Key__c = 'web.com-main']){
                    accountOrganicSetupCountMap.put(acct.Id, acct);
                }
            }

            Map<Id, Account> accountIdWithClientIDMap = new Map<Id, Account>();
            if(!accountIdForClientIdSOQL.isEmpty()){
                for(Account acct : [select Id, Client_ID__c from Account where Id in : accountIdForClientIdSOQL]){
                    accountIdWithClientIDMap.put(acct.Id, acct);
                }
            }

            Map<String, Id> segmentOptimizationOwnerMap = new Map<String, Id>();
            if(!segmentNamesForAssignment.isEmpty()){
                segmentNamesForAssignment.add('DEFAULT');
                for(Segment_Optimization_Case_Assignment__c record : [select Name, OwnerId from Segment_Optimization_Case_Assignment__c where Name in :segmentNamesForAssignment]){
                    segmentOptimizationOwnerMap.put(record.Name, record.OwnerId);
                }
            }

            for(Case record : trigger.New){
                if(String.isNotBlank(record.Client_ID__c) && (record.Origin == 'LHFS Android App' || record.Origin == 'LHFS iOS App')){
                    record.OwnerId = lhfsQueueId;
                    if(clientIdSalesforceIdMap.containsKey(record.Client_ID__c)){
                        record.AccountId = clientIdSalesforceIdMap.get(record.Client_ID__c);
                    }
                    record.Reason = lhfsMobileCaseReason;
                    record.Reason_Detail__c = lhfsReasonDetail;
                }
                if(String.isNotBlank(record.Origin) && (record.Origin.equalsIgnoreCase('LH Upsell - Walkme') || record.Origin.equalsIgnoreCase('New Homeowner - WalkMe')) && String.isBlank(record.AccountId) && cliendIdAccountMap.containsKey(record.Client_ID__c)){
                    record.AccountId = cliendIdAccountMap.get(record.Client_ID__c).Id;
                    record.Client_Phone_Number__c = cliendIdAccountMap.get(record.Client_ID__c).Phone;
                }
                if(String.isNotBlank(record.Reason) && record.RecordTypeId == outboundCallCaseId && record.Reason.equalsIgnoreCase('CS Touch Plan') && accountCSTouchDateMap.containsKey(record.AccountId)){
                    record.Scheduled_Call__c = accountCSTouchDateMap.get(record.AccountId).Next_Scheduled_Touchpoint__c;
                }

                /*if(String.isNotBlank(record.Reason) && record.RecordTypeId == outboundCallCaseId && record.Reason.equalsIgnoreCase('CS Touch Plan')){
                    if(record.Auto_Close_Date__c == null){
                        record.Auto_Close_Date__c = (record.Scheduled_Call__c != null) ? record.Scheduled_Call__c.date().addDays(14) : Date.today().addDays(14);
                    }
                }*/

                if(record.RecordTypeId == lbwOrganicSetupRecordTypeId && accountOrganicSetupCountMap.containsKey(record.AccountId) && String.isBlank(record.TaskID__c)){
                    record.TaskID__c = accountOrganicSetupCountMap.get(record.AccountId).Client_ID__c + '-00' + (accountOrganicSetupCountMap.get(record.AccountId).Cases.size() + 1); 
                }

                if(String.isBlank(record.Client_ID__c) && String.isNotBlank(record.AccountId) && accountIdWithClientIDMap.containsKey(record.AccountId)){
                    record.Client_ID__c = accountIdWithClientIDMap.get(record.AccountId).Client_ID__c;
                }

                if(record.RecordTypeId == optimizationRTID && !wbnClientTypeSet.contains(record.Client_Type__c) && !segmentOptimizationOwnerMap.isEmpty()){
                    record.OwnerId = (segmentOptimizationOwnerMap.containsKey(record.Partner_Segment__c)) ? segmentOptimizationOwnerMap.get(record.Partner_Segment__c) : segmentOptimizationOwnerMap.get('DEFAULT');
                }
            }
        }else if(trigger.isUpdate){
            Set<String> completeString = new Set<String>{'Complete - Short Script', 'Complete - Full Script', 'Completed'};
            Set<String> caseClosedStatusSet = new Set<String>();

            Set<Id> awaitingInternalResponseRecordTypeOverride = new Set<Id>{Schema.SObjectType.Case.getRecordTypeInfosByName().get('Account Update').getRecordTypeId(), Schema.SObjectType.Case.getRecordTypeInfosByName().get('LH Master').getRecordTypeId()};

            Map<Id, Boolean> caseHasJiraTicketOrOpenChildCase = new Map<Id, Boolean>();

            for(CaseStatus cs : [select MasterLabel from CaseStatus where IsClosed = true]){
                caseClosedStatusSet.add(cs.MasterLabel);
            }

            for(Case record : trigger.New){
                Case oldRecord = trigger.oldMap.get(record.Id);
                if(accountIdMapWithSelfSignUp.containsKey(record.AccountId) && (String.isBlank(record.Sales_Notes__c) || !record.Sales_Notes__c.containsIgnoreCase('LHFS Self Sign-Up'))){
                    record.Sales_Notes__c = '(LHFS Self Sign-Up) ' + (String.isNotBlank(record.Sales_Notes__c) ? record.Sales_Notes__c : '');
                }

                if(record.RecordTypeId == outboundCallCaseId && !caseClosedStatusSet.contains(record.Status) && String.isNotBlank(record.Channel_Type__c)){
                        record = CaseScriptAssignmentUtil.setCallScript(record);
                }

                if((record.YBNRequestReason__c != oldRecord.YBNRequestReason__c || record.YBNRequestDetail__c != oldRecord.YBNRequestDetail__c) && String.isNotBlank(record.AccountId) && accountIdMapForYBNRequestCaseIMSRep.containsKey(record.AccountId) && String.isNotBlank(record.YBNRequestReason__c) && String.isNotBlank(record.YBNRequestDetail__c) && record.YBNRequestReason__c.equalsIgnoreCase('Miscellaneous') && record.YBNRequestDetail__c.equalsIgnoreCase('SE Request')){
                    record.OwnerId = accountIdMapForYBNRequestCaseIMSRep.get(record.AccountId).IMS_Rep__c;
                }

                if(record.Status != oldRecord.Status && record.Status == 'Awaiting Internal Response' && !awaitingInternalResponseRecordTypeOverride.contains(record.RecordTypeId)){
                    caseHasJiraTicketOrOpenChildCase.put(record.Id, (String.isNotBlank(record.JIRA_Issue_ID__c) ? true : false));
                }

                /*if(String.isNotBlank(record.Reason) && record.RecordTypeId == outboundCallCaseId && record.Reason.equalsIgnoreCase('CS Touch Plan') && record.Scheduled_Call__c != oldRecord.Scheduled_Call__c){
                    record.Auto_Close_Date__c = (record.Scheduled_Call__c != null) ? record.Scheduled_Call__c.date().addDays(14) : Date.today().addDays(14);
                }*/

                if(record.RecordTypeId == lbwOrganicSetupRecordTypeId && (record.Geographic_Areas_To_Service__c != oldRecord.Geographic_Areas_To_Service__c || record.Segment__c != oldRecord.Segment__c)){
                    record.Homepage__c = record.Geographic_Areas_To_Service__c + ' ' + record.Segment__c;
                }
            }

            for(Case cs : [select Id, (select Id, ParentId from Cases where IsClosed = false), (select Id from Organic_Analyses__r where (NOT Status__c like '%Closed%') and (NOT Status__c like '%Complete%') and Status__c != 'Delete Case'), (select Id from Operations__r where (NOT Status__c like '%Closed%')), (select Id from Lighthouse_Worksheets__r where RecordType.Name = 'LH OOS' and (NOT Status__c in ('Complete', 'Delete Case'))) from Case where Id in : caseHasJiraTicketOrOpenChildCase.keySet()]){
                if(!cs.Cases.isEmpty() || !cs.Organic_Analyses__r.isEmpty() || !cs.Operations__r.isEmpty() || !cs.Lighthouse_Worksheets__r.isEmpty()){
                    caseHasJiraTicketOrOpenChildCase.put(cs.Id, true);
                }
            }

            for(Id parentCaseId : caseHasJiraTicketOrOpenChildCase.keySet()){
                if(!caseHasJiraTicketOrOpenChildCase.get(parentCaseId)){
                    trigger.newMap.get(parentCaseId).Status.addError('You need either a Jira Issue ID number or an open Child Case, Organic Case or Operations Case to mark this Case to Awaiting Internal Response');
                }
            }

            for(TP_Section_Auto_Evaluate_Criteria__c ypCriteria : [select Id, Field_Trigger__c, Field_Trigger_Value__c, Field_Trigger_Old_Value__c, Touchplan_Section__r.Case__c, Base_Date_Field__c, Auto_Evaluate_Date_Field__c, Days_Added_to_Base_Date__c from TP_Section_Auto_Evaluate_Criteria__c where Touchplan_Section__r.Case__c in : trigger.new]){
                Case currentCase = trigger.newMap.get(ypCriteria.Touchplan_Section__r.Case__c);
                Case oldCase = trigger.oldMap.get(ypCriteria.Touchplan_Section__r.Case__c);

                if(/*currentCase.Status != oldCase.Status && */!caseClosedStatusSet.contains((String)currentCase.get('Status'))){
                    if(String.isBlank(ypCriteria.Field_Trigger_Value__c) && String.isBlank(ypCriteria.Field_Trigger_Old_Value__c) && currentCase.get(ypCriteria.Field_Trigger__c) != oldCase.get(ypCriteria.Field_Trigger__c)){
                        if(String.isNotBlank(ypCriteria.Base_Date_Field__c) && ypCriteria.Base_Date_Field__c.toLowerCase() == 'today'){
                            Date valueDate = Date.today().addDays((Integer)ypCriteria.Days_Added_to_Base_Date__c);
                            Date startOfWeek = valueDate.toStartOfWeek();
                            
                            if(valueDate.daysBetween(startOfWeek) == 0){
                                valueDate = valueDate.addDays(1);
                            }else if(valueDate.daysBetween(startOfWeek) == -6){
                                valueDate = valueDate.addDays(2);
                            }
                            currentCase.put(ypCriteria.Auto_Evaluate_Date_Field__c, valueDate);
                        }else if(String.isNotBlank(ypCriteria.Base_Date_Field__c) && currentCase.get(ypCriteria.Base_Date_Field__c) != null){
                            Date valueDate = (Date.valueof(currentCase.get(ypCriteria.Base_Date_Field__c))).addDays((Integer)ypCriteria.Days_Added_to_Base_Date__c);
                            Date startOfWeek = valueDate.toStartOfWeek();

                            if(valueDate.daysBetween(startOfWeek) == 0){
                                valueDate = valueDate.addDays(1);
                            }else if(valueDate.daysBetween(startOfWeek) == -6){
                                valueDate = valueDate.addDays(2);
                            }
                            currentCase.put(ypCriteria.Auto_Evaluate_Date_Field__c, valueDate);
                        }else{
                            Date valueDate = Date.today().addDays((Integer)ypCriteria.Days_Added_to_Base_Date__c);
                            Date startOfWeek = valueDate.toStartOfWeek();
                            
                            if(valueDate.daysBetween(startOfWeek) == 0){
                                valueDate = valueDate.addDays(1);
                            }else if(valueDate.daysBetween(startOfWeek) == -6){
                                valueDate = valueDate.addDays(2);
                            }
                            currentCase.put(ypCriteria.Auto_Evaluate_Date_Field__c, valueDate);
                        }
                    }else{
                        if(String.isNotBlank(ypCriteria.Field_Trigger_Value__c) && String.isBlank(ypCriteria.Field_Trigger_Old_Value__c) && currentCase.get(ypCriteria.Field_Trigger__c) != oldCase.get(ypCriteria.Field_Trigger__c) && (String)currentCase.get(ypCriteria.Field_Trigger__c) == ypCriteria.Field_Trigger_Value__c){
                            if(String.isNotBlank(ypCriteria.Base_Date_Field__c) && ypCriteria.Base_Date_Field__c.toLowerCase() == 'today'){
                                Date valueDate = Date.today().addDays((Integer)ypCriteria.Days_Added_to_Base_Date__c);
                                Date startOfWeek = valueDate.toStartOfWeek();
                                
                                if(valueDate.daysBetween(startOfWeek) == 0){
                                    valueDate = valueDate.addDays(1);
                                }else if(valueDate.daysBetween(startOfWeek) == -6){
                                    valueDate = valueDate.addDays(2);
                                }
                                currentCase.put(ypCriteria.Auto_Evaluate_Date_Field__c, valueDate);
                            }else if(String.isNotBlank(ypCriteria.Base_Date_Field__c)){
                                Date valueDate = (Date.valueof(currentCase.get(ypCriteria.Base_Date_Field__c))).addDays((Integer)ypCriteria.Days_Added_to_Base_Date__c);
                                Date startOfWeek = valueDate.toStartOfWeek();

                                if(valueDate.daysBetween(startOfWeek) == 0){
                                    valueDate = valueDate.addDays(1);
                                }else if(valueDate.daysBetween(startOfWeek) == -6){
                                    valueDate = valueDate.addDays(2);
                                }
                                currentCase.put(ypCriteria.Auto_Evaluate_Date_Field__c, valueDate);
                            }else{
                                Date valueDate = Date.today().addDays((Integer)ypCriteria.Days_Added_to_Base_Date__c);
                                Date startOfWeek = valueDate.toStartOfWeek();
                                
                                if(valueDate.daysBetween(startOfWeek) == 0){
                                    valueDate = valueDate.addDays(1);
                                }else if(valueDate.daysBetween(startOfWeek) == -6){
                                    valueDate = valueDate.addDays(2);
                                }
                                currentCase.put(ypCriteria.Auto_Evaluate_Date_Field__c, valueDate);
                            }
                        }else if(String.isBlank(ypCriteria.Field_Trigger_Value__c) && String.isNotBlank(ypCriteria.Field_Trigger_Old_Value__c) && currentCase.get(ypCriteria.Field_Trigger__c) != oldCase.get(ypCriteria.Field_Trigger__c) && (String)oldCase.get(ypCriteria.Field_Trigger__c) == ypCriteria.Field_Trigger_Old_Value__c){
                            if(String.isNotBlank(ypCriteria.Base_Date_Field__c) && ypCriteria.Base_Date_Field__c.toLowerCase() == 'today'){
                                Date valueDate = Date.today().addDays((Integer)ypCriteria.Days_Added_to_Base_Date__c);
                                Date startOfWeek = valueDate.toStartOfWeek();
                                
                                if(valueDate.daysBetween(startOfWeek) == 0){
                                    valueDate = valueDate.addDays(1);
                                }else if(valueDate.daysBetween(startOfWeek) == -6){
                                    valueDate = valueDate.addDays(2);
                                }
                                currentCase.put(ypCriteria.Auto_Evaluate_Date_Field__c, valueDate);
                            }else if(String.isNotBlank(ypCriteria.Base_Date_Field__c)){
                                Date valueDate = (Date.valueof(currentCase.get(ypCriteria.Base_Date_Field__c))).addDays((Integer)ypCriteria.Days_Added_to_Base_Date__c);
                                Date startOfWeek = valueDate.toStartOfWeek();

                                if(valueDate.daysBetween(startOfWeek) == 0){
                                    valueDate = valueDate.addDays(1);
                                }else if(valueDate.daysBetween(startOfWeek) == -6){
                                    valueDate = valueDate.addDays(2);
                                }
                                currentCase.put(ypCriteria.Auto_Evaluate_Date_Field__c, valueDate);
                            }else{
                                Date valueDate = Date.today().addDays((Integer)ypCriteria.Days_Added_to_Base_Date__c);
                                Date startOfWeek = valueDate.toStartOfWeek();
                                
                                if(valueDate.daysBetween(startOfWeek) == 0){
                                    valueDate = valueDate.addDays(1);
                                }else if(valueDate.daysBetween(startOfWeek) == -6){
                                    valueDate = valueDate.addDays(2);
                                }
                                currentCase.put(ypCriteria.Auto_Evaluate_Date_Field__c, valueDate);
                            }
                        }

                        // NEED LOGIC FOR WHEN BOTH OLD VALUE AND NEW VALUE IS SET!!!!!!!
                    }
                }
            }
        }
    }else if(trigger.isAfter){
        Id calendarBlockerEventRecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('Calendar Blocker').getRecordTypeId();

        if(trigger.isInsert){
            Map<String, Event> newEventMap = new Map<String, Event>();

            for(Case record : trigger.New){
                if((Test.isRunningTest() && !System.isBatch() && record.Scheduled_Call__c != null && String.valueof(record.OwnerId).startsWith('005')) || (record.RecordTypeId == outboundCallCaseId && String.valueof(record.OwnerId).startsWith('005') && record.Scheduled_Call__c != null)){
                    Event newEvent = new Event();
                    newEvent.RecordTypeId = calendarBlockerEventRecordTypeId;
                    newEvent.WhatId = record.Id;
                    newEvent.OwnerId = record.OwnerId;
                    //newEvent.DurationInMinutes = ((String.isNotBlank(record.Reason) && record.Reason.equalsIgnoreCase('CSC')) || (!record.Product_Type__c.equalsIgnoreCase('Leads By Web') || !record.Product_Type__c.equalsIgnoreCase('Lead Stream ATV'))) ? 60 : 30;
                    //newEvent.DurationInMinutes = ((String.isNotBlank(record.Reason) && record.Reason.equalsIgnoreCase('CSC')) || (!record.Product_Type__c.contains('Lead'))) ? 60 : 30;
                    newEvent.DurationInMinutes = (String.isNotBlank(record.Reason) && record.Reason.equalsIgnoreCase('CS Touch Plan')) ? 30 : 60;
                    newEvent.StartDateTime = record.Scheduled_Call__c;
                    newEvent.Subject = record.Client_ID__c + ' | ' + record.Reason;
                    newEvent.IsVisibleInSelfService = true;
                    newEvent.IsPrivate = false;
                    newEventMap.put(newEvent.Subject, newEvent);
                }
            }

            if(!newEventMap.isEmpty()){
                for(Event e : [select Id, WhatId, Subject from Event where Subject in :newEventMap.keySet() and What.Type = 'Account']){
                    newEventMap.get(e.Subject).Id = e.Id;
                }
                upsert newEventMap.values();
            }
        }else if(trigger.isUpdate){
            Id wbnCalendarBlockerEventRecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('WBN Calendar Blocker').getRecordTypeId();

            Set<Id> wbnTouchpointCaseIdSet = new Set<Id>();
            Set<Id> touchpointCaseIdSet = new Set<Id>();

            Map<Id, Case> accountIdCaseMapForNextScheduledTP = new Map<Id, Case>();

            List<Account> updateAccountCSCCompleteDateList = new List<Account>();

            for(Case record : trigger.New){
                Case oldRecord = trigger.oldMap.get(record.Id);
                if(record.RecordTypeId == wbnOutboundTouchpointRecordType && !record.IsClosed && record.Scheduled_Call__c != oldRecord.Scheduled_Call__c){
                    wbnTouchpointCaseIdSet.add(record.Id);
                }else if(record.RecordTypeId == outboundCallCaseId && !record.IsClosed && (record.Scheduled_Call__c != oldRecord.Scheduled_Call__c || record.OwnerId != oldRecord.OwnerId)){

                    touchpointCaseIdSet.add(record.Id);
                }

                if(String.isNotBlank(record.AccountId) && record.RecordTypeId == outboundCallCaseId && !record.IsClosed && record.Scheduled_Call__c != oldRecord.Scheduled_Call__c && (record.Scheduled_Call__c > Date.today() || record.Scheduled_Call__c == null) && String.isNotBlank(record.Reason) && record.Reason.equalsIgnoreCase('CS Touch Plan')){
                    accountIdCaseMapForNextScheduledTP.put(record.AccountId, record);
                    CaseObjectHelper.alreadyFiredCalendarBlockerForCase = true;
                }

                if(record.Status != oldRecord.Status && record.Status.equalsIgnoreCase('Complete') && String.isNotBlank(record.AccountId) && String.isNotBlank(record.Reason) && record.Reason.equalsIgnoreCase('CSC')){
                    Account acctRecord = new Account();
                    acctRecord.Id = record.AccountId;
                    acctRecord.CSC_Completed_Date__c = record.ClosedDate.date();

                    updateAccountCSCCompleteDateList.add(acctRecord);
                }
            }

            if(!updateAccountCSCCompleteDateList.isEmpty()){
                Database.update(updateAccountCSCCompleteDateList, false);
            }

            if(!accountIdCaseMapForNextScheduledTP.isEmpty()){
                List<Account> updateAccountNextTPDate = new List<Account>();
                for(Id acctId : accountIdCaseMapForNextScheduledTP.keySet()){
                    Account acctUpdate = new Account();
                    acctUpdate.Id = acctId;
                    acctUpdate.Next_Scheduled_Touchpoint__c = accountIdCaseMapForNextScheduledTP.get(acctId).Scheduled_Call__c;
                    updateAccountNextTPDate.add(acctUpdate);
                }
                Database.update(updateAccountNextTPDate, false);
            }

            if(!wbnTouchpointCaseIdSet.isEmpty()){
                List<Event> updateEventList = new List<Event>();
                for(Event wbnEventBlocker : [select Id, StartDateTime, WhatId, ShowAs from Event where WhatId in : wbnTouchpointCaseIdSet and RecordTypeId = : wbnCalendarBlockerEventRecordTypeId]){
                    if(trigger.newMap.get(wbnEventBlocker.WhatId).Scheduled_Call__c == null){
                        wbnEventBlocker.ShowAs = 'Free';
                    }else{
                        wbnEventBlocker.StartDateTime = trigger.newMap.get(wbnEventBlocker.WhatId).Scheduled_Call__c;
                        wbnEventBlocker.ShowAs = 'Busy';
                    }
                    updateEventList.add(wbnEventBlocker);
                    wbnTouchpointCaseIdSet.remove(wbnEventBlocker.WhatId);
                }

                if(!updateEventList.isEmpty()){
                    update updateEventList;
                }
                if(!wbnTouchpointCaseIdSet.isEmpty()){
                    List<Event> newWBNEventBlocker = new List<Event>();
                    for(Case cs : [select Id, AccountId, Client_ID__c, Account.IMS_Rep__c, Scheduled_Call__c from Case where Id in : wbnTouchpointCaseIdSet]){
                        if(cs.Scheduled_Call__c != null){
                            Event newEvent = new Event();
                            newEvent.RecordTypeId = wbnCalendarBlockerEventRecordTypeId;
                            newEvent.WhatId = cs.Id;
                            newEvent.OwnerId = cs.Account.IMS_Rep__c;
                            newEvent.DurationInMinutes = 30;
                            newEvent.StartDateTime = cs.Scheduled_Call__c;
                            newEvent.Subject = cs.Client_ID__c + ': Scheduled Proactive Touch';
                            newEvent.IsVisibleInSelfService = true;
                            newEvent.IsPrivate = false;
                            newWBNEventBlocker.add(newEvent);
                        }
                    }
                    insert newWBNEventBlocker;
                }
            }

            if(!touchpointCaseIdSet.isEmpty()){
                Set<Id> queueIdSet = new Set<Id>();
                for(Group gp : [select Id, name from Group where Type = 'Queue']){
                    queueIdSet.add(gp.Id);
                }

                List<Event> updateEventList = new List<Event>();
                List<Event> deleteEventList = new List<Event>();
                for(Event eventBlocker : [select Id, StartDateTime, WhatId, ShowAs from Event where WhatId in : touchpointCaseIdSet and RecordTypeId = : calendarBlockerEventRecordTypeId]){
                    if(trigger.newMap.get(eventBlocker.WhatId).Scheduled_Call__c == null){
                        //eventBlocker.ShowAs = 'Free';
                        deleteEventList.add(eventBlocker);
                    }else if(!queueIdSet.contains(trigger.newMap.get(eventBlocker.WhatId).OwnerId)){
                        eventBlocker.StartDateTime = trigger.newMap.get(eventBlocker.WhatId).Scheduled_Call__c;
                        eventBlocker.ShowAs = 'Busy';
                        eventBlocker.OwnerId = trigger.newMap.get(eventBlocker.WhatId).OwnerId;
                        updateEventList.add(eventBlocker);
                    }else{
                        deleteEventList.add(eventBlocker);
                    }
                    touchpointCaseIdSet.remove(eventBlocker.WhatId);
                }

                if(!updateEventList.isEmpty()){
                    system.debug('*** in update event list ****');
                    update updateEventList;
                }
                if(!touchpointCaseIdSet.isEmpty()){
                    system.debug('in 1 ****');
                    List<Event> newEventBlocker = new List<Event>();
                    for(Case cs : [select Id, AccountId, Client_ID__c, Reason, OwnerId, Owner.Type, Scheduled_Call__c, Product_Type__c from Case where Id in : touchpointCaseIdSet]){
                        system.debug(cs.OwnerId);
                        if((Test.isRunningTest() && !System.isBatch() && cs.Scheduled_Call__c != null && String.valueof(cs.OwnerId).startsWith('005')) || (cs.Scheduled_Call__c != null && String.valueof(cs.OwnerId).startsWith('005'))){
                            system.debug('**** before new event *** in update');
                            Event newEvent = new Event();
                            newEvent.RecordTypeId = calendarBlockerEventRecordTypeId;
                            newEvent.WhatId = cs.Id;
                            newEvent.OwnerId = cs.OwnerId;
                            //newEvent.DurationInMinutes = ((String.isNotBlank(cs.Reason) && cs.Reason.equalsIgnoreCase('CSC')) || (!cs.Product_Type__c.equalsIgnoreCase('Leads By Web') || !cs.Product_Type__c.equalsIgnoreCase('Lead Stream ATV'))) ? 60 : 30;
                            //newEvent.DurationInMinutes = ((String.isNotBlank(cs.Reason) && cs.Reason.equalsIgnoreCase('CSC')) || (!cs.Product_Type__c.contains('Lead'))) ? 60 : 30;
                            newEvent.DurationInMinutes = (String.isNotBlank(cs.Reason) && cs.Reason.equalsIgnoreCase('CS Touch Plan')) ? 30 : 60;
                            newEvent.StartDateTime = cs.Scheduled_Call__c;
                            newEvent.Subject = cs.Client_ID__c + ' | ' + cs.Reason;
                            newEvent.IsVisibleInSelfService = true;
                            newEvent.IsPrivate = false;
                            newEventBlocker.add(newEvent);
                        }
                    }
                    if(!newEventBlocker.isEmpty()){
                        insert newEventBlocker;
                    }
                }
                if(!deleteEventList.isEmpty()){
                    delete deleteEventList;
                }
            }

            /*if(!CaseTouchplanTriggerHandler.alreadyTriggered){
                CaseTouchplanTriggerHandler.afterUpdateLogic(trigger.newMap, trigger.oldMap);
            }*/

            Set<String> caseClosedStatusSet = new Set<String>();
            for(CaseStatus cs : [select MasterLabel from CaseStatus where IsClosed = true]){
                caseClosedStatusSet.add(cs.MasterLabel);
            }

            Map<Id, Double> yodlePathNextSectionOrder = new Map<Id, Double>();
            Map<Id, Touchplan_Section__c> yodlePathCurrentSection = new Map<Id, Touchplan_Section__c>();

            for(TP_Section_Auto_Evaluate_Criteria__c ypCriteria : [select Id, Touchplan_Section__r.Touchplan__c, Touchplan_Section__r.Section_Order__c, Touchplan_Section__r.Case__c, Touchplan_Section__r.Case__r.Status, Touchplan_Section__r.Set_Next_Section_Evaluation_Date__c from TP_Section_Auto_Evaluate_Criteria__c where Touchplan_Section__r.Case__c in : trigger.new]){
                Case currentCase = trigger.newMap.get(ypCriteria.Touchplan_Section__r.Case__c);
                Case oldCase = trigger.oldMap.get(ypCriteria.Touchplan_Section__r.Case__c);

                if(currentCase.Status != oldCase.Status && caseClosedStatusSet.contains((String)currentCase.get('Status'))){
                    yodlePathCurrentSection.put(ypCriteria.Touchplan_Section__r.Touchplan__c, ypCriteria.Touchplan_Section__r);
                    yodlePathNextSectionOrder.put(ypCriteria.Touchplan_Section__r.Touchplan__c, ypCriteria.Touchplan_Section__r.Section_Order__c + 1);
                }
            }

            List<Case> updateNextSectionCase = new List<Case>();
            List<Touchplan_Section__c> createYPSCaseListByCheckingBox = new List<Touchplan_Section__c>();
            List<Touchplan_Section__c> setYPSSectionAutoCreateCaseDate = new List<Touchplan_Section__c>();

            for(Touchplan_Section__c ypSection : [select Id, Case__c, Case__r.Status, Create_Case_Criteria__c, Case_Created__c, Case__r.Account.Marketo_ID__c, Trigger_Case_Creation_Date__c, Case__r.Evaluation_Date__c, Section_Order__c, Touchplan__c, Touchplan__r.Account__r.Live_Date__c from Touchplan_Section__c where Touchplan__c in :yodlePathNextSectionOrder.keySet() and Section_Order__c in :yodlePathNextSectionOrder.values()]){
                // ypCriteria.Touchplan_Section__r.Set_Next_Section_Evaluation_Date__c != null
                if(ypSection.Case_Created__c && yodlePathCurrentSection.get(ypSection.Touchplan__c).Set_Next_Section_Evaluation_Date__c != null && yodlePathNextSectionOrder.containsKey(ypSection.Touchplan__c) && yodlePathNextSectionOrder.get(ypSection.Touchplan__c) == ypSection.Section_Order__c){
                    ypSection.Case__r.Evaluation_Date__c = Date.today().addDays(Integer.valueof(yodlePathCurrentSection.get(ypSection.Touchplan__c).Set_Next_Section_Evaluation_Date__c));
                    updateNextSectionCase.add(ypSection.Case__r);
                }else if(!ypSection.Case_Created__c && yodlePathNextSectionOrder.containsKey(ypSection.Touchplan__c) && yodlePathNextSectionOrder.get(ypSection.Touchplan__c) == ypSection.Section_Order__c){
                    if((ypSection.Create_Case_Criteria__c == 'On Last Section Any Close Status' && caseClosedStatusSet.contains(yodlePathCurrentSection.get(ypSection.Touchplan__c).Case__r.Status)) || (ypSection.Create_Case_Criteria__c == 'On Last Section Complete Status' && yodlePathCurrentSection.get(ypSection.Touchplan__c).Case__r.Status == 'Complete') || (ypSection.Create_Case_Criteria__c == 'On Last Section Did Not Complete Status' && yodlePathCurrentSection.get(ypSection.Touchplan__c).Case__r.Status == 'Did Not Complete')){
                        ypSection.Case_Created__c = true;
                        createYPSCaseListByCheckingBox.add(ypSection);
                    }else if(String.isNotBlank(ypSection.Create_Case_Criteria__c) && ypSection.Create_Case_Criteria__c.contains('On Last Section Complete Status Create Case on Days Live:')){
                        ypSection.Trigger_Case_Creation_Date__c = ypSection.Touchplan__r.Account__r.Live_Date__c.addDays(Integer.valueof(ypSection.Create_Case_Criteria__c.remove('On Last Section Complete Status Create Case on Days Live:').trim()));
                        setYPSSectionAutoCreateCaseDate.add(ypSection);
                    }else if(String.isNotBlank(ypSection.Create_Case_Criteria__c) && ypSection.Create_Case_Criteria__c.contains('On Last Section Any Close Status Create Case on Days Live:')){
                        ypSection.Trigger_Case_Creation_Date__c = ypSection.Touchplan__r.Account__r.Live_Date__c.addDays(Integer.valueof(ypSection.Create_Case_Criteria__c.remove('On Last Section Any Close Status Create Case on Days Live:').trim()));
                        setYPSSectionAutoCreateCaseDate.add(ypSection);
                    }
                }
            }

            if(!updateNextSectionCase.isEmpty()){
                update updateNextSectionCase;
            }
            if(!createYPSCaseListByCheckingBox.isEmpty()){
                update createYPSCaseListByCheckingBox;
            }
            if(!setYPSSectionAutoCreateCaseDate.isEmpty()){
                update setYPSSectionAutoCreateCaseDate;
            }
        }
    }
}