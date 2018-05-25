public class MarketoEmailCampaignSchedule implements Schedulable {
	public void execute(SchedulableContext sc) {
		for(Marketo_Email_Campaign__c mec : [select Id, Criteria__c, Randomize__c, How_Many_Random_Records__c from Marketo_Email_Campaign__c where Active__c = true and RecordType.Name = 'Template']){
			if(!mec.Randomize__c){
				Database.executeBatch(new MarketoEmailCampaignBatch(mec.Criteria__c, mec.Id), 100);
			}else{
				List<String> splitCriteriaForCount = mec.Criteria__c.toUpperCase().split('FROM', 2);
				Integer totalSize = Database.countQuery('SELECT COUNT() FROM ' + splitCriteriaForCount[1]);
				Integer rand = Math.floor(Math.random() * totalSize).intValue();

				if(rand >=2000){
					rand = 2000 - Integer.valueof(mec.How_Many_Random_Records__c);
				}

				List<String> orderBys = new List<String>{'LastModifiedDate Desc','LastModifiedDate Asc','CreatedDate Asc','CreatedDate Desc','Id Asc','Id Desc'};
				String orderBy = orderBys.get(Math.floor(Math.random() * orderBys.size()).intValue());
				String queryString = mec.Criteria__c + ' Order By ' + orderBy + ' Limit ' + mec.How_Many_Random_Records__c + ' OFFSET ' + rand;
				system.debug(queryString);
				List<Id> idList = new List<Id>();
				for(SObject sObj : Database.query(queryString)){
					idList.add(sObj.Id);
				}
				system.debug(mec.Criteria__c + ' and Id IN ' + idList);
				system.debug(totalSize);
				Database.executeBatch(new MarketoEmailCampaignBatch(mec.Criteria__c + ' and Id IN (\'' + String.join(idList, '\',\'') + '\')', mec.Id), 100);
			}
		}
	}
}