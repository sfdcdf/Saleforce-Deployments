public class RetentionSLAEvaluationBatch implements Database.Batchable<sObject> {
		
	public RetentionSLAEvaluationBatch() {
		
	}
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator([select Id, Day_Of_Next_SLA_Touch__c, Day_SLA_Equivalent__c from Cancellation_Request__c where Outcome__c = 'In Progress' and (Next_Scheduled_Contact_Date__c < TODAY or Next_Scheduled_Contact_Date__c = null)]);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
		for(Cancellation_Request__c record : (List<Cancellation_Request__c>)scope){
			record.Day_SLA_Equivalent__c++;
		}
		Database.update(scope, false);
	}
	
	public void finish(Database.BatchableContext BC) {
		
	}
	
}