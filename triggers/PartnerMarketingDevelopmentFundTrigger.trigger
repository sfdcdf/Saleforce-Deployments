trigger PartnerMarketingDevelopmentFundTrigger on Partner_Marketing_Development_Fund__c (before insert, after insert, before update) {
	List<Partner_MDF_Quarterly_Budget_Setting__mdt> quarterlyBudgetSettingList = PartnerMDFQuarterlyBudgetSettingsHelper.retrieveMDFQuarterlyBudgetSettingsList();
	Period lastQuarterDate = [Select StartDate, EndDate From Period Where type = 'Quarter' and StartDate = LAST_FISCAL_QUARTER];

	if(trigger.isBefore && trigger.isInsert){
		Map<Id, Double> accountIdTotalQuarterRequest = new Map<Id, Double>();
		Map<Id, Integer> totalRequestThisQuarter = new Map<Id, Integer>();
		for(Partner_Marketing_Development_Fund__c record : trigger.New){
			if(String.isNotBlank(record.MDF_Status__c)){
				record.MDF_Status_Date_Time_Stamp__c = DateTime.now();
				if(String.isNotBlank(record.Partner_Account__c)){
					accountIdTotalQuarterRequest.put(record.Partner_Account__c, 0);
					totalRequestThisQuarter.put(record.Partner_Account__c, 0);
				}
			}
		}

		Map<Id, Partner_MDF_Quarterly_Budget_Setting__mdt> accountQuarterlyBudgetAssignmentMap = new Map<Id, Partner_MDF_Quarterly_Budget_Setting__mdt>();
		for(Partner_Quarterly_Managed_Account_Count__c record : [select Parent_Account__c, End_Of_Quarter_Date__c, Child_Accounts_End_of_Quarter_Count__c from Partner_Quarterly_Managed_Account_Count__c where Parent_Account__c in :accountIdTotalQuarterRequest.keySet() and End_of_Quarter_Date__c =: lastQuarterDate.EndDate]){
			for(Partner_MDF_Quarterly_Budget_Setting__mdt pmdfqbs : quarterlyBudgetSettingList){
				if(record.Child_Accounts_End_of_Quarter_Count__c >= pmdfqbs.Minimum_Managed_Accounts__c){
					accountQuarterlyBudgetAssignmentMap.put(record.Parent_Account__c, pmdfqbs);
				}
			}
		}

		for(Partner_Marketing_Development_Fund__c pmdf : [select Partner_Account__c, Total_Cost_of_Activity__c, Estimated_Cost_of_Activity__c, MDF_Date_Submitted__c from Partner_Marketing_Development_Fund__c where Partner_Account__c in :accountIdTotalQuarterRequest.keySet() and MDF_Date_Submitted__c = THIS_QUARTER and MDF_Status__c not in ('Request Denied', 'Request Expired')]){
			Double accountQuarterAdd = accountIdTotalQuarterRequest.get(pmdf.Partner_Account__c) + ((pmdf.Total_Cost_of_Activity__c != null) ? pmdf.Total_Cost_of_Activity__c : pmdf.Estimated_Cost_of_Activity__c);
			accountIdTotalQuarterRequest.put(pmdf.Partner_Account__c, accountQuarterAdd);

			Integer totalRequest = totalRequestThisQuarter.get(pmdf.Partner_Account__c) + 1;
			totalRequestThisQuarter.put(pmdf.Partner_Account__c, totalRequest);
		}

		Map<Id, Account> accountMap = new Map<Id, Account>([select Id, Owner.Name from Account where Id in : accountIdTotalQuarterRequest.keySet()]);

		for(Partner_Marketing_Development_Fund__c record : trigger.New){

			if((totalRequestThisQuarter.get(record.Partner_Account__c) + 1) > 3){
				record.addError('You can only request 3 activities per quarter!');
			}else if(!accountQuarterlyBudgetAssignmentMap.containsKey(record.Partner_Account__c)){
				record.addError('You are not eligible for MDF Funds this quarter. Contact ' + accountMap.get(record.Partner_Account__c).Owner.Name +  ' if you have any questions.');
			}else if(accountQuarterlyBudgetAssignmentMap.get(record.Partner_Account__c).Maximum_Quarterly_Budget_Allowance__c < (accountIdTotalQuarterRequest.get(record.Partner_Account__c) + record.Estimated_Cost_of_Activity__c)){
				Double totalSpend = accountIdTotalQuarterRequest.get(record.Partner_Account__c) + record.Estimated_Cost_of_Activity__c;
				record.addError('You are eligible to spend $' + accountQuarterlyBudgetAssignmentMap.get(record.Partner_Account__c).Maximum_Quarterly_Budget_Allowance__c + '! This will make your total requests to $' + totalSpend + '!');
			}
		}
	}else if(trigger.isBefore && trigger.isUpdate){
		for(Partner_Marketing_Development_Fund__c record : trigger.New){
			Partner_Marketing_Development_Fund__c oldRecord = trigger.oldMap.get(record.Id);
			if(record.MDF_Status__c != oldRecord.MDF_Status__c){
				record.MDF_Status_Date_Time_Stamp__c = DateTime.now();
			}
		}
	}else if(trigger.isInsert && trigger.isAfter){
		List<Id> requestorIdList = new List<Id>();

		for(Partner_Marketing_Development_Fund__c record : trigger.New){
			requestorIdList.add(record.Requested_By__c);
		}

		Map<Id, User> userIdMap = new Map<Id, User>([select Id, UserRoleId, IsPortalEnabled, AccountId from User where Id in : requestorIdList and AccountId != '' and IsPortalEnabled = true and UserRoleId != '']);
		
		Map<Id, Group> userRoleGroupMap = new Map<Id, Group>();
		for(Group record : [select Id, RelatedId from Group where RelatedId in (select UserRoleId from User where Id in : userIdMap.keySet())]){
			userRoleGroupMap.put(record.RelatedId, record);
		}

		List<Partner_Marketing_Development_Fund__Share> sharingList = new List<Partner_Marketing_Development_Fund__Share>();
		for(Partner_Marketing_Development_Fund__c record : trigger.New){
			if(userIdMap.containsKey(record.Requested_By__c)){
				Partner_Marketing_Development_Fund__Share shareRecord = new Partner_Marketing_Development_Fund__Share();
				shareRecord.ParentId = record.Id;
				shareRecord.UserOrGroupId = userRoleGroupMap.get(userIdMap.get(record.Requested_By__c).UserRoleId).Id;
				shareRecord.AccessLevel = 'Edit';
				sharingList.add(shareRecord);
			}
		}

		if(!sharingList.isEmpty()){
			insert sharingList;
		}
	}
}