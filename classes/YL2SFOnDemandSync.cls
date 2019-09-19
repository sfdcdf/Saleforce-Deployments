@RestResource(urlMapping='/yltosfsync')
global with sharing class YL2SFOnDemandSync  {

    //[{"yodle.core.client":{"id":326471,"status":"Provisioning"}}]

    @HttpGet
    global static void yl2SFSyncGet(){
        RestRequest req = RestContext.request;
        system.debug(req);

        //DebugInfo__c db = new DebugInfo__c();
        //db.DebugData__c = 'YL2SFSyncGet  | ' + (req.requestBody != null ? req.requestBody.toString() : '');
        //insert db;

        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf('YAY!!!!');
    }

    @HttpPost
    global static void yl2SFSyncPost(){
        RestRequest req = RestContext.request;
        system.debug(req.requestBody.toString());

        List<Object> reqBodyList = (List<Object>)JSON.deserializeUntyped(req.requestBody.toString());

        List<Account> updateAcctList = new List<Account>();
        List<DebugInfo__c> debugInfo = new List<DebugInfo__c>();

        Map<String, Id> usernameIdMap = new Map<String, Id>();
        for(User record : [select Id, Username from User where IsActive = true and UserType = 'Standard']){
            usernameIdMap.put(record.Username, record.Id);
        }

        for(Object obj : reqBodyList){
            Map<String, Object> objMap = (Map<String, Object>)obj;
            Map<String, Object> objValueMap = (Map<String, Object>)objMap.get('yodle.core.client');

            Account acct = new Account();
            try{
                acct = [select Id from Account where Client_ID__c =: String.valueof(objValueMap.get('id'))];
            }catch(Exception E){
                DebugInfo__c newDebug = new DebugInfo__c();
                newDebug.DebugData__c = 'yl2SFSyncPost Error | ' + JSON.serializePretty(objMap) + ' | ' + JSON.serializePretty(E.getMessage());
                debugInfo.add(newDebug);
            }
            if(acct.Id != null){
                for(String key : objValueMap.keySet()){
                    if(key.equalsIgnoreCase('clientYodleTeam')){
                        Map<String, Object> objYTMap = (Map<String, Object>)objValueMap.get('clientYodleTeam');
                        for(String ytKey : objYTMap.keySet()){
                            YL2SFAccountFieldMapping__c gv = YL2SFAccountFieldMapping__c.getValues(ytKey);
                            if(gv != null){
                                if(gv.Email2UsernameMap__c){
                                    Map<String, Object> unValueMap = (Map<String, Object>)objYTMap.get(ytKey);
                                    String unValue = String.valueof(unValueMap.get('username'));
                                    system.debug(unValue);
                                    if(usernameIdMap.containsKey(unValue)){
                                        acct.put(gv.Salesforce_Field_API_Name__c, String.valueof(usernameIdMap.get(unValue)));
                                    }else if(String.isBlank(unValue)){
                                        acct.put(gv.Salesforce_Field_API_Name__c, null);
                                    }
                                }
                            }
                        }
                    }else if(key.equalsIgnoreCase('rebranding')){
                        Map<String, Object> objYTMap = (Map<String, Object>)objValueMap.get('rebranding');
                        for(String ytKey : objYTMap.keySet()){
                            YL2SFAccountFieldMapping__c gv = YL2SFAccountFieldMapping__c.getValues(ytKey);
                            if(gv != null){
                                acct.put(gv.Salesforce_Field_API_Name__c, String.valueof(objYTMap.get(ytKey)));
                            }
                        }
                    }else{
                        YL2SFAccountFieldMapping__c gv = YL2SFAccountFieldMapping__c.getValues(key);
                        if(gv != null){
                            acct.put(gv.Salesforce_Field_API_Name__c, String.valueof(objValueMap.get(key)));
                        }
                    }
                }
                updateAcctList.add(acct);
            }
        }

        if(!updateAcctList.isEmpty()){
            Database.SaveResult[] srList = Database.update(updateAcctList, false);

            for(Integer i = 0; i < srList.size(); i++){
                Database.SaveResult sr = srList[i];

                if(!sr.isSuccess()){
                    DebugInfo__c newDebug = new DebugInfo__c();
                    newDebug.DebugData__c = 'yl2SFSyncPost Error | ' + JSON.serializePretty(updateAcctList[i]) + ' | ' + JSON.serializePretty(sr.getErrors());
                    debugInfo.add(newDebug);
                }
            }
        }

        if(!debugInfo.isEmpty()){
            Database.insert(debugInfo, false);
        }

        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(JSON.serializePretty(updateAcctList));
    }

}