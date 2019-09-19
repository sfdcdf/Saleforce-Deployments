public without sharing class CaseObjectHelper {
	public static Boolean alreadyFiredCaseObjectHelper = false;
	public static Set<Id> recordTypeIdSet = new Set<Id>{Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId()};
	private static Id ncsCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('NCS - AutoLaunch').getRecordTypeId();
	//public static Set<String> caseReasonSet = new Set<String>{'CSC'};
	private static Id caseMasterRecordTypeId = [select Id, Name, DeveloperName, SobjectType from RecordType where Name = 'Master' and SObjectType = 'Case'].Id;
	private static Id syncUserId = [select Id, Name from User where Name = 'SFDC Sync'].Id;
	private static List<String> reasonAndReasonDetailExclusionList = new List<String>{'Free Time', 'Training', 'CSC', 'Quality Team', 'Other', 'Out of Sync', 'Charge', 'Adoption', 'Maps Verification', 'Unknown', 'Cancel', 'Touch', 'Setup', 'Upsell', 'Pin Collection', 'Downsell', 'Invoice', 'Proactive', 'Taxonomy', 'Escalation', 'Communication', 'Billing'};
	private static List<String> originExclusionList = new List<String>{'phone', 'chat', 'email', '@lighthousepmg.com', '@web.com', '@torchx'};

	public static Boolean alreadyFiredCalendarBlockerForCase = false;

	private static final Map<Id, User> activeStandardUserIdMap = new Map<Id, User>([select Id from User where IsActive = true and UserType = 'Standard']);

	private static Set<String> supportedCaseReasonSet(){
		Set<String> stringSet = new Set<String>();
		for(SFDC_Case_to_Marketo_Field_Mappings__c sfdcCaseMarketoFieldMap : SFDC_Case_to_Marketo_Field_Mappings__c.getAll().values()){
			if(sfdcCaseMarketoFieldMap.Sync_Field__c){
				if(String.isNotBlank(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c) && !stringSet.contains(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c)){
					//stringSet.addAll(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c.replace(',  ', ',').replace(', ', ',').split(','));
					for(String str : sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c.split(',')){
						stringSet.add(str.trim());
					}
				}
			}
		}
		return stringSet;
	}

	public static void syncCaseRecordLogic(List<Case> newValue, Map<Id, Case> oldValue){
		Set<Id> accountIdSet = new Set<Id>();
		for(Case cs : newValue){
			if(!cs.Sync_to_Marketo__c && String.isNotBlank(cs.AccountId) && recordTypeIdSet.contains(cs.RecordTypeId) && supportedCaseReasonSet().contains(cs.Reason)){
				accountIdSet.add(cs.AccountId);
			}else if(!cs.Sync_to_Marketo__c && String.isNotBlank(cs.AccountId) && !oldValue.isEmpty() && issueResolutionCriteriaMet(cs, oldValue.get(cs.Id))){
				accountIdSet.add(cs.AccountId);
			}else if(!cs.Sync_to_Marketo__c && cs.RecordTypeId == ncsCaseRecordTypeId){
				accountIdSet.add(cs.AccountId);
			}
		}

		if(!accountIdSet.isEmpty()){
			Map<Id, Account> accountRecordMap = new Map<Id, Account>([select Id, Marketo_ID__c, Sync_to_Marketo__c, Days_Since_Live__c, Secondary_Segments__c, Client_Type__c, Product_Type_Transactional__c from Account where Id in :accountIdSet and Marketo_ID__c != '' and Sync_to_Marketo__c = true]);
			for(Case cs : newValue){
				if(accountRecordMap.containsKey(cs.AccountId)){
					Account acct = accountRecordMap.get(cs.AccountId);
					if(!cs.Sync_to_Marketo__c && oldValue.isEmpty() && /*acct.Client_Type__c == 'Local' &&*/ ((recordTypeIdSet.contains(cs.RecordTypeId) && supportedCaseReasonSet().contains(cs.Reason)) || (cs.RecordTypeId == ncsCaseRecordTypeId && cs.Next_Scheduled_CSC2__c != null))){
						cs.Sync_to_Marketo__c = true;
					}else if(!cs.Sync_to_Marketo__c && /*acct.Client_Type__c == 'Local' &&*/ recordTypeIdSet.contains(cs.RecordTypeId) && supportedCaseReasonSet().contains(cs.Reason) && (acct.Days_Since_Live__c == null || acct.Days_Since_Live__c <= 30)){
						cs.Sync_to_Marketo__c = true;
					}else if(!cs.Sync_to_Marketo__c && !oldValue.isEmpty() && cs.RecordTypeId == caseMasterRecordTypeId && cs.OwnerId != syncUserId){// && accountRecordMap.get(cs.AccountId).Client_Type__c.containsIgnoreCase('Lighthouse') && !accountRecordMap.get(cs.AccountId).Product_Type_Transactional__c.equalsIgnoreCase('Yodle Web')){
						cs.Sync_to_Marketo__c = issueResolutionCriteriaMet(cs, oldValue.get(cs.Id));
					}
				}
			}
		}
	}

	public static void caseMarketoSyncHelper(Map<Id, Case> newValue, Map<Id, Case> oldValue){
		List<SFDC_Case_to_Marketo_Field_Mappings__c> sfdcAPINameSFDCMarketoFieldMappingList = new List<SFDC_Case_to_Marketo_Field_Mappings__c>();
		for(SFDC_Case_to_Marketo_Field_Mappings__c sfdcCaseMarketoFieldMap : SFDC_Case_to_Marketo_Field_Mappings__c.getAll().values()){
			if(sfdcCaseMarketoFieldMap.Sync_Field__c){
				sfdcAPINameSFDCMarketoFieldMappingList.add(sfdcCaseMarketoFieldMap);
			}
		}

		List<Case> caseSyncList = new List<Case>();
		List<Case> issueResolutionCaseSyncList = new List<Case>();
		List<Case> ncsCaseScheduledCSCList = new List<Case>();

		for(Case record : newValue.values()){
			Boolean syncToMarketo = false;
			if(record.Sync_to_Marketo__c && oldValue.isEmpty() && recordTypeIdSet.contains(record.RecordTypeId) && supportedCaseReasonSet().contains(record.Reason)){
				syncToMarketo = true;
			}else if(record.Sync_to_Marketo__c && !oldValue.isEmpty() && recordTypeIdSet.contains(record.RecordTypeId) && supportedCaseReasonSet().contains(record.Reason)){
				Case oldRecord = oldValue.get(record.Id);
				for(SFDC_Case_to_Marketo_Field_Mappings__c sfdcCaseMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingList){
					if(record.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) != oldRecord.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) && (String.isBlank(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c) || sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c.containsIgnoreCase(record.Reason)) && (sfdcCaseMarketoFieldMap.Sync_Blank_Values__c || (!sfdcCaseMarketoFieldMap.Sync_Blank_Values__c && record.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) != null))) {
						syncToMarketo = true;
						break;
					}
				}
			}

			if(syncToMarketo){
				caseSyncList.add(record);
			}

			if(record.Sync_to_Marketo__c && !oldValue.isEmpty() && record.RecordTypeId == caseMasterRecordTypeId && record.OwnerId != syncUserId && issueResolutionCriteriaMet(record, oldValue.get(record.Id))){
				system.debug(issueResolutionCriteriaMet(record, oldValue.get(record.Id)));
				issueResolutionCaseSyncList.add(record);
			}

			if(record.Sync_to_Marketo__c && oldValue.isEmpty() && record.RecordTypeId == ncsCaseRecordTypeId && record.Next_Scheduled_CSC2__c != null){
				ncsCaseScheduledCSCList.add(record);
			}
		}

		if(!caseSyncList.isEmpty()){
			caseUpdateLeads('', '', JSON.serialize(caseSyncList), false, '');
			CaseObjectHelper.alreadyFiredCaseObjectHelper = true;
		}

		if(!issueResolutionCaseSyncList.isEmpty()){
			issueResolutionCaseUpdateLeads('', '', JSON.serialize(issueResolutionCaseSyncList), false, '');
			CaseObjectHelper.alreadyFiredCaseObjectHelper = true;
		}

		if(!ncsCaseScheduledCSCList.isEmpty()){
			ncsCaseUpdateMarketoCSCSchedule('', '', JSON.serialize(ncsCaseScheduledCSCList), false, '');
		}
	}

	private static Boolean issueResolutionCriteriaMet(Case newValue, Case oldValue){
		if(!activeStandardUserIdMap.containsKey(newValue.OwnerId)){
			return false;
		}else if(!newValue.IsClosed){
			return false;
		}else if(newValue.ClosedDate.date() != Date.today()){
			return false;
		}/*else if(newValue.Status != 'Closed'){
			return false;
		}else if(newValue.Status == 'Closed' && newValue.Status == oldValue.Status){
			return false;
		}*/else if(String.isNotBlank(newValue.Reason) && newValue.Reason.containsIgnoreCase('Product')){
			return false;
		}else if(String.isNotBlank(newValue.Origin) && newValue.Origin.containsIgnoreCase('yodle.com')){
			return false;
		}

		for(String record : reasonAndReasonDetailExclusionList){
			if(String.isNotBlank(newValue.Reason) && newValue.Reason.containsIgnoreCase(record)){
				return false;
			}else if(String.isNotBlank(newValue.Reason_Detail__c) && newValue.Reason_Detail__c.containsIgnoreCase(record)){
				return false;
			}
		}

		Boolean originMatch = false;
		for(String record : originExclusionList){
			if(String.isNotBlank(newValue.Origin) && newValue.Origin.containsIgnoreCase(record)){
				originMatch = true;
				break;
			}
		}
		if(!originMatch){
			return false;
		}
		return true;
	}

	@future(callout=true)
	public static void issueResolutionCaseUpdateLeads(String action,  String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
        issueResolutionCaseUpdateLeadsCallout(action, lookupField, sObjectListJSON, asyncProcessing, partitionName);
	}

	public static void issueResolutionCaseUpdateLeadsCallout(String action,  String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
		List<SObject> sObjectList = (List<SObject>)JSON.deserialize(sObjectListJSON, List<SObject>.class);

		Map<Id, Account> accountMap = new Map<Id, Account>([select Id, Marketo_ID__c, tz__Timezone_IANA__c from Account where Id in (select AccountId from Case where Id in : sObjectList) and Marketo_ID__c != '' and Sync_to_Marketo__c = true]);
		Map<Id, User> userMap = new Map<Id, User>([select Id, FirstName from User where Id in (select OwnerId from Case where Id in : sObjectList)]);

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
            			bodyJSON.writeObjectField('id', accountMap.get((id)inputValue.get('AccountId')).Marketo_ID__c);
            			bodyJSON.writeObjectField('issueResolutionCaseOwnerFirstName', userMap.get((id)inputValue.get('OwnerId')).FirstName);
            			bodyJSON.writeObjectField('issueResolutionCaseID', (id)inputValue.get('Id'));
            		bodyJSON.writeEndObject();
            	}
            bodyJSON.writeEndArray();	
        bodyJSON.writeEndObject();
        HttpResponse res = MarketoSyncService.calloutToMarketoPOST('/rest/v1/leads.json', bodyJSON.getAsString(), '', true);
        system.debug(res.getBody());
	}

	@future(callout=true)
	public static void ncsCaseUpdateMarketoCSCSchedule(String action,  String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
		ncsCaseUpdateMarketoCSCScheduleCallout(action, lookupField, sObjectListJSON, asyncProcessing, partitionName);
	}

	public static String ncsCaseUpdateMarketoCSCScheduleCallout(String action,  String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
		List<SObject> sObjectList = (List<SObject>)JSON.deserialize(sObjectListJSON, List<SObject>.class);

		Map<Id, Account> accountMap = new Map<Id, Account>([select Id, Marketo_ID__c, tz__Timezone_IANA__c from Account where Id in (select AccountId from Case where Id in : sObjectList) and Marketo_ID__c != '' and Sync_to_Marketo__c = true]);

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
					String timeZone = (String.isNotBlank(accountMap.get((id)inputValue.get('AccountId')).tz__Timezone_IANA__c)) ? accountMap.get((id)inputValue.get('AccountId')).tz__Timezone_IANA__c : 'America/New_York';
            		bodyJSON.writeStartObject();
            			bodyJSON.writeObjectField('id', accountMap.get((id)inputValue.get('AccountId')).Marketo_ID__c);
						bodyJSON.writeObjectField('Next_Scheduled_CSC', DateTime.valueof(inputValue.get('Next_Scheduled_CSC2__c')).format('yyyy-MM-dd\'T\'HH:mm:ss.SSSXXX'));
            			bodyJSON.writeObjectField('dateofNextScheduledCSC', DateTime.valueof(inputValue.get('Next_Scheduled_CSC2__c')).format('yyyy-MM-dd'));
						bodyJSON.writeObjectField('timeofNextScheduledCSC', DateTime.valueof(inputValue.get('Next_Scheduled_CSC2__c')).format('hh:mm a', timeZone));
            		bodyJSON.writeEndObject();
            	}
            bodyJSON.writeEndArray();	
        bodyJSON.writeEndObject();
        HttpResponse res = MarketoSyncService.calloutToMarketoPOST('/rest/v1/leads.json', bodyJSON.getAsString(), '', true);
        system.debug(res.getBody());
        return res.getBody();
	}

	@future(callout=true)
	public static void caseUpdateLeads(String action,  String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
		List<SObject> sObjectList = (List<SObject>)JSON.deserialize(sObjectListJSON, List<SObject>.class);

		Map<Id, Account> accountMap = new Map<Id, Account>([select Id, Marketo_ID__c, tz__Timezone_IANA__c from Account where Id in (select AccountId from Case where Id in : sObjectList) and Marketo_ID__c != '' and Sync_to_Marketo__c = true]);

		List<SFDC_Case_to_Marketo_Field_Mappings__c> sfdcAPINameSFDCMarketoFieldMappingList = new List<SFDC_Case_to_Marketo_Field_Mappings__c>();
		for(SFDC_Case_to_Marketo_Field_Mappings__c sfdcCaseMarketoFieldMap : SFDC_Case_to_Marketo_Field_Mappings__c.getAll().values()){
			if(sfdcCaseMarketoFieldMap.Sync_Field__c){
				sfdcAPINameSFDCMarketoFieldMappingList.add(sfdcCaseMarketoFieldMap);
			}
		}

		Set<String> caseDateTimeFieldSet = new Set<String>();

		for(Schema.SObjectField field : Case.getSobjectType().getDescribe().fields.getMap().values())
		{
		    if(Schema.DisplayType.DATETIME == field.getDescribe().getType()){
		        caseDateTimeFieldSet.add(field.getDescribe().getName());
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
            			bodyJSON.writeObjectField('id', accountMap.get((id)inputValue.get('AccountId')).Marketo_ID__c);
            			for(SFDC_Case_to_Marketo_Field_Mappings__c sfdcCaseMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingList){
            				system.debug(sfdcCaseMarketoFieldMap);
            				if(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) != null && !caseDateTimeFieldSet.contains(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) && (String.isBlank(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c) || sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c.containsIgnoreCase((String)inputValue.get('Reason')))){
            					bodyJSON.writeObjectField(sfdcCaseMarketoFieldMap.Name, String.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)));
            				}else if(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) != null && caseDateTimeFieldSet.contains(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) && (String.isBlank(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c) || sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c.containsIgnoreCase((String)inputValue.get('Reason')))){
								// This sets it as YODLE TIME ZONE!!! FYI FYI FYI!!!
								bodyJSON.writeObjectField(sfdcCaseMarketoFieldMap.Name, DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('yyyy-MM-dd\'T\'HH:mm:ss.SSSXXX'));

								String timeZone = (String.isNotBlank(accountMap.get((id)inputValue.get('AccountId')).tz__Timezone_IANA__c)) ? accountMap.get((id)inputValue.get('AccountId')).tz__Timezone_IANA__c : 'America/New_York';

								if(sfdcCaseMarketoFieldMap.Name.equalsIgnoreCase('Next_Scheduled_CSC')){
									bodyJSON.writeObjectField('dateofNextScheduledCSC', DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('yyyy-MM-dd'));
									bodyJSON.writeObjectField('timeofNextScheduledCSC', DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('hh:mm a', timeZone));
								}else if(sfdcCaseMarketoFieldMap.Name.equalsIgnoreCase('nextScheduledCall')){
									bodyJSON.writeObjectField('dateofNextScheduledCall', DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('yyyy-MM-dd'));
									bodyJSON.writeObjectField('timeofNextScheduledCall', DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('hh:mma', timeZone));
									if(String.valueof(inputValue.get('Reason')).equalsIgnoreCase('CS Touch Plan')){
										bodyJSON.writeObjectField('nextScheduledCallType', 'CS Touch Plan');
									}
								}

							}else if(sfdcCaseMarketoFieldMap.Sync_Blank_Values__c && (String.isBlank(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c) || sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c.containsIgnoreCase((String)inputValue.get('Reason')))){
            					system.debug('testing test');
            					bodyJSON.writeObjectField(sfdcCaseMarketoFieldMap.Name, '');

            					if(sfdcCaseMarketoFieldMap.Name.equalsIgnoreCase('Next_Scheduled_CSC')){
									bodyJSON.writeObjectField('dateofNextScheduledCSC', '');
									bodyJSON.writeObjectField('timeofNextScheduledCSC', '');
								}else if(sfdcCaseMarketoFieldMap.Name.equalsIgnoreCase('nextScheduledCall')){
									bodyJSON.writeObjectField('dateofNextScheduledCall', '');
									bodyJSON.writeObjectField('timeofNextScheduledCall', '');
								}
            				}
            			}
            		bodyJSON.writeEndObject();
            	}
            bodyJSON.writeEndArray();	
        bodyJSON.writeEndObject();
        HttpResponse res = MarketoSyncService.calloutToMarketoPOST('/rest/v1/leads.json', bodyJSON.getAsString(), '', true);
        system.debug(res.getBody());
	}

	public static String caseUpdateLeadsNotFuture(String action,  String lookupField, String sObjectListJSON, Boolean asyncProcessing, String partitionName){
		List<SObject> sObjectList = (List<SObject>)JSON.deserialize(sObjectListJSON, List<SObject>.class);

		Map<Id, Account> accountMap = new Map<Id, Account>([select Id, Marketo_ID__c, tz__Timezone_IANA__c from Account where Id in (select AccountId from Case where Id in : sObjectList) and Marketo_ID__c != '' and Sync_to_Marketo__c = true]);

		List<SFDC_Case_to_Marketo_Field_Mappings__c> sfdcAPINameSFDCMarketoFieldMappingList = new List<SFDC_Case_to_Marketo_Field_Mappings__c>();
		for(SFDC_Case_to_Marketo_Field_Mappings__c sfdcCaseMarketoFieldMap : SFDC_Case_to_Marketo_Field_Mappings__c.getAll().values()){
			if(sfdcCaseMarketoFieldMap.Sync_Field__c){
				sfdcAPINameSFDCMarketoFieldMappingList.add(sfdcCaseMarketoFieldMap);
			}
		}

		Set<String> caseDateTimeFieldSet = new Set<String>();

		for(Schema.SObjectField field : Case.getSobjectType().getDescribe().fields.getMap().values())
		{
		    if(Schema.DisplayType.DATETIME == field.getDescribe().getType()){
		        caseDateTimeFieldSet.add(field.getDescribe().getName());
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
            			bodyJSON.writeObjectField('id', accountMap.get((id)inputValue.get('AccountId')).Marketo_ID__c);
            			for(SFDC_Case_to_Marketo_Field_Mappings__c sfdcCaseMarketoFieldMap : sfdcAPINameSFDCMarketoFieldMappingList){
            				system.debug(sfdcCaseMarketoFieldMap);
            				if(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) != null && !caseDateTimeFieldSet.contains(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) && (String.isBlank(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c) || sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c.containsIgnoreCase((String)inputValue.get('Reason')))){
            					bodyJSON.writeObjectField(sfdcCaseMarketoFieldMap.Name, String.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)));
            				}else if(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) != null && caseDateTimeFieldSet.contains(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c) && (String.isBlank(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c) || sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c.containsIgnoreCase((String)inputValue.get('Reason')))){
								// This sets it as YODLE TIME ZONE!!! FYI FYI FYI!!!
								bodyJSON.writeObjectField(sfdcCaseMarketoFieldMap.Name, DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('yyyy-MM-dd\'T\'HH:mm:ss.SSSXXX'));

								String timeZone = (String.isNotBlank(accountMap.get((id)inputValue.get('AccountId')).tz__Timezone_IANA__c)) ? accountMap.get((id)inputValue.get('AccountId')).tz__Timezone_IANA__c : 'America/New_York';

								if(sfdcCaseMarketoFieldMap.Name.equalsIgnoreCase('Next_Scheduled_CSC')){
									bodyJSON.writeObjectField('dateofNextScheduledCSC', DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('yyyy-MM-dd'));
									bodyJSON.writeObjectField('timeofNextScheduledCSC', DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('hh:mm a', timeZone));
								}else if(sfdcCaseMarketoFieldMap.Name.equalsIgnoreCase('nextScheduledCall')){
									bodyJSON.writeObjectField('dateofNextScheduledCall', DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('yyyy-MM-dd'));
									bodyJSON.writeObjectField('timeofNextScheduledCall', DateTime.valueof(inputValue.get(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c)).format('hh:mma', timeZone));
									if(String.valueof(inputValue.get('Reason')).equalsIgnoreCase('CS Touch Plan')){
										bodyJSON.writeObjectField('nextScheduledCallType', 'CS Touch Plan');
									}
								}

							}else if(sfdcCaseMarketoFieldMap.Sync_Blank_Values__c && (String.isBlank(sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c) || sfdcCaseMarketoFieldMap.Case_Reason_Criteria__c.containsIgnoreCase((String)inputValue.get('Reason')))){
            					bodyJSON.writeObjectField(sfdcCaseMarketoFieldMap.Name, '');

            					if(sfdcCaseMarketoFieldMap.Name.equalsIgnoreCase('Next_Scheduled_CSC')){
									bodyJSON.writeObjectField('dateofNextScheduledCSC', '');
									bodyJSON.writeObjectField('timeofNextScheduledCSC', '');
								}else if(sfdcCaseMarketoFieldMap.Name.equalsIgnoreCase('nextScheduledCall')){
									bodyJSON.writeObjectField('dateofNextScheduledCall', '');
									bodyJSON.writeObjectField('timeofNextScheduledCall', '');
								}
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