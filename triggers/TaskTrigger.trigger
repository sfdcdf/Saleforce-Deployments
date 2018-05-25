trigger TaskTrigger on Task (after insert/*, after update*/) {

	//Set<Id> caseIdSet = new Set<Id>();
	Set<Id> cancellationRequestIdSet = new Set<Id>();
	Set<Id> cancellationEmailIdSet = new Set<Id>();
	for(Task tk : trigger.New){
		/*if(String.isNotBlank(tk.WhatId) && ((String)tk.WhatId).left(3) == '500' && tk.CallDurationInSeconds >= 30){
			caseIdSet.add(tk.WhatId);
		}else*/ if(String.isNotBlank(tk.WhatId) && ((String)tk.WhatId).left(3) == 'a0j' && String.isNotBlank(tk.CallType) && tk.CallType.equalsIgnoreCase('Outbound')){
			cancellationRequestIdSet.add(tk.WhatId);
		}else if(String.isNotBlank(tk.WhatId) && ((String)tk.WhatId).left(3) == 'a0j' && String.isNotBlank(tk.TaskSubtype) && tk.TaskSubtype.equalsIgnoreCase('Email')){
			cancellationEmailIdSet.add(tk.WhatId);
		}
	}
	
	if(trigger.isAfter && trigger.isInsert){
		/*if(!caseIdSet.isEmpty()){
			List<Case> updateCaseAttemptList = new List<Case>();
			for(Case cs : [select Id, X1st_Attempt_By__c, Attempt_Date_1__c, X2nd_Attempt_By__c, Attempt_Date_2__c, X3rd_Attempt_By__c, Attempt_Date_3__c, X4th__c, Attempt_Date_4__c from Case where RecordType.Name = 'Outbound Call' and Id in :caseIdSet and Id in (select Case__c from Touchplan_Section__c where Case__c in: caseIdSet) and isClosed = false]){
				// ADD THE ATTEMPT DATE TIME HERE AND THEN CHECK WITH THAT FIELD IF THE NEXT ATTEMPT IS WITHIN THE SAME TIME FRAME AND DON'T LOG IF IT IS AND THE SAME REP!!!
				if(String.isNotBlank(cs.X1st_Attempt_By__c) && cs.X1st_Attempt_By__c == UserInfo.getName() && cs.Attempt_Date_1__c > DateTime.now().addDays(-2)){
					break;
				}else if(String.isNotBlank(cs.X2nd_Attempt_By__c) && cs.X2nd_Attempt_By__c == UserInfo.getName() && cs.Attempt_Date_2__c > DateTime.now().addDays(-2)){
					break;
				}else if(String.isNotBlank(cs.X3rd_Attempt_By__c) && cs.X3rd_Attempt_By__c == UserInfo.getName() && cs.Attempt_Date_3__c > DateTime.now().addDays(-2)){
					break;
				}else if(String.isNotBlank(cs.X4th__c) && cs.X4th__c == UserInfo.getName() && cs.Attempt_Date_4__c > DateTime.now().addDays(-2)){
					break;
				}

				if(String.isBlank(cs.X1st_Attempt_By__c)){
					cs.X1st_Attempt_By__c = UserInfo.getName();
					cs.Attempt_Date_1__c = DateTime.now();
					//cs.Status = 'In Progress - 1 Attempt';
				}else if(String.isBlank(cs.X2nd_Attempt_By__c)){
					cs.X2nd_Attempt_By__c = UserInfo.getName();
					cs.Attempt_Date_2__c = DateTime.now();
					//cs.Status = 'In Progress - 2 Attempt';
				}else if(String.isBlank(cs.X3rd_Attempt_By__c)){
					cs.X3rd_Attempt_By__c = UserInfo.getName();
					cs.Attempt_Date_3__c = DateTime.now();
					//cs.Status = 'In Progress - 3 Attempt';
				}else{
					cs.X4th__c = UserInfo.getName();
					cs.Attempt_Date_4__c = DateTime.now();
					//cs.Status = 'In Progress - 3+ Attempt';
				}

				updateCaseAttemptList.add(cs);
			}

			update updateCaseAttemptList;
		}*/

		if(!cancellationRequestIdSet.isEmpty()){
			List<Cancellation_Request__c> updateCancelRequestList = new List<Cancellation_Request__c>();
			for(Cancellation_Request__c cr : [select Id, Day_SLA_Equivalent__c, Day_Of_Next_SLA_Touch__c, (select Id, CreatedDate from Tasks where CreatedDate = TODAY and CallType = 'Outbound') from Cancellation_Request__c where Id in :cancellationRequestIdSet and Outcome__c = 'In Progress']){
				if(Integer.valueof(cr.Day_Of_Next_SLA_Touch__c) <= cr.Day_SLA_Equivalent__c && cr.Tasks.size() == 1){
					if((CancellationRequestTriggerHandler.orderMap().get(cr.Day_Of_Next_SLA_Touch__c) + 1) < CancellationRequestTriggerHandler.orderList().size()){
						cr.Day_Of_Next_SLA_Touch__c = CancellationRequestTriggerHandler.orderList().get(CancellationRequestTriggerHandler.orderMap().get(cr.Day_Of_Next_SLA_Touch__c) + 1);
						updateCancelRequestList.add(cr);
					}
				}
			}
			if(!updateCancelRequestList.isEmpty()){
				update updateCancelRequestList;
			}
		}

		if(!cancellationEmailIdSet.isEmpty()){
			List<Cancellation_Request__c> updateCancelRequestList = new List<Cancellation_Request__c>();
			for(Cancellation_Request__c cr : [select Id, Day_SLA_Equivalent__c, Day_Of_Next_SLA_Touch__c, (select Id, CreatedDate from Tasks where CreatedDate = TODAY and TaskSubtype = 'Email') from Cancellation_Request__c where Id in :cancellationEmailIdSet and Outcome__c = 'In Progress']){
				if(Integer.valueof(cr.Day_Of_Next_SLA_Touch__c) == 1 && cr.Tasks.size() == 1){
					cr.Day_SLA_Equivalent__c = 0;
					updateCancelRequestList.add(cr);
				}
			}
			if(!updateCancelRequestList.isEmpty()){
				update updateCancelRequestList;
			}
		}
	}/*else if(trigger.isAfter && trigger.isUpdate){
		if(!caseIdSet.isEmpty()){
			List<Case> updateCaseAttemptList = new List<Case>();
			for(Case cs : [select Id, X1st_Attempt_By__c, Attempt_Date_1__c, X2nd_Attempt_By__c, Attempt_Date_2__c, X3rd_Attempt_By__c, Attempt_Date_3__c, X4th__c, Attempt_Date_4__c from Case where RecordType.Name = 'Outbound Call' and Id in :caseIdSet and Id in (select Case__c from Touchplan_Section__c where Case__c in: caseIdSet) and isClosed = false]){
				// ADD THE ATTEMPT DATE TIME HERE AND THEN CHECK WITH THAT FIELD IF THE NEXT ATTEMPT IS WITHIN THE SAME TIME FRAME AND DON'T LOG IF IT IS AND THE SAME REP!!!
				if(String.isNotBlank(cs.X1st_Attempt_By__c) && cs.X1st_Attempt_By__c == UserInfo.getName() && cs.Attempt_Date_1__c > DateTime.now().addDays(-2)){
					break;
				}else if(String.isNotBlank(cs.X2nd_Attempt_By__c) && cs.X2nd_Attempt_By__c == UserInfo.getName() && cs.Attempt_Date_2__c > DateTime.now().addDays(-2)){
					break;
				}else if(String.isNotBlank(cs.X3rd_Attempt_By__c) && cs.X3rd_Attempt_By__c == UserInfo.getName() && cs.Attempt_Date_3__c > DateTime.now().addDays(-2)){
					break;
				}else if(String.isNotBlank(cs.X4th__c) && cs.X4th__c == UserInfo.getName() && cs.Attempt_Date_4__c > DateTime.now().addDays(-2)){
					break;
				}

				if(String.isBlank(cs.X1st_Attempt_By__c)){
					cs.X1st_Attempt_By__c = UserInfo.getName();
					cs.Attempt_Date_1__c = DateTime.now();
					//cs.Status = 'In Progress - 1 Attempt';
				}else if(String.isBlank(cs.X2nd_Attempt_By__c)){
					cs.X2nd_Attempt_By__c = UserInfo.getName();
					cs.Attempt_Date_2__c = DateTime.now();
					//cs.Status = 'In Progress - 2 Attempt';
				}else if(String.isBlank(cs.X3rd_Attempt_By__c)){
					cs.X3rd_Attempt_By__c = UserInfo.getName();
					cs.Attempt_Date_3__c = DateTime.now();
					//cs.Status = 'In Progress - 3 Attempt';
				}else{
					cs.X4th__c = UserInfo.getName();
					cs.Attempt_Date_4__c = DateTime.now();
					//cs.Status = 'In Progress - 3+ Attempt';
				}

				updateCaseAttemptList.add(cs);
			}

			update updateCaseAttemptList;
		}
	}*/

}