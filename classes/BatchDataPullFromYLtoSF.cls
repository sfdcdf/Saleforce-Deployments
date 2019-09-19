public class BatchDataPullFromYLtoSF implements Database.Batchable<sObject>, Database.AllowsCallouts {
	
	private String query;
	private String classToInvoke;
	
	public BatchDataPullFromYLtoSF(String passedQuery, String passedClassToInvoke) {
		query = passedQuery;
		classToInvoke = passedClassToInvoke;
	}
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
		if(classToInvoke == 'YodleLiveSyncClientEngagementDataHelper'){
			List<Integer> clientIdList = new List<Integer>();
			for(Account acct : (List<Account>)scope){
				clientIdList.add(Integer.valueof(acct.Client_ID__c));
			}
			YodleLiveSyncClientEngagementDataHelper.reqClientEngagementData(clientIdList);
		}

	}
	
	public void finish(Database.BatchableContext BC) {
		
	}
	
}