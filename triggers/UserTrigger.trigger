trigger UserTrigger on User (before insert, before update, after insert, after update) {
	Map<String, Id> profileIdMap = new Map<String, Id>();

	for(Profile record :[select Id, Name from Profile where UserType = 'PowerPartner']){
		profileIdMap.put(record.Name, record.Id);
	}

	if(trigger.isBefore && trigger.isInsert){
		Set<Id> contactIdSet = new Set<Id>();
		for(User record : trigger.New){
			system.debug(record);
			if(record.UserType == 'PowerPartner' || (Test.isRunningTest() && record.ContactId != null)){
				system.debug(record);
				contactIdSet.add(record.ContactId);
			}
		}

		Map<Id, Id> contIdAcctIdMap = new Map<Id, Id>();
		for(Contact record : [select Id, AccountId from Contact where Id in :contactIdSet]){
			contIdAcctIdMap.put(record.Id, record.AccountId);
		}

		Map<Id, Opportunity> certifiedAcctOppMap = new Map<Id, Opportunity>();
		for(Opportunity record : [select AccountId, Partner_Products_Available_To_Sell__c, Date_certification_complete__c from Opportunity where AccountId in :contIdAcctIdMap.values()]){
			certifiedAcctOppMap.put(record.AccountId, record);
		}

		for(User record : trigger.New){
			if(certifiedAcctOppMap.containsKey(contIdAcctIdMap.get(record.ContactId))){
				Opportunity opp = certifiedAcctOppMap.get(contIdAcctIdMap.get(record.ContactId));
				if(opp.Date_certification_complete__c == null && !opp.Partner_Products_Available_To_Sell__c.contains('Lighthouse Dental')){
					record.ProfileId = profileIdMap.get('Partner Community User');
				}else if(opp.Date_certification_complete__c == null && opp.Partner_Products_Available_To_Sell__c.contains('Lighthouse Dental')){
					record.ProfileId = profileIdMap.get('Partner Community Uncertified Lighthouse Dental');
				}else if(opp.Date_certification_complete__c != null && opp.Partner_Products_Available_To_Sell__c.contains('Lighthouse Dental')){
					record.ProfileId = profileIdMap.get('Partner Community Lighthouse Dental');
				}else{
					record.ProfileId = profileIdMap.get('Partner Community User');
				}
			}else if(!certifiedAcctOppMap.containsKey(contIdAcctIdMap.get(record.ContactId)) && contactIdSet.contains(record.ContactId)){
				record.addError('Related Account Needs an Opportunity!');
			}
		}
	}

	if(trigger.isAfter && (trigger.isUpdate || trigger.isInsert)){
		Id dentalGroupId = [select ID, DeveloperName from Group where DeveloperName = 'Partner_Lighthouse_Dental' limit 1].Id;
		List<GroupMember> newGroupMemberList = new List<GroupMember>();
		Set<Id> removeUserFromGroup = new Set<Id>();

		for(User record : trigger.New){
			if(trigger.isInsert && record.ProfileId == profileIdMap.get('Partner Community Lighthouse Dental')){
				GroupMember newGM = new GroupMember();
				newGM.GroupId = dentalGroupId;
				newGM.UserOrGroupId = record.Id;
				newGroupMemberList.add(newGM);
			}else if(trigger.isUpdate){
				User oldRecord = trigger.oldMap.get(record.Id);
				if(record.ProfileId != oldRecord.ProfileId && record.ProfileId == profileIdMap.get('Partner Community Lighthouse Dental')){
					GroupMember newGM = new GroupMember();
					newGM.GroupId = dentalGroupId;
					newGM.UserOrGroupId = record.Id;
					newGroupMemberList.add(newGM);
				}else if(record.ProfileId != oldRecord.ProfileId && oldRecord.ProfileId == profileIdMap.get('Partner Community Lighthouse Dental')){
					removeUserFromGroup.add(record.Id);
				}
			}
		}

		if(!newGroupMemberList.isEmpty()){
			insert newGroupMemberList;
		}
		if(!removeUserFromGroup.isEmpty()){
			List<GroupMember> removeGroupMemberList = new List<GroupMember>();
			for(GroupMember gm : [select UserOrGroupId, GroupId from GroupMember where GroupId =: dentalGroupId and UserOrGroupId in: removeUserFromGroup]){
				removeGroupMemberList.add(gm);
			}
			if(!removeGroupMemberList.isEmpty()){
				delete removeGroupMemberList;
			}
		}
		
	}
}