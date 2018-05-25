@RestResource(urlMapping='/partnerUserQuizScore/*')
global without sharing class PartnerCommunityScore_RESTAPI  {

    @HttpGet
    global static Partner_User_Quiz_Scores__c scoreAPI() {
        RestRequest req = RestContext.request;

        Map<String, Object> testMap = (Map<String,Object>)JSON.deserializeUntyped(JSON.serialize(req.params));
        system.debug(testMap);

        if(testMap.get('quiz_id') == null){
            return null;
        }

        Partner_User_Quiz_Scores__c obj = new Partner_User_Quiz_Scores__c();
        obj.ProProfs_Message__c = JSON.serialize((Map<String,Object>)JSON.deserializeUntyped(JSON.serialize(req.params)));
        insert obj;

        return obj;
    }

    /*@HttpPost
    global static Partner_User_Quiz_Scores__c createQuizScore() {
        RestRequest req = RestContext.request;

        Partner_User_Quiz_Scores__c obj = new Partner_User_Quiz_Scores__c();
        obj.ProProfs_Message__c = req.requestBody.toString();
        insert obj;

        return obj;
        

    }

    @HttpPut
    global static Partner_User_Quiz_Scores__c updateObject() {

        Partner_User_Quiz_Scores__c obj;

        return obj;

    }

    @HttpDelete
    global static void remove() {

    }*/

}