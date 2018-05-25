trigger ybnActivityEventsRelationshipStats on Event (after insert, after update) {
    
    Id EventRelationshipRecordTypeId = ybnUtilsEvents.getInstance().getYbnCorporateRelationshipEventRecordTypeId();
    
    Map<Id, Account> accountsToUpdate = new Map<Id, Account>();

    for (Event event : trigger.new) {
        
        // Continue if not an account activity
        if (event.AccountId == null) continue;
        
        if (!accountsToUpdate.containsKey(event.AccountId)) {
            Account a = new Account(Id = event.AccountId);
            accountsToUpdate.put(event.AccountId, a);
        }
        
        if (event.Milestone__c != null && event.Status__c == 'Completed') {
            String ms = (String) event.Milestone__c.left(3);
            if (ms == 'LM7' || ms == 'LM8') {
                accountsToUpdate.get(event.AccountId).Date_of_Last_Customer_Performance_Review__c = system.today();
            }
            if (ms == 'LM4') {
                accountsToUpdate.get(event.AccountId).Date_of_Last_Customer_Status_Call__c = system.today();
            }
            if (ms == 'LM3') {
                accountsToUpdate.get(event.AccountId).Date_of_Last_Internal_Roundtable_Meeting__c = system.today();
            }
            if (ms == 'LM2') {
                accountsToUpdate.get(event.AccountId).Date_of_Last_Internal_Sales_Meeting__c = system.today();
            }
            if (ms == 'LM5') {
                accountsToUpdate.get(event.AccountId).Date_of_Last_Sales_AD_Meeting__c = system.today();
            }
            if (ms == 'LM6') {
                accountsToUpdate.get(event.AccountId).Date_of_Last_Stakeholder_Meeting__c = system.today();
            }
        }
        
        //@todo What defines this as a Event that has performance metrics
        if (event.RecordTypeId == EventRelationshipRecordTypeId) {
            if (event.Actual_PPL__c != null) accountsToUpdate.get(event.AccountId).Actual_PPL__c = event.Actual_PPL__c;
            if (event.Actual_ROI__c != null) accountsToUpdate.get(event.AccountId).Actual_ROI__c = event.Actual_ROI__c;
            if (event.Actual_Lead_Volume_Per_Month__c != null) accountsToUpdate.get(event.AccountId).Actual_Lead_Volume_Per_Month__c = event.Actual_Lead_Volume_Per_Month__c;
            if (event.Actual_New_Customers_Per_Month__c != null) accountsToUpdate.get(event.AccountId).Actual_New_Customers_Per_Month__c = Event.Actual_New_Customers_Per_Month__c; 
        }
    }
    
    update accountsToUpdate.values();
}