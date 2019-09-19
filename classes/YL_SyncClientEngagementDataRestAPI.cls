@RestResource(urlMapping='/clients/engagement/*')
global without sharing class YL_SyncClientEngagementDataRestAPI  {

    @HttpPost
    global static void syncEngagementData() {
        RestRequest req = RestContext.request;
        List<YodleLiveSyncClientEngagementDataHelper.DebugDataWrapper> debugDatWrapperList = YodleLiveSyncClientEngagementDataHelper.updateClientEngagementData(req.requestBody.toString());

        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(JSON.serialize(debugDatWrapperList));
        system.debug(RestContext.response);
    }

}