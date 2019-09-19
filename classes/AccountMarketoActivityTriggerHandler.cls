public without sharing class AccountMarketoActivityTriggerHandler {

	public static void beforeInsert(List<Account_Marketo_Activity__c> newList){
		acctMarketoActivityDataFill(newList);
	}

	public static void beforeUpdate(Map<Id, Account_Marketo_Activity__c> newValueMap, Map<Id, Account_Marketo_Activity__c> oldValueMap){
		List<Account_Marketo_Activity__c> amaListWithNoAccount = new List<Account_Marketo_Activity__c>();
		for(Account_Marketo_Activity__c record : newValueMap.values()){
			if(String.isBlank(record.Account__c)){
				amaListWithNoAccount.add(record);
			}
		}
		acctMarketoActivityDataFill(amaListWithNoAccount);
	}

	public static List<Account_Marketo_Activity__c> acctMarketoActivityDataFill(List<Account_Marketo_Activity__c> amaList){
		Set<String> accountIDsToSearch = new Set<String>();
		Set<String> marketoCampaignIDsToSearch = new Set<String>();
		Map<String, Set<String>> allPairings = new Map<String, Set<String>>();
		Map<String, Set<String>> usablePairings = new Map<String, Set<String>>();
		Set<String> marketoCampaignsToCreate = new Set<String>();

		for (Account_Marketo_Activity__c accountMarketoActivity : amaList) {
			if (String.isNotBlank(accountMarketoActivity.Marketo_Lead_ID__c) && String.isNotBlank(accountMarketoActivity.Campaign_ID__c)) {
				accountIDsToSearch.add(accountMarketoActivity.Marketo_Lead_ID__c);
				marketoCampaignIDsToSearch.add(accountMarketoActivity.Campaign_ID__c);
				Set<String> tempSet = allPairings.get(accountMarketoActivity.Marketo_Lead_ID__c);
				if (tempSet == null) {
					tempSet = new Set<String>();
				}
				tempSet.add(accountMarketoActivity.Campaign_ID__c);
				allPairings.put(accountMarketoActivity.Marketo_Lead_ID__c, tempSet);
			}
		}

		Map<String, Account> accountsThatExist = new Map<String, Account>();
		for (Account acct : [select Id, Marketo_ID__c from Account where Marketo_ID__c in :accountIDsToSearch]){
			accountsThatExist.put(acct.Marketo_ID__c, acct);
			usablePairings.put(acct.Marketo_ID__c, allPairings.get(acct.Marketo_ID__c));
		}

		Map<String, Marketo_Campaign__c> marketoCampaignsThatExist = new Map<String, Marketo_Campaign__c>();
		for (Marketo_Campaign__c markCam : [select Id, Campaign_ID__c from Marketo_Campaign__c where Campaign_ID__c in :marketoCampaignIDsToSearch]) {
			marketoCampaignsThatExist.put(markCam.Campaign_ID__c, markCam);
		}

		for (String leadId : usablePairings.keySet()) {
			for (String key : usablePairings.get(leadId)) {
				if (!marketoCampaignsThatExist.containsKey(key)) {
					marketoCampaignsToCreate.add(key);
				}
			}
		}

		List<Marketo_Campaign__c> mktCampaignList = new List<Marketo_Campaign__c>();
		for(String campaignId : marketoCampaignsToCreate){
			Marketo_Campaign__c newCampaign = new Marketo_Campaign__c();
			newCampaign.Campaign_ID__c = campaignId;
			marketoCampaignsThatExist.put(campaignId, newCampaign);
			mktCampaignList.add(newCampaign);
		}

		insert mktCampaignList;

		Map<String, Activity_Type__c> activityTypeMap = new Map<String, Activity_Type__c>();
		for (Activity_Type__c activityType : [select Id, Activity_Type_ID__c from Activity_Type__c]) {
			activityTypeMap.put(activityType.Activity_Type_ID__c, activityType);
		}

		for (Account_Marketo_Activity__c accountMarketoActivity : amaList) {
			accountMarketoActivity.Activity_Type__c = activityTypeMap.get(accountMarketoActivity.Activity_Type_ID__c).Id;
			if (accountsThatExist.containsKey(accountMarketoActivity.Marketo_Lead_ID__c) && String.isNotBlank(accountMarketoActivity.Marketo_Lead_ID__c) && String.isNotBlank(accountMarketoActivity.Campaign_ID__c)) {
				accountMarketoActivity.Account__c = accountsThatExist.get(accountMarketoActivity.Marketo_Lead_ID__c).Id;
				accountMarketoActivity.Marketo_Campaign__c = marketoCampaignsThatExist.get(accountMarketoActivity.Campaign_ID__c).Id;
			}
		}
		return amaList;
	}
}