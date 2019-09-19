/**
 * Updates the Individual_Location_Service_Level__c of new or updated child accounts
 * based on the value of their parent
 */
trigger ybnAccountServiceLevelChildrenAccounts on Account (before insert, before update) {
    SL_AccountTriggerHandler.setSalesDirectorFields(trigger.new);
    
    Set<Id> parentAccountIds = new Set<Id>();
    
    for (Account account : trigger.new) {
        // Only update accounts that have parent accounts
        if (account.ParentId == null) continue;
        
        // Continue if service level is empty
        if (account.Individual_Location_Service_Level__c != null) continue;
        parentAccountIds.add(account.ParentId);
    }
    // Get parent accounts
    Map<Id, Account> parentAccounts = new Map<Id, Account>([
        SELECT Id, Individual_Location_Service_Level__c 
        FROM Account 
        WHERE Id IN :parentAccountIds AND Individual_Location_Service_Level__c <> null]);
        
    for (Account account : trigger.new) {
        if (account.ParentId != null && account.Individual_Location_Service_Level__c == null && parentAccounts.containsKey(account.ParentId)) {
                account.Individual_Location_Service_Level__c = parentAccounts.get(account.ParentId).Individual_Location_Service_Level__c;
            }
    }
    
    
    //Account_Director__c
    parentAccountIds = new Set<Id>();
    for (Account account : trigger.new) {
        if (account.ParentId == null) continue;
        if (account.Account_Director__c != null) continue;
        parentAccountIds.add(account.ParentId);
    }
    parentAccounts = new Map<Id, Account>([
        SELECT Id, Account_Director__c 
        FROM Account 
        WHERE Id IN :parentAccountIds AND Account_Director__c <> null]);
        
    for (Account account : trigger.new) {
        if (account.ParentId != null && account.Account_Director__c == null && parentAccounts.containsKey(account.ParentId)) {
                account.Account_Director__c = parentAccounts.get(account.ParentId).Account_Director__c;
            }
    }
    
    //Lead_Analyst__c
    parentAccountIds = new Set<Id>();
    for (Account account : trigger.new) {
        if (account.ParentId == null) continue;
        if (account.Lead_Analyst__c != null) continue;
        parentAccountIds.add(account.ParentId);
    }
    parentAccounts = new Map<Id, Account>([
        SELECT Id, Lead_Analyst__c 
        FROM Account 
        WHERE Id IN :parentAccountIds AND Lead_Analyst__c <> null]);
        
    for (Account account : trigger.new) {
        if (account.ParentId != null && account.Lead_Analyst__c == null && parentAccounts.containsKey(account.ParentId)) {
                account.Lead_Analyst__c = parentAccounts.get(account.ParentId).Lead_Analyst__c;
            }
    }
    
    //Sales_Director__c
    parentAccountIds = new Set<Id>();
    for (Account account : trigger.new) {
        if (account.ParentId == null) continue;
        if (account.Sales_Director__c != null) continue;
        parentAccountIds.add(account.ParentId);
    }
    parentAccounts = new Map<Id, Account>([
        SELECT Id, Sales_Director__c 
        FROM Account 
        WHERE Id IN :parentAccountIds AND Sales_Director__c <> null]);
        
    for (Account account : trigger.new) {
        if (account.ParentId != null && account.Sales_Director__c == null && parentAccounts.containsKey(account.ParentId)) {
                account.Sales_Director__c = parentAccounts.get(account.ParentId).Sales_Director__c;
            }
    }
    
    //Bulk_Bing_AccountPL__c
    parentAccountIds = new Set<Id>();
    for (Account account : trigger.new) {
        if (account.ParentId == null) continue;
        if (account.Bulk_Bing_AccountPL__c != null) continue;
        parentAccountIds.add(account.ParentId);
    }
    parentAccounts = new Map<Id, Account>([
        SELECT Id, Bulk_Bing_AccountPL__c 
        FROM Account 
        WHERE Id IN :parentAccountIds AND Bulk_Bing_AccountPL__c <> null]);
        
    for (Account account : trigger.new) {
        if (account.ParentId != null && account.Bulk_Bing_AccountPL__c == NULL && parentAccounts.containsKey(account.ParentId)) {
                account.Bulk_Bing_AccountPL__c = parentAccounts.get(account.ParentId).Bulk_Bing_AccountPL__c;
            }
    }
        
    //Bulk_Google_AccountPL__c
    parentAccountIds = new Set<Id>();
    for (Account account : trigger.new) {
        if (account.ParentId == null) continue;
        if (account.Bulk_Google_AccountPL__c != null) continue;
        parentAccountIds.add(account.ParentId);
    }
    parentAccounts = new Map<Id, Account>([
        SELECT Id, Bulk_Google_AccountPL__c 
        FROM Account 
        WHERE Id IN :parentAccountIds AND Bulk_Google_AccountPL__c <> null]);
        
    for (Account account : trigger.new) {
        if (account.ParentId != null && account.Bulk_Google_AccountPL__c == NULL && parentAccounts.containsKey(account.ParentId)) {
                account.Bulk_Google_AccountPL__c = parentAccounts.get(account.ParentId).Bulk_Google_AccountPL__c;
            }
    }
    //Custom_Call_TrackingPL__c
    parentAccountIds = new Set<Id>();
    for (Account account : trigger.new) {
        if (account.ParentId == null) continue;
        if (account.Custom_Call_TrackingPL__c != null) continue;
        parentAccountIds.add(account.ParentId);
    }
    parentAccounts = new Map<Id, Account>([
        SELECT Id, Custom_Call_TrackingPL__c 
        FROM Account 
        WHERE Id IN :parentAccountIds AND Custom_Call_TrackingPL__c <> null]);
        
    for (Account account : trigger.new) {
        if (account.ParentId != null && account.Custom_Call_TrackingPL__c == NULL && parentAccounts.containsKey(account.ParentId)) {
                account.Custom_Call_TrackingPL__c = parentAccounts.get(account.ParentId).Custom_Call_TrackingPL__c;
            }
    }
    //Client_Side_ClientPL__c
    parentAccountIds = new Set<Id>();
    for (Account account : trigger.new) {
        if (account.ParentId == null) continue;
        if (account.Client_Side_ClientPL__c != null) continue;
        parentAccountIds.add(account.ParentId);
    }
    parentAccounts = new Map<Id, Account>([
        SELECT Id, Client_Side_ClientPL__c 
        FROM Account 
        WHERE Id IN :parentAccountIds AND Client_Side_ClientPL__c <> null]);
        
    for (Account account : trigger.new) {
        if (account.ParentId != null && account.Client_Side_ClientPL__c == NULL && parentAccounts.containsKey(account.ParentId)) {
                account.Client_Side_ClientPL__c = parentAccounts.get(account.ParentId).Client_Side_ClientPL__c;
            }
    }
}