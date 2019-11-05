/*******************************************************************************************
 * Modification Log:
 * 
 * Developer Name: Mahesh Bogila
 * Date : 5/29/2019
 * Jira :https://jira.registeredsite.com/browse/TEAM-36749

 * ****************************************************************************************/


trigger OpportunityTrigger on Opportunity (before Insert, Before Update, after update) {
    if(trigger.isBefore) // Modification Of Mahesh start here for https://jira.registeredsite.com/browse/TEAM-36749
    {
        Map<ID, Schema.RecordTypeInfo> rtMap = Schema.SObjectType.Opportunity.getRecordTypeInfosById();
        for(Opportunity TempOppty: Trigger.new)
        {
        if(TempOppty.RecordTypeId!= null)
        {
            TempOppty.RecordType_Name__c = rtMap.get(TempOppty.RecordTypeId).getName();
            System.debug('++++++Record type' +TempOppty.RecordType_Name__c);
        }
          
        }
    } // Modification of Mahesh Ended here for https://jira.registeredsite.com/browse/TEAM-36749
    
    if(trigger.isAfter && trigger.isUpdate){
		Id partnerCppChildAcctRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Partner - CPP Child Account').getRecordTypeId();
		Set<Id> verifyCertificationAcctIdSet = new Set<Id>();
		Set<Id> opportunityIdRecentlyClosedSet = new Set<Id>();

		for(Opportunity record : trigger.New){
			Opportunity oldRecord = trigger.oldMap.get(record.Id);
			if((oldRecord.Date_certification_complete__c != record.Date_certification_complete__c || oldRecord.Partner_Products_Available_To_Sell__c != record.Partner_Products_Available_To_Sell__c) && String.isNotBlank(record.AccountId)){
				verifyCertificationAcctIdSet.add(record.AccountId);
			}

			if(record.IsClosed && record.StageName != oldRecord.StageName && record.RecordTypeId == partnerCppChildAcctRecordTypeId){
				opportunityIdRecentlyClosedSet.add(record.Id);
			}
		}

		if(!opportunityIdRecentlyClosedSet.isEmpty()){
			List<CPP_Lead_Registration__c> updateLeadRegistrationList = new List<CPP_Lead_Registration__c>();
			for(CPP_Lead_Registration__c record : [select Id, Opportunity_Stage__c, Opportunity__c from CPP_Lead_Registration__c where Opportunity__c in : opportunityIdRecentlyClosedSet]){
				record.Opportunity_Stage__c = trigger.newMap.get(record.Opportunity__c).StageName;
				updateLeadRegistrationList.add(record);
			}
			if(!updateLeadRegistrationList.isEmpty()){
				update updateLeadRegistrationList;
			}
		}

		if(!verifyCertificationAcctIdSet.isEmpty()){
			PartnerCommunityUtil.updatePartnerUserProfile(verifyCertificationAcctIdSet);
		}
	}
}