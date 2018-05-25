public class CaseAutomateCSCBatch implements Database.Batchable<sObject>, Database.Stateful {
	
	private final Set<Id> ncsRecordTypeIdSet = new Set<Id>{Schema.SObjectType.Case.getRecordTypeInfosByName().get('NCS - AutoLaunch').getRecordTypeId(), Schema.SObjectType.Case.getRecordTypeInfosByName().get('Partner - New Client Setup').getRecordTypeId()};
	private final Set<String> fieldServiceProductTypeSet = new Set<String>{'Lighthouse Field Service', 'Lighthouse Field Service Pro'};
	private final Set<String> excludedProductTypeSet = new Set<String>{'Lighthouse', 'YBN'};
	private final Set<String> torchxProductTypeSet = new Set<String>{'TORCHx', 'TORCHx Ads'};
	private final Id kyleZaffinId = [select Id from User where Name = 'Kyle Zaffin' and IsActive = true limit 1].Id;

	private List<Id> caseIdList = new List<Id>();

	private static String query = 'select Id, Created_Outbound_Call_Case__c, X3_Day_Approval__c, Next_Scheduled_Call__c, Sales_Notes__c, Winback_CSC_Script__c, Channel_Type__c, '
		+ 'MA_Notes__c, Budget__c, Website_Type2__c, AccountId, Account.Product_Type_Transactional__c '
		+ 'from Case where ((Product_Type__c in :torchxProductTypeSet and RecordTypeId in :ncsRecordTypeIdSet) or (Product_Type__c in :fieldServiceProductTypeSet and RecordTypeId in :ncsRecordTypeIdSet) or '
		+ '((NOT Product_Type__c like \'%Lighthouse%\') and (NOT Product_Type__c like \'%YBN%\') '
		+ 'and IMS_Rep__c != :kyleZaffinId and Client_Type__c != \'YBN\' '
		+ 'and ((RecordType.Name = \'NCS - AutoLaunch\' and Partner_Account4__c = \'\' and Total_Acct_Revenue__c < 1750) or '
		+ '(Partner_Account4__c = \'Rogers\' and RecordTypeId in :ncsRecordTypeIdSet and Total_Acct_Revenue__c < 600) or '
		+ '(Partner_Account4__c = \'Rogers\' and IMS_Rep__c = \'\' and RecordTypeId in :ncsRecordTypeIdSet)))) '
		+ 'and IsClosed = false and SystemModStamp >= LAST_N_DAYS:2 and Next_Scheduled_Call__c > TODAY';
	
	public CaseAutomateCSCBatch() {
		
	}
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		system.debug(query);
		return Database.getQueryLocator(query);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
   		Date june202016Date = Date.newInstance(2016, 6, 21);
   		Map<Id, Account> idAccountMap = new Map<Id, Account>([select Id, Product_Type_Transactional__c, Channel_Development__c, (select Id, RecordType.Name, Reason, Scheduled_Call__c from Cases where RecordType.Name = 'Outbound Call' and Reason = 'CSC' and IsClosed = false) from Account where Id in (select AccountId from Case where Id in : scope)]);
		
		List<Case> upsertCaseList = new List<Case>();

		for(Case cs : (List<Case>)scope){
			Case ncsCase = new Case();
			if(idAccountMap.containsKey(cs.AccountId) && !idAccountMap.get(cs.AccountId).Cases.isEmpty() && idAccountMap.get(cs.AccountId).Cases[0].Scheduled_Call__c < june202016Date){
				continue;
			}

			if(cs.Created_Outbound_Call_Case__c && idAccountMap.containsKey(cs.AccountId) && !idAccountMap.get(cs.AccountId).Cases.isEmpty()){
				ncsCase.Id = idAccountMap.get(cs.AccountId).Cases[0].Id;
			}else{
				ncsCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
				ncsCase.Reason = 'CSC';
				ncsCase.AccountId = cs.AccountId;
				ncsCase.OwnerId = '00G60000001kigl';
				ncsCase.Scheduled_Call__c = cs.Next_Scheduled_Call__c;
				if(!cs.Created_Outbound_Call_Case__c){
					cs.Created_Outbound_Call_Case__c = true;
					upsertCaseList.add(cs);
				}
			}

			ncsCase.X3_Day_Approval__c = cs.X3_Day_Approval__c;
			/*if(cs.Next_Scheduled_Call__c != null){
				ncsCase.Scheduled_Call__c = cs.Next_Scheduled_Call__c;
			}*/
				
			ncsCase.Sales_Notes__c = cs.Sales_Notes__c;
			
			ncsCase.Winback_CSC_Script__c = cs.Winback_CSC_Script__c;
			ncsCase.Channel_Type__c = (cs.Channel_Type__c == 'Transactional') ? 'Local' : cs.Channel_Type__c;
			if(ncsCase.Channel_Type__c == 'Local' && cs.Account.Product_Type_Transactional__c == 'Lighthouse Field Service'){
				ncsCase.Channel_Type__c = 'Lighthouse';
			}
			ncsCase.MA_Notes__c = cs.MA_Notes__c;
			ncsCase.Budget__c = cs.Budget__c;
			ncsCase.Website_Type2__c = cs.Website_Type2__c;
			upsertCaseList.add(ncsCase);
		}

		//upsert upsertCaseList;
		Database.UpsertResult[] upsertResult = Database.upsert(upsertCaseList, false);

		List<DebugInfo__c> debugInfoList = new List<DebugInfo__c>();

		List<DebugDataWrapper> ddwResponseList = new List<DebugDataWrapper>();

		for(Integer i = 0; i < upsertCaseList.size(); i++){
			DebugDataWrapper ddw = new DebugDataWrapper();
			ddw.resultLog = upsertResult[i];
			ddw.payloadLog = upsertCaseList[i];
			ddwResponseList.add(ddw);

			if(upsertResult[i].isSuccess()){
				caseIdList.add(upsertResult[i].getId());
			}

			if(!upsertResult[i].isSuccess()){
				DebugInfo__c di = new DebugInfo__c();
				di.DebugData__c = JSON.serializePretty(ddw);
				debugInfoList.add(di);
			}
		}
		insert debugInfoList;
	}
	
	public void finish(Database.BatchableContext BC) {
		system.debug(caseIdList);
		if(!caseIdList.isEmpty() && !Test.isRunningTest()){
			Database.executeBatch(new CriteriaBasedBatchDataPushToMarketo(caseIdList, 'Case'), 50);
		}
	}

	private class DebugDataWrapper{
    	private Object resultLog;
    	private Object payloadLog;
    }
	
}

//2016-06-13T22:04:46.000+0000