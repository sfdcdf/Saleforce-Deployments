public class CPPLeadRegistrationChildAccountLinkBatch implements Database.Batchable<sObject> {
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator([select Id from CPP_Lead_Registration__c where Gold_Nugget_Client_ID__c != '' and Child_Account__c = '']);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
		update scope;
	}
	
	public void finish(Database.BatchableContext BC) {
		
	}
	
}