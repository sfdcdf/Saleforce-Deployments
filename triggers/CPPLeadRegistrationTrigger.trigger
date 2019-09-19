trigger CPPLeadRegistrationTrigger on CPP_Lead_Registration__c (before update, after update) {

	if(trigger.isBefore && trigger.isUpdate){
		Map<Id, Opportunity> cppLeadRegistrationIdOppMap = new Map<Id, Opportunity>();
		Map<String, Id> clientIdCPPLeadRegistrationIdMap = new Map<String, Id>();
		for(CPP_Lead_Registration__c record : trigger.New){
			CPP_Lead_Registration__c oldRecord = trigger.oldMap.get(record.Id);
			if(record.Lead_Registration_Status__c == 'Approved' && String.isBlank(record.Opportunity__c)){
				Opportunity newOpportunity = new Opportunity();
				newOpportunity.Name = ('Lead Registration: ' + record.Name).abbreviate(80);
				newOpportunity.AccountId = record.Partner_Account__c;
				newOpportunity.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Partner - CPP Child Account').getRecordTypeId();
				newOpportunity.ForecastCategoryName = 'Pipeline';
				newOpportunity.StageName = 'New Opportunity';
				newOpportunity.CloseDate = record.Expected_Close_Date__c;
				cppLeadRegistrationIdOppMap.put(record.Id, newOpportunity);
			}

			if(String.isNotBlank(record.Gold_Nugget_Client_ID__c) && String.isBlank(record.Child_Account__c)){
				clientIdCPPLeadRegistrationIdMap.put(record.Gold_Nugget_Client_ID__c, record.Id);
			}
		}

		if(!cppLeadRegistrationIdOppMap.isEmpty()){
			insert cppLeadRegistrationIdOppMap.values();

			for(String keyValue : cppLeadRegistrationIdOppMap.keySet()){
				trigger.newMap.get(keyValue).Opportunity__c = cppLeadRegistrationIdOppMap.get(keyValue).Id;
			}
		}

		if(!clientIdCPPLeadRegistrationIdMap.isEmpty()){
			for(Account record : [select Id, Client_ID__c from Account where Client_ID__c in : clientIdCPPLeadRegistrationIdMap.keySet()]){
				system.debug('test');
				trigger.newMap.get(clientIdCPPLeadRegistrationIdMap.get(record.Client_ID__c)).Child_Account__c = record.Id;
			}
		}
	}else if(trigger.isAfter && trigger.isUpdate){
		List<Opportunity> updateOppList = new List<Opportunity>();
		for(CPP_Lead_Registration__c record : trigger.New){
			CPP_Lead_Registration__c oldRecord = trigger.oldMap.get(record.Id);
			if(String.isNotBlank(record.Opportunity__c) && String.isNotBlank(record.Opportunity_Stage__c) && record.Opportunity_Stage__c != oldRecord.Opportunity_Stage__c){
				if(record.Opportunity_Stage__c == 'Closed Won'){
					Opportunity oppRecord = new Opportunity();
					oppRecord.Id = record.Opportunity__c;
					oppRecord.StageName = 'Closed Won';
					oppRecord.CloseDate = Date.today();
					updateOppList.add(oppRecord);
				}else if(record.Opportunity_Stage__c == 'Closed Lost'){
					Opportunity oppRecord = new Opportunity();
					oppRecord.Id = record.Opportunity__c;
					oppRecord.StageName = 'Closed Lost';
					updateOppList.add(oppRecord);
				}
			}
		}
		if(!updateOppList.isEmpty()){
			update updateOppList;
		}
	}

}