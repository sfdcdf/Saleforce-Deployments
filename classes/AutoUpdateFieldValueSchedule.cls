global class AutoUpdateFieldValueSchedule implements Schedulable {
	global void execute(SchedulableContext sc) {
		for(AutoUpdateFieldValueCustomSetting__c record : AutoUpdateFieldValueCustomSetting__c.getAll().values()){
			if(record.Active__c){
				Database.executebatch(new AutoUpdateFieldValueBatch(record.Name), 100);
			}
		}
	}
}