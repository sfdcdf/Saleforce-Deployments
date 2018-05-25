public without sharing class MarketoSyncService {
	//http://developers.marketo.com/documentation/rest/

	public static Integration_Settings__c reauthenticateWithMarketo(Integration_Settings__c integrationSetting) {
		Http h = new Http();

		// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
		HttpRequest req = new HttpRequest();
		//req.setEndpoint('callout:MarketoSyncService/rest/v1/leads.json?access_token=578832c3-beed-42a2-8a2f-d608e3d8aba8:sj&filterType=id&filterValues=50,2343,88498&fields=firstName');
		req.setEndpoint('callout:MarketoIdentityTokenURL');
		req.setMethod('GET');

		// Send the request, and return a response
		HttpResponse res = h.send(req);

		Map<String, Object> mktResponse = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());

		integrationSetting.Marketo_Sync_Token__c = (String)mktResponse.get('access_token');
		integrationSetting.Marketo_Token_Expiration__c = DateTime.now().addSeconds((Integer)mktResponse.get('expires_in'));

		return integrationSetting;
	}

	public static HttpResponse calloutToMarketoGet(String requestPath, String requestAttributes, Boolean updateIntegrationSetting){
		Integration_Settings__c integrationSetting = Integration_Settings__c.getOrgDefaults();
		Boolean updateNeededForIntegrationSetting = false;

		if(integrationSetting == null || integrationSetting.Marketo_Token_Expiration__c == null || integrationSetting.Marketo_Token_Expiration__c <= DateTime.now()){
			integrationSetting = reauthenticateWithMarketo(integrationSetting);
			updateNeededForIntegrationSetting = true;
		}


		Http h = new Http();

		// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
		HttpRequest req = new HttpRequest();
		//req.setEndpoint('callout:MarketoSyncService/rest/v1/leads.json?access_token=578832c3-beed-42a2-8a2f-d608e3d8aba8:sj&filterType=id&filterValues=50,2343,88498&fields=firstName');
		req.setEndpoint('callout:MarketoSyncService' + requestPath + '?access_token=' + integrationSetting.Marketo_Sync_Token__c + '&' + requestAttributes);
		system.debug(req.getEndpoint());
		req.setMethod('GET');
		req.setTimeout(120000);

		// Send the request, and return a response
		HttpResponse res = h.send(req);

		if(updateIntegrationSetting && updateNeededForIntegrationSetting){
			try{
				update integrationSetting;
			}catch(Exception E){

			}
		}

		return res;
	}

	public static HttpResponse calloutToMarketoPOST(String requestPath, String requestBody, String requestAttributes, Boolean updateIntegrationSetting){
		Integration_Settings__c integrationSetting = Integration_Settings__c.getOrgDefaults();
		Boolean updateNeededForIntegrationSetting = false;

		if(integrationSetting == null || integrationSetting.Marketo_Token_Expiration__c == null || integrationSetting.Marketo_Token_Expiration__c <= DateTime.now()){
			integrationSetting = reauthenticateWithMarketo(integrationSetting);
			updateNeededForIntegrationSetting = true;
		}


		Http h = new Http();

		// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
		HttpRequest req = new HttpRequest();
		//req.setEndpoint('callout:MarketoSyncService/rest/v1/leads.json?access_token=578832c3-beed-42a2-8a2f-d608e3d8aba8:sj&filterType=id&filterValues=50,2343,88498&fields=firstName');
		req.setEndpoint('callout:MarketoSyncService' + requestPath + '?access_token=' + integrationSetting.Marketo_Sync_Token__c + (String.isNotBlank(requestAttributes) ? '&' + requestAttributes : ''));
		req.setBody(requestBody);
		req.setMethod('POST');
		req.setHeader('Content-Type', 'application/json');
		req.setTimeout(120000);

		// Send the request, and return a response
		HttpResponse res = h.send(req);

		if(updateIntegrationSetting && updateNeededForIntegrationSetting){
			try{
				update integrationSetting;
			}catch(Exception E){
				DebugInfo__c di = new DebugInfo__c();
				di.DebugData__c = JSON.serializePretty('Request: ' + req.toString() + ' | Response: ' + res.toString() + ' Error: ' + E.getMessage());
				insert di;
			}
		}

		return res;
	}

	public static HttpResponse calloutToMarketoDELETE(String requestPath, String requestAttributes){
		Integration_Settings__c integrationSetting = Integration_Settings__c.getOrgDefaults();

		if(integrationSetting == null || integrationSetting.Marketo_Token_Expiration__c == null || integrationSetting.Marketo_Token_Expiration__c <= DateTime.now()){
			integrationSetting = reauthenticateWithMarketo(integrationSetting);
		}


		Http h = new Http();

		// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
		HttpRequest req = new HttpRequest();
		//req.setEndpoint('callout:MarketoSyncService/rest/v1/leads.json?access_token=578832c3-beed-42a2-8a2f-d608e3d8aba8:sj&filterType=id&filterValues=50,2343,88498&fields=firstName');
		req.setEndpoint('callout:MarketoSyncService' + requestPath + '?access_token=' + integrationSetting.Marketo_Sync_Token__c + '&' + requestAttributes);
		req.setHeader('Content-Type', 'application/json');
		req.setMethod('DELETE');
		req.setTimeout(120000);

		// Send the request, and return a response
		HttpResponse res = h.send(req);

		try{
			update integrationSetting;
		}catch(Exception E){

		}

		return res;
	}

	public static void getLeadById(String marketoRecordId){
		HttpResponse res = calloutToMarketoGet('/rest/v1/lead/' + marketoRecordId + '.json', '', true);
		system.debug(res.getBody());
	}

	public static String getMultipleLeadsbyFilterType(String filterType, List<String> filterValues, List<String> fields, String xmethod){
		String requestAttributes = 'filterType=' + filterType;
		requestAttributes += '&filterValues=' + String.join(filterValues, ',');
		if(!fields.isEmpty()){
			requestAttributes += '&fields=' + String.join(fields, ',');
		}
		if(String.isNotBlank(xmethod)){
			requestAttributes += '&_method=' + xmethod;
		}

		HttpResponse res = calloutToMarketoGet('/rest/v1/leads.json', requestAttributes, false);
		system.debug(res.getBody());
		return res.getBody();
	}

	public static void getMultipleLeadsByListId(String listId, List<String> fields){
		//4940
		HttpResponse res = calloutToMarketoGet('/rest/v1/list/' + listId + '/leads.json', '', true);
		system.debug(res.getBody());
	}

	public static void getMultipleLeadsByProgramId(String programId, List<String> fields){
		HttpResponse res = calloutToMarketoGet('/rest/v1/leads/programs/' + programId + '.json', '', true);
		system.debug(res.getBody());
	}

	public static void changeLeadProgramStatus(String programId, String status, List<String> memberIds){
		JSONGenerator bodyJSON = JSON.createGenerator(false); 
        bodyJSON.writeStartObject();
            bodyJSON.writeObjectField('status', status);
            bodyJSON.writeFieldName('input');
            bodyJSON.writeStartArray();
            	for(String memberId : memberIds){
            		bodyJSON.writeStartObject();
            			bodyJSON.writeObjectField('id', memberId);
            		bodyJSON.writeEndObject();
            	}
            bodyJSON.writeEndArray();	
        bodyJSON.writeEndObject();

        HttpResponse res = calloutToMarketoPOST('/rest/v1/leads/programs/' + programId + '/status.json', bodyJSON.getAsString(), '', true);
        system.debug(res.getBody());
	}

	public static String createUpdateLeads(String action, String lookupField, List<SObject> sObjectList, Boolean asyncProcessing, String partitionName){
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
            			for(SFDC_Account_to_Marketo_Field_Mappings__c sfdcAccountMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingMap.values()){
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
        HttpResponse res = calloutToMarketoPOST('/rest/v1/leads.json', bodyJSON.getAsString(), '', false);


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
	        		if(sObjectList[i].get('Marketo_ID__c') == null){
	        			sObjectList[i].put('Marketo_ID__c', String.valueof(mktRecord.get('id')));
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

	public static void associateLead(String cookieId){
		HttpResponse res = calloutToMarketoPOST('/rest/v1/leads.json', '', cookieId, true);
        system.debug(res.getBody());
	}

	public static void mergeLead(String marketoId, String leadId, List<String> leadIds, Boolean mergeInCRM){
		String requestAttributes = String.isNotBlank(leadId) ? 'leadId=' + leadId : 'leadIds=' + String.join(leadIds, ',');
		HttpResponse res = calloutToMarketoPOST('/rest/v1/leads/' + marketoId + '/merge.json', '', requestAttributes, true);
		system.debug(res.getBody());
	}

	public static void getListById(String listId){
		HttpResponse res = calloutToMarketoGET('/rest/v1/lists/' + listId + '.json', '', true);
		system.debug(res.getBody());
	}

	public static void getMultipleLists(String parameterType, List<String> parameterList){
		String requestAttributes = '';

		if(String.isNotBlank(parameterType) && !parameterList.isEmpty()){
			requestAttributes += parameterType + '=' + String.join(parameterList, '&' + parameterType + '=');
		}

		HttpResponse res = calloutToMarketoGET('/rest/v1/lists.json', requestAttributes, true);
		system.debug(res.getBody());
	}

	public static void addLeadsToList(String listId, List<String> leadIdList){
		String requestAttributes = 'id=' + String.join(leadIdList, '&id=');

		HttpResponse res = calloutToMarketoPOST('/rest/v1/lists/' + listId + '/leads.json', '', requestAttributes, true);
		system.debug(res.getBody());
	}

	public static void removeLeadsFromList(String listId, List<String> leadIdList){
		String requestAttributes = 'id=' + String.join(leadIdList, '&id=');

		HttpResponse res = calloutToMarketoDELETE('/rest/v1/lists/' + listId + '/leads.json', requestAttributes);
		system.debug(res.getBody());
	}

	public static void memberOfList(String listId, List<String> leadIdList){
		String requestAttributes = 'id=' + String.join(leadIdList, '&id=');

		HttpResponse res = calloutToMarketoGET('/rest/v1/lists/' + listId + '/leads/ismember.json', requestAttributes, true);
		system.debug(res.getBody());
	}

	public static void getCampaigns(){
		HttpResponse res = calloutToMarketoGET('/rest/v1/campaigns.json', '', true);
		system.debug(res.getBody());
	}

	public static String getCampaignById(String campaignId){
		HttpResponse res = calloutToMarketoGET('/rest/v1/campaigns/' + campaignId + '.json', '', true);
		system.debug(res.getBody());
		return res.getBody();
	}

	public static String getMultipleCampaigns(String parameterType, List<String> parameterList){
		String requestAttributes = '';

		if(String.isNotBlank(parameterType) && !parameterList.isEmpty()){
			requestAttributes += parameterType + '=' + String.join(parameterList, '&' + parameterType + '=');
		}

		HttpResponse res = calloutToMarketoGET('/rest/v1/campaigns.json', requestAttributes, true);
		system.debug(res.getBody());

		return res.getBody();
	}

	public static void scheduleCampaign(String campaignId, DateTime runAt, String cloneToProgramName, List<Object> tokens){
		// STILL NEED TO BUILD!!! TO DO!!!
	}

	public static void requestCampaign(String campaignId, List<String> leadIdList, List<MarketoSyncServiceToken> tokens){
		JSONGenerator bodyJSON = JSON.createGenerator(false); 
        bodyJSON.writeStartObject();
            bodyJSON.writeFieldName('input');
        	bodyJSON.writeStartObject();
	            bodyJSON.writeFieldName('leads');
	            bodyJSON.writeStartArray();
	            	for(String memberId : leadIdList){
	            		bodyJSON.writeStartObject();
	            			bodyJSON.writeObjectField('id', memberId);
	            		bodyJSON.writeEndObject();
	            	}
	            bodyJSON.writeEndArray();

	            if(!tokens.isEmpty()){
		            bodyJSON.writeFieldName('tokens');
		            bodyJSON.writeStartArray();
		            	for(MarketoSyncServiceToken token : tokens){
		            		bodyJSON.writeStartObject();
		            			bodyJSON.writeObjectField('name', token.name);
		            			bodyJSON.writeObjectField('value', token.value);
		            		bodyJSON.writeEndObject();
		            	}
		            bodyJSON.writeEndArray();
		        }
        	bodyJSON.writeEndObject();

        	// NEED TOKEN LOGIC
        bodyJSON.writeEndObject();

        HttpResponse res = calloutToMarketoPOST('/rest/v1/campaigns/' + campaignId + '/trigger.json', bodyJSON.getAsString(), '', false);
        system.debug(res.getBody());
	}

	public static String requestCampaignWithResponse(String campaignId, List<String> leadIdList, List<MarketoSyncServiceToken> tokens){
		JSONGenerator bodyJSON = JSON.createGenerator(false); 
        bodyJSON.writeStartObject();
            bodyJSON.writeFieldName('input');
        	bodyJSON.writeStartObject();
	            bodyJSON.writeFieldName('leads');
	            bodyJSON.writeStartArray();
	            	for(String memberId : leadIdList){
	            		bodyJSON.writeStartObject();
	            			bodyJSON.writeObjectField('id', memberId);
	            		bodyJSON.writeEndObject();
	            	}
	            bodyJSON.writeEndArray();

	            if(!tokens.isEmpty()){
		            bodyJSON.writeFieldName('tokens');
		            bodyJSON.writeStartArray();
		            	for(MarketoSyncServiceToken token : tokens){
		            		bodyJSON.writeStartObject();
		            			bodyJSON.writeObjectField('name', token.name);
		            			bodyJSON.writeObjectField('value', token.value);
		            		bodyJSON.writeEndObject();
		            	}
		            bodyJSON.writeEndArray();
		        }
        	bodyJSON.writeEndObject();

        	// NEED TOKEN LOGIC
        bodyJSON.writeEndObject();

        HttpResponse res = calloutToMarketoPOST('/rest/v1/campaigns/' + campaignId + '/trigger.json', bodyJSON.getAsString(), '', false);
        system.debug(res.getBody());

        return res.getBody();
	}

	/*public static void importLead(String format, ){
		TO DO! NEED TO INVESTIGATE!
	}
	
	- getImportLeadStatus
	- getImportFailureFile
	- getImportWarningFile
	*/

	public static void describe(){
		HttpResponse res = calloutToMarketoGET('/rest/v1/leads/describe.json', '', true);
		system.debug(res.getBody());
	}

	public static void getActivityTypes(){
		HttpResponse res = calloutToMarketoGET('/rest/v1/activities/types.json', '', true);
		system.debug(res.getBody());
	}

	public static String getPagingToken(DateTime sinceDatetime){
		system.debug(sinceDatetime.format('yyyy-MM-dd'));
		HttpResponse res = calloutToMarketoGET('/rest/v1/activities/pagingtoken.json', 'sinceDatetime=' + sinceDatetime.format('yyyy-MM-dd'), false);
		system.debug(res.getBody());
		Map<String, Object> pagingToken = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());

		return (String)pagingToken.get('nextPageToken');
	}

	public static String getLeadActivities(List<String> activityTypeIds, String listId, List<String> leadIds, DateTime sinceDatetime, String nextPageTokenValue){
		String tokenValue = String.isNotBlank(nextPageTokenValue) ? nextPageTokenValue : getPagingToken(sinceDatetime);
		String requestAttributes = 'activityTypeIds=' + String.join(activityTypeIds, ',') + '&nextPageToken=' + tokenValue;
		if(!leadIds.isEmpty()){
			requestAttributes += '&leadIds=' + String.join(leadIds, ',');
		}
		if(String.isNotBlank(listId)){
			requestAttributes += '&listId=' + listId;
		}

		HttpResponse res = calloutToMarketoGet('/rest/v1/activities.json', requestAttributes, false);
		system.debug(res.getBody());
		return res.getBody();
	}

	public static void getLeadChanges(DateTime sinceDatetime, String listId, List<String> fields){
		String requestAttributes = 'fields=' + String.join(fields, ',') + '&nextPageToken=' + getPagingToken(sinceDatetime);
		if(String.isNotBlank(listId)){
			requestAttributes += '&listId=' + listId;
		}
		HttpResponse res = calloutToMarketoGet('/rest/v1/activities/leadchanges.json', requestAttributes, true);
		system.debug(res.getBody());
	}

	public static void getDailyUsage(){
		HttpResponse res = calloutToMarketoGet('/rest/v1/stats/usage.json', '', true);
		system.debug(res.getBody());
	}

	public static void getLast7DaysUsage(){
		HttpResponse res = calloutToMarketoGet('/rest/v1/stats/usage/last7days.json', '', true);
		system.debug(res.getBody());
	}

	public static void getDailyErrors(){
		HttpResponse res = calloutToMarketoGet('/rest/v1/stats/errors.json', '', true);
		system.debug(res.getBody());
	}

	public static void getLast7DaysErrors(){
		HttpResponse res = calloutToMarketoGet('/rest/v1/stats/errors/last7days.json', '', true);
		system.debug(res.getBody());
	}

	public static void addCustomActivities(String leadId, DateTime activityDate, String activityTypeId, String primaryAttributeValue, List<Object> attributes){

	}

	public static void deleteLead(List<String> leadIds){
		String requestAttributes = 'id=' + String.join(leadIds, '&id=');

		HttpResponse res = calloutToMarketoDELETE('/rest/v1/leads.json', requestAttributes);
		system.debug(res.getBody());
	}

	public static void getDeletedLeads(DateTime sinceDatetime){
		HttpResponse res = calloutToMarketoGet('/rest/v1/activities/deletedleads.json', 'nextPageToken=' + getPagingToken(sinceDatetime), true);
		system.debug(res.getBody());
	}

	public class MarketoSyncServiceToken{
		public String name;
		public String value;
	}


}