trigger ybnAccountServiceLevelChildrenAccounts_NEW on Account (before insert, before update) {
    SL_AccountTriggerHandler.setSalesDirectorFields(trigger.new);
    
    Set<Id> setParAccIds = new Set<Id>();
    for(Account acc: trigger.new){
        if(acc.ParentId != null){
            if(acc.Individual_Location_Service_Level__c==null || acc.Account_Director__c==null || acc.Lead_Analyst__c==null 
            || acc.Sales_Director__c==null || acc.Bulk_Bing_AccountPL__c==null || acc.Bulk_Google_AccountPL__c==null
            || acc.Custom_Call_TrackingPL__c==null || acc.Client_Side_ClientPL__c==null)
            {
                setParAccIds.add(acc.ParentId);
            }
        }
    }
    
    if(setParAccIds.size()>0){
        Map<Id, Account> mapParAccs = new Map<Id, Account>([
            SELECT Id, Individual_Location_Service_Level__c, Account_Director__c, Lead_Analyst__c, Sales_Director__c, 
                Bulk_Bing_AccountPL__c, Bulk_Google_AccountPL__c, Custom_Call_TrackingPL__c, Client_Side_ClientPL__c
            FROM Account WHERE Id IN :setParAccIds]);
            
        for(Account acc: trigger.new){
            if(acc.ParentId != null && mapParAccs.get(acc.ParentId)!=null){
                Account accParent = mapParAccs.get(acc.ParentId);
                //Individual_Location_Service_Level__c
                if(acc.Individual_Location_Service_Level__c==null && accParent.Individual_Location_Service_Level__c!=null){
                    acc.Individual_Location_Service_Level__c = accParent.Individual_Location_Service_Level__c;
                }
                //Account_Director__c
                if(acc.Account_Director__c==null && accParent.Account_Director__c!=null){
                    acc.Account_Director__c = accParent.Account_Director__c;
                }
                //Sales_Director__c
                if(acc.Sales_Director__c==null && accParent.Sales_Director__c!=null){
                    acc.Sales_Director__c = accParent.Sales_Director__c;
                }
                //Bulk_Bing_AccountPL__c
                if(acc.Bulk_Bing_AccountPL__c==null && accParent.Bulk_Bing_AccountPL__c!=null){
                    acc.Bulk_Bing_AccountPL__c = accParent.Bulk_Bing_AccountPL__c;
                }
                //Bulk_Google_AccountPL__c
                if(acc.Bulk_Google_AccountPL__c==null && accParent.Bulk_Google_AccountPL__c!=null){
                    acc.Bulk_Google_AccountPL__c = accParent.Bulk_Google_AccountPL__c;
                }
                //Custom_Call_TrackingPL__c
                if(acc.Custom_Call_TrackingPL__c==null && accParent.Custom_Call_TrackingPL__c!=null){
                    acc.Custom_Call_TrackingPL__c = accParent.Custom_Call_TrackingPL__c;
                }
                //Client_Side_ClientPL__c
                if(acc.Client_Side_ClientPL__c==null && accParent.Client_Side_ClientPL__c!=null){
                    acc.Client_Side_ClientPL__c = accParent.Client_Side_ClientPL__c;
                }
            }
        }
        
    }
}