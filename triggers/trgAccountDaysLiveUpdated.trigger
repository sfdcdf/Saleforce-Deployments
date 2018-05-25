trigger trgAccountDaysLiveUpdated on Account (after update) {
	
	Set<Id> accountIdsPostLaunch = new Set<Id>();
	Set<Id> accountIds45day = new Set<Id>();
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

}