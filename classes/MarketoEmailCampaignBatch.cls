public class MarketoEmailCampaignBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {
    
    private String query;
    private String parentTemplateId;
    
    public MarketoEmailCampaignBatch(String passedQuery, String passedParentTemplateId) {
        query = passedQuery;
        parentTemplateId = passedParentTemplateId;
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        system.debug(scope);
        system.debug(parentTemplateId);
        Marketo_Email_Campaign__c parentTemplate = [select Id, Name, Custom_Automation_API_Reference__c, Use_Marketo_ID_For_Touchplan__c, Marketo_Campaign_ID__c, Account_ID_Field_Name__c, Marketo_Request_Sent__c, Criteria__c, Date_Field_to_Update_on_Request_Sent__c, Create_Case__c, New_Record_Default_Values__c from Marketo_Email_Campaign__c where Id =: parentTemplateId];
        Boolean updateScopeDateField = false;

        Map<Id, Marketo_Email_Campaign__c> marketoEmailRecordMap = new Map<Id, Marketo_Email_Campaign__c>();
		Map<Id, Case> accountIdNewCaseMap = new Map<Id, Case>();

        List<DebugInfo__c> debugInfoList = new List<DebugInfo__c>();

        List<String> marketoLeadIdList = new List<String>();
        Set<String> failedMarketoIdSet = new Set<String>();

        for(SObject record : scope){
            Account acct = new Account();
            if(String.isBlank(parentTemplate.Account_ID_Field_Name__c) || parentTemplate.Account_ID_Field_Name__c.equalsIgnoreCase('id') || (query.containsIgnoreCase('Custom_Automation__c') && String.isNotBlank(parentTemplate.Custom_Automation_API_Reference__c) && parentTemplate.Custom_Automation_API_Reference__c.equalsIgnoreCase('TORCHX_MONTHLY_REVIEW_EVERY_30'))){
                acct = (Account)record;
            }else{
                acct = (Account)record.getSObject(parentTemplate.Account_ID_Field_Name__c);
            }
            Marketo_Email_Campaign__c mec = parentTemplate.clone(false, true);
            mec.Account__c = acct.Id;
            mec.Marketo_Request_Sent__c = true;
            mec.Marketo_Email_Campaign_Template__c = parentTemplate.Id;
			marketoEmailRecordMap.put(acct.Id, mec);
            if(parentTemplate.Use_Marketo_ID_For_Touchplan__c){
                marketoLeadIdList.add(acct.Marketo_ID_For_Touchplan__c);
            }else{
                marketoLeadIdList.add(acct.Marketo_ID__c);
            }

            if(parentTemplate.Create_Case__c && String.isNotBlank(parentTemplate.New_Record_Default_Values__c)){
				Case newCase = (Case)JSON.deserialize(parentTemplate.New_Record_Default_Values__c, Case.class);
				newCase.AccountId = acct.Id;
				accountIdNewCaseMap.put(acct.Id, newCase);
			}

            if(String.isNotBlank(mec.Date_Field_to_Update_on_Request_Sent__c)){
                updateScopeDateField = true;
                record.put(mec.Date_Field_to_Update_on_Request_Sent__c, Date.today());
            }

            if(marketoLeadIdList.size() == 100){
                String responseData = MarketoSyncService.requestCampaignWithResponse(parentTemplate.Marketo_Campaign_ID__c, marketoLeadIdList, new List<MarketoSyncService.MarketoSyncServiceToken>());

                Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(responseData);
                //system.debug(responseMap);
                //system.debug(responseMap.get('success') == false);
                if(responseMap.get('success') == false){
                    DebugInfo__c di = new DebugInfo__c();
                    di.DebugData__c = JSON.serializePretty('Campaign Id: ' + parentTemplate.Id + ' | Request: ' + marketoLeadIdList + ' | Response: ' + responseData);
                    debugInfoList.add(di);

                    List<Object> errorList = (List<Object>)responseMap.get('errors');
                    for(Integer i = 0; i < errorList.size(); i++){
                        Map<String, Object> errorMap = (Map<String, Object>)errorList[i];
                        if(String.valueof(errorMap.get('code')) == '1004'){
                            system.debug(String.valueof(errorMap.get('message')));
                            Set<String> failedMarketoIDs = (Set<String>)JSON.deserialize(String.valueof(errorMap.get('message')).remove('Lead').remove('not found').trim(), Set<String>.class);
                            system.debug(failedMarketoIDs);

                            Set<String> marketoLeadIdSet = new Set<String>();
                            marketoLeadIdSet.addAll(marketoLeadIdList);
                            marketoLeadIdSet.removeAll(failedMarketoIDs);

                            marketoLeadIdList.clear();
                            marketoLeadIdList.addAll(marketoLeadIdSet);

                            responseData = MarketoSyncService.requestCampaignWithResponse(parentTemplate.Marketo_Campaign_ID__c, marketoLeadIdList, new List<MarketoSyncService.MarketoSyncServiceToken>());

                            DebugInfo__c diRetry = new DebugInfo__c();
                            diRetry.DebugData__c = JSON.serializePretty('Retry | Campaign Id: ' + parentTemplate.Id + ' | Request: ' + marketoLeadIdList + ' | Response: ' + responseData);
                            debugInfoList.add(diRetry);

                            failedMarketoIdSet.addAll(failedMarketoIDs);
                        }
                    }
                }

                marketoLeadIdList.clear();
            }

        }

        if(!marketoLeadIdList.isEmpty()){
		    String responseData = MarketoSyncService.requestCampaignWithResponse(parentTemplate.Marketo_Campaign_ID__c, marketoLeadIdList, new List<MarketoSyncService.MarketoSyncServiceToken>());
            Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(responseData);
            if(responseMap.get('success') == false){
                DebugInfo__c di = new DebugInfo__c();
                di.DebugData__c = JSON.serializePretty('Campaign Id: ' + parentTemplate.Id + ' | Request: ' + marketoLeadIdList + ' | Response: ' + responseData);
                debugInfoList.add(di);

                List<Object> errorList = (List<Object>)responseMap.get('errors');
                for(Integer i = 0; i < errorList.size(); i++){
                    Map<String, Object> errorMap = (Map<String, Object>)errorList[i];
                    if(String.valueof(errorMap.get('code')) == '1004'){
                        system.debug(String.valueof(errorMap.get('message')));
                        Set<String> failedMarketoIDs = (Set<String>)JSON.deserialize(String.valueof(errorMap.get('message')).remove('Lead').remove('not found').trim(), Set<String>.class);
                        system.debug(failedMarketoIDs);

                        Set<String> marketoLeadIdSet = new Set<String>();
                        marketoLeadIdSet.addAll(marketoLeadIdList);
                        marketoLeadIdSet.removeAll(failedMarketoIDs);

                        marketoLeadIdList.clear();
                        marketoLeadIdList.addAll(marketoLeadIdSet);

                        responseData = MarketoSyncService.requestCampaignWithResponse(parentTemplate.Marketo_Campaign_ID__c, marketoLeadIdList, new List<MarketoSyncService.MarketoSyncServiceToken>());

                        DebugInfo__c diRetry = new DebugInfo__c();
                        diRetry.DebugData__c = JSON.serializePretty('Retry | Campaign Id: ' + parentTemplate.Id + ' | Request: ' + marketoLeadIdList + ' | Response: ' + responseData);
                        debugInfoList.add(diRetry);

                        failedMarketoIdSet.addAll(failedMarketoIDs);
                    }
                }
            }
        }

        List<Account> failedToSyncAccountList = new List<Account>();
        if(parentTemplate.Use_Marketo_ID_For_Touchplan__c){
            for(Account record : [select Id, Failed_to_Sync_to_Marketo__c from Account where Marketo_ID_For_Touchplan__c in: failedMarketoIdSet]){
                record.Failed_to_Sync_to_Marketo__c = true;
                failedToSyncAccountList.add(record);
                if(!accountIdNewCaseMap.isEmpty()){
                    accountIdNewCaseMap.remove(record.Id);
                }
                marketoEmailRecordMap.remove(record.Id);
            }
        }else{
            for(Account record : [select Id, Failed_to_Sync_to_Marketo__c from Account where Marketo_ID__c in: failedMarketoIdSet]){
                record.Failed_to_Sync_to_Marketo__c = true;
                failedToSyncAccountList.add(record);
                if(!accountIdNewCaseMap.isEmpty()){
                    accountIdNewCaseMap.remove(record.Id);
                }
                marketoEmailRecordMap.remove(record.Id);
            }
        }

        if(!failedToSyncAccountList.isEmpty()){
            Database.update(failedToSyncAccountList, false);
        }

        if(!debugInfoList.isEmpty()){
            insert debugInfoList;
        }

        if(!accountIdNewCaseMap.isEmpty()){
			Database.insert(accountIdNewCaseMap.values(), false);
			for(Marketo_Email_Campaign__c mec : marketoEmailRecordMap.values()){
				mec.Case__c = accountIdNewCaseMap.get(mec.Account__c).Id;
			}

            if(query.containsIgnoreCase('Custom_Automation__c') && String.isNotBlank(parentTemplate.Custom_Automation_API_Reference__c) && parentTemplate.Custom_Automation_API_Reference__c.equalsIgnoreCase('TORCHX_MONTHLY_REVIEW_EVERY_30')){
                List<Custom_Automation__c> updateCustomAutomationList = new List<Custom_Automation__c>();

                for(Custom_Automation__c ca : [select Id, Automation_Status__c from Custom_Automation__c where Account__c in :accountIdNewCaseMap.keySet() and Automation_Status__c = 'Scheduled' and Automation_Trigger_Date__c = TODAY and Automation_Type_API_Name_External_ID__c = 'TORCHX_MONTHLY_REVIEW_EVERY_30']){
                    ca.Automation_Status__c = 'Completed';
                    updateCustomAutomationList.add(ca);
                }

                if(!updateCustomAutomationList.isEmpty()){
                    Database.update(updateCustomAutomationList, false);
                }
            }
		}

        insert marketoEmailRecordMap.values();

        if(updateScopeDateField){
            Database.update(scope, false);
        }
    }
    
    public void finish(Database.BatchableContext BC) {
        
    }
        
}