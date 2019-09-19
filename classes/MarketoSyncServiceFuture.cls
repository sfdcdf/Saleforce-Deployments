public without sharing class MarketoSyncServiceFuture {
	
	@future(callout=true)
	public static void getLeadById(String marketoRecordId){
		//HttpResponse res = MarketoSyncService.calloutToMarketoGet('/rest/v1/lead/' + marketoRecordId + '.json', '', true);
		MarketoSyncService.getLeadById(marketoRecordId);
		//system.debug(res.getBody());
	}
	@future(callout=true)
	public static void getMultipleLeadsbyFilterType(String filterType, List<String> filterValues, List<String> fields, String xmethod){
		MarketoSyncService.getMultipleLeadsbyFilterType(filterType, filterValues, fields, xmethod);
	}

	@future(callout=true)
	public static void getMultipleLeadsByListId(String listId, List<String> fields){
		MarketoSyncService.getMultipleLeadsByListId(listId, fields);
	}

	@future(callout=true)
	public static void getMultipleLeadsByProgramId(String programId, List<String> fields){
		MarketoSyncService.getMultipleLeadsByProgramId(programId, fields);
	}

	@future(callout=true)
	public static void changeLeadProgramStatus(String programId, String status, List<String> memberIds){
		MarketoSyncService.changeLeadProgramStatus(programId, status, memberIds);
	}

	@future(callout=true)
	public static void createUpdateLeads(String action, String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
		List<SObject> sObjectList = (List<SObject>)JSON.deserialize(sObjectListJSON, List<SObject>.class);
		MarketoSyncService.createUpdateLeads(action, lookupField, sObjectList, asyncProcessing, partitionName);
	}

	@future(callout=true)
	public static void associateLead(String cookieId){
		MarketoSyncService.associateLead(cookieId);
	}

	@future(callout=true)
	public static void mergeLead(String marketoId, String leadId, List<String> leadIds, Boolean mergeInCRM){
		MarketoSyncService.mergeLead(marketoId, leadId, leadIds, mergeInCRM);
	}

	@future(callout=true)
	public static void getListById(String listId){
		MarketoSyncService.getListById(listId);
	}

	@future(callout=true)
	public static void getMultipleLists(String parameterType, List<String> parameterList){
		MarketoSyncService.getMultipleLists(parameterType, parameterList);
	}

	@future(callout=true)
	public static void addLeadsToList(String listId, List<String> leadIdList){
		MarketoSyncService.addLeadsToList(listId, leadIdList);
	}

	@future(callout=true)
	public static void removeLeadsFromList(String listId, List<String> leadIdList){
		MarketoSyncService.removeLeadsFromList(listId, leadIdList);
	}

	@future(callout=true)
	public static void memberOfList(String listId, List<String> leadIdList){
		MarketoSyncService.memberOfList(listId, leadIdList);
	}

	@future(callout=true)
	public static void getCampaignById(String campaignId){
		MarketoSyncService.getCampaignById(campaignId);
	}

	@future(callout=true)
	public static void getMultipleCampaigns(String parameterType, List<String> parameterList){
		MarketoSyncService.getMultipleCampaigns(parameterType, parameterList);
	}

	/*@future(callout=true)
	public static void scheduleCampaign(String campaignId, DateTime runAt, String cloneToProgramName, List<Object> tokens){
		// STILL NEED TO BUILD!!! TO DO!!!
	}*/

	@future(callout=true)
	public static void requestCampaign(String campaignId, List<String> leadIdList, String tokensJSON){
		List<MarketoSyncService.MarketoSyncServiceToken> tokens = (List<MarketoSyncService.MarketoSyncServiceToken>)JSON.deserialize(tokensJSON, List<MarketoSyncService.MarketoSyncServiceToken>.class);

		MarketoSyncService.requestCampaign(campaignId, leadIdList, tokens);
	}

	/*public static void importLead(String format, ){
		TO DO! NEED TO INVESTIGATE!
	}
	
	- getImportLeadStatus
	- getImportFailureFile
	- getImportWarningFile
	*/

	@future(callout=true)
	public static void describe(){
		MarketoSyncService.describe();
	}

	@future(callout=true)
	public static void getActivityTypes(){
		MarketoSyncService.getActivityTypes();
	}

	/*@future(callout=true)
	public static String getPagingToken(DateTime sinceDatetime){
		system.debug(sinceDatetime.format('yyyy-MM-dd'));
		HttpResponse res = calloutToMarketoGET('/rest/v1/activities/pagingtoken.json', 'sinceDatetime=' + sinceDatetime.format('yyyy-MM-dd'), false);
		system.debug(res.getBody());
		Map<String, Object> pagingToken = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());

		return (String)pagingToken.get('nextPageToken');
	}*/

	@future(callout=true)
	public static void getLeadActivities(List<String> activityTypeIds, String listId, List<String> leadIds, DateTime sinceDatetime){
		MarketoSyncService.getLeadActivities(activityTypeIds, listId, leadIds, sinceDatetime, '');
	}

	@future(callout=true)
	public static void getLeadChanges(DateTime sinceDatetime, String listId, List<String> fields){
		MarketoSyncService.getLeadChanges(sinceDatetime, listId, fields);
	}

	@future(callout=true)
	public static void getDailyUsage(){
		MarketoSyncService.getDailyUsage();
	}

	@future(callout=true)
	public static void getLast7DaysUsage(){
		MarketoSyncService.getLast7DaysUsage();
	}

	@future(callout=true)
	public static void getDailyErrors(){
		MarketoSyncService.getDailyErrors();
	}

	@future(callout=true)
	public static void getLast7DaysErrors(){
		MarketoSyncService.getLast7DaysErrors();
	}

	/*@future(callout=true)
	public static void addCustomActivities(String leadId, DateTime activityDate, String activityTypeId, String primaryAttributeValue, List<Object> attributes){

	}*/

	@future(callout=true)
	public static void deleteLead(List<String> leadIds){
		MarketoSyncService.deleteLead(leadIds);
	}

	@future(callout=true)
	public static void getDeletedLeads(DateTime sinceDatetime){
		MarketoSyncService.getDeletedLeads(sinceDatetime);
	}

	@future(callout=true)
	public static void createUpdateLeadForEmailForTouchplanFuture(String action, String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
		List<SObject> sObjectList = (List<SObject>)JSON.deserialize(sObjectListJSON, List<SObject>.class);
		createUpdateLeadForEmailForTouchplan(action, lookupField, sObjectList, asyncProcessing, partitionName);
	}

	public static String createUpdateLeadForEmailForTouchplan(String action, String lookupField, List<SObject> sObjectList, Boolean asyncProcessing, String partitionName){
		Map<String, SFDC_Account_to_Marketo_Field_Mappings__c> sfdcAPINameSFDCMarketoFieldMappingMap = new Map<String, SFDC_Account_to_Marketo_Field_Mappings__c>();
		for(SFDC_Account_to_Marketo_Field_Mappings__c sfdcAccountMarketoFieldMap : SFDC_Account_to_Marketo_Field_Mappings__c.getAll().values()){
			if(sfdcAccountMarketoFieldMap.Sync_Field__c){
				sfdcAPINameSFDCMarketoFieldMappingMap.put(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c, sfdcAccountMarketoFieldMap);
			}
		}

		Set<String> accountDateTimeFieldSet = new Set<String>();

		for(Schema.SObjectField field : Account.getSobjectType().getDescribe().fields.getMap().values())
		{
		    if(Schema.DisplayType.DATETIME == field.getDescribe().getType()){
		        accountDateTimeFieldSet.add(field.getDescribe().getName());
		    }
		}

		JSONGenerator bodyJSON = JSON.createGenerator(false); 
        bodyJSON.writeStartObject();
            bodyJSON.writeObjectField('action', (String.isNotBlank(action) ? action : 'createOrUpdate'));
        	bodyJSON.writeObjectField('lookupField', (String.isNotBlank(lookupField) ? lookupField : 'email'));
        	bodyJSON.writeObjectField('asyncProcessing', asyncProcessing);
        	if(String.isNotBlank(partitionName)){
        		bodyJSON.writeObjectField('partitionName', partitionName);
        	}
        	bodyJSON.writeFieldName('input');
            bodyJSON.writeStartArray();
            	for(SObject inputValue : sObjectList){
            		bodyJSON.writeStartObject();
            			if(inputValue.get('Marketo_ID_For_Touchplan__c') != null){
            				bodyJSON.writeObjectField('id', String.valueof(inputValue.get('Marketo_ID_For_Touchplan__c')));
            			}
            			bodyJSON.writeObjectField('exclusiveForEmailForTouchplan', true);
            			for(SFDC_Account_to_Marketo_Field_Mappings__c sfdcAccountMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingMap.values()){
            				if(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c.equalsIgnoreCase('Email__c') || sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c.equalsIgnoreCase('Marketo_ID__c')){
            					continue;
            				}else if(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c.equalsIgnoreCase('Email_for_Touchplan__c')){
            					bodyJSON.writeObjectField('Email', String.valueof(inputValue.get(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c)));
            					continue;
            				}


            				if(inputValue.get(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c) != null && !accountDateTimeFieldSet.contains(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c)){
            					bodyJSON.writeObjectField(sfdcAccountMarketoFieldMap.Name, String.valueof(inputValue.get(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c)));
            				}else if(inputValue.get(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c) != null && accountDateTimeFieldSet.contains(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c)){
								// This sets it as YODLE TIME ZONE!!! FYI FYI FYI!!!
								bodyJSON.writeObjectField(sfdcAccountMarketoFieldMap.Name, DateTime.valueof(inputValue.get(sfdcAccountMarketoFieldMap.SFDC_Field_API_Name__c)).format('yyyy-MM-dd\'T\'HH:mm:ss.SSSXXX'));
							}else{
            					bodyJSON.writeObjectField(sfdcAccountMarketoFieldMap.Name, '');
            				}
            			}
            		bodyJSON.writeEndObject();
            	}
            bodyJSON.writeEndArray();	
        bodyJSON.writeEndObject();
        HttpResponse res = MarketoSyncService.calloutToMarketoPOST('/rest/v1/leads.json', bodyJSON.getAsString(), '', false);


        try{
        	Map<String, Object> jsonResponse = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        	List<Object> mktResults = (List<Object>)jsonResponse.get('result');

        	List<Account> failedAccountList = new List<Account>();

        	for(Integer i = 0; i < mktResults.size(); i++){
        		Map<String, Object> mktRecord = (Map<String, Object>)mktResults[i];
        		if(String.valueof(mktRecord.get('status')).equalsIgnoreCase('skipped')){
        			sObjectList[i].put('Failed_to_Sync_to_Marketo__c', true);
        			failedAccountList.add((Account)sObjectList[i]);
        		}
        	}

        	if(!failedAccountList.isEmpty()){
        		Database.SaveResult[] updateResults = Database.update(failedAccountList, false);

	        	List<DebugInfo__c> individualErrorList = new List<DebugInfo__c>();
	        	for(Database.SaveResult updateResult : updateResults){
	        		if(!updateResult.isSuccess()){
	        			DebugInfo__c err = new DebugInfo__c();
	        			err.DebugData__c = JSON.serialize(updateResult.getErrors());
	        			individualErrorList.add(err);
	        		}
	        	}
	        	if(!individualErrorList.isEmpty()){
	        		insert individualErrorList;
	        	}
	        }
    	}catch(Exception E){

    	}


        try{
	        if(lookupField != 'id'){
	        	Map<String, Object> jsonResponse = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
	        	List<Object> mktResults = (List<Object>)jsonResponse.get('result');
	        	for(Integer i = 0; i < mktResults.size(); i++){
	        		Map<String, Object> mktRecord = (Map<String, Object>)mktResults[i];
	        		if(sObjectList[i].get('Marketo_ID_For_Touchplan__c') == null){
	        			sObjectList[i].put('Marketo_ID_For_Touchplan__c', String.valueof(mktRecord.get('id')));
	        		}
	        	}
	        	Database.SaveResult[] updateResults = Database.update(sObjectList, false);

	        	List<DebugInfo__c> individualErrorList = new List<DebugInfo__c>();
	        	for(Database.SaveResult updateResult : updateResults){
	        		if(!updateResult.isSuccess()){
	        			DebugInfo__c err = new DebugInfo__c();
	        			err.DebugData__c = JSON.serialize(updateResult.getErrors());
	        			individualErrorList.add(err);
	        		}
	        	}
	        	if(!individualErrorList.isEmpty()){
	        		insert individualErrorList;
	        	}
	        }
        }catch(Exception E){
			DebugInfo__c di = new DebugInfo__c();
			di.DebugData__c = JSON.serializePretty('Request: ' + bodyJSON.getAsString() + ' | Response: ' + res.toString() + ' | Error: ' + E.getMessage());
			insert di;
		}

        system.debug(res.getBody());
        return res.getBody();
	}
}