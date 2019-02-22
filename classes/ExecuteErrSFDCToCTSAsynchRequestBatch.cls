/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 02-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 02-Jan-2019
  Description ........: Batchable class to create CTS Tickets using the SFDC Sync Service to CTS ESB Service (API). 
  Error Status records.
  
  Dependencies: 
  - Custom Setting | Batch Automation Settings
  
*****************************************************************************/
public class ExecuteErrSFDCToCTSAsynchRequestBatch implements Database.Batchable<sObject>, Database.AllowsCallouts 
{
    private static Batch_Automation_Settings__c batchSetting;
    String objName;

    public ExecuteErrSFDCToCTSAsynchRequestBatch(string objectName) {
      
        objName = objectName;
        
        switch on objectName {
        
            when 'Case' {
                batchSetting = Batch_Automation_Settings__c.getValues('Async Request Cases Errored');
            }
            when 'Customer_Surveys__c' {
                batchSetting = Batch_Automation_Settings__c.getValues('Async Request Customer Surveys Errored');
            }
            when 'Organic_Analysis__c' {
                batchSetting = Batch_Automation_Settings__c.getValues('Async Request Organic Cases Errored');
            }
            when 'Quality_Case__c' {
                batchSetting = Batch_Automation_Settings__c.getValues('Async Request Quality Cases Errored');
            }
        }
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
    
        CTS_Integration_Setting__mdt integrationSetting = CTSSyncService.GetCTSIntegrationSettings();
        String query = batchSetting.SOQL_Criteria__c;
        
        if(String.isNotBlank(batchSetting.Additional_SOQL_Criteria__c)){
            query += ' ' + batchSetting.Additional_SOQL_Criteria__c;
        }
        
        query += ' LIMIT ' + String.valueOf(integrationSetting.AsyncRetrievalSize__c);
        
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
    
        for(SFDCToCTSAsynchRequest__c ar :  (List<SFDCToCTSAsynchRequest__c>) scope){
        
            CTSSyncService.ProcessSFDCToCTSAsynchRequest(objName, scope);
        }
    }
    
    public void finish(Database.BatchableContext BC) {
        
    }
}