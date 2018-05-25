trigger SL_Case on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    SL_TriggerFactory.createTriggerHandler(Case.sObjectType);
}