public without sharing class AccountObjectHelper {
	public static Boolean accountObjectHelperAlreadyFired = false;

	public static Map<Id, Account> getTORCHXandLBWAccountMap(Set<Id> accountIdSet){
		Map<Id, Account> accountTORCHXandLBWMap = new Map<Id, Account>();
		for(Account record : (List<Account>)Database.query(Label.AccountTORCHXandLBWMapQuery)){
			accountTORCHXandLBWMap.put(record.Id, record);
		}

		return accountTORCHXandLBWMap;
	}

	public static void checkIfAccountListInPauseMode(Set<Id> accountIdSet){
		//Map<Id, Boolean> acctIdInPauseModeMap = new Map<Id, Boolean>();
		List<Account> updateAccountList = new List<Account>();

		//maybe move to custom label - the query
		for(Account record : [select Id, Pause_Touchplan__c, (select Account_Name__c from Cancellation_Requests__r where Outcome__c = 'In Progress') from Account where Id in :accountIdSet]){
			if(record.Pause_Touchplan__c != (!record.Cancellation_Requests__r.isEmpty())){
				record.Pause_Touchplan__c = !record.Cancellation_Requests__r.isEmpty();
				updateAccountList.add(record);
			}
		}

		update updateAccountList;
	}
}