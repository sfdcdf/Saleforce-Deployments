trigger ybnAccountProducts on Account (after delete, after update) {
	List<Account> accountsToUpdate = new List<Account>();
	
	Set<ID> parentAccountIds = new Set<ID>();
	
	// The ID is the ID of the parent account
	Map<ID, String> childProducts = new Map<ID, String>();
	
	if (Trigger.isUpdate) {
		for (Account account : trigger.new) {
			
			// Continue if accounts doesn't have parentId
			if (account.ParentId == null) continue;
			
			// If Products is null, they could have been removed and we should continue
			//if (account.Product_Type__c == null) continue;
			
			// Continue if products hasn't been updated
			Account oldAccount = Trigger.oldMap.get(account.Id);
			if (oldAccount.Product_Type__c == account.Product_Type__c) continue;
			
			// Store the parent account Id
			parentAccountIds.add(account.ParentId);
		}
	}
	if (Trigger.isDelete) {
		for (Account account : trigger.old) {
			if (account.ParentId == null) continue;
			parentAccountIds.add(account.ParentId);
		}
	}
	
	// Get all the parent account objects that we need to work on
	Map<Id, Account> parentAccounts = new Map<Id, Account>(
		[SELECT Id, Product_Type__c, All_Products__c 
		FROM Account 
		WHERE (Id IN :parentAccountIds) AND RecordTypeId = :ybnUtils.getInstance().getYbnCorporateRelationshipAccountRecordTypeId()]);
		
	// Get all the children account
	List<Account> childAccounts = new List<Account>(
		[SELECT Id, ParentId, Product_Type__c 
		FROM Account 
		WHERE (ParentId IN :parentAccounts.keySet()) AND Product_Type__c != null AND Product_Type__c != '']);
	
	// Map to store the parent product values
	Map<ID, Set<String>> parentProductsMap = new Map<ID, Set<String>>();
	
	// Iterate through the child accounts and update parentProductsMap
	for (Account cAccount: childAccounts) {
		if (!parentProductsMap.containsKey(cAccount.ParentId)) {
			parentProductsMap.put(cAccount.ParentId, new Set<String>());
		}
		parentProductsMap.get(cAccount.ParentId).addAll(cAccount.Product_Type__c.split(','));
	}
	
	// Finally update the Products field in the parents
	// Reset the Product field in all the parent accounts
	for (Account pAccount: parentAccounts.values()) {
		List<String> products = new List<String>();
		if (parentProductsMap.containsKey(pAccount.Id)) {
			products.addAll(parentProductsMap.get(pAccount.Id));
			pAccount.All_Products__c = String.join(products, ',');
		} else {
			pAccount.All_Products__c = null;
		}
	}
	
	update parentAccounts.values();
}