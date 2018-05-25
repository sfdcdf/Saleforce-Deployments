trigger SL_Lighthouse_Worksheets on Lighthouse_Worksheets__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	SL_TriggerFactory.createTriggerHandler(Lighthouse_Worksheets__c.sObjectType);
}