public class PartnerQuarterlyManagedAccountsCalc implements Database.Batchable<sObject> {
	
	//String query;

	private static Date endOfQuarterDate = [Select EndDate From Period Where type = 'Quarter' and StartDate = THIS_FISCAL_QUARTER].EndDate;
	
	public PartnerQuarterlyManagedAccountsCalc() {
		
	}
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator([select Id, (select Id from ChildAccounts where Status__c = 'LIVE' and (NOT Name like '%TEST')) from Account where RecordType.Name = 'Partner Master Account' and Partner_Status__c = 'Customer']);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
   		Map<Id, Map<Id, Set<Id>>> parentIdQuarterlyManagedIdchildAccountIdSetMap = new Map<Id, Map<Id, Set<Id>>>();
		for(Partner_Quarterly_Managed_Account_Count__c quarterlyRecord : [select Id, Parent_Account__c, End_of_Quarter_Date__c, Child_Accounts_End_of_Quarter_Count__c, (select Id, Child_Account__c, Child_Account__r.Status__c from Partner_Quarterly_Managed_Child_Accounts__r where (NOT Child_Account__r.Name like '%TEST')) from Partner_Quarterly_Managed_Account_Count__c where End_of_Quarter_Date__c =: endOfQuarterDate]){
			Set<Id> childAccountIdSet = new Set<Id>();
			Map<Id, Set<Id>> quarterlyManagedIdChildSet = new Map<Id, Set<Id>>();
			quarterlyManagedIdChildSet.put(quarterlyRecord.Id, childAccountIdSet);
			parentIdQuarterlyManagedIdchildAccountIdSetMap.put(quarterlyRecord.Parent_Account__c, quarterlyManagedIdChildSet);

			for(Partner_Quarterly_Managed_Child_Account__c quarterlyChildAccount : quarterlyRecord.Partner_Quarterly_Managed_Child_Accounts__r){
				parentIdQuarterlyManagedIdchildAccountIdSetMap.get(quarterlyRecord.Parent_Account__c).get(quarterlyRecord.Id).add(quarterlyChildAccount.Child_Account__c);
			}
		}

		if(parentIdQuarterlyManagedIdchildAccountIdSetMap.isEmpty() || parentIdQuarterlyManagedIdchildAccountIdSetMap.size() != scope.size()){
			List<Partner_Quarterly_Managed_Account_Count__c> newQuarterlyRecords = new List<Partner_Quarterly_Managed_Account_Count__c>();
			for(Account parentAccount : (List<Account>)scope){
				if(!parentIdQuarterlyManagedIdchildAccountIdSetMap.containsKey(parentAccount.Id)){
					Partner_Quarterly_Managed_Account_Count__c quarterlyRecord = new Partner_Quarterly_Managed_Account_Count__c();
					quarterlyRecord.End_of_Quarter_Date__c = endOfQuarterDate;
					quarterlyRecord.Parent_Account__c = parentAccount.Id;
					newQuarterlyRecords.add(quarterlyRecord);
				}
			}
			if(!newQuarterlyRecords.isEmpty()){
				insert newQuarterlyRecords;

				for(Partner_Quarterly_Managed_Account_Count__c quarterlyRecord : newQuarterlyRecords){
					Map<Id, Set<Id>> quarterlyManagedIdChildSet = new Map<Id, Set<Id>>();
					quarterlyManagedIdChildSet.put(quarterlyRecord.Id, new Set<Id>());
					parentIdQuarterlyManagedIdchildAccountIdSetMap.put(quarterlyRecord.Parent_Account__c, quarterlyManagedIdChildSet);
				}
			}
		}

		Map<Id, Set<Id>> parentIdChildAccountSetMap = new Map<Id, Set<Id>>();
		List<Partner_Quarterly_Managed_Child_Account__c> newPQMCAList = new List<Partner_Quarterly_Managed_Child_Account__c>();
		for(Account parentAccount : (List<Account>)scope){
			for(Id quarterlyManagedId : parentIdQuarterlyManagedIdchildAccountIdSetMap.get(parentAccount.Id).keySet()){
				for(Account childAccount : parentAccount.ChildAccounts){
					if(!parentIdQuarterlyManagedIdchildAccountIdSetMap.get(parentAccount.Id).get(quarterlyManagedId).contains(childAccount.Id)){
						Partner_Quarterly_Managed_Child_Account__c newPQMCA = new Partner_Quarterly_Managed_Child_Account__c();
						newPQMCA.Child_Account__c = childAccount.Id;
						newPQMCA.Partner_Quarterly_Managed_Account_Count__c = quarterlyManagedId;
						newPQMCAList.add(newPQMCA);
					}
				}
			}
		}

		if(!newPQMCAList.isEmpty()){
			insert newPQMCAList;
		}

		List<Partner_Quarterly_Managed_Child_Account__c> deleteChildAccountRelationshipList = new List<Partner_Quarterly_Managed_Child_Account__c>();
		for(Partner_Quarterly_Managed_Child_Account__c childAccountRelationship : [select Id from Partner_Quarterly_Managed_Child_Account__c where (Child_Account__r.Status__c != 'LIVE' or Child_Account__r.Name like '%TEST') and Partner_Quarterly_Managed_Account_Count__r.End_of_Quarter_Date__c =: endOfQuarterDate]){
			deleteChildAccountRelationshipList.add(childAccountRelationship);
		}
		if(!deleteChildAccountRelationshipList.isEmpty()){
			delete deleteChildAccountRelationshipList;
		}
	}
	
	public void finish(Database.BatchableContext BC) {
		
	}
	
}