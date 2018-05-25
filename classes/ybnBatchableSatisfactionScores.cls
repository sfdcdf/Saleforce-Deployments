global with sharing class ybnBatchableSatisfactionScores implements Database.Batchable<sObject> {
	
	global String query;

	global ybnBatchableSatisfactionScores(String q){
		query=q;
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC){
		return Database.getQueryLocator(query);
	}
	
	global void execute(Database.BatchableContext BC, List<Account> scope){
		ybnAccountUtils.updateSatisfactionScores(scope);
	}

	global void finish(Database.BatchableContext BC){
	}
}