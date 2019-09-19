public class MarketoHourlyEmailCampaignSchedule implements Schedulable {
	public void execute(SchedulableContext sc) {
		for(Marketo_Email_Campaign__c mec : [select Id, Criteria__c, Randomize__c, How_Many_Random_Records__c, Hourly_Reminder_DateTime_Field__c, of_Hours_For_Reminder__c from Marketo_Email_Campaign__c where Active__c = true and RecordType.Name = 'Hourly Template']){
			//DateTime reminderStartTime = DateTime.now().addHours((Integer)mec.of_Hours_For_Reminder__c);
			DateTime dtNowUnscrubbedValue = DateTime.now().addHours((Integer)mec.of_Hours_For_Reminder__c);
			system.debug(DateTime.Now());
			system.debug(dtNowUnscrubbedValue);
			DateTime reminderStartTime = DateTime.newInstance(dtNowUnscrubbedValue.year(), dtNowUnscrubbedValue.month(), dtNowUnscrubbedValue.day(), dtNowUnscrubbedValue.hour(), 0, 0);
			DateTime reminderEndTime = reminderStartTime.addMinutes(60);
			system.debug(reminderStartTime);
			String hourlyCriteria = ' and ' + mec.Hourly_Reminder_DateTime_Field__c + ' >=: reminderStartTime and ' + mec.Hourly_Reminder_DateTime_Field__c + ' <: reminderEndTime ';
			if(!mec.Randomize__c){
				Database.executeBatch(new MarketoHourlyEmailCampaignBatch(mec.Criteria__c + hourlyCriteria, mec.Id, reminderStartTime), 100);
			}else{
				List<String> splitCriteriaForCount = mec.Criteria__c.toUpperCase().split('FROM', 2);
				Integer totalSize = Database.countQuery('SELECT COUNT() FROM ' + splitCriteriaForCount[1]);
				Integer rand = Math.floor(Math.random() * totalSize).intValue();

				List<String> orderBys = new List<String>{'LastModifiedDate Desc','LastModifiedDate Asc','CreatedDate Asc','CreatedDate Desc','Id Asc','Id Desc'};
				String orderBy = orderBys.get(Math.floor(Math.random() * orderBys.size()).intValue());
				String queryString = mec.Criteria__c + hourlyCriteria + ' Order By ' + orderBy + ' Limit ' + mec.How_Many_Random_Records__c + ' OFFSET ' + rand;
				system.debug(queryString);
				List<Id> idList = new List<Id>();
				for(SObject sObj : Database.query(queryString)){
					idList.add(sObj.Id);
				}
				system.debug(mec.Criteria__c + ' and Id IN ' + idList);
				system.debug(totalSize);
				Database.executeBatch(new MarketoHourlyEmailCampaignBatch(mec.Criteria__c + ' and Id IN (\'' + String.join(idList, '\',\'') + '\')', mec.Id, reminderStartTime), 100);
			}
		}
	}
}