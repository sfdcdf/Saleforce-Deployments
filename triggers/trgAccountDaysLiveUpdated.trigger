trigger trgAccountDaysLiveUpdated on Account (after update) {
    
    Set<Id> accountIdsPostLaunch = new Set<Id>();
    Set<Id> accountIds45day = new Set<Id>();
    List<Contact> dmlContacts = new List<Contact>();
    
    for ( Account a: trigger.new )
    {
        if ( ( a.Channel_Development__c == '' || a.Channel_Partner_Type__c == null ) && ( a.Client_Type__c != 'OEM Account' ) )
        {
            if ( a.Days_Live__c == 45 )
                accountIds45day.add(a.Id);
            else if ( a.Days_Live__c == 3 )
                accountIdsPostLaunch.add(a.Id);
        }
    }

    if(accountIds45day.size() > 0){
        for(Contact c :
                [SELECT Id,
                        send_45_day_survey__c,
                        send_Post_Launch_survey__c
                   FROM Contact
                  WHERE AccountId IN :accountIds45day]){
            
            // check for 45 day value
            if(!c.send_45_day_survey__c){
            
                // set checkbox to true
                c.send_45_day_survey__c = True;
                
                // add to update list
                dmlContacts.add(c);
            }
        }
    }
    
    if(accountIdsPostLaunch.size() > 0){
        for(Contact c :
                [SELECT Id,
                        send_45_day_survey__c,
                        send_Post_Launch_survey__c
                   FROM Contact
                  WHERE AccountId IN :accountIdsPostLaunch]){
            
            // check for post launch value
            if(!c.send_Post_Launch_survey__c){
            
                // set checkbox to true
                c.send_Post_Launch_survey__c= True;
                
                // add to update list
                dmlContacts.add(c);
            }
        }
    }
    
    
    if(dmlContacts.size() > 0){
    
        // update contact records
        update dmlContacts;
    }

    /** commented out and replaced by above refactored code
    
    List<Contact> contacts;

    contacts = [ Select c.send_45_day_survey__c From Contact c where c.AccountId in :accountIds45day ];
    for ( Contact c: contacts)
    {
        c.send_45_day_survey__c = True;
    }
    update contacts;

    contacts = [ Select c.send_Post_Launch_survey__c From Contact c where c.AccountId in :accountIdsPostLaunch ];
    for ( Contact c: contacts )
    {
        c.send_Post_Launch_survey__c = True;
    }
    update contacts;
    
    **/
}