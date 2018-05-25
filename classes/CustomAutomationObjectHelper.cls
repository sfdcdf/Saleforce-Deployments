public without sharing class CustomAutomationObjectHelper {
    private static Map<Id, Account> torchxAccountMap = new Map<Id, Account>();
    private static Map<Id, Account> lbwAccountMap = new Map<Id, Account>();

    private static Map<Id, Account> accountTORCHXandLBWMap = new Map<Id, Account>();

    private static Set<Id> accountIdSet = new Set<Id>();

    public static void afterInsert(Map<Id, Custom_Automation__c> newMapValues){
        accountIdSet = relatedAccountIdList(newMapValues.values());

        if(accountIdSet.isEmpty()){
            return;
        }

        accountTORCHXandLBWMap = AccountObjectHelper.getTORCHXandLBWAccountMap(accountIdSet);

        for(Account acct : accountTORCHXandLBWMap.values()){
            if(acct.Product_Type_Transactional__c.containsIgnoreCase('Leads By Web') || acct.Product_Type_Transactional__c.containsIgnoreCase('Lead Stream ATV')){
                lbwAccountMap.put(acct.Id, acct);
            }else if(acct.Product_Type_Transactional__c.containsIgnoreCase('TORCHX')){
                torchxAccountMap.put(acct.Id, acct);
            }
        }

        if(!lbwAccountMap.isEmpty()){
            updateCaseLBWSaveMode();
        }

        if(!torchxAccountMap.isEmpty()){
            updateCaseTORCHXSaveMode();
        }
    }

    public static void beforeUpdate(Map<Id, Custom_Automation__c> newMapValues, Map<Id, Custom_Automation__c> oldMapValues){
        accountIdSet = relatedAccountIdList(newMapValues.values());

        if(accountIdSet.isEmpty()){
            return;
        }

        accountTORCHXandLBWMap = AccountObjectHelper.getTORCHXandLBWAccountMap(accountIdSet);

        for(Account acct : accountTORCHXandLBWMap.values()){
            if(acct.Product_Type_Transactional__c.containsIgnoreCase('Leads By Web') || acct.Product_Type_Transactional__c.containsIgnoreCase('Lead Stream ATV')){
                lbwAccountMap.put(acct.Id, acct);
            }else if(acct.Product_Type_Transactional__c.containsIgnoreCase('TORCHX')){
                torchxAccountMap.put(acct.Id, acct);
            }
        }

        if(!lbwAccountMap.isEmpty()){
            evaluateLBWSaveMode(newMapValues, oldMapValues);
        }

        if(!torchxAccountMap.isEmpty()){
            evaluateTORCHXSaveMode(newMapValues, oldMapValues);
        }
    }

    public static void afterUpdate(Map<Id, Custom_Automation__c> newMapValues, Map<Id, Custom_Automation__c> oldMapValues){
        List<Account> updateAccountDaysInCancellationField = new List<Account>();

        for(Custom_Automation__c record : newMapValues.values()){
            Custom_Automation__c oldRecord = oldMapValues.get(record.Id);
            if(String.isNotBlank(record.Account__c) && record.Days_In_Cancellation__c != null && record.Days_In_Cancellation__c != oldRecord.Days_In_Cancellation__c){
                Account updateAcct = new Account();
                updateAcct.Id = record.Account__c;
                updateAcct.Days_in_Save_Mode__c = record.Days_In_Cancellation__c;

                updateAccountDaysInCancellationField.add(updateAcct);
            }
        }

        if(!updateAccountDaysInCancellationField.isEmpty()){
            Database.update(updateAccountDaysInCancellationField, false);
        }
    }

    public static void setAutomationStatusFromCancellationRequest(List<Cancellation_Request__c> cancellationRequestList){
        Set<String> cancellationSavedOutcomeSet = getCancellationSavedOutcomeSet();
        Set<String> cancellationAbortOutcomeSet = getCancellationAbortOutcomeSet();
        
        List<Custom_Automation__c> updateCustomAutomationStatusList = new List<Custom_Automation__c>();

        for(Custom_Automation__c record : [select Id, Automation_Status__c, Cancellation_Request__c, Cancellation_Request__r.Outcome__c from Custom_Automation__c where Cancellation_Request__c in : cancellationRequestList]){
            if(cancellationSavedOutcomeSet.contains(record.Cancellation_Request__r.Outcome__c)){
                record.Automation_Status__c = 'Evaluating';
            }else if(cancellationAbortOutcomeSet.contains(record.Cancellation_Request__r.Outcome__c)){
                record.Automation_Status__c = 'Aborted';
            }else if(record.Cancellation_Request__r.Outcome__c.equalsIgnoreCase('In Progress')){
                record.Automation_Status__c = 'Waiting on Outcome';
            }/*else if(record.Cancellation_Request__r.Outcome__c.equalsIgnoreCase('Duplicate Retention Case')){
                record.Automation_Status__c = 'No Action Needed';
            }*/else{
                continue;
            }

            updateCustomAutomationStatusList.add(record);
        }

        if(!updateCustomAutomationStatusList.isEmpty()){
            update updateCustomAutomationStatusList;
        }
    }

    private static Set<String> getCancellationSavedOutcomeSet(){
        Set<String> cancellationSavedOutcomeSet = new Set<String>();
        for(String str : Label.CancellationSavedOutcome.split(';')){
            cancellationSavedOutcomeSet.add(str.trim());
        }

        return cancellationSavedOutcomeSet;
    }

    private static Set<String> getCancellationAbortOutcomeSet(){
        Set<String> cancellationAbortOutcomeSet = new Set<String>();
        for(String str : Label.CancellationOutcome2AbortAutomation.split(';')){
            cancellationAbortOutcomeSet.add(str.trim());
        }

        return cancellationAbortOutcomeSet;
    }

    private static void evaluateTORCHXSaveMode(Map<Id, Custom_Automation__c> newMapValues, Map<Id, Custom_Automation__c> oldMapValues){
        // UPDATE THE STATUS FOR TORCHX !!! MAYBE MAKE IT CUSTOM SETTING OR CUSTOM LABEL!!~!!!!!!!!!
        Set<Id> accountWithRecentlyCreatedMonthlyCaseSet = new Set<Id>();
        for(Account record : [select Id from Account where Id in (select AccountId from Case where Subject like '%Schedule your next call: Monthly Review%' and CreatedDate = LAST_N_DAYS:26) and Id in :torchxAccountMap.keySet()]){
            accountWithRecentlyCreatedMonthlyCaseSet.add(record.Id);
        }

        for(Custom_Automation__c record : newMapValues.values()){
            if(String.isBlank(record.Automation_Status__c) || !record.Automation_Status__c.equalsIgnoreCase('Evaluating')){
                continue;
            }
            if(torchxAccountMap.containsKey(record.Account__c)){
                record.Days_In_Cancellation__c = saveModeDaysCalc(record.CreatedDate.date());

                Integer effectiveDaysSinceLive = (Integer)record.Days_Since_Live_Equivalent_on_Request__c;

                if(effectiveDaysSinceLive <= 37 || accountWithRecentlyCreatedMonthlyCaseSet.contains(record.Account__c)){
                    record.Automation_Status__c = 'Aborted';
                    record.Automation_Type_API_Name_External_ID__c = '';
                }else{
                    Integer daysSinceFirstTP = effectiveDaysSinceLive - 37;

                    Integer remainder = math.mod(daysSinceFirstTP, 30);

                    Integer noDaysNeeded = (remainder < 0) ? remainder * (-1) : 30 - remainder;
                    record.Automation_Trigger_Date__c = Date.today().addDays(noDaysNeeded);
                    record.Automation_Type_API_Name_External_ID__c = 'TORCHX_MONTHLY_REVIEW_EVERY_30';
                    record.Automation_Type__c = 'Marketo_Email_Campaign__c';
                    record.Automation_Status__c = 'Scheduled';
                }
            }
        }
    }

    private static void evaluateLBWSaveMode(Map<Id, Custom_Automation__c> newMapValues, Map<Id, Custom_Automation__c> oldMapValues){
        Set<Id> accountWithRecentlyCreatedMonthlyCaseSet = new Set<Id>();
        for(Account record : [select Id from Account where Id in (select AccountId from Case where Subject like '%LBW Monthly Touchplan%' and CreatedDate = LAST_N_DAYS:29) and Id in :lbwAccountMap.keySet()]){
            accountWithRecentlyCreatedMonthlyCaseSet.add(record.Id);
        }

        for(Custom_Automation__c record : newMapValues.values()){
            if(!record.Automation_Status__c.equalsIgnoreCase('Evaluating')){
                continue;
            }
            if(lbwAccountMap.containsKey(record.Account__c)){
                record.Days_In_Cancellation__c = saveModeDaysCalc(record.CreatedDate.date());

                Integer daysSinceFirstTP = (Integer)lbwAccountMap.get(record.Account__c).Days_Since_Live__c - 27;

                if(daysSinceFirstTP <= 0 || accountWithRecentlyCreatedMonthlyCaseSet.contains(record.Account__c)){
                    record.Automation_Status__c = 'Aborted';
                    record.Automation_Type_API_Name_External_ID__c = '';
                    continue;
                }

                Integer remainder = math.mod(daysSinceFirstTP, 30);

                Integer noDaysNeeded = (remainder < 0) ? remainder * (-1) : 30 - remainder;
                record.Automation_Trigger_Date__c = Date.today().addDays(noDaysNeeded);
                record.Automation_Type_API_Name_External_ID__c = 'Create_Monthly_LBW_Account_Performance';
                record.Automation_Status__c = 'Scheduled';
                record.Automation_Type__c = 'Daily_Scheduled_Record_Auto_Create__mdt';
            }
        }
    }

    private static Integer saveModeDaysCalc(Date requestCreatedDate){
        return requestCreatedDate.daysBetween(Date.today());
    }

    private static void updateCaseTORCHXSaveMode(){
        List<Case> updateCaseList = new List<Case>();

        for(Case record : [select Id, Status from Case where AccountId in :torchxAccountMap.keySet() and IsClosed = false and RecordType.Name = 'Outbound Call' and Subject IN ('Schedule your next call: Managing Relationships', 'Schedule your next call: Monthly Review', 'Schedule your next call: Advanced Features') and Reason = 'CS Touch Plan']){
            record.Status = 'Did Not Complete';
            updateCaseList.add(record);
        }

        if(!updateCaseList.isEmpty()){
            Database.update(updateCaseList, false);
        }
    }

    private static void updateCaseLBWSaveMode(){
        List<Case> updateCaseList = new List<Case>();

        for(Case record : [select Id, Status from Case where AccountId in :lbwAccountMap.keySet() and IsClosed = false and RecordType.Name = 'Outbound Call' and Subject like 'LBW Monthly Touchplan%' and Reason = 'CS Touch Plan']){
            record.Status = 'Churned';
            updateCaseList.add(record);
        }

        if(!updateCaseList.isEmpty()){
            Database.update(updateCaseList, false);
        }
    }

    private static Set<Id> relatedAccountIdList(List<Custom_Automation__c> customAutomationList){
        Set<Id> acctIdSet = new Set<Id>();

        for(Custom_Automation__c record : customAutomationList){
            if(String.isNotBlank(record.Account__c)){
                acctIdSet.add(record.Account__c);
            }
        }

        return acctIdSet;
    }

}