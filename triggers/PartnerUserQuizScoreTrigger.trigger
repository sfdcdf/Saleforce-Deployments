trigger PartnerUserQuizScoreTrigger on Partner_User_Quiz_Scores__c (before insert) {
	if(trigger.isBefore && trigger.isInsert){
		Set<String> emailPassedCertification = new Set<String>();
		Set<String> emailFailedCertification = new Set<String>();

		for(Partner_User_Quiz_Scores__c record : trigger.New){
			Map<String, Object> testMap = (Map<String,Object>)JSON.deserializeUntyped(record.ProProfs_Message__c);
			if(Double.valueof(testMap.get('user_percent_marks')) >= 80){
				emailPassedCertification.add((String)testMap.get('user_Email'));
				record.Email_Used__c = (String)testMap.get('user_Email');
			}else if(Double.valueof(testMap.get('user_percent_marks')) < 80){
				emailFailedCertification.add((String)testMap.get('user_Email'));
				record.Email_Used__c = (String)testMap.get('user_Email');
			}
		}

		if(!emailPassedCertification.isEmpty()){
			Map<String, Id> contactEmailAccountIdMap = new Map<String, Id>();

			try{
				List<Opportunity> updateOppList = new List<Opportunity>();
				for(Account record : [select Id, (select Id, Date_certification_complete__c from Opportunities where IsWon = true and Date_certification_complete__c = null), (select Email, AccountId from Contacts where Email in: emailPassedCertification) from Account where Id in (select AccountId from Contact where Email in : emailPassedCertification)]){
					for(Opportunity opp : record.Opportunities){
						opp.Date_certification_complete__c = date.today();
						updateOppList.add(opp);
					}

					for(Contact con : record.Contacts){
						contactEmailAccountIdMap.put(con.Email, con.AccountId);
					}
				}

				update updateOppList;

				for(Partner_User_Quiz_Scores__c record : trigger.new){
					record.Account__c = contactEmailAccountIdMap.get(record.Email_Used__c);
				}
			}catch(Exception E){
				system.debug(E.getMessage());
			}
		}

		if(!emailFailedCertification.isEmpty()){
			Map<String, Id> contactEmailAccountIdMap = new Map<String, Id>();

			for(Account record : [select Id, (select Email, AccountId from Contacts where Email in: emailFailedCertification) from Account where Id in (select AccountId from Contact where Email in : emailFailedCertification)]){
				for(Contact con : record.Contacts){
					contactEmailAccountIdMap.put(con.Email, con.AccountId);
				}
			}

			for(Partner_User_Quiz_Scores__c record : trigger.new){
				record.Account__c = contactEmailAccountIdMap.get(record.Email_Used__c);
			}
		}
	}
}