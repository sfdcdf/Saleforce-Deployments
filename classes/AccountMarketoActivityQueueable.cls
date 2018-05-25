public class AccountMarketoActivityQueueable implements Queueable, Database.AllowsCallouts {

	DateTime dateTimeParameter;
	String tokenValue;

	public AccountMarketoActivityQueueable(DateTime sinceDateTime, String passedTokenValue){
		dateTimeParameter = sinceDateTime;
		tokenValue = passedTokenValue;
	}

	public void execute(QueueableContext context) {
        List<String> activityIdList = new List<String>();
        for(Activity_Type__c record : [select Id, Activity_Type_ID__c from Activity_Type__c where Activity_Type_ID__c != '']){
        	activityIdList.add(record.Activity_Type_ID__c);
        }

		//String jsonResponse = MarketoSyncService.getLeadActivities(activityIdList, '', new List<String>(), dateTimeParameter);

		Boolean moreResult = true;
		Integer calloutCount = 1;
		//String tokenValue = '';

		List<Account_Marketo_Activity__c> accountMarketoActivityList = new List<Account_Marketo_Activity__c>();

		while(moreResult && calloutCount <= AdjustCustomCodeLimit__c.getValues('AccountMarketoActivityQueueableLimit').Limit__c){
			String jsonResponse = MarketoSyncService.getLeadActivities(activityIdList, '', new List<String>(), dateTimeParameter, tokenValue);

			Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);

			for(Object obj : (List<Object>)responseMap.get('result')){
				Map<String, Object> activityObjMap = (Map<String, Object>)obj;

				Account_Marketo_Activity__c accountMarketoActivity = new Account_Marketo_Activity__c();
				accountMarketoActivity.Activity_Id__c = String.valueof(activityObjMap.get('id'));
				accountMarketoActivity.Campaign_ID__c = String.valueof(activityObjMap.get('campaignId'));
				accountMarketoActivity.Marketo_Lead_ID__c = String.valueof(activityObjMap.get('leadId'));
				accountMarketoActivity.Activity_Type_ID__c = String.valueof(activityObjMap.get('activityTypeId'));
				accountMarketoActivity.Activity_Attribute__c = String.valueof(activityObjMap.get('primaryAttributeValue'));
				accountMarketoActivity.Marketo_Activity_Timestamp__c = DateTime.valueofGMT(String.valueof(activityObjMap.get('activityDate')).replace('T',' ').replace('Z', ''));
				accountMarketoActivityList.add(accountMarketoActivity);
			}

			tokenValue = (String)responseMap.get('nextPageToken');
			moreResult = (Boolean)responseMap.get('moreResult');
			calloutCount++;
		}

		upsert accountMarketoActivityList Activity_Id__c;

		if(moreResult){
			System.enqueueJob(new AccountMarketoActivityQueueable(dateTimeParameter, tokenValue));
		}

		if(!Test.isRunningTest() && !moreResult){
			Database.executeBatch(new MarketoCampaignSyncBatch());
		}
	}
}