trigger ybnAccountServiceLevel on Account (after update) {
    
    Id rtYbnMaster = Utilities.GetRecTypeId('Account', 'YBN Master Account');
    id rtStandard = Utilities.GetRecTypeId('Account', 'Standard');
    Set<Id> setParentIds = new Set<Id>();
    List<Account> accountsToUpdate = new List<Account>();
    Map<Id, String> serviceLevelMap = new Map<Id, String>();
    Map<Id, Id> accountDirectorMap = new Map<Id, Id>();
    Map<Id, Id> leadAnalystMap = new Map<Id, Id>();
    Map<Id, Id> salesDirectorMap = new Map<Id, Id>();
    Map<Id, Id> forceFieldSalesDirectorMap = new Map<Id, Id>();
    Map<Id, String> bulkBingAccountPLMap = new Map<Id, String>();
    Map<Id, String> bulkGoogleAccountPLMap = new Map<Id, String>();
    Map<Id, String> customCallTrackingPLMap = new Map<Id, String>();
    Map<Id, String> clientSideClientPLMap = new Map<Id, String>();
    Id RecordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipAccountRecordTypeId();
    
    for (Account account : trigger.new) {
        // Only process master accounts
        if(account.RecordTypeId != rtYbnMaster)  continue;
            
        // Only work on parent accounts (by account type)
        //if (account.RecordTypeId != RecordTypeId) continue;
        //Note (Oct 2, 2013): Above is commented out in order to update children of children accounts
        
        // Continue if service level hasn't been updated
        Account oldAccount = Trigger.oldMap.get(account.Id);
        
        if (oldAccount.Individual_Location_Service_Level__c != account.Individual_Location_Service_Level__c) {
            serviceLevelMap.put(account.Id, account.Individual_Location_Service_Level__c);  
            setParentIds.add(account.Id);
        }
        
        if (oldAccount.Account_Director__c != account.Account_Director__c) {
            accountDirectorMap.put(account.Id, account.Account_Director__c);
            setParentIds.add(account.Id);    
        }

        if (oldAccount.Lead_Analyst__c != account.Lead_Analyst__c) {
            leadAnalystMap.put(account.Id, account.Lead_Analyst__c);  
            setParentIds.add(account.Id); 
        }
        
        if (oldAccount.Sales_Director__c != account.Sales_Director__c) {
            salesDirectorMap.put(account.Id, account.Sales_Director__c);
            setParentIds.add(account.Id);   
        }

        if (oldAccount.Force_Field_Sales_Director__c != account.Force_Field_Sales_Director__c) {
            forceFieldSalesDirectorMap.put(account.Id, account.Force_Field_Sales_Director__c); 
            setParentIds.add(account.Id);  
        }
                
        if (oldAccount.Bulk_Bing_AccountPL__c != account.Bulk_Bing_AccountPL__c) {
            bulkBingAccountPLMap.put(account.Id, account.Bulk_Bing_AccountPL__c); 
            setParentIds.add(account.Id);   
        }
        
        if (oldAccount.Bulk_Google_AccountPL__c != account.Bulk_Google_AccountPL__c) {
            bulkGoogleAccountPLMap.put(account.Id, account.Bulk_Google_AccountPL__c);
            setParentIds.add(account.Id);    
        }
        
        if (oldAccount.Custom_Call_TrackingPL__c != account.Custom_Call_TrackingPL__c) {
            customCallTrackingPLMap.put(account.Id, account.Custom_Call_TrackingPL__c); 
            setParentIds.add(account.Id);   
        }
        
        if (oldAccount.Client_Side_ClientPL__c != account.Client_Side_ClientPL__c) {
            clientSideClientPLMap.put(account.Id, account.Client_Side_ClientPL__c);
            setParentIds.add(account.Id);   
        }
        
    }
    
    if(setParentIds.size()>0){
        for (Account a: [SELECT Id, ParentId, Individual_Location_Service_Level__c 
                         FROM Account 
                         WHERE RecordTypeId = :rtStandard
                         AND ParentId IN :setParentIds]) 
        {
            Boolean toUpdate = false;
        
            if (serviceLevelMap.containsKey(a.ParentId)) {
                a.Individual_Location_Service_Level__c = serviceLevelMap.get(a.ParentId);
                toUpdate = true;
            }
            if (accountDirectorMap.containsKey(a.ParentId)) {
                a.Account_Director__c = accountDirectorMap.get(a.ParentId);
                toUpdate = true;
            }
            if (leadAnalystMap.containsKey(a.ParentId)) {
                a.Lead_Analyst__c = leadAnalystMap.get(a.ParentId);
                toUpdate = true;
            }
            if (salesDirectorMap.containsKey(a.ParentId)) {
                a.Sales_Director__c = salesDirectorMap.get(a.ParentId);
                toUpdate = true;
            }
            if (forceFieldSalesDirectorMap.containsKey(a.ParentId)) {
                a.Force_Field_Sales_Director__c = forceFieldSalesDirectorMap.get(a.ParentId);
                toUpdate = true;
            }
            if (bulkBingAccountPLMap.containsKey(a.ParentId)) {
                a.Bulk_Bing_AccountPL__c = bulkBingAccountPLMap.get(a.ParentId);
                toUpdate = true;
            }
            if (bulkGoogleAccountPLMap.containsKey(a.ParentId)) {
                a.Bulk_Google_AccountPL__c = bulkGoogleAccountPLMap.get(a.ParentId);
                toUpdate = true;
            }
            if (customCallTrackingPLMap.containsKey(a.ParentId)) {
                a.Custom_Call_TrackingPL__c = customCallTrackingPLMap.get(a.ParentId);
                toUpdate = true;
            }
            if (clientSideClientPLMap.containsKey(a.ParentId)) {
                a.Client_Side_ClientPL__c = clientSideClientPLMap.get(a.ParentId);
                toUpdate = true;
            }
            
            if(toUpdate)  accountsToUpdate.add(a);
        }
    
        if(accountsToUpdate.size()>0)  update accountsToUpdate;
    }
}