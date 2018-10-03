public class ATVContentSetupCaseBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {
    
    private static Batch_Automation_Settings__c batchSetting = Batch_Automation_Settings__c.getValues('ATV Content Setup Case');

    /*private static Set<String> segmentExcludeServicesOffered {
        get{
            if(segmentExcludeServicesOffered == null){
                segmentExcludeServicesOffered = new Set<String>();
                for(String s : Label.OrganicCustomContentSetupCaseBatchExcludeServicesOffered.split(',')){
                    segmentExcludeServicesOffered.add(s.trim());
                }
            }

            return segmentExcludeServicesOffered;
        }
        set;
    }*/
    //private static Id devRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Development').getRecordTypeId();

    public ATVContentSetupCaseBatch() {
        
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = batchSetting.SOQL_Criteria__c;
        if(String.isNotBlank(batchSetting.Additional_SOQL_Criteria__c)){
            query += ' ' + batchSetting.Additional_SOQL_Criteria__c;
        }
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        List<Integer> clientIds = new List<Integer>();
        Map<String, Account> clientIdAcctMap = new Map<String, Account>();
        for(Account acct : (List<Account>)scope){
            clientIds.add(Integer.valueof(acct.Client_ID__c));
            clientIdAcctMap.put(acct.Client_ID__c, acct);
        }
        JSONGenerator combinedJSON = JSON.createGenerator(false); 

        combinedJSON.writeStartObject();
        combinedJSON.writeObjectField('clientIds', clientIds);
        combinedJSON.writeEndObject();
        
        try{
            String jsonResponse = YodleLiveIntegration.liveAction('get-client-organic-setup-information', true,  combinedJSON.getAsString());
            Map<String, Object> jsonDeserializeMap = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);
            system.debug(jsonDeserializeMap);

            List<Case> createOrganicSetupCaseList = new List<Case>();
            Map<String, String> defaultValueMapAssignment = defaultValueMap();

            for(String key : jsonDeserializeMap.keySet()){
                Map<String, Object> clientResponseMap = (Map<String, Object>)jsonDeserializeMap.get(key);
                Case newCase = new Case();
                newCase.AccountId = clientIdAcctMap.get(key).Id;
                newCase.Name_of_Business_for_Name_Campaign__c = (String)clientResponseMap.get('businessName');
                newCase.Segment__c = (String)clientResponseMap.get('segmentName');
                newCase.Geographic_Areas_To_Service__c = (String)clientResponseMap.get('servingAreaTagline');
                newCase.Services_Offered__c = '';
                newCase.Number_of_Pages_Text__c = 1;
                Integer pageNumber = 2; // Added to address ,YO-68088 by Subba on 8/8/2017,Home Page will be Pg1,so seq will start from 2, PreFix Page# to each serviceGroup added in Case.Services_Offered__c
                if(String.isNotBlank(newCase.Segment__c)){
                    for(Object obj : (List<Object>)clientResponseMap.get('serviceGroups')){
                        Map<String, Object> clientServiceMap = (Map<String, Object>)obj;
                        newCase.Services_Offered__c +='Page ' + String.valueOf(pageNumber) + ' - ' +(String)clientServiceMap.get('name') + ' - ' + newCase.Geographic_Areas_To_Service__c + ' ' + (clientServiceMap.get('keyword') != null ? (String)clientServiceMap.get('keyword') : (String)clientServiceMap.get('name')) + '\r\n';
                        newCase.Number_of_Pages_Text__c++;
                        pageNumber++;
                    }
                }

                for(String defaultKey : defaultValueMapAssignment.keySet()){
                    newCase.put(defaultKey, defaultValueMapAssignment.get(defaultKey));
                }
                createOrganicSetupCaseList.add(newCase);
            }

            if(createOrganicSetupCaseList.size() > 0){
                insert createOrganicSetupCaseList;
            }
        }catch(Exception E){
            DebugInfo__c di = new DebugInfo__c();
            di.DebugData__c = 'ATVContentSetupCaseBatch failed for client Ids: ' + clientIds + '\r\n' + 'Error: ' + E.getMessage();
            insert di;
        }
    }
    
    public void finish(Database.BatchableContext BC) {
        
    }

    public static Map<String, String> defaultValueMap(){
        List<String> defaultValueList = new List<String>();
        defaultValueList.addAll(batchSetting.Default_Values__c.split(','));
        if(String.isNotBlank(batchSetting.Additional_Default_Values__c)){
            defaultValueList.addAll(batchSetting.Additional_Default_Values__c.split(','));
        }

        Map<String, String> defaultMap = new Map<String, String>();
        for(String val : defaultValueList){
            List<String> splitKeyFromValue = val.split(':');
            defaultMap.put(splitKeyFromValue[0].trim(), splitKeyFromValue[1].trim());
        }

        return defaultMap;
    }
    
}

/*
{
  "56166": {
    "clientId": 56166,
    "businessName": "The Roy J Catering Service",
    "servingAreaTagline": "Greater Kingwood, TX",
    "segmentName": "Caterer",
    "sellingPropositions": [
      "Quick Response",
      "Excellent Customer Service",
      "Locally Owned & Operated"
    ],
    "serviceGroups": [
      {
        "id": 177239032,
        "name": "Catering",
        "keyword": "catering services"
      },
      {
        "id": 177239035,
        "name": "Corporate Catering",
        "keyword": "office gourmet catering"
      },
      {
        "id": 177239036,
        "name": "Lunch Catering",
        "keyword": "lunch catering"
      },
      {
        "id": 177239037,
        "name": "BBQ Picnic Catering",
        "keyword": "bbq catering"
      },
      {
        "id": 177239656,
        "name": "Breakfast Catering",
        "keyword": "breakfast catering"
      }
    ]
  },
  "235470": {
    "clientId": 235470,
    "businessName": "Court's Snaggle Tooth DDS",
    "servingAreaTagline": "Austin, TX",
    "segmentName": "Dentist",
    "sellingPropositions": [
      "Highly trained staff",
      "Comfortable, relaxing environment",
      "Friendly and helpful office staff"
    ],
    "serviceGroups": [
      {
        "id": 177239071,
        "name": "General Dentistry",
        "keyword": "dental care"
      },
      {
        "id": 225193704,
        "name": "Emergency Dentistry",
        "keyword": "emergency dentist"
      }
    ]
  }
}

if(
or(
and(
ISBLANK(KeyWord_1_Service_Name__c),
ISBLANK(KeyWord_2_Service_Name__c)),
and(
ISBLANK(KeyWord_3_Service_Name__c ),
ISBLANK(KeyWord_2_Service_Name__c)),
and(
ISBLANK( KeyWord_1_Service_Name__c ),
ISBLANK(KeyWord_3_Service_Name__c))),
"1",
if(
or(
ISBLANK(KeyWord_1_Service_Name__c),
ISBLANK(KeyWord_2_Service_Name__c),
ISBLANK(KeyWord_3_Service_Name__c)),
"2",
"3"))
*/

//https://salesforce-incoming.api.yodle.com:443/api/v1/action

//http://salesforceincoming.services.nyc.dev.yodle.com/api/v1/action