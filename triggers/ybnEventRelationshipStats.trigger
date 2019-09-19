trigger ybnEventRelationshipStats on Event (after insert, after update) {
	
	Map<Id, Account> accountsToUpdate = new Map<Id, Account>();

	for (Event e : trigger.new) {
		
		// Continue if not an account activity
		if (e.AccountId == null) continue;
		
		
		if (!accountsToUpdate.containsKey(e.AccountId)) {
			Account a = new Account(Id = e.AccountId);
			if (e.Actual_PPL__c != null) a.Actual_PPL__c = e.Actual_PPL__c;
			if (e.Actual_ROI__c != null) a.Actual_ROI__c = e.Actual_ROI__c;
			if (e.Actual_Lead_Volume_Per_Month__c != null) a.Actual_Lead_Volume_Per_Month__c = e.Actual_Lead_Volume_Per_Month__c;
			if (e.Actual_New_Customers_Per_Month__c != null) a.Actual_New_Customers_Per_Month__c = e.Actual_New_Customers_Per_Month__c;
			accountsToUpdate.put(e.AccountId, a);
		}
	}
	
	update accountsToUpdate.values();
}