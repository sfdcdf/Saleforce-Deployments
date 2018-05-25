global class TouchplanAutoCloseBatch implements Database.Batchable<sObject> {
    
    global TouchplanAutoCloseBatch() {

    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([select Id, Status, Scheduled_Call__c, Auto_Close_Date__c from Case where LastModifiedDate = LAST_N_DAYS:30 and Auto_Close_Date__c != null and Auto_Close_Date__c < TODAY and IsClosed = false]);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        for(Case cs : (List<Case>)scope){
            if(cs.Scheduled_Call__c != null && cs.Scheduled_Call__c >= cs.Auto_Close_Date__c){
                continue;
            }
            cs.Status = 'Did Not Complete';
            cs.Reason = 'Account';
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }
    
}