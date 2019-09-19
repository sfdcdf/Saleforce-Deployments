public class MarketoHourlyEmailCampaignBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {
    
    private String query;
    private String parentTemplateId;
    private DateTime reminderStartTime;
    private DateTime reminderEndTime;
    
    public MarketoHourlyEmailCampaignBatch(String passedQuery, String passedParentTemplateId, DateTime passedReminderStartTime) {
        query = passedQuery;
        parentTemplateId = passedParentTemplateId;
        reminderStartTime = passedReminderStartTime;
        reminderEndTime = reminderStartTime.addMinutes(60);
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        //system.debug(query);
        //system.debug(reminderStartTime);
        //system.debug([select AccountId, Account.Marketo_ID__c, Account.Client_ID__c, Scheduled_Call__c from Case where RecordType.Name = 'Outbound Call' and Reason = 'CS Touch Plan' and Sync_to_Marketo__c = true and Account.Marketo_ID__c != '' and Account.Status__c = 'LIVE']);
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        system.debug(scope);
        system.debug(parentTemplateId);
        Marketo_Email_Campaign__c parentTemplate = [select Id, Name, Marketo_Campaign_ID__c, Account_ID_Field_Name__c, Marketo_Request_Sent__c, Criteria__c, Date_Field_to_Update_on_Request_Sent__c, Create_Case__c, New_Record_Default_Values__c from Marketo_Email_Campaign__c where Id =: parentTemplateId];
        Boolean updateScopeDateField = false;

        Map<Id, Marketo_Email_Campaign__c> marketoEmailRecordMap = new Map<Id, Marketo_Email_Campaign__c>();
		Map<Id, Case> accountIdNewCaseMap = new Map<Id, Case>();

        List<String> marketoLeadIdList = new List<String>();
        for(SObject record : scope){
            Account acct = new Account();
            if(String.isBlank(parentTemplate.Account_ID_Field_Name__c) || parentTemplate.Account_ID_Field_Name__c.equalsIgnoreCase('id')){
                acct = (Account)record;
            }else{
                acct = (Account)record.getSObject(parentTemplate.Account_ID_Field_Name__c);
            }
            //system.debug((DateTime)record.get('Scheduled_Call__c'));
            Marketo_Email_Campaign__c mec = parentTemplate.clone(false, true);
            mec.Account__c = acct.Id;
            mec.Marketo_Request_Sent__c = true;
            mec.Marketo_Email_Campaign_Template__c = parentTemplate.Id;
			marketoEmailRecordMap.put(acct.Id, mec);
            marketoLeadIdList.add(acct.Marketo_ID__c);

            if(parentTemplate.Create_Case__c && String.isNotBlank(parentTemplate.New_Record_Default_Values__c)){
				Case newCase = (Case)JSON.deserialize(parentTemplate.New_Record_Default_Values__c, Case.class);
				newCase.AccountId = acct.Id;
				accountIdNewCaseMap.put(acct.Id, newCase);
			}

            if(String.isNotBlank(mec.Date_Field_to_Update_on_Request_Sent__c)){
                updateScopeDateField = true;
                record.put(mec.Date_Field_to_Update_on_Request_Sent__c, Date.today());
            }
        }

		MarketoSyncService.requestCampaign(parentTemplate.Marketo_Campaign_ID__c, marketoLeadIdList, new List<MarketoSyncService.MarketoSyncServiceToken>());

        if(!accountIdNewCaseMap.isEmpty()){
			Database.insert(accountIdNewCaseMap.values(), false);
			for(Marketo_Email_Campaign__c mec : marketoEmailRecordMap.values()){
				mec.Case__c = accountIdNewCaseMap.get(mec.Account__c).Id;
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