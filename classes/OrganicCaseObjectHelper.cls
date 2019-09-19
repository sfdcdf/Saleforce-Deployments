public without sharing class OrganicCaseObjectHelper {
	public static Boolean alreadyFiredOrganicCaseObjectHelper = false;

	public static Set<Id> recordTypeIdSet = new Set<Id>{Schema.SObjectType.Organic_Analysis__c.getRecordTypeInfosByName().get('Maps Initial Claiming').getRecordTypeId()};

	public static void syncOrganicCaseRecordLogic(List<Organic_Analysis__c> newValue, Map<Id, Organic_Analysis__c> oldValue){
        system.debug(newValue);
		Set<Id> accountIdSet = new Set<Id>();
		for(Organic_Analysis__c oa : newValue){
			if(!oa.Sync_to_Marketo__c && String.isNotBlank(oa.Account_Name__c)){
				accountIdSet.add(oa.Account_Name__c);
			}
		}

		Map<Id, Account> accountRecordMap = new Map<Id, Account>([select Id, Marketo_ID__c, Sync_to_Marketo__c, Days_Since_Live__c, Secondary_Segments__c, Client_Type__c from Account where Id in :accountIdSet and Marketo_ID__c != '' and Sync_to_Marketo__c = true]);
		for(Organic_Analysis__c oa : newValue){
			if(accountRecordMap.containsKey(oa.Account_Name__c)){
				Account acct = accountRecordMap.get(oa.Account_Name__c);
				if(!oa.Sync_to_Marketo__c && oldValue.isEmpty() && acct.Client_Type__c == 'Local' && recordTypeIdSet.contains(oa.RecordTypeId)){
					oa.Sync_to_Marketo__c = true;
				}else if(!oa.Sync_to_Marketo__c && acct.Client_Type__c == 'Local' && recordTypeIdSet.contains(oa.RecordTypeId) && (acct.Days_Since_Live__c == null || acct.Days_Since_Live__c <= 30)){
					oa.Sync_to_Marketo__c = true;
				}
			}
		}
	}

	public static void organicCaseMarketoSyncHelper(Map<Id, Organic_Analysis__c> newValue, Map<Id, Organic_Analysis__c> oldValue){
		Map<String, SFDC_Org_Case_to_Marketo_Field_Mappings__c> sfdcAPINameSFDCMarketoFieldMappingMap = new Map<String, SFDC_Org_Case_to_Marketo_Field_Mappings__c>();
		for(SFDC_Org_Case_to_Marketo_Field_Mappings__c sfdcOrganicCaseMarketoFieldMap : SFDC_Org_Case_to_Marketo_Field_Mappings__c.getAll().values()){
			if(sfdcOrganicCaseMarketoFieldMap.Sync_Field__c){
				sfdcAPINameSFDCMarketoFieldMappingMap.put(sfdcOrganicCaseMarketoFieldMap.SFDC_Field_API_Name__c, sfdcOrganicCaseMarketoFieldMap);
			}
		}

		List<Organic_Analysis__c> organicCaseSyncList = new List<Organic_Analysis__c>();
		for(Organic_Analysis__c record : newValue.values()){
			Boolean syncToMarketo = false;
			if(record.Sync_to_Marketo__c && oldValue.isEmpty() && recordTypeIdSet.contains(record.RecordTypeId)){
				syncToMarketo = true;
			}else if(record.Sync_to_Marketo__c && !oldValue.isEmpty() && recordTypeIdSet.contains(record.RecordTypeId)){
				Organic_Analysis__c oldRecord = oldValue.get(record.Id);
				for(String sfdcOrganicCaseMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingMap.keySet()){
					if(record.get(sfdcOrganicCaseMarketoFieldMap) != oldRecord.get(sfdcOrganicCaseMarketoFieldMap) && (sfdcAPINameSFDCMarketoFieldMappingMap.get(sfdcOrganicCaseMarketoFieldMap).Sync_Blank_Values__c || (!sfdcAPINameSFDCMarketoFieldMappingMap.get(sfdcOrganicCaseMarketoFieldMap).Sync_Blank_Values__c && record.get(sfdcOrganicCaseMarketoFieldMap) != null))) {
						syncToMarketo = true;
						break;
					}
				}
			}

			if(syncToMarketo){
				organicCaseSyncList.add(record);
			}
		}

		if(!organicCaseSyncList.isEmpty()){
			organicCaseUpdateLeads('', '', JSON.serialize(organicCaseSyncList), false, '');
			OrganicCaseObjectHelper.alreadyFiredOrganicCaseObjectHelper = true;
		}
	}

	@future(callout=true)
	public static void organicCaseUpdateLeads(String action,  String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
		system.debug(sObjectListJSON);
		List<SObject> sObjectList = (List<SObject>)JSON.deserialize(sObjectListJSON, List<SObject>.class);

		Map<Id, Account> accountMap = new Map<Id, Account>([select Id, Marketo_ID__c from Account where Id in (select Account_Name__c from Organic_Analysis__c where Id in : sObjectList) and Marketo_ID__c != '' and Sync_to_Marketo__c = true]);

		Map<String, SFDC_Org_Case_to_Marketo_Field_Mappings__c> sfdcAPINameSFDCMarketoFieldMappingMap = new Map<String, SFDC_Org_Case_to_Marketo_Field_Mappings__c>();
		for(SFDC_Org_Case_to_Marketo_Field_Mappings__c sfdcOrganicCaseMarketoFieldMap : SFDC_Org_Case_to_Marketo_Field_Mappings__c.getAll().values()){
			if(sfdcOrganicCaseMarketoFieldMap.Sync_Field__c){
				sfdcAPINameSFDCMarketoFieldMappingMap.put(sfdcOrganicCaseMarketoFieldMap.SFDC_Field_API_Name__c, sfdcOrganicCaseMarketoFieldMap);
			}
		}

		JSONGenerator bodyJSON = JSON.createGenerator(false); 
        bodyJSON.writeStartObject();
            bodyJSON.writeObjectField('action', (String.isNotBlank(action) ? action : 'updateOnly'));
        	bodyJSON.writeObjectField('lookupField', (String.isNotBlank(lookupField) ? lookupField : 'id'));
        	bodyJSON.writeObjectField('asyncProcessing', asyncProcessing);
        	if(String.isNotBlank(partitionName)){
        		bodyJSON.writeObjectField('partitionName', partitionName);
        	}
        	bodyJSON.writeFieldName('input');
            bodyJSON.writeStartArray();
            	for(SObject inputValue : sObjectList){
            		bodyJSON.writeStartObject();
            			bodyJSON.writeObjectField('id', accountMap.get((id)inputValue.get('Account_Name__c')).Marketo_ID__c);
            			for(SFDC_Org_Case_to_Marketo_Field_Mappings__c sfdcOrganicCaseMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingMap.values()){
            				if(inputValue.get(sfdcOrganicCaseMarketoFieldMap.SFDC_Field_API_Name__c) != null){
            					bodyJSON.writeObjectField(sfdcOrganicCaseMarketoFieldMap.Name, String.valueof(inputValue.get(sfdcOrganicCaseMarketoFieldMap.SFDC_Field_API_Name__c)));
            				}else if(sfdcOrganicCaseMarketoFieldMap.Sync_Blank_Values__c){
            					bodyJSON.writeObjectField(sfdcOrganicCaseMarketoFieldMap.Name, '');
            				}
            			}
            		bodyJSON.writeEndObject();
            	}
            bodyJSON.writeEndArray();	
        bodyJSON.writeEndObject();
        HttpResponse res = MarketoSyncService.calloutToMarketoPOST('/rest/v1/leads.json', bodyJSON.getAsString(), '', true);
        system.debug(res.getBody());
	}

	public static String organicCaseUpdateLeadsNotFuture(String action,  String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
		system.debug(sObjectListJSON);
		List<SObject> sObjectList = (List<SObject>)JSON.deserialize(sObjectListJSON, List<SObject>.class);

		Map<Id, Account> accountMap = new Map<Id, Account>([select Id, Marketo_ID__c from Account where Id in (select Account_Name__c from Organic_Analysis__c where Id in : sObjectList) and Marketo_ID__c != '' and Sync_to_Marketo__c = true]);

		Map<String, SFDC_Org_Case_to_Marketo_Field_Mappings__c> sfdcAPINameSFDCMarketoFieldMappingMap = new Map<String, SFDC_Org_Case_to_Marketo_Field_Mappings__c>();
		for(SFDC_Org_Case_to_Marketo_Field_Mappings__c sfdcOrganicCaseMarketoFieldMap : SFDC_Org_Case_to_Marketo_Field_Mappings__c.getAll().values()){
			if(sfdcOrganicCaseMarketoFieldMap.Sync_Field__c){
				sfdcAPINameSFDCMarketoFieldMappingMap.put(sfdcOrganicCaseMarketoFieldMap.SFDC_Field_API_Name__c, sfdcOrganicCaseMarketoFieldMap);
			}
		}

		JSONGenerator bodyJSON = JSON.createGenerator(false); 
        bodyJSON.writeStartObject();
            bodyJSON.writeObjectField('action', (String.isNotBlank(action) ? action : 'updateOnly'));
        	bodyJSON.writeObjectField('lookupField', (String.isNotBlank(lookupField) ? lookupField : 'id'));
        	bodyJSON.writeObjectField('asyncProcessing', asyncProcessing);
        	if(String.isNotBlank(partitionName)){
        		bodyJSON.writeObjectField('partitionName', partitionName);
        	}
        	bodyJSON.writeFieldName('input');
            bodyJSON.writeStartArray();
            	for(SObject inputValue : sObjectList){
            		bodyJSON.writeStartObject();
            			bodyJSON.writeObjectField('id', accountMap.get((id)inputValue.get('Account_Name__c')).Marketo_ID__c);
            			for(SFDC_Org_Case_to_Marketo_Field_Mappings__c sfdcOrganicCaseMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingMap.values()){
            				if(inputValue.get(sfdcOrganicCaseMarketoFieldMap.SFDC_Field_API_Name__c) != null){
            					bodyJSON.writeObjectField(sfdcOrganicCaseMarketoFieldMap.Name, String.valueof(inputValue.get(sfdcOrganicCaseMarketoFieldMap.SFDC_Field_API_Name__c)));
            				}else if(sfdcOrganicCaseMarketoFieldMap.Sync_Blank_Values__c){
            					bodyJSON.writeObjectField(sfdcOrganicCaseMarketoFieldMap.Name, '');
            				}
            			}
            		bodyJSON.writeEndObject();
            	}
            bodyJSON.writeEndArray();	
        bodyJSON.writeEndObject();
        HttpResponse res = MarketoSyncService.calloutToMarketoPOST('/rest/v1/leads.json', bodyJSON.getAsString(), '', true);
        system.debug(res.getBody());
        return res.getBody();
	}
}

// = 'Locksmith'