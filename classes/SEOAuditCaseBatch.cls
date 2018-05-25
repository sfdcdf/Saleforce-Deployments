global without sharing class SEOAuditCaseBatch implements Database.Batchable<sObject> {

	static Date THIRTY_DAYS_AGO = Date.today().addDays(-30);
	static Date SIXTY_DAYS_AGO = Date.today().addDays(-60);
	static String THIRTY_DAY_SUBJECT = 'Please create the 30 day SEO audit for';
	static String SIXTY_DAY_SUBJECT = 'Please create the 30 day SEO audit for';
	static String NINETY_DAY_SUBJECT = 'Please create the 30 day SEO audit for';
	
	Id caseRecordTypeId;
	Id caseQueueId;

	
	global SEOAuditCaseBatch() {
		List<RecordType> rts = [SELECT Id 
								FROM RecordType 
								WHERE DeveloperName = 'YBN_Master_Case'];
		if(rts.size() > 0) caseRecordTypeId = rts[0].Id;

		List<Group> queueList = [Select Name, Id 
					   			 FROM Group 
					   			 WHERE Name = 'National Performance Queue' 
					   			 AND Type = 'Queue' LIMIT 1];
		if(queueList.size() > 0) casequeueId = queueList[0].Id;
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		List<Case> Cases 	= [SELECT AccountID, Subject 
				 						FROM Case 
				 						WHERE (Subject like '%30 day SEO audit for%'
				 							OR Subject like '%60 day SEO audit for%'
				 							OR Subject like '%90 day SEO audit for%')
				 						AND RecordTypeId = :caseRecordTypeId];
		
		List<Id> todayAccts = new List<Id>();
		List<Id> thirtyDayAccts = new List<Id>();
		List<Id> sixtyDayAccts = new List<Id>();
		for(Case c :cases){
			if(c.Subject.contains(THIRTY_DAY_SUBJECT)){
				todayAccts.add(c.AccountId);
			}else if(c.Subject.contains(SIXTY_DAY_SUBJECT)){
				thirtyDayAccts.add(c.AccountId);
			}else if(c.Subject.contains(NINETY_DAY_SUBJECT)){
				sixtyDayAccts.add(c.AccountId);
			}
		}

		List<RecordType> acctRTs = [SELECT Id FROM RecordType WHERE Name = 'YBN Master Account'];

		return Database.getQueryLocator(
				[SELECT Id, Name, Account_Director__r.Email, 
						Sales_Director__r.Email, Live_Date__c
				 FROM 	Account  
				 WHERE 	(Live_Date__c = TODAY AND Id NOT IN :todayAccts AND RecordTypeId NOT IN :acctRTs)
				 OR 	(Live_Date__c = :THIRTY_DAYS_AGO AND Id NOT IN :thirtyDayAccts)
				 OR 	(Live_Date__c = :SIXTY_DAYS_AGO AND Id NOT IN :sixtyDayAccts)]);
	}

   	global void execute(Database.BatchableContext BC, List<Account> scope) {
   		runJob(scope);
	}

	global void finish(Database.BatchableContext BC) {
	}

	public void runJob(List<Account> scope){
		System.debug(String.valueOf(scope));
   		List<Case> casesToInsert = new List<Case>();
		for(Account a :scope){
			String caseSubject;
			Date dueDate;
			if(a.Live_Date__c == Date.today()){
				caseSubject = 'Please create the 30 day SEO audit for' + a.Name;
				dueDate = Date.today().addDays(7);
			}else if(a.Live_Date__c == THIRTY_DAYS_AGO){
				caseSubject = 'Please create the 60 day SEO audit for' + a.Name;
				dueDate = Date.today().addDays(7);
			}else if(a.Live_Date__c == SIXTY_DAYS_AGO){
				caseSubject = 'Please create the 90 day SEO audit for' + a.Name;
				dueDate = Date.today().addDays(7);
			}

			String acctDirEmail = '';
			if(a.Account_Director__c != null){
				acctDirEmail = a.Account_Director__r.Email;
			}
			String salesDirEmail = '';
			if(a.Sales_Director__c != null){
				salesDirEmail = a.Sales_Director__r.Email;
			}

			Case c = new Case(
				AccountId = a.Id,
				Reason = 'Organic Request - Relationship Level',
				OwnerId = casequeueId,
				Reason_Detail__c = 'Organic Audit Request',
				Account_Director_Email__c = acctDirEmail,
				Sales_Director_Email__c = salesDirEmail,
				Status = 'New',
				Priority = 'Major',
				YBN_Project_Due_Date__c = dueDate,
				Subject = caseSubject,
				RecordTypeId = caseRecordTypeId
			);
			casesToInsert.add(c);
		}
		insert casesToInsert;
	}
	
}