global class ResetContactLiveOpsAttributesBatch implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id FROM Contact WHERE Account.RecordType.Name = \'YBN Master Account\' OR Account.Client_Type__c = \'YBN\'');
    }
    
    global void execute(Database.BatchableContext bc, List<sObject> scope){
        List<Contact> lstContactsToUpdate = new List<Contact>();
        
        for(sObject sObj : scope){
            Contact con = (Contact)sObj;
            
            con.Target_Account__c = NULL;
            con.Most_Eligible__c = FALSE;
            con.Executed_Clause_For_Flagging__c = NULL;
            
            con.Target_Account_E2C__c = NULL;
            con.Most_Eligible_E2C__c = FALSE;
            con.Executed_Clause_For_Flagging_E2C__c = NULL;
            
            lstContactsToUpdate.add(con);
        }
        
        Database.update(lstContactsToUpdate);
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}