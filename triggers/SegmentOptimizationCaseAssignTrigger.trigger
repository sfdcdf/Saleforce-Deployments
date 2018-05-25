trigger SegmentOptimizationCaseAssignTrigger on Segment_Optimization_Case_Assignment__c (before insert, after insert, before update, after update) {
	if(trigger.isBefore && trigger.isInsert){
		SegmentOptCaseAssignTriggerHandler.beforeInsert(trigger.New);
	}else if(trigger.isAfter && trigger.isInsert){
		SegmentOptCaseAssignTriggerHandler.afterInsert(trigger.newMap);
	}else if(trigger.isBefore && trigger.isUpdate){
		SegmentOptCaseAssignTriggerHandler.beforeUpdate(trigger.newMap, trigger.oldMap);
	}else if(trigger.isAfter && trigger.isUpdate){
		SegmentOptCaseAssignTriggerHandler.afterUpdate(trigger.newMap, trigger.oldMap);
	}
}