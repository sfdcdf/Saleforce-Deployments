public class DailyScheduledRecordAutoCreateSchedule implements Schedulable {

	public void execute(SchedulableContext sc) {
		for(Daily_Scheduled_Record_Auto_Create__mdt record : [select Id, DeveloperName, Additional_Default_Values__c, Additional_SOQL_Criteria__c, Default_Values__c, Lookup_Relationships__c, SOQL__c, Supported_Objects_for_Record_Auto_Create__c, Push_New_Record_Data_To_Marketo__c from Daily_Scheduled_Record_Auto_Create__mdt where Active__c = true]){
			if(!Test.isRunningTest() && record.DeveloperName.equalsIgnoreCase('Test_Class_Use_Only')){
				continue;
			}

			Database.executeBatch(new DailyScheduledRecordAutoCreateBatch(record, ''));
		}
	}

}