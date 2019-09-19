trigger SL_Organic_Analysis on Organic_Analysis__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    SL_TriggerFactory.createTriggerHandler(Organic_Analysis__c.sObjectType);
}