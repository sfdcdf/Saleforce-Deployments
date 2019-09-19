public class NCSCaseCSCDateToMarketoBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {
	
	String query;
	
	public NCSCaseCSCDateToMarketoBatch() {
		
	}
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		DateTime last15Mins = DateTime.now().addMinutes(-15);
		query = Label.NCSCaseCSCDateToMarketoBatchQuery + ' and CreatedDate > :last15Mins';
		return Database.getQueryLocator(query);
	}

   	public void execute(Database.BatchableContext BC, List<Case> scope) {
		String calloutResponse = CaseObjectHelper.ncsCaseUpdateMarketoCSCScheduleCallout('', '', JSON.serialize(scope), false, '');
		try{
			if(calloutResponse.containsIgnoreCase('skipped')){
				DebugInfo__c err = new DebugInfo__c();
    			err.DebugData__c = 'NCSCaseCSCDateToMarketoBatch had failure: ' + JSON.serialize(calloutResponse);
    			insert err;
			}
			for(Case record : scope){
				record.Sync_to_Marketo__c = true;
			}

			Database.update(scope, false);
		}catch(Exception E){

		}
	}
	
	public void finish(Database.BatchableContext BC) {
		if(!Test.isRunningTest()){
			System.scheduleBatch(new NCSCaseCSCDateToMarketoBatch(), 'NCSCaseCSCDateToMarketoBatch every 5 minutes', 5, 100);
		}
	}
	
}