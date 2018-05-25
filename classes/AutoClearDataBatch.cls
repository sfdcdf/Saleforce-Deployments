public class AutoClearDataBatch implements Database.Batchable<sObject> {
	
	private String query;
	private String fieldToClearOut;
	
	public AutoClearDataBatch(String passedQuery, String passedFieldToClearOut) {
		query = passedQuery;
		fieldToClearOut = passedFieldToClearOut;
	}
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
   		for(sObject record : scope){
   			record.put(fieldToClearOut, null);
   		}
   		Database.update(scope, false);
	}
	
	public void finish(Database.BatchableContext BC) {
		
	}
	
}