public class DailyScheduledRecordAutoCreateBatch implements Database.Batchable<sObject>, Database.Stateful {
	
	private Daily_Scheduled_Record_Auto_Create__mdt scheduledAutoCreate;
	private String query;

	private List<Id> recordIdList = new List<Id>();
	
	public DailyScheduledRecordAutoCreateBatch(Daily_Scheduled_Record_Auto_Create__mdt scheduledCreateRecord, String criteriaOverride) {
		scheduledAutoCreate = scheduledCreateRecord;
		query = scheduledAutoCreate.SOQL__c;
		if(scheduledAutoCreate.Additional_SOQL_Criteria__c != null){
			query += ' ' + scheduledAutoCreate.Additional_SOQL_Criteria__c;
		}

		if(String.isNotBlank(criteriaOverride)){
			query = criteriaOverride;
		}
	}
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
   		List<sObject> newRecordList = new List<sObject>();
		for(sObject record : scope){
			if(scheduledAutoCreate.Supported_Objects_for_Record_Auto_Create__c.equalsIgnoreCase('Case')){
				Case newRecord = createCase(record);
				newRecordList.add(newRecord);
			}else{
				sObject newRecord = createSObject(record);
				newRecordList.add(newRecord);
			}
		}

		if(!newRecordList.isEmpty()){
			Database.SaveResult[] srList = Database.insert(newRecordList, false);
			List<DebugInfo__c> debugInfo = new List<DebugInfo__c>();

			Set<Id> relatedAccountIdSet = new Set<Id>();

			//if(scheduledAutoCreate.Push_New_Record_Data_To_Marketo__c){
				/*for(sObject record : newRecordList){
					recordIdList.add(record.Id);
				}*/
				//for(Database.SaveResult sr : srList){
				for(Integer i = 0; i < srList.size(); i++){
					Database.SaveResult sr = srList[i];

					if(sr.isSuccess()){
						if(scheduledAutoCreate.Supported_Objects_for_Record_Auto_Create__c.equalsIgnoreCase('Case')){
							recordIdList.add(sr.getId());
							relatedAccountIdSet.add((Id)newRecordList[i].get('AccountId'));
						}
					}else{
						DebugInfo__c newDebug = new DebugInfo__c();
						newDebug.DebugData__c = 'DailyScheduledRecordAutoCreateBatch Error | ' + JSON.serializePretty(newRecordList[i]) + ' | ' + JSON.serializePretty(sr.getErrors());
						debugInfo.add(newDebug);
					}
				}

				if(!debugInfo.isEmpty()){
					Database.insert(debugInfo, false);
				}
			//}

			if(query.containsIgnoreCase('Custom_Automation__c') && scheduledAutoCreate.DeveloperName.equalsIgnoreCase('Create_Monthly_LBW_Account_Performance')){
				List<Custom_Automation__c> updateCustomAutomationList = new List<Custom_Automation__c>();

                for(Custom_Automation__c ca : [select Id, Automation_Status__c from Custom_Automation__c where Account__c in :relatedAccountIdSet and Automation_Status__c = 'Scheduled' and Automation_Trigger_Date__c = TODAY and Automation_Type_API_Name_External_ID__c = 'Create_Monthly_LBW_Account_Performance']){
                    ca.Automation_Status__c = 'Completed';
                    updateCustomAutomationList.add(ca);
                }

                if(!updateCustomAutomationList.isEmpty()){
                    Database.update(updateCustomAutomationList, false);
                }
			}
		}
	}
	
	public void finish(Database.BatchableContext BC) {
		if(!recordIdList.isEmpty() && scheduledAutoCreate.Push_New_Record_Data_To_Marketo__c){
			if(scheduledAutoCreate.Supported_Objects_for_Record_Auto_Create__c.equalsIgnoreCase('Case') && !Test.isRunningTest()){
				Database.executeBatch(new CriteriaBasedBatchDataPushToMarketo(recordIdList, 'Case'), 100);
			}
		}
	}

	private Case createCase(sObject recordScope){
		Case newCase = new Case();

		if(scheduledAutoCreate.Lookup_Relationships__c != null){
			for(String lookUp : scheduledAutoCreate.Lookup_Relationships__c.split(',')){
				List<String> lookUpAPINameParentAPINameList = lookUp.split(':');
				newCase.put(lookUpAPINameParentAPINameList[0].trim(), recordScope.get(lookUpAPINameParentAPINameList[1].trim()));
			}
		}

		if(scheduledAutoCreate.Default_Values__c != null){
			for(String defaultValue : scheduledAutoCreate.Default_Values__c.split(',')){
				List<String> defaultValueAPINameAndValueList = defaultValue.split(':');
				newCase.put(defaultValueAPINameAndValueList[0].trim(), defaultValueAPINameAndValueList[1].trim());
			}
		}

		if(scheduledAutoCreate.Additional_Default_Values__c != null){
			for(String defaultValue : scheduledAutoCreate.Additional_Default_Values__c.split(',')){
				List<String> defaultValueAPINameAndValueList = defaultValue.split(':');
				newCase.put(defaultValueAPINameAndValueList[0].trim(), defaultValueAPINameAndValueList[1].trim());
			}
		}

		return newCase;
	}

	private sObject createSObject(sObject recordScope){
		sObject newRecord = Schema.getGlobalDescribe().get(scheduledAutoCreate.Supported_Objects_for_Record_Auto_Create__c).newSObject();

		if(scheduledAutoCreate.Lookup_Relationships__c != null){
			for(String lookUp : scheduledAutoCreate.Lookup_Relationships__c.split(',')){
				List<String> lookUpAPINameParentAPINameList = lookUp.split(':');
				newRecord.put(lookUpAPINameParentAPINameList[0].trim(), recordScope.get(lookUpAPINameParentAPINameList[1].trim()));
			}
		}

		if(scheduledAutoCreate.Default_Values__c != null){
			for(String defaultValue : scheduledAutoCreate.Default_Values__c.split(',')){
				List<String> defaultValueAPINameAndValueList = defaultValue.split(':');
				newRecord.put(defaultValueAPINameAndValueList[0].trim(), defaultValueAPINameAndValueList[1].trim());
			}
		}

		if(scheduledAutoCreate.Additional_Default_Values__c != null){
			for(String defaultValue : scheduledAutoCreate.Additional_Default_Values__c.split(',')){
				List<String> defaultValueAPINameAndValueList = defaultValue.split(':');
				newRecord.put(defaultValueAPINameAndValueList[0].trim(), defaultValueAPINameAndValueList[1].trim());
			}
		}

		return newRecord;
	}
	
}