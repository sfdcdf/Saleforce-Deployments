trigger CancellationRequestTrigger on Cancellation_Request__c (before insert, before update, after insert, after update) {
	
	if(trigger.isBefore && trigger.isInsert){
		for(Cancellation_Request__c record : trigger.New){
			if(String.isBlank(record.Day_Of_Next_SLA_Touch__c)){
				record.Day_Of_Next_SLA_Touch__c = '1';
			}
		}
	}else if(trigger.isBefore && trigger.isUpdate){
		for(Cancellation_Request__c record : trigger.New){
			if(String.isBlank(record.Day_Of_Next_SLA_Touch__c)){
				record.Day_Of_Next_SLA_Touch__c = '1';
			}
			if(record.Day_SLA_Equivalent__c == null){
				record.Day_SLA_Equivalent__c = 1;
			}
		}

		CancellationRequestTriggerHandler.beforeUpdateSLACheck(trigger.newMap, trigger.oldMap);
		/*for(Cancellation_Request__c cancelRequest : trigger.New){
			Cancellation_Request__c oldCancelRequest = trigger.oldMap.get(cancelRequest.Id);
			if(String.isNotBlank(cancelRequest.Day_Of_Next_SLA_Touch__c) && Double.valueof(cancelRequest.Day_Of_Next_SLA_Touch__c) < cancelRequest.Day_SLA_Equivalent__c){
				cancelRequest.Within_SLA__c = 'No';
			}else if(String.isNotBlank(cancelRequest.Day_Of_Next_SLA_Touch__c) && Double.valueof(cancelRequest.Day_Of_Next_SLA_Touch__c) >= cancelRequest.Day_SLA_Equivalent__c){
				cancelRequest.Within_SLA__c = 'Yes';
			}
		}*/
	}else if(trigger.isAfter && trigger.isInsert){    
		CancellationRequestTriggerHandler.afterInsert(trigger.newMap);
		/* Subba Gadhamsetty, Added for YO-62417 ,Start */
		CancellationRequestTriggerHandler.createNewEvents(trigger.newMap, trigger.oldMap);			
		/* Subba Gadhamsetty, Added for YO-62417 ,End */
	}else if(trigger.isAfter && trigger.isUpdate){
		CancellationRequestTriggerHandler.afterUpdate(trigger.newMap, trigger.oldMap);

		Set<Id> savedAccountIds = new Set<Id>();
		for(Cancellation_Request__c cancelRequest : trigger.New){
			Cancellation_Request__c oldCancelRequest = trigger.oldMap.get(cancelRequest.Id);
			if(String.isNotBlank(cancelRequest.Outcome__c) && cancelRequest.Outcome__c != oldCancelRequest.Outcome__c && cancelRequest.Outcome__c.containsIgnoreCase('Saved')){
				savedAccountIds.add(cancelRequest.Account_Name__c);
			}
		}

		if(!savedAccountIds.isEmpty()){
			List<Case> updateCaseList = new List<Case>();
			for(Account acct : [select Id, (select Id, Scheduled_Call__c, Status from Cases where Status = 'Churned' and Reason = 'CSC' and CreatedDate >= LAST_N_MONTHS:2) from Account where Id in : savedAccountIds]){
				for(Case cs : acct.Cases){
					cs.Status = 'Unscheduled - Reattempt';
					updateCaseList.add(cs);
				}
			}
			if(!updateCaseList.isEmpty()){
				update updateCaseList;
			}
		}
		
		/* Subba Gadhamsetty, Added for YO-62417 ,Start */ 
		CancellationRequestTriggerHandler.processUpdateEvents(trigger.newMap, trigger.oldMap);	
		/* Subba Gadhamsetty, Added for YO-62417 ,End */		
	}
}