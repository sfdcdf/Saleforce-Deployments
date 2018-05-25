public without sharing class MarketoLeadIdSFAccountMapper {

	@future (callout=true)
	public static void mapSFAccountToMarketoLead(String serializedAccountList) {
		Map<String, Account> accountIdAccountMap = new Map<String, Account>();
		Map<String, Account> prospectIdAccountMap = new Map<String, Account>();

		List<Account> updateMarketoIdInAccountList = new List<Account>();

		for(Account acct : (List<Account>)JSON.deserialize(serializedAccountList, List<Account>.class)){
			accountIdAccountMap.put(acct.Id, acct);
			if(String.isNotBlank(acct.Prospect_ID__c) && acct.Prospect_ID__c != '0'){
				prospectIdAccountMap.put(acct.Prospect_ID__c, acct);
			}
		}


		if(!prospectIdAccountMap.isEmpty()){
			List<String> prospectIdList = new List<String>();
			prospectIdList.addAll(prospectIdAccountMap.keySet());
			String jsonResponse = MarketoSyncService.getMultipleLeadsbyFilterType('GN_Prospect_ID', prospectIdList, new List<String>{'Client_ID', 'id', 'GN_Prospect_ID', 'email', 'salesforceAccountID', 'updatedAt', 'yOStatus'}, '');
			Map<String, Object> jsonResponseDeserialize = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);
			system.debug(jsonResponseDeserialize);
			List<Object> deserializeLeadResult = (List<Object>)jsonResponseDeserialize.get('result');
			system.debug(deserializeLeadResult);

			Map<Id, MarketoLeadScoreMatchWrapper> acctIdMarketoLeadScoreMap = new Map<Id, MarketoLeadScoreMatchWrapper>();
			for(Object eachLeadResult : deserializeLeadResult){
				Map<String, Object> eachLeadMap = (Map<String, Object>)eachLeadResult;
				Account acct = prospectIdAccountMap.get((String)eachLeadMap.get('GN_Prospect_ID'));
				Integer leadScore = 0;

				if(acct == null){
					continue;
				}

				if(eachLeadMap.get('salesforceAccountID') != null && (String)eachLeadMap.get('salesforceAccountID') != acct.Id && eachLeadMap.get('Client_ID') != null && String.valueof(eachLeadMap.get('Client_ID')) != acct.Client_ID__c && (String)eachLeadMap.get('yOStatus') == 'LIVE'){
					continue;
				}

				if(eachLeadMap.get('salesforceAccountID') != null && (String)eachLeadMap.get('salesforceAccountID') == acct.Id){
					leadScore += 5;
				}
				if(eachLeadMap.get('Client_ID') != null && String.valueof(eachLeadMap.get('Client_ID')) == acct.Client_ID__c){
					leadScore += 4;
				}
				if(eachLeadMap.get('email') != null && (String)eachLeadMap.get('email') == acct.Email__c){
					leadScore += 3;
				}
				if(eachLeadMap.get('Client_ID') == null && String.isBlank((String)eachLeadMap.get('salesforceAccountID'))){
					leadScore += 2;
				}
				if(eachLeadMap.get('yOStatus') == null || (String)eachLeadMap.get('yOStatus') == 'OFF'){
					leadScore += 1;
				}

				system.debug(leadScore);
				if(leadScore > 0){
					if(acctIdMarketoLeadScoreMap.containsKey(acct.Id)){
						if(leadScore > acctIdMarketoLeadScoreMap.get(acct.Id).matchScore){
							acctIdMarketoLeadScoreMap.get(acct.Id).matchScore = leadScore;
							acctIdMarketoLeadScoreMap.get(acct.Id).marketoLead = eachLeadResult;
						}
					}else{
						MarketoLeadScoreMatchWrapper mktLeadScore = new MarketoLeadScoreMatchWrapper();
						mktLeadScore.marketoLead = eachLeadResult;
						mktLeadScore.acct = acct;
						mktLeadScore.matchScore = leadScore;
						acctIdMarketoLeadScoreMap.put(acct.Id, mktLeadScore);
					}
				}

			}

			if(!acctIdMarketoLeadScoreMap.isEmpty()){
				List<Account> accountListSyncWithMarketoIdLookUp = new List<Account>();
				for(String mapKey : acctIdMarketoLeadScoreMap.keySet()){
					Map<String, Object> eachLeadMap = (Map<String, Object>)acctIdMarketoLeadScoreMap.get(mapKey).marketoLead;
					Account acct = acctIdMarketoLeadScoreMap.get(mapKey).acct;
					acct.Marketo_ID__c = String.valueof(eachLeadMap.get('id'));
					accountListSyncWithMarketoIdLookUp.add(acct);
					updateMarketoIdInAccountList.add(acct);
					accountIdAccountMap.remove(acct.Id);
				}


				MarketoSyncService.createUpdateLeads('', 'id', accountListSyncWithMarketoIdLookUp, false, '');
			}
		}

		if(!accountIdAccountMap.isEmpty()){
			Map<String, Account> emailAccountMap = new Map<String, Account>();
			for(Account acct : accountIdAccountMap.values()){
				if(String.isNotBlank(acct.Email__c)){
					emailAccountMap.put(acct.Email__c, acct);
				}
			}

			List<String> emailIdList = new List<String>();
			emailIdList.addAll(emailAccountMap.keySet());

			String jsonResponse = MarketoSyncService.getMultipleLeadsbyFilterType('email', emailIdList, new List<String>{'Client_ID', 'id', 'GN_Prospect_ID', 'email', 'salesforceAccountID', 'updatedAt', 'yOStatus'}, '');
			Map<String, Object> jsonResponseDeserialize = (Map<String, Object>)JSON.deserializeUntyped(jsonResponse);
			system.debug(jsonResponseDeserialize);
			List<Object> deserializeLeadResult = (List<Object>)jsonResponseDeserialize.get('result');
			system.debug(deserializeLeadResult);


			Map<Id, MarketoLeadScoreMatchWrapper> acctIdMarketoLeadScoreMap = new Map<Id, MarketoLeadScoreMatchWrapper>();
			for(Object eachLeadResult : deserializeLeadResult){
				Map<String, Object> eachLeadMap = (Map<String, Object>)eachLeadResult;
				Account acct = emailAccountMap.get((String)eachLeadMap.get('email'));
				Integer leadScore = 0;

				if(acct == null){
					continue;
				}

				if(eachLeadMap.get('salesforceAccountID') != null && (String)eachLeadMap.get('salesforceAccountID') != acct.Id && eachLeadMap.get('Client_ID') != null && String.valueof(eachLeadMap.get('Client_ID')) != acct.Client_ID__c && (String)eachLeadMap.get('yOStatus') == 'LIVE'){
					continue;
				}

				if(eachLeadMap.get('salesforceAccountID') != null && (String)eachLeadMap.get('salesforceAccountID') == acct.Id){
					leadScore += 5;
				}
				if(eachLeadMap.get('Client_ID') != null && String.valueof(eachLeadMap.get('Client_ID')) == acct.Client_ID__c){
					leadScore += 4;
				}
				if(eachLeadMap.get('GN_Prospect_ID') != null && (String)eachLeadMap.get('GN_Prospect_ID') == acct.Prospect_ID__c){
					leadScore += 3;
				}
				if(eachLeadMap.get('Client_ID') == null && String.isBlank((String)eachLeadMap.get('salesforceAccountID'))){
					leadScore += 2;
				}
				if(eachLeadMap.get('yOStatus') == null || (String)eachLeadMap.get('yOStatus') == 'OFF'){
					leadScore += 1;
				}

				system.debug(leadScore);
				if(leadScore > 0){
					if(acctIdMarketoLeadScoreMap.containsKey(acct.Id)){
						if(leadScore > acctIdMarketoLeadScoreMap.get(acct.Id).matchScore){
							acctIdMarketoLeadScoreMap.get(acct.Id).matchScore = leadScore;
							acctIdMarketoLeadScoreMap.get(acct.Id).marketoLead = eachLeadResult;
						}
					}else{
						MarketoLeadScoreMatchWrapper mktLeadScore = new MarketoLeadScoreMatchWrapper();
						mktLeadScore.marketoLead = eachLeadResult;
						mktLeadScore.acct = acct;
						mktLeadScore.matchScore = leadScore;
						acctIdMarketoLeadScoreMap.put(acct.Id, mktLeadScore);
					}
				}
			}

			if(!acctIdMarketoLeadScoreMap.isEmpty()){
				List<Account> accountListSyncWithMarketoIdLookUp = new List<Account>();
				for(String mapKey : acctIdMarketoLeadScoreMap.keySet()){
					Map<String, Object> eachLeadMap = (Map<String, Object>)acctIdMarketoLeadScoreMap.get(mapKey).marketoLead;
					Account acct = acctIdMarketoLeadScoreMap.get(mapKey).acct;
					acct.Marketo_ID__c = String.valueof(eachLeadMap.get('id'));
					accountListSyncWithMarketoIdLookUp.add(acct);
					updateMarketoIdInAccountList.add(acct);
					accountIdAccountMap.remove(acct.Id);
				}

				MarketoSyncService.createUpdateLeads('', 'id', accountListSyncWithMarketoIdLookUp, false, '');
			}
		}

		if(!accountIdAccountMap.isEmpty()){
			MarketoSyncService.createUpdateLeads('createDuplicate', '', accountIdAccountMap.values(), false, '');
		}

		if(!updateMarketoIdInAccountList.isEmpty()){
			List<Account> updateAccountList = new List<Account>();
			List<Account> clearMKTIdList = new List<Account>();

			Database.SaveResult[] srList = Database.update(updateMarketoIdInAccountList, false);
			for(Integer i = 0; i < srList.size(); i++) {
				Database.SaveResult sr = srList[i];
				Account acct = updateMarketoIdInAccountList[i];
				if (sr.isSuccess()) {
					// Operation was successful, so get the ID of the record that was processed
					System.debug('Successfully inserted account. Account ID: ' + sr.getId());
				}else{
					// Operation failed, so get all errors                
					for(Database.Error err : sr.getErrors()) {
						if(err.getMessage().containsIgnoreCase('duplicate value found: Marketo_ID__c')){
							updateAccountList.add(acct);

							Account clearMKTId = new Account();
							clearMKTId.Id = err.getMessage().split('duplicates value on record with id: ')[1];
							clearMKTId.Marketo_ID__c = '';
							clearMKTIdList.add(clearMKTId);
						}
						system.debug(acct.Id);
						System.debug('The following error has occurred.');                    
						System.debug(err.getStatusCode() + ' | ' + err.getMessage());
						List<String> stringList = err.getMessage().split('duplicates value on record with id: ');
						system.debug(stringList[1]);
						System.debug('Account fields that affected this error: ' + err.getFields());
					}
				}
			}

			if(!clearMKTIdList.isEmpty()){
				update clearMKTIdList;
			}
			if(!updateAccountList.isEmpty()){
				update updateAccountList;
			}
		}
	}

	private class MarketoLeadScoreMatchWrapper {
		private Object marketoLead;
		private Integer matchScore;
		private Account acct;

		private MarketoLeadScoreMatchWrapper(){
			this.matchScore = 0;
		}
	}
	
}