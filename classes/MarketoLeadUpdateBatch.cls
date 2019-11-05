/****************************************************************************
  Company/ Author ....: R. Wang
  Date Created .......: 19-June-2019
  Description ........: Use the Costom Object MarketoLeadSFAccountMapping__c to update Marketo Lead's attribute salesforceAccountId
  Execution ..........: In Developer Console run the Apex Code "Database.executeBatch(new MarketoLeadUpdateBatch (), 300);"
                        300 is the maximum batch size accepted by Marketo
*****************************************************************************/

public class MarketoLeadUpdateBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {
    
    String query;
    
    public MarketoLeadUpdateBatch() {
        query = 'SELECT Id, MarketoLeadId__c, SFAccountId__c, Status__c, ErrorMessage__c FROM MarketoLeadSFAccountMapping__c';
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC) {    
        return Database.getQueryLocator(query);
    }


    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        String response = updateLeads(scope);
        processResponse(scope, response);
    }
    
    public void finish(Database.BatchableContext BC) {
        
    }
    
    
    private String updateLeads(List<MarketoLeadSFAccountMapping__c> marketoLeadSFAccountMappings)
    {
        System.Debug('Entering Method updateLeads');
        
        JSONGenerator bodyJSON = JSON.createGenerator(false);
        bodyJSON.writeStartObject();
            bodyJSON.writeObjectField('action', 'updateOnly');
            bodyJSON.writeObjectField('lookupField', 'id');
            bodyJSON.writeObjectField('asyncProcessing', false);            
            bodyJSON.writeFieldName('input');
            bodyJSON.writeStartArray();
                for(MarketoLeadSFAccountMapping__c inputValue : marketoLeadSFAccountMappings){
                    bodyJSON.writeStartObject();                        
                    bodyJSON.writeObjectField('id', inputValue.MarketoLeadId__c);  
                    bodyJSON.writeObjectField('salesforceAccountID', inputValue.SFAccountId__c);                     
                    bodyJSON.writeEndObject();
                }
            bodyJSON.writeEndArray();   
        bodyJSON.writeEndObject();
               
        String strBodyJSON =  bodyJSON.getAsString();
               
        System.Debug('Marketo Request:' + strBodyJSON);       
                
        HttpResponse res = MarketoSyncService.calloutToMarketoPOST('/rest/v1/leads.json', strBodyJSON, '', true);
        
        System.Debug('Marketo Response: ' + res.getBody());
        
        System.Debug('Exit Method updateLeads');
        
        return res.getBody();
    }
    
    
    private void processResponse(List<MarketoLeadSFAccountMapping__c> marketoLeadSFAccountMappings, String response)
    {
        System.Debug('Entering Method processResponse');
        
        try{
            Map<String, Object> jsonResponse = (Map<String, Object>)JSON.deserializeUntyped(response); 
            List<Object> mktResults = (List<Object>)jsonResponse.get('result');
            for(Integer i = 0; i < mktResults.size(); i++){
                try {
                        Map<String, Object> mktRecord = (Map<String, Object>)mktResults[i];
                        if(String.valueof(mktRecord.get('status')).equalsIgnoreCase('updated')){
                            marketoLeadSFAccountMappings[i].put('Status__c', 'Success');                                        
                        }
                        else {
                            marketoLeadSFAccountMappings[i].put('Status__c', 'Error');
                            marketoLeadSFAccountMappings[i].put('ErrorMessage__c', JSON.serialize(mktRecord.get('reasons')));
                        }
                }
                catch (Exception e) {
                    marketoLeadSFAccountMappings[i].put('Status__c', 'Unknown');
                    marketoLeadSFAccountMappings[i].put('ErrorMessage__c', e.getMessage());
                }                          
            }
            Update(marketoLeadSFAccountMappings);
        }
        catch (Exception e) {
            System.Debug('Error when parsing the response: ' + e.getMessage());
        }
        
        System.Debug('Exit Method processResponse');
        
    }
    
}