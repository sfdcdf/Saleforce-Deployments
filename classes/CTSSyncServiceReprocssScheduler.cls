/*
 * To run it every 30 minutes go to Developer Console: Debug->Open Execute Anonymous Window:
        System.schedule('CTS Sync Service Reprocess Scheduler 1', '0 0 * * * ?', new CTSSyncServiceReprocssScheduler());        
        System.schedule('CTS Sync Service Reprocess Scheduler 2', '0 30 * * * ?', new CTSSyncServiceReprocssScheduler());        
 */
global with sharing class CTSSyncServiceReprocssScheduler implements Schedulable {

    global void execute(SchedulableContext sc) {    
        Reprocess('Case');
        Reprocess('Organic_Analysis__c');
        Reprocess('Quality_Case__c');
        Reprocess('Customer_Surveys__c');                                
    }
    
    private void Reprocess(String objType)
    {
        List<SFDCToCTSAsynchRequest__c> asyncRecords = [SELECT Id,                        
                        Name,
                        NumberOfRetryAttempts__c,
                        ObjectId__c,
                        Object_Name__c,                       
                        Status__c
                   FROM SFDCToCTSAsynchRequest__c
                   WHERE Object_Name__c = :objType AND Status__c = 'ERROR' AND NumberOfRetryAttempts__c < 3
                   LIMIT 10]; 
        
        if (asyncRecords.size() > 0)
        {
            FOR(SFDCToCTSAsynchRequest__c record : asyncRecords)
                record.Status__c = 'REPROCESS';
                
            Update asyncRecords;
        }                    
    }
}