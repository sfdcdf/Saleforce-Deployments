global class SalesforceToQueueBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {
	
	private Set<Id> ids = new Set<Id>();
	private String obj;
	private List<String> syncFieldList = new List<String>();
	private String actType;
	private Map<Id, List<String>> inboundIdChangedFieldsMap;
	
	global SalesforceToQueueBatch(String inboundAccountIdChangedFieldsMapJSON, String objName, List<String> queueSyncFieldList, String actionType) {
		inboundIdChangedFieldsMap = (Map<Id, List<String>>)JSON.deserialize(inboundAccountIdChangedFieldsMapJSON, Map<Id, List<String>>.class);
		ids = inboundIdChangedFieldsMap.keySet();
		obj = objName;
		syncFieldList = queueSyncFieldList;
		actType = actionType;
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'select ' + String.join(syncFieldList, ',') + ' from ' + obj + ' where Id in : ids';
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {
		if(actType == 'update-account'){
			IntegrationHelperClass.inboundSalesUpdateAccountToQueueAction(scope, inboundIdChangedFieldsMap);
		}else if(actType == 'upsert-lead'){
			//IntegrationHelperClass.inboundSalesLeadsToQueueAction(scope, inboundIdChangedFieldsMap);
		}
	}
	
	global void finish(Database.BatchableContext BC) {
		
	}
	
}