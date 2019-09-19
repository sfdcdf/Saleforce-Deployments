/*
//Reason : ?BeaconHS1Migration? : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
*/
trigger CustomAutomationTrigger on Custom_Automation__c (before update, after insert, after update) {
   /* if(trigger.isBefore && trigger.isUpdate){
        CustomAutomationObjectHelper.beforeUpdate(trigger.newMap, trigger.oldMap);
    }else if(trigger.isAfter && trigger.isInsert){
        CustomAutomationObjectHelper.afterInsert(trigger.newMap);
    }else if(trigger.isAfter && trigger.isUpdate){
        CustomAutomationObjectHelper.afterUpdate(trigger.newMap, trigger.oldMap);
    }*/
}