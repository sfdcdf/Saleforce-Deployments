public class MarketoCampaignSyncBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {
	
	String query;
	
	public MarketoCampaignSyncBatch() {
		query = Label.MarketoCampaignSyncBatchQuery;
	}
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
   		List<String> marketoCampaignIdList = new List<String>();
   		Map<String, Marketo_Campaign__c> idMarketoCampaignMap = new Map<String, Marketo_Campaign__c>();
   		for(Marketo_Campaign__c record : (List<Marketo_Campaign__c>)scope){
   			marketoCampaignIdList.add(record.Campaign_ID__c);
   			idMarketoCampaignMap.put(record.Campaign_ID__c, record);
   		}

		String jsonMarketoCampaignDetails = MarketoSyncService.getMultipleCampaigns('id', marketoCampaignIdList);

		Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(jsonMarketoCampaignDetails);

		for(Object obj : (List<Object>)responseMap.get('result')){
			Map<String, Object> mktCampaignObjMap = (Map<String, Object>)obj;
			Marketo_Campaign__c mktCampaign = idMarketoCampaignMap.get(String.valueof(mktCampaignObjMap.get('id')));
			if(mktCampaign == null){
				continue;
			}
			mktCampaign.Name = (String)mktCampaignObjMap.get('name');
			mktCampaign.Type__c = (String)mktCampaignObjMap.get('type');
			mktCampaign.Program_Name__c = (String)mktCampaignObjMap.get('programName');
			mktCampaign.Date_Time_of_Last_Sync_With_Marketo__c = DateTime.now();
		}

		upsert idMarketoCampaignMap.values() Campaign_ID__c;
	}
	
	public void finish(Database.BatchableContext BC) {
		
	}
	
}