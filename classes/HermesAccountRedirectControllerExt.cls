public without sharing class HermesAccountRedirectControllerExt {

	private final Account acct;
    public Boolean showWaitingStatus {get; set;}

    public HermesAccountRedirectControllerExt(ApexPages.StandardController stdController) {
        acct = (Account)stdController.getRecord();
        showWaitingStatus = true;
    }

    public PageReference redirectToHermes(){
        try{
            String hermesURL;
            String jsonResponse;

            Account accountRecord = [select Id, Client_ID__c, wrenBilling__c from Account where Id = :acct.Id and wrenBilling__c = true];

            JSONGenerator combinedJSON = JSON.createGenerator(false); 

            combinedJSON.writeStartObject();
            combinedJSON.writeObjectField('clientIds', new List<Integer>{Integer.valueOf(accountRecord.Client_ID__c)});
            combinedJSON.writeObjectField('restURL', URL.getSalesforceBaseUrl().toExternalForm());
            combinedJSON.writeEndObject();

            system.debug(combinedJSON.getAsString());

            jsonResponse = YodleLiveIntegration.liveAction('external-billing-links', true, combinedJSON.getAsString());

            //jsonResponse = '[{"rel": "hermes", "href": "https://hermesbeta.web.com/index.php?m=customers&a=main&cprod_id=14926937"}, {"rel": "wrenBilling", "href": "https://hermesbeta.web.com/index.php?m=customers&a=main&cprod_id=14926937"}]';
            Map<String, Object> getInitialResponseAndDeserialize = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);

            List<Object> deserializedResponse = (List<Object>)JSON.deserializeUntyped(JSON.serialize(getInitialResponseAndDeserialize.get(accountRecord.Client_ID__c)));
            for(Object obj : deserializedResponse){
                Map<String, Object> objDeserialize = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(obj));
                if(String.valueof(objDeserialize.get('rel')) == 'wrenBilling'){
                    hermesURL = String.valueof(objDeserialize.get('href'));
                }
            }
            PageReference pageRef = new PageReference(hermesURL);
            pageRef.setRedirect(true);
            return pageRef;
        }catch(Exception E){
            showWaitingStatus = false;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, E.getMessage()));
        }
        showWaitingStatus = false;
        return null;
    }
}