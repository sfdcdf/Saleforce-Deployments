/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
trigger dlrs_TaskTrigger on Task
    (before delete, before insert, before update, after delete, after insert, after undelete, after update)
{
    if(Trigger.isBefore && Trigger.isInsert){
        CheckRecursive.runBeforeInsert();
        CheckRecursive.runBeforeUpdate();
        dlrs.RollupService.triggerHandler();
    } else if(Trigger.isAfter && Trigger.isInsert){
        CheckRecursive.runAfterInsert();
        CheckRecursive.runAfterUpdate();
        dlrs.RollupService.triggerHandler();
    }
    else if((Trigger.isBefore && Trigger.isUpdate && CheckRecursive.runBeforeUpdate()) 
    || (Trigger.isBefore && Trigger.isDelete && CheckRecursive.runBeforeDelete())  
    || (Trigger.isAfter && Trigger.isUpdate && CheckRecursive.runAfterUpdate())
    || (Trigger.isAfter && Trigger.isDelete && CheckRecursive.runAfterDelete()) 
    || (Trigger.isAfter && Trigger.isUndelete && CheckRecursive.runAfterUndelete())          
    ){
        dlrs.RollupService.triggerHandler();
    }    
}