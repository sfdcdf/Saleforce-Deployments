public without sharing class PartnerCommunityUtil {

	@future
	public static void updatePartnerUserProfile(Set<Id> verifyCertificationAcctIdSet){
		List<User> updateUserList = new List<User>();
		Map<String, Id> profileIdMap = new Map<String, Id>();

		for(Profile record :[select Id, Name from Profile where UserType = 'PowerPartner']){
			profileIdMap.put(record.Name, record.Id);
		}

		Map<Id, Opportunity> certifiedAcctOppMap = new Map<Id, Opportunity>();
		for(Opportunity record : [select AccountId, Partner_Products_Available_To_Sell__c, Date_certification_complete__c from Opportunity where AccountId in :verifyCertificationAcctIdSet]){
			certifiedAcctOppMap.put(record.AccountId, record);
		}

		for(User record : [select Id, ProfileId, AccountId from User where AccountId in: verifyCertificationAcctIdSet and IsPortalEnabled = true]){
			Opportunity opp = certifiedAcctOppMap.get(record.AccountId);
			if(opp.Date_certification_complete__c == null && !opp.Partner_Products_Available_To_Sell__c.contains('Lighthouse Dental')){
				record.ProfileId = profileIdMap.get('Partner Community User');
			}else if(opp.Date_certification_complete__c == null && opp.Partner_Products_Available_To_Sell__c.contains('Lighthouse Dental')){
				record.ProfileId = profileIdMap.get('Partner Community Uncertified Lighthouse Dental');
			}else if(opp.Date_certification_complete__c != null && opp.Partner_Products_Available_To_Sell__c.contains('Lighthouse Dental')){
				record.ProfileId = profileIdMap.get('Partner Community Lighthouse Dental');
			}else{
				record.ProfileId = profileIdMap.get('Partner Community User');
			}
			updateUserList.add(record);
		}

		update updateUserList;
	}
}