trigger WorksheetsTrigger on Worksheets__c (before insert, after insert, after update) {

	Id mlsWorksheetRecordTypeId = Worksheets__c.sObjectType.getDescribe().getRecordTypeInfosByName().get('MLS Worksheet').getRecordTypeId();

	if(trigger.isBefore){
		if(trigger.isInsert){
			Set<Id> accountIdSet = new Set<Id>();

			for(Worksheets__c record : trigger.New){
				if(String.isNotBlank(record.Account_Name__c) && record.RecordTypeId.equals(mlsWorksheetRecordTypeId)){
					accountIdSet.add(record.Account_Name__c);
				}
			}

			for(Account acct : [select Id, (select Id from Account_MLS_s__r where MLS_Worksheet__c = null) from Account where Id in :accountIdSet]){
				if(!acct.Account_MLS_s__r.isEmpty()){
					accountIdSet.remove(acct.Id);
				}
			}

			for(Worksheets__c record : trigger.New){
				if(String.isNotBlank(record.Account_Name__c) && record.RecordTypeId.equals(mlsWorksheetRecordTypeId) && accountIdSet.contains(record.Account_Name__c)){
					record.addError(Label.AccountMLSNeededByMLSWorksheetError);
				}
			}
		}
	}else if(trigger.isAfter){
		Set<Id> ncsCaseMLSCompleteIdSet = new Set<Id>();

		if(trigger.isInsert){
			Set<Id> ncsCaseIdSet = new Set<Id>();
			Map<Id, Id> accountIdMLSWKId = new Map<Id, Id>();

			for(Worksheets__c record : trigger.New){
				if(String.isNotBlank(record.Status__c) && String.isNotBlank(record.Parent_Case__c) && record.RecordTypeId.equals(mlsWorksheetRecordTypeId) && !record.Status__c.equalsIgnoreCase('Complete')){
					ncsCaseIdSet.add(record.Parent_Case__c);
				}else if(String.isNotBlank(record.Status__c) && String.isNotBlank(record.Parent_Case__c) && record.RecordTypeId.equals(mlsWorksheetRecordTypeId) && record.Status__c.equalsIgnoreCase('Complete')){
					ncsCaseMLSCompleteIdSet.add(record.Parent_Case__c);
				}

				if(String.isNotBlank(record.Account_Name__c) && record.RecordTypeId.equals(mlsWorksheetRecordTypeId)){
					accountIdMLSWKId.put(record.Account_Name__c, record.Id);
				}
			}

			if(!ncsCaseIdSet.isEmpty()){
				List<Case> updateCaseList = new List<Case>();
				for(Case record : [select Id, Sub_Status__c from Case where /*RecordType.Name = 'NCS - AutoLaunch' and*/ Id in : ncsCaseIdSet]){
					record.Sub_Status__c = 'MLS Setup';
					updateCaseList.add(record);
				}

				if(!updateCaseList.isEmpty()){
					update updateCaseList;
				}
			}

			if(!accountIdMLSWKId.isEmpty()){
				List<Account_MLS__c> updateAccountMLSList = new List<Account_MLS__c>();
				for(Account_MLS__c acctMLS : [select Account__c, MLS_Worksheet__c from Account_MLS__c where Account__c in : accountIdMLSWKId.keySet() and MLS_Worksheet__c = null]){
					acctMLS.MLS_Worksheet__c = accountIdMLSWKId.get(acctMLS.Account__c);
					updateAccountMLSList.add(acctMLS);
				}

				if(!updateAccountMLSList.isEmpty()){
					update updateAccountMLSList;
				}
			}

		}else if(trigger.isUpdate){
			for(Worksheets__c record : trigger.New){
				Worksheets__c oldRecord = trigger.oldMap.get(record.Id);
				if(String.isNotBlank(record.Status__c) && String.isNotBlank(record.Parent_Case__c) && record.RecordTypeId.equals(mlsWorksheetRecordTypeId) && record.Status__c.equalsIgnoreCase('Complete') && record.Status__c != oldRecord.Status__c){
					ncsCaseMLSCompleteIdSet.add(record.Parent_Case__c);
				}
			}
		}

		if(!ncsCaseMLSCompleteIdSet.isEmpty()){
			List<Case> updateCaseList = new List<Case>();
			for(Case record : [select Id, Sub_Status__c from Case where /*RecordType.Name = 'NCS - AutoLaunch' and*/ Id in : ncsCaseMLSCompleteIdSet]){
				record.Sub_Status__c = 'Site Build';
				updateCaseList.add(record);
			}

			if(!updateCaseList.isEmpty()){
				update updateCaseList;
			}
		}

	}

}