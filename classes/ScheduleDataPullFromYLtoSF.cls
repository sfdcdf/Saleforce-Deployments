global class ScheduleDataPullFromYLtoSF implements Schedulable {
	global void execute(SchedulableContext sc) {
		for(Scheduled_Data_Pull_from_YL_to_SF__c schDataPullFromYLtoSF : [select Id, Batch_Size__c, Class_to_Invoke__c, SOQL_Criteria__c from Scheduled_Data_Pull_from_YL_to_SF__c where Active__c = true]){
			Database.executeBatch(new BatchDataPullFromYLtoSF(schDataPullFromYLtoSF.SOQL_Criteria__c, schDataPullFromYLtoSF.Class_to_Invoke__c), Integer.valueof(schDataPullFromYLtoSF.Batch_Size__c));
		}
	}
}