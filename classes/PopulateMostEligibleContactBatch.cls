global class PopulateMostEligibleContactBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            'SELECT Id, Phone, MobilePhone, OtherPhone ' + 
            'FROM Contact ' + 
            'WHERE ' + 
                '(Account.RecordType.Name = \'YBN Master Account\' OR Account.Client_Type__c = \'YBN\') AND ' +
                '(Phone != NULL OR MobilePhone != NULL OR OtherPhone != NULL)'
                
        );
    }
    
    global void execute(Database.BatchableContext bc, List<sObject> scope){
        List<Contact> lstContactsToUpdate = (List<Contact>)scope;
        
        YodleUtilities.flagEligibleContact(lstContactsToUpdate);
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}