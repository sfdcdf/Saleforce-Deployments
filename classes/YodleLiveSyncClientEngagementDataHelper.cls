public without sharing class YodleLiveSyncClientEngagementDataHelper {
    // Get Client Engagement Data
    public static void reqClientEngagementData(List<Integer> clientIds){
        JSONGenerator combinedJSON = JSON.createGenerator(false); 

        combinedJSON.writeStartObject();
        combinedJSON.writeObjectField('clientIds', clientIds);
        combinedJSON.writeObjectField('restURL', URL.getSalesforceBaseUrl().toExternalForm());
        combinedJSON.writeEndObject();

        system.debug(combinedJSON.getAsString());

        String jsonResponse = YodleLiveIntegration.liveAction('sync-client-engagement-data', true, combinedJSON.getAsString());
        //Map<String, Object> deserializedResponse = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);
        List<YodleLiveSyncClientEngagementDataHelper.DebugDataWrapper> debugDatWrapperList = YodleLiveSyncClientEngagementDataHelper.updateClientEngagementData(jsonResponse);

        system.debug(jsonResponse);
    }

    public static List<DebugDataWrapper> updateClientEngagementData(String clientEngagementDataJSON){
        system.debug(clientEngagementDataJSON);
        List<Object> clientEngagementList = (List<Object>)JSON.deserializeUntyped(clientEngagementDataJSON);
        List<Account> updateAccountList = new List<Account>();
        for(Object obj : clientEngagementList){
            Account acctRecord = (Account)JSON.deserialize(JSON.serialize(obj), Account.class);
            acctRecord.Engagement_Data_Last_Update__c = DateTime.now();
            updateAccountList.add(acctRecord);
        }
        Database.UpsertResult[] upsertResult = Database.upsert(updateAccountList, Account.Fields.Client_ID__c, false);

        List<DebugInfo__c> debugInfoList = new List<DebugInfo__c>();

        List<DebugDataWrapper> ddwResponseList = new List<DebugDataWrapper>();

        for(Integer i = 0; i < updateAccountList.size(); i++){
            DebugDataWrapper ddw = new DebugDataWrapper();
            ddw.resultLog = upsertResult[i];
            ddw.payloadLog = updateAccountList[i];
            ddwResponseList.add(ddw);

            if(!upsertResult[i].isSuccess()){
                DebugInfo__c di = new DebugInfo__c();
                di.DebugData__c = JSON.serializePretty(ddw);
                debugInfoList.add(di);
            }
        }
        insert debugInfoList;

        return ddwResponseList;
    }

    public class DebugDataWrapper{
        public Object resultLog;
        public Object payloadLog;
    }
}