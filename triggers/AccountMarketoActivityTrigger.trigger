trigger AccountMarketoActivityTrigger on Account_Marketo_Activity__c (before insert, before update) {
	if(trigger.isBefore && trigger.isInsert){
		AccountMarketoActivityTriggerHandler.beforeInsert(trigger.New);
	}else if (trigger.isBefore && trigger.isUpdate){
		AccountMarketoActivityTriggerHandler.beforeUpdate(trigger.newMap, trigger.oldMap);
	}
}