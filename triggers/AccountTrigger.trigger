trigger AccountTrigger on Account (before insert, after insert, before update, after update, after delete) {
    if(Test.isRunningTest()){
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
    }

    Set<String> syncToMarketoSponsoredStatusSet = new Set<String>{'LIVE', 'PROVISIONING'};
    Set<String> syncToMarketoClientTypeSet = new Set<String>{'Local', 'Lighthouse'};
    Set<String> ybnTouchplanClientGroup = new Set<String>{'Hand & Stone - Master', 'Senior Helpers', 'Maaco'};
    Set<String> ybnTouchplanSupportedServiceLevels = new Set<String>{'Service Level A', 'Service Level A+', 'Service Level B', 'Service Level C'};

    List<Account> syncToMarketoWithId = new List<Account>();
    List<Account> syncToMarketoWithCliendID = new List<Account>();
    List<Account> syncToMarketoWithEmail = new List<Account>();
    List<Account> syncToMarketoWithEmailForTouchplan = new List<Account>();
    List<Account> syncToMarketoWithIdForTouchplan = new List<Account>();
    Boolean syncWithMarketo = Integration_Settings__c.getInstance().Sync_Account_Data_With_Marketo__c;

    Map<String, SFDC_Account_to_Marketo_Field_Mappings__c> sfdcAPINameSFDCMarketoFieldMappingMap = new Map<String, SFDC_Account_to_Marketo_Field_Mappings__c>();

    Set<String> wbnClientTypeSet = new Set<String>{'YBN', 'National Account', 'National Master Account'};
    Set<Id> wbnRecordTypeIdSet = new Set<Id>{Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId(), Schema.SObjectType.Account.getRecordTypeInfosByName().get('YBN Master Account').getRecordTypeId()};

    Id multiLocationParentRecordTypeID = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Multi Location Parent').getRecordTypeId();

    Map<String, String> mapAccountIdMlpId = new Map<String, String>();
    List<Id> parentsIdsToGetChilds = new List<Id>();

    Integer maxMlpId = 0;

    for(Account a : [SELECT Id, Multiple_Location_Parent_ID__c FROM Account WHERE RecordTypeId =: multiLocationParentRecordTypeID]){
        if(String.isNotBlank(a.Multiple_Location_Parent_ID__c)) {
            mapAccountIdMlpId.put(a.Id, a.Multiple_Location_Parent_ID__c);
            Integer currentMlpId = Integer.valueOf(a.Multiple_Location_Parent_ID__c.right(a.Multiple_Location_Parent_ID__c.length() - 4));
            if (currentMlpId > maxMlpId) {
                maxMlpId = currentMlpId;
            }
        }
    }

    system.debug('Trigger is before ' + Trigger.isBefore );
    system.debug('Trigger is insert ' + Trigger.isInsert );
    system.debug('Trigger is update ' + Trigger.isUpdate );
    system.debug('Trigger is delete ' + Trigger.isDelete );
    system.debug('trigger new ===> ' + Trigger.new);
    System.debug('trigger old ===> ' + Trigger.old);
    system.debug('mapAccountIdMlpId ===> ' + mapAccountIdMlpId);

    Set<Id> partnerParentAccountId = new Set<Id>();
    for(SFDC_Account_to_Marketo_Field_Mappings__c sfdcAccountMarketoFieldMap : SFDC_Account_to_Marketo_Field_Mappings__c.getAll().values()){
        if(sfdcAccountMarketoFieldMap.Sync_Field__c){
            sfdcAPINameSFDCMarketoFieldMappingMap.put(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c, sfdcAccountMarketoFieldMap);
        }
    }


    Set<String> zipCodeNeedPopIdSet = new Set<String>();

    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        for(Account record : trigger.New){

            if(String.isNotBlank(record.BillingPostalCode)){
                if(trigger.isInsert){
                    zipCodeNeedPopIdSet.add(record.BillingPostalCode);
                }else if(trigger.isUpdate && String.isNotBlank(record.BillingPostalCode) && String.isBlank(record.Population_Data__c)){//record.BillingPostalCode != trigger.oldMap.get(record.Id).BillingPostalCode){
                    zipCodeNeedPopIdSet.add(record.BillingPostalCode);
                }
            }
            if(record.RecordTypeId == multiLocationParentRecordTypeID && String.isBlank(record.Multiple_Location_Parent_ID__c)){
                maxMlpId++;
                record.Multiple_Location_Parent_ID__c = 'MLP-' + maxMlpId;
                mapAccountIdMlpId.put(record.Id, record.Multiple_Location_Parent_ID__c);
                parentsIdsToGetChilds.add(record.Id);
            }

            if(mapAccountIdMlpId.containsKey(record.ParentId)){

                record.MLP_Group_ID__c = mapAccountIdMlpId.get(record.ParentId);

            }

        }


    }

    Map<String, Id> zipCodeToPopIdMap = new Map<String, Id>();

    if(!zipCodeNeedPopIdSet.isEmpty()){
        for(Population_Data__c record : [select Id, Zip_Code__c from Population_Data__c where Zip_Code__c in : zipCodeNeedPopIdSet]){
            zipCodeToPopIdMap.put(record.Zip_Code__c, record.Id);
        }
    }

    if(trigger.isBefore && trigger.isInsert){
        for(Account record : trigger.New){
            if(syncWithMarketo && syncToMarketoClientTypeSet.contains(record.Client_Type__c) && String.isNotBlank(record.Email__c) && (String.isBlank(record.Status__c) || syncToMarketoSponsoredStatusSet.contains(record.Status__c))){
                record.Sync_to_Marketo__c = true;
            }
            if(syncWithMarketo && !record.Sync_to_Marketo__c && wbnClientTypeSet.contains(record.Client_Type__c) && String.isNotBlank(record.Email__c) && wbnRecordTypeIdSet.contains(record.RecordTypeId)){
                record.Sync_to_Marketo__c = true;
            }
            if(String.isNotBlank(record.BillingPostalCode) && zipCodeToPopIdMap.containsKey(record.BillingPostalCode)){
                record.Population_Data__c = zipCodeToPopIdMap.get(record.BillingPostalCode);
            }
        }
    }else if(trigger.isBefore && trigger.isUpdate){
        Map<Id, Id> cppChildAccountIdNeedSalesRepMap = new Map<Id, Id>(); // <child account Id, parent Id>
        Set<Id> accountIdForChangedNextTPDateSet = new Set<Id>();
        Map<String, Id> emailForTouchplanAccountIdMap = new Map<String, Id>(); // Won't catch all but it will catch most. Especially if data loaded. 

        for(Account record : trigger.New){
            Account oldRecord = trigger.oldMap.get(record.Id);

            if(oldRecord.Multi_Location_Account__c && UserInfo.getUserId() == '005320000053VLfAAM' && record.ParentId != oldRecord.ParentId && String.isBlank(record.ParentId)){
                record.ParentId = oldRecord.ParentId;
            }

            if(mapAccountIdMlpId.containsKey(record.ParentId)){
                record.MLP_Group_ID__c = mapAccountIdMlpId.get(record.ParentId);
            }
            else {
                record.MLP_Group_ID__c = '';
            }

            if(record.Sync_to_Marketo__c && String.isBlank(record.Email__c)){
                record.Email__c.addError('Email is required once an Account has been synced to Marketo!');
            }

            if(syncWithMarketo && record.Status__c != 'OFF' && !record.Sync_to_Marketo__c && syncToMarketoClientTypeSet.contains(record.Client_Type__c) && String.isNotBlank(record.Email__c) && (String.isBlank(record.Status__c) || syncToMarketoSponsoredStatusSet.contains(record.Status__c))){
                record.Sync_to_Marketo__c = true;
            }

            //YBN SPECIFIC, commenting out until done!
            if(syncWithMarketo && !record.Sync_to_Marketo__c && wbnClientTypeSet.contains(record.Client_Type__c) && String.isNotBlank(record.Email__c) && wbnRecordTypeIdSet.contains(record.RecordTypeId)){
                record.Sync_to_Marketo__c = true;
            }

            if(record.Client_Type__c == 'Partner' && String.isNotBlank(record.ParentId) && String.isBlank(record.Partner_Salesrep__c)){
                cppChildAccountIdNeedSalesRepMap.put(record.Id, record.ParentId);
            }

            if(String.isNotBlank(record.BillingPostalCode) && zipCodeToPopIdMap.containsKey(record.BillingPostalCode)){
                record.Population_Data__c = zipCodeToPopIdMap.get(record.BillingPostalCode);
            }

            if(record.Next_Scheduled_Touchpoint__c != oldRecord.Next_Scheduled_Touchpoint__c && record.Next_Scheduled_Touchpoint__c != null && String.isNotBlank(record.Product_Type_Transactional__c) && (record.Product_Type_Transactional__c.equalsIgnoreCase('Leads By Web') || record.Product_Type_Transactional__c.equalsIgnoreCase('Lead Stream ATV'))){
                accountIdForChangedNextTPDateSet.add(record.Id);
            }

            if(record.Sync_to_Marketo__c && String.isNotBlank(record.Email_for_Touchplan__c) && String.isNotBlank(record.Marketo_ID__c) && String.isNotBlank(record.YBN_Relationship__c) && ybnTouchplanClientGroup.contains(record.YBN_Relationship__c) && String.isNotBlank(record.Client_Type__c) && wbnClientTypeSet.contains(record.Client_Type__c) && wbnRecordTypeIdSet.contains(record.RecordTypeId) && (String.isBlank(record.Multi_Location_Owner_Primary_CID__c) || record.Primary_Multi_Location_Owner_For_TP__c) && ybnTouchplanSupportedServiceLevels.contains(record.Individual_Location_Service_Level__c)){
                if(record.Email_for_Touchplan__c != oldRecord.Email_for_Touchplan__c && (String.isBlank(record.Status__c) || !record.Status__c.equalsIgnoreCase('OFF'))){ // Only will do the validate on Email for Touchplan change because that can't be changed by the sync. It has to be done by a person. Other criteria can be changed by sync and we don't want to error out on syncs.
                    emailForTouchplanAccountIdMap.put(record.Email_for_Touchplan__c, record.Id);
                }
                if(record.Email__c.equalsIgnoreCase(record.Email_for_Touchplan__c)){
                    record.Marketo_ID_for_Touchplan__c = record.Marketo_ID__c;
                }else if(String.isNotBlank(record.Marketo_ID_for_Touchplan__c) && record.Marketo_ID__c.equalsIgnoreCase(record.Marketo_ID_for_Touchplan__c) && !record.Email__c.equalsIgnoreCase(record.Email_for_Touchplan__c)){
                    record.Marketo_ID_for_Touchplan__c = '';
                }else if(String.isNotBlank(record.Marketo_ID_for_Touchplan__c) && String.isBlank(record.Email_for_Touchplan__c)){
                    record.Marketo_ID_for_Touchplan__c = '';
                }
            }else{
                record.Marketo_ID_for_Touchplan__c = '';
            }
        }

        if(!cppChildAccountIdNeedSalesRepMap.isEmpty()){
            Map<Id, Opportunity> parentIdOpportunityMap = new Map<Id, Opportunity>();
            for(Opportunity opp : [select Id, AccountId, Owner.Name from Opportunity where RecordType.Name = 'CPP - Initial Transaction' and IsWon = true and AccountId in: cppChildAccountIdNeedSalesRepMap.values()]){
                parentIdOpportunityMap.put(opp.AccountId, opp);
            }
            for(String acctId : cppChildAccountIdNeedSalesRepMap.keySet()){
                if(parentIdOpportunityMap.containsKey(cppChildAccountIdNeedSalesRepMap.get(acctId))){
                    trigger.newMap.get(acctId).Partner_Salesrep__c = parentIdOpportunityMap.get(cppChildAccountIdNeedSalesRepMap.get(acctId)).Owner.Name;
                }
            }
        }

        if(!emailForTouchplanAccountIdMap.isEmpty()){
            for(Account record : [select Id, Email_for_Touchplan__c from Account where Id not in :emailForTouchplanAccountIdMap.values() and Email_for_Touchplan__c in: emailForTouchplanAccountIdMap.keySet() and Status__c != 'OFF' and Sync_to_Marketo__c = true and YBN_Relationship__c in: ybnTouchplanClientGroup and Client_Type__c in :wbnClientTypeSet and RecordTypeId in :wbnRecordTypeIdSet and Individual_Location_Service_Level__c in :ybnTouchplanSupportedServiceLevels and (Multi_Location_Owner_Primary_CID__c = '' or Primary_Multi_Location_Owner_For_TP__c = true)]){
                trigger.newMap.get(emailForTouchplanAccountIdMap.get(record.Email_for_Touchplan__c)).Email_for_Touchplan__c.addError(Label.EmailForTouchplanDuplicateError);
            }
        }

        if(!accountIdForChangedNextTPDateSet.isEmpty()){
            for(Account acct : [select Id, (select Id, CaseNumber, Scheduled_Call__c, CreatedDate, IsClosed from Cases where Reason = 'CS Touch Plan' and RecordType.Name = 'Outbound Call' order by CreatedDate DESC limit 1) from Account where Id in : accountIdForChangedNextTPDateSet]){
                if(!acct.Cases.isEmpty()){
                    Account beforeUpdateValue = trigger.newMap.get(acct.Id);
                    Case caseRecord = acct.Cases[0];

                    if(!caseRecord.isClosed && beforeUpdateValue.Next_Scheduled_Touchpoint__c != caseRecord.Scheduled_Call__c){// && (caseRecord.Scheduled_Call__c == null || caseRecord.Scheduled_Call__c.date() != Date.today())){
                        beforeUpdateValue.Next_Scheduled_Touchpoint__c.addError(Label.OpenCSTouchPlanError + ' Case #' + caseRecord.CaseNumber);
                    }else if(caseRecord.isClosed && beforeUpdateValue.Next_Scheduled_Touchpoint__c <= caseRecord.CreatedDate.addDays(30)){
                        beforeUpdateValue.Next_Scheduled_Touchpoint__c.addError(Label.CSTouchpoint30DayError);
                    }
                }
            }
        }
    }else if(trigger.isAfter && trigger.isInsert){
        //List<Account> assignTouchplanToAccount = new List<Account>();
        for (Account record : trigger.New) {
            if(String.isNotBlank(record.ParentId) && record.Status__c == 'LIVE'){
                partnerParentAccountId.add(record.ParentId);
            }
            if(record.Sync_to_Marketo__c){
                if(String.isNotBlank(record.Marketo_ID__c)){
                    syncToMarketoWithId.add(record);
                }else if(String.isNotBlank(record.Client_ID__c) && String.isBlank(record.Marketo_ID__c)){
                    syncToMarketoWithCliendID.add(record);
                }else if(String.isNotBlank(record.Email__c) && String.isBlank(record.Marketo_ID__c)){
                    syncToMarketoWithEmail.add(record);
                }
            }

            /*if(record.Status__c == 'LIVE'){
                assignTouchplanToAccount.add(record);
            }*/
        }

        /*if(!assignTouchplanToAccount.isEmpty()){
            AccountTouchplanTriggerHandler.afterInsertLogic(assignTouchplanToAccount);
        }*/
    }else if (trigger.isAfter && trigger.isUpdate) {
        //AccountTouchplanTriggerHandler.afterUpdateLogic(trigger.newMap, trigger.oldMap);
        Id calendarBlockerEventRecordTypeId = Schema.SObjectType.Event.getRecordTypeInfosByName().get('Calendar Blocker').getRecordTypeId();

        SF2YLFieldMapping__c sf2YLfieldMap = SF2YLFieldMapping__c.getValues('Account');

        // List of fields to monitor
        List<String> monitorChangeFieldList = (sf2YLfieldMap != null) ? sf2YLfieldMap.Fields_to_Monitor_Changes__c.split(';') : new List<String>();
        // Fields to send to Queue
        List<String> queueSyncFieldList = (sf2YLfieldMap != null) ? sf2YLfieldMap.Fields_to_Return__c.split(';') : new List<String>();

        // Create Map of Account IDs with montiored changed fields to push to Golden Nugget
        Map<Id, List<String>> inboundAccountIdChangedFieldsMap = new Map<Id, List<String>>();

        //List<Account> assignTouchplanToAccount = new List<Account>();
        Map<String, Event> newEventCalendarBlockerMap = new Map<String, Event>();

        List<Marketo_Lead_Merge__c> marketoLeadMergeList = new List<Marketo_Lead_Merge__c>();

        Set<Id> accountIdSetForAccountMLSStatus = new Set<Id>();


        for (Account record : trigger.New) {
            Account oldRecord = trigger.oldMap.get(record.Id);

            if(record.RecordTypeId == multiLocationParentRecordTypeID && (record.Multiple_Location_Parent_ID__c != oldRecord.Multiple_Location_Parent_ID__c)){
                parentsIdsToGetChilds.add(record.Id);
            }

            if(String.isNotBlank(record.ParentId) && record.Status__c != oldRecord.Status__c && (record.Status__c == 'LIVE' || oldRecord.Status__c == 'LIVE')){
                partnerParentAccountId.add(record.ParentId);
            }

            if(record.Status__c != oldRecord.Status__c){
                accountIdSetForAccountMLSStatus.add(record.Id);
            }

            /*if(record.Status__c == 'LIVE' && record.Days_Since_Live__c <= 5 && (oldRecord.Status__c != record.Status__c || oldRecord.Monthly_Budget__c != record.Monthly_Budget__c || oldRecord.Budget_Ads__c != record.Budget_Ads__c) && !record.Touchplan_Created__c && !AccountTouchplanTriggerHandler.alreadTriggered){
                assignTouchplanToAccount.add(record);
            }*/

            if(record.Sync_to_Marketo__c /*|| record.Sync_to_Marketo__c != oldRecord.Sync_to_Marketo__c*/){
                if(String.isNotBlank(record.Marketo_ID__c) && record.Marketo_ID__c == oldRecord.Marketo_ID__c){
                    if(!oldRecord.Sync_to_Marketo__c){
                        syncToMarketoWithId.add(record);
                    }else{
                        for(String sfdcAccountMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingMap.keySet()){
                            if(record.get(sfdcAccountMarketoFieldMap) != oldRecord.get(sfdcAccountMarketoFieldMap)){
                                syncToMarketoWithId.add(record);

                                if(String.isNotBlank(record.Marketo_ID_For_Touchplan__c) && !record.Marketo_ID__c.equalsIgnoreCase(record.Marketo_ID_For_Touchplan__c) && String.isNotBlank(record.YBN_Relationship__c) && ybnTouchplanClientGroup.contains(record.YBN_Relationship__c)){
                                    syncToMarketoWithIdForTouchplan.add(record);
                                }

                                break;
                            }
                        }
                    }
                }else if(String.isNotBlank(record.Client_ID__c) && String.isBlank(record.Marketo_ID__c)){
                    if(!oldRecord.Sync_to_Marketo__c){
                        syncToMarketoWithCliendID.add(record);
                    }else{
                        for(String sfdcAccountMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingMap.keySet()){
                            if(record.get(sfdcAccountMarketoFieldMap) != oldRecord.get(sfdcAccountMarketoFieldMap)){
                                syncToMarketoWithCliendID.add(record);
                                break;
                            }
                        }
                    }
                }else if(String.isNotBlank(record.Email__c) && String.isBlank(record.Marketo_ID__c)){
                    if(!oldRecord.Sync_to_Marketo__c){
                        syncToMarketoWithEmail.add(record);
                    }else{
                        for(String sfdcAccountMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingMap.keySet()){
                            if(record.get(sfdcAccountMarketoFieldMap) != oldRecord.get(sfdcAccountMarketoFieldMap)){
                                syncToMarketoWithEmail.add(record);
                                break;
                            }
                        }
                    }
                }


                // FOR WBN EMAIL FOR TOUCHPLAN
                if(record.Sync_to_Marketo__c && String.isNotBlank(record.Status__c) && !record.Status__c.equalsIgnoreCase('OFF') && String.isNotBlank(record.Marketo_ID__c) && String.isNotBlank(record.YBN_Relationship__c) && ybnTouchplanClientGroup.contains(record.YBN_Relationship__c) && wbnClientTypeSet.contains(record.Client_Type__c) && wbnRecordTypeIdSet.contains(record.RecordTypeId) && (String.isBlank(record.Multi_Location_Owner_Primary_CID__c) || record.Primary_Multi_Location_Owner_For_TP__c) && ybnTouchplanSupportedServiceLevels.contains(record.Individual_Location_Service_Level__c)){
                    if(String.isBlank(record.Marketo_ID_for_Touchplan__c) && !record.Email__c.equalsIgnoreCase(record.Email_for_Touchplan__c) && String.isNotBlank(record.Email_for_Touchplan__c)){
                        syncToMarketoWithEmailForTouchplan.add(record);
                    }
                }

                if(String.isNotBlank(oldRecord.Marketo_ID_For_Touchplan__c) && String.isNotBlank(record.Marketo_ID__c) && record.Marketo_ID_For_Touchplan__c != oldRecord.Marketo_ID_For_Touchplan__c && oldRecord.Marketo_ID_For_Touchplan__c != record.Marketo_ID__c){
                    Marketo_Lead_Merge__c mlm = new Marketo_Lead_Merge__c();
                    mlm.Account__c = record.Id;
                    mlm.Winning_Marketo_ID__c = record.Marketo_ID__c;
                    mlm.Losing_Marketo_ID__c = oldRecord.Marketo_ID_For_Touchplan__c;
                    marketoLeadMergeList.add(mlm);
                }
                // END  
            }

            if(!marketoLeadMergeList.isEmpty()){
                insert marketoLeadMergeList;
            }

            if (!System.isFuture()) {
                // Create a list of all fields that changed that we are monitoring for each record
                List<String> changedFieldsList = new List<String>();
                for(String field : monitorChangeFieldList){
                    if(record.get(field) != oldRecord.get(field)){
                        changedFieldsList.add(field);
                    }
                }
                if(!changedFieldsList.isEmpty()){
                    // Map the monitored changed field list for each record
                    inboundAccountIdChangedFieldsMap.put(record.Id, changedFieldsList);
                }
            }

            if(!CaseObjectHelper.alreadyFiredCalendarBlockerForCase && (record.Next_Scheduled_Touchpoint__c != oldRecord.Next_Scheduled_Touchpoint__c || record.IMS_Rep__c != oldRecord.IMS_Rep__c) && String.isNotBlank(record.IMS_Rep__c) && record.Next_Scheduled_Touchpoint__c != null && String.isNotBlank(record.Product_Type_Transactional__c) && (record.Product_Type_Transactional__c.equalsIgnoreCase('Leads By Web') || record.Product_Type_Transactional__c.equalsIgnoreCase('Lead Stream ATV'))){
                Event newEvent = new Event();
                newEvent.RecordTypeId = calendarBlockerEventRecordTypeId;
                newEvent.WhatId = record.Id;
                newEvent.OwnerId = record.IMS_Rep__c;
                newEvent.DurationInMinutes = 30;
                newEvent.StartDateTime = record.Next_Scheduled_Touchpoint__c;
                newEvent.Subject = record.Client_ID__c + ' | CS Touch Plan';
                newEvent.IsVisibleInSelfService = true;
                newEvent.IsPrivate = false;
                newEvent.ReminderDateTime = newEvent.StartDateTime.addMinutes(-15);
                newEvent.IsReminderSet = true;
                newEventCalendarBlockerMap.put(newEvent.Subject, newEvent);
            }
        }

        if(parentsIdsToGetChilds.size()>0){
            List<Account> childrenToUpdate = new List<Account>();
            childrenToUpdate = [
                    SELECT  Id,
                            ParentId
                    FROM    Account
                    WHERE   ParentId in :parentsIdsToGetChilds
            ];
            system.debug('childrenToUpdate before ===> ' + childrenToUpdate);
            for(Account a : childrenToUpdate){
                if(mapAccountIdMlpId.containsKey(a.ParentId)){
                    a.MLP_Group_ID__c = mapAccountIdMlpId.get(a.ParentId);
                }
                else {
                    a.MLP_Group_ID__c = '';
                }

            }
            system.debug('childrenToUpdate after ===> ' + childrenToUpdate);

            update childrenToUpdate;
        }

        if(!newEventCalendarBlockerMap.isEmpty()){
            for(Event e : [select WhatId, Id, Subject from Event where Subject in: newEventCalendarBlockerMap.keySet()]){
                if(newEventCalendarBlockerMap.containsKey(e.Subject)){
                    newEventCalendarBlockerMap.get(e.Subject).Id = e.Id;
                }
            }
            upsert newEventCalendarBlockerMap.values();
        }

        /*if(!assignTouchplanToAccount.isEmpty()){
            AccountTouchplanTriggerHandler.afterInsertLogic(assignTouchplanToAccount);
        }*/

        if (!inboundAccountIdChangedFieldsMap.isEmpty()) {
            if (inboundAccountIdChangedFieldsMap.size() <= 50) {
                IntegrationHelperClass.inbouldSalesUpdateAccountToQueue(JSON.serialize(inboundAccountIdChangedFieldsMap), queueSyncFieldList);
            }
            // Salesforce doesn't allow a batch to call a batch. If the changes on a Lead was due to a batch, it will error out. The batch should call and execute the batch below from it's finally block if necessary.
            else if (!System.isBatch()) {
                Database.executeBatch(new SalesforceToQueueBatch(JSON.serialize(inboundAccountIdChangedFieldsMap), 'Account', queueSyncFieldList, 'update-account'), 75);
            }
        }

        if(!accountIdSetForAccountMLSStatus.isEmpty()){
            List<Account_MLS__c> updateAccountMLSList = new List<Account_MLS__c>();
            for(Account_MLS__c acctMLS : [select Id, Account_Status__c, Account__c from Account_MLS__c where Account__c in : accountIdSetForAccountMLSStatus]){
                acctMLS.Account_Status__c = trigger.newMap.get(acctMLS.Account__c).Status__c;
                updateAccountMLSList.add(acctMLS);
            }
            if(!updateAccountMLSList.isEmpty()){
                update updateAccountMLSList;
            }
        }
    }

    if(Trigger.isAfter && Trigger.isDelete){
        List<String> mlpIds = new List<String>();

        for(Account a : Trigger.old){

            //if(a.RecordTypeId == multiLocationParentRecordTypeID){
                mlpIds.add(a.Multiple_Location_Parent_ID__c);
            //}
        }



        if(mlpIds.size()>0){
            List<Account> childrenToUpdate = new List<Account>();
            childrenToUpdate = [
                    SELECT  Id,
                            ParentId
                    FROM    Account
                    WHERE   MLP_Group_ID__c IN :mlpIds
            ];

            for(Account a : childrenToUpdate){
                a.MLP_Group_ID__c = '';
            }

            update childrenToUpdate;
        }

    }

    if(!partnerParentAccountId.isEmpty()){
        CPPAccountHelper.currentQuarterChildAccountTrueUp([select Id, (select Id from ChildAccounts where Status__c = 'LIVE' and (NOT Name like '%TEST')) from Account where RecordType.Name = 'Partner Master Account' and Partner_Status__c = 'Customer' and Id in :partnerParentAccountId]);
    }

    if(!syncToMarketoWithId.isEmpty() && syncWithMarketo && !system.isFuture() && !system.isBatch()){
        MarketoSyncServiceFuture.createUpdateLeads('updateOnly', 'id', JSON.serialize(syncToMarketoWithId), false, '');
    }

    if(!syncToMarketoWithIdForTouchplan.isEmpty() && syncWithMarketo && !system.isFuture() && !system.isBatch()){
        MarketoSyncServiceFuture.createUpdateLeadForEmailForTouchplanFuture('updateOnly', 'id', JSON.serialize(syncToMarketoWithIdForTouchplan), false, '');
    }

    if(!syncToMarketoWithEmailForTouchplan.isEmpty() && syncWithMarketo && !system.isFuture() && !system.isBatch()){
        MarketoSyncServiceFuture.createUpdateLeadForEmailForTouchplanFuture('createDuplicate', 'email', JSON.serialize(syncToMarketoWithEmailForTouchplan), false, '');
    }

    /*if(!AccountObjectHelper.accountObjectHelperAlreadyFired && (!syncToMarketoWithCliendID.isEmpty() || !syncToMarketoWithEmail.isEmpty())){
        if(!syncToMarketoWithCliendID.isEmpty() && syncWithMarketo && !system.isFuture() && !system.isBatch()){
            MarketoSyncServiceFuture.createUpdateLeads('', 'Client_ID', JSON.serialize(syncToMarketoWithCliendID), false, '');
        }
        if(!syncToMarketoWithEmail.isEmpty() && syncWithMarketo && !system.isFuture() && !system.isBatch()){
            MarketoSyncServiceFuture.createUpdateLeads('', 'email', JSON.serialize(syncToMarketoWithEmail), false, '');
        }
        AccountObjectHelper.accountObjectHelperAlreadyFired = true;
    }*/
    if(!AccountObjectHelper.accountObjectHelperAlreadyFired && (!syncToMarketoWithCliendID.isEmpty() || !syncToMarketoWithEmail.isEmpty()) && syncWithMarketo && !system.isFuture() && !system.isBatch()){
        List<Account> acctListToMarketo = new List<Account>();
        acctListToMarketo.addAll(syncToMarketoWithCliendID);
        acctListToMarketo.addAll(syncToMarketoWithEmail);
        MarketoLeadIdSFAccountMapper.mapSFAccountToMarketoLead(JSON.serialize(acctListToMarketo));
        AccountObjectHelper.accountObjectHelperAlreadyFired = true;
    }
}