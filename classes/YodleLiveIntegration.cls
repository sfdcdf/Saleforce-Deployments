public class YodleLiveIntegration { 
 
    //Maybe put in custom settings
 	//private static final String authToken = '73PwuwriTm6bScHre1R2cKxnboyqjV'; real token

    private static final String authToken = Integration_Settings__c.getInstance().Salesforce_Incoming_Service_authToken__c; //'lgCqnySEd7AkfQOovpu0'; // test token
    
    /**
     * See "salesforce-incoming-service" in Yodle codebase for documentation regarding
     * Yodle Live to Salesforce integration.
     */
    public static String liveAction(String action, Boolean blocking, String payload) {
        
    	JSONGenerator gen = JSON.createGenerator(false); 
        gen.writeStartObject();
        gen.writeStringField('action', action);
        if (blocking != null) {
        	gen.writeBooleanField('blocking', blocking);
        }
    	gen.writeObjectField('payload', JSON.deserializeUntyped(payload));
    	gen.writeObjectField('auth', authToken);
    	gen.writeEndObject();
    	
    	HttpRequest req = new HttpRequest(); 
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint('callout:YodleLiveAction');
        req.setTimeout(120000);
        req.setBody(gen.getAsString());
        
        System.debug(gen.getAsString());

        system.debug(req);
         
        Http http = new Http(); 
        HTTPResponse res = http.send(req);

        system.debug(res.getBody());

        return res.getBody();
    }

}