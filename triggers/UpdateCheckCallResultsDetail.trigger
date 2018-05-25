trigger UpdateCheckCallResultsDetail on Task (before insert, before update) {
	
	for (Task newTask : Trigger.new) {
		System.Debug('************ What Obj Id: ' + newTask.WhatId + '\n What Type: \n' + newTask);
		Call_Result_Detail__c callResult;
		try {
			callResult = [Select Id,Lead__c, Contact__c, Campaign__c, Comments__c, Call_Status__c, Task_Processed__c From Call_Result_Detail__c WHERE Id = :newTask.WhatId];
		}
		catch (Exception e) {
			System.Debug(e);
		}
		
		if (newTask.CallType == 'Outbound' && callResult != null) {			
			System.Debug('******\n*********\nIs Call Result Task\n\n');
			
			newTask.Type = 'Completed Call Summary';
			if (callResult.Lead__c != null ) {
				System.Debug('Setting who id');
				newTask.WhoId = callResult.Lead__c;
				newTask.WhatId = null;
				System.debug('New task who Id\n' + newTask.WhoId);
			}
			else if (callResult.Contact__c != null) {
				newTask.WhoId = callResult.Contact__c;
				if (callResult.Campaign__c != null) {
					newTask.WhatId = callResult.Campaign__c;
				}
				newTask.WhatId = callResult.Id;
				
			}
			newTask.Phone_Result__c = callResult.Call_Status__c;
			newTask.Description = callResult.Comments__c;
			callResult.Task_Processed__c = true;
			update callResult;
		}
		System.Debug('***** NEW TASK: \n ' + newTask);
	}
	
}