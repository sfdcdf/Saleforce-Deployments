public with sharing class IntegrationHelperClass {

    /*public static Boolean isCellPhoneNumber(String phoneNumber){   Commenting out because only used for Inbound Sales Stuff and it's not in prod
        Boolean isCellPhone = true;

        JSONGenerator gen = JSON.createGenerator(false); 
        gen.writeStartObject();
        gen.writeObjectField('phoneNumber', phoneNumber);
        gen.writeEndObject();

        String jsonResponse = YodleLiveIntegration.liveAction('validate-cell-phone', true, gen.getAsString());
        Map<String, Object> deserializedResponse = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);

        if((!deserializedResponse.containsKey('error') || String.isBlank((String)deserializedResponse.get('error'))) && deserializedResponse.containsKey('isCellPhone') ){
            isCellPhone = (Boolean)deserializedResponse.get('isCellPhone');
        }

        return isCellPhone;
    }*/

    /*@future(callout=true)  // COMMENTED OUT BECAUSE WE CURRENTLY DON'T USE IT FOR PROD
    public static void inboundSalesLeadsToQueue(String inboundLeadIdChangedFieldsMapJSON, List<String> queueSyncFieldList) {
        // Consider moving into custom settings so that it's easily configurable to what information should be sent out to Gold Nugget
        //List<String> queueSyncFieldList = new List<String>{'Prospect_Contact_ID__c', 'Prospect_ID__c', 'Company', 'Website', 'Secondary_Segments__c', 'Street', 'City', 'StateCode', 'PostalCode', 'CountryCode', 'Salutation', 'FirstName', 'LastName', 'Email', 'MobilePhone', 'Phone', 'Fax', 'Owner.Email', 'Status'};

        Map<Id, List<String>> inboundLeadIdChangedFieldsMap = (Map<Id, List<String>>)JSON.deserialize(inboundLeadIdChangedFieldsMapJSON, Map<Id, List<String>>.class);

        Set<Id> inboundLeadIdSet = inboundLeadIdChangedFieldsMap.keySet();

        String query = 'select ' + String.join(queueSyncFieldList, ',') + ' from Lead where Id in : inboundLeadIdSet';

        inboundSalesLeadsToQueueAction(Database.query(query), inboundLeadIdChangedFieldsMap);
    }

    // Upsert Lead Action
    public static void inboundSalesLeadsToQueueAction(List<Lead> leadsList, Map<Id, List<String>> inboundLeadIdChangedFieldsMap){
        List<Lead> updateLeadList = new List<Lead>();

        for(Lead record : leadsList){
            JSONGenerator gen = JSON.createGenerator(false); 
            gen.writeStartObject();
            gen.writeObjectField('object', record);
            gen.writeEndObject();

            String jsonResponse = YodleLiveIntegration.liveAction('upsert-lead', true, gen.getAsString());
            Map<String, Object> deserializedResponse = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);

            if((!deserializedResponse.containsKey('error') || String.isBlank((String)deserializedResponse.get('error'))) && deserializedResponse.containsKey('contactId') ){
                record.Prospect_Contact_ID__c = String.valueof(deserializedResponse.get('contactId'));
                record.Prospect_ID__c = String.valueof(deserializedResponse.get('prospectId'));
                updateLeadList.add(record);
            }
        }

        if(!updateLeadList.isEmpty()){
            update updateLeadList;
        }
    }*/

    @future(callout=true)
    public static void inbouldSalesUpdateAccountToQueue(String inboundAccountIdChangedFieldsMapJSON, List<String> queueSyncFieldList){
        Map<Id, List<String>> inboundAccountIdChangedFieldsMap = (Map<Id, List<String>>)JSON.deserialize(inboundAccountIdChangedFieldsMapJSON, Map<Id, List<String>>.class);

        Set<Id> inboundAccountIdSet = inboundAccountIdChangedFieldsMap.keySet();

        String query = 'select ' + String.join(queueSyncFieldList, ',') + ' from Account where Id in : inboundAccountIdSet';

        inboundSalesUpdateAccountToQueueAction(Database.query(query), inboundAccountIdChangedFieldsMap);
    }

    // Update Account Action
    public static void inboundSalesUpdateAccountToQueueAction(List<Account> acctList, Map<Id, List<String>> inboundAccountIdChangedFieldsMap){
        for(Account record : acctList){
            JSONGenerator combinedJSON = JSON.createGenerator(false); 
            combinedJSON.writeStartObject();
            combinedJSON.writeFieldName('object');
                combinedJSON.writeStartObject();
                combinedJSON.writeObjectField('account', record);
                combinedJSON.writeObjectField('changedFields', inboundAccountIdChangedFieldsMap.get(record.Id));
                combinedJSON.writeEndObject();
            combinedJSON.writeEndObject();

            String jsonResponse = YodleLiveIntegration.liveAction('update-account', false, combinedJSON.getAsString());
            Map<String, Object> deserializedResponse = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);

            system.debug(deserializedResponse);
        }
    }

}