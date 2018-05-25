global class AutoClearDataSchedule implements Schedulable {
	global void execute(SchedulableContext sc) {
		for(AutoClearDataCustomSetting__c record : [select Id, SOQL__c, Field_API_Name_To_Clear_Out__c from AutoClearDataCustomSetting__c where Active__c = true]){
			Database.executebatch(new AutoClearDataBatch(record.SOQL__c, record.Field_API_Name_To_Clear_Out__c));
		}
	}
}