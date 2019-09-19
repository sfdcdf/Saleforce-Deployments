/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019*/
trigger SL_Case on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    //SL_TriggerFactory.createTriggerHandler(Case.sObjectType);
}