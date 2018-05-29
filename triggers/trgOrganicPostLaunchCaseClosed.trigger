trigger trgOrganicPostLaunchCaseClosed on Case (after insert, after update) {

    private static String organicSetup = '012600000009OBoAAM';
    Set<Id> accountIds = new Set<Id>();
    User u = [SELECT Id, Name FROM User WHERE Name = 'DB Amp' LIMIT 1];
    
    // only execute if user is not DB Amp User
    if(UserInfo.getUserId() != u.Id){
    
        for ( Case c :trigger.new )
        {
            if ( c.RecordTypeId == organicSetup && c.Subject == 'NCS Organic Post-Launch' && c.Status == 'Closed' && !accountIds.contains(c.AccountId) )
            {
                accountIds.add(c.AccountId);
            }
        }
    
        // abrosius@soliantconsulting.com 2013Jul17: added ability to shut off this section of the trigger with a custom setting called Textbroker_Trigger_Switch__c
        if(trigger.isAfter && trigger.isUpdate && TextbrokerHelper.enforceTextbrokerTriggerAfter && TextbrokerHelper.getTriggerSwitchValue('Trigger Switch')) {
            //We have to set it before we call the methods that do the actual work to avoid infinite loops
            TextbrokerHelper.enforceTextbrokerTriggerAfter = false;
            TextbrokerDispatcher.processTextbrokerTrigger(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
            //TextbrokerHelper.enforceTextbrokerTriggerAfter = true;
        }
    
        List<Account> accounts = [ Select Post_Launch_Case_closed__c from Account where id in :accountIds ];
        
        if(accounts.size() > 0){
        
            for ( Account a :accounts )
            {
                a.Post_Launch_Case_closed__c = true;
            }
            
            update accounts;
        }
    }
}