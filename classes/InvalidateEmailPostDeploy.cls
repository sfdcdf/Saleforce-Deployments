public class InvalidateEmailPostDeploy implements Database.Batchable<sObject> {
  
	private String query;
	private List<String> emailFieldList;

	public InvalidateEmailPostDeploy(String queryString, List<String> emailFields) {
		query = queryString;
		emailFieldList = emailFields;
	}

	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

	public void execute(Database.BatchableContext BC, List<sObject> scope) {
		for(SObject record : scope){
			for(String field : emailFieldList){
				if(record.get(field) != null){
					String fakeValue = 'fake' + (String)record.get(field) + 'fake';
					record.put(field, fakeValue);
				}
			}
		}
		Database.update(scope, false);
		//update scope;
	}

	public void finish(Database.BatchableContext BC) {

	}
  
}