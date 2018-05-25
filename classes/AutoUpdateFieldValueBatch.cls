global class AutoUpdateFieldValueBatch implements Database.Batchable<sObject> {
	
	String query;
	AutoUpdateFieldValueCustomSetting__c customSettingRecord;
	
	global AutoUpdateFieldValueBatch(String customSettingName) {
		customSettingRecord = AutoUpdateFieldValueCustomSetting__c.getValues(customSettingName);

		query = customSettingRecord.SOQL__c;
		if(String.isNotBlank(customSettingRecord.Additional_SOQL_Criteria__c)){
			query += ' ' + customSettingRecord.Additional_SOQL_Criteria__c;
		}
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {
		for(sObject so : scope){
			for(String fieldValue : customSettingRecord.Field_Value_Update__c.split(',')){
				List<String> fieldValueList = fieldValue.split(':');
				so.put(fieldValueList[0].trim(), fieldValueList[1].trim());
			}
		}
		Database.update(scope, false);
	}
	
	global void finish(Database.BatchableContext BC) {
		
	}
	
}