trigger ybnActivityRelationshipStats on Task (after insert, after update) {
    
    Id TaskRelationshipRecordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipTaskRecordTypeId();
    
    Map<Id, Account> accountsToUpdate = new Map<Id, Account>();

    for (Task task : trigger.new) {
        
        // Continue if not an account activity
        if (task.AccountId == null) continue;
        
        if (!accountsToUpdate.containsKey(task.AccountId)) {
            Account a = new Account(Id = task.AccountId);
            accountsToUpdate.put(task.AccountId, a);
        }
        
        if (task.Milestone__c != null && task.Status == 'Completed') {
            String ms = (String) task.Milestone__c.left(3);
            if (ms == 'LM7' || ms == 'LM8') {
                accountsToUpdate.get(task.AccountId).Date_of_Last_Customer_Performance_Review__c = system.today();
            }
            if (ms == 'LM4') {
                accountsToUpdate.get(task.AccountId).Date_of_Last_Customer_Status_Call__c = system.today();
            }
            if (ms == 'LM3') {
                accountsToUpdate.get(task.AccountId).Date_of_Last_Internal_Roundtable_Meeting__c = system.today();
            }
            if (ms == 'LM2') {
                accountsToUpdate.get(task.AccountId).Date_of_Last_Internal_Sales_Meeting__c = system.today();
            }
            if (ms == 'LM5') {
                accountsToUpdate.get(task.AccountId).Date_of_Last_Sales_AD_Meeting__c = system.today();
            }
            if (ms == 'LM6') {
                accountsToUpdate.get(task.AccountId).Date_of_Last_Stakeholder_Meeting__c = system.today();
            }
        }
        
        //@todo What defines this as a task that has performance metrics
        if (task.RecordTypeId == TaskRelationshipRecordTypeId) {
            if (task.Actual_PPL__c != null) accountsToUpdate.get(task.AccountId).Actual_PPL__c = task.Actual_PPL__c;
            if (task.Actual_ROI__c != null) accountsToUpdate.get(task.AccountId).Actual_ROI__c = task.Actual_ROI__c;
            if (task.Actual_Lead_Volume_Per_Month__c != null) accountsToUpdate.get(task.AccountId).Actual_Lead_Volume_Per_Month__c = task.Actual_Lead_Volume_Per_Month__c;
            if (task.Actual_New_Customers_Per_Month__c != null) accountsToUpdate.get(task.AccountId).Actual_New_Customers_Per_Month__c = task.Actual_New_Customers_Per_Month__c; 
        }
    }
    
    update accountsToUpdate.values();
}