trigger SL_EmailMessage on EmailMessage (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    SL_TriggerFactory.createTriggerHandler(EmailMessage.sObjectType);
}