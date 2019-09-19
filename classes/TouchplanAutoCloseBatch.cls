/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
*/

global class TouchplanAutoCloseBatch implements Database.Batchable<sObject> {
    Integer i1 = 1; 
    Integer i2 = 1; 
    Integer i3 = 1; 
    Integer i4 = 1; 
    Integer i5 = 1; 
    Integer i6 = 1; 
    Integer i7 = 1; 
    Integer i8 = 1; 
    Integer i9 = 1; 
    Integer i10 = 1; 
    
    global TouchplanAutoCloseBatch() {

    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
       return Database.getQueryLocator([select Id, Status, Scheduled_Call__c, Auto_Close_Date__c from Case where LastModifiedDate = LAST_N_DAYS:30 and Auto_Close_Date__c != null and Auto_Close_Date__c < TODAY and IsClosed = false]);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope) {
      /*  for(Case cs : (List<Case>)scope){
            if(cs.Scheduled_Call__c != null && cs.Scheduled_Call__c >= cs.Auto_Close_Date__c){
                continue;
            }
            cs.Status = 'Did Not Complete';
            cs.Reason = 'Account';
        }
        update scope;*/
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }
    
}