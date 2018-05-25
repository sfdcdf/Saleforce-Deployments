global class ybnScheduleSatisfactionScores implements Schedulable{

	global void execute(SchedulableContext ctx) {
		ybnBatchableSatisfactionScores ss = new ybnBatchableSatisfactionScores('SELECT Id FROM Account WHERE RecordTypeId = \'' + ybnUtils.getInstance().getYbnCorporateRelationshipAccountRecordTypeId() + '\'');
		ID batchprocessid = Database.executeBatch(ss);
	}
	
	static testmethod void test() {
   		Test.startTest();
   		
   		List <Account> accns = new List<Account>();
		for(integer i = 0; i<10; i++){
			Account a = new Account(Name='testAccount');//+'i'); 
			a.Live_Date__c = System.today().addDays(-7);
			accns.add(a);
      	}
      	 
   		insert accns;
   		
   		String jobId = System.schedule('testBasicScheduledApex',
      		'0 0 0 3 9 ? 2022', 
         	new ybnScheduleSatisfactionScores());
         
		Test.stopTest();
	}
         	
}