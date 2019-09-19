public class CriteriaBasedBatchDataPushToMarketo implements Database.Batchable<sObject>, Database.AllowsCallouts {
	
	private String query;
    private List<Id> recordIdList;
    private String objectType;
	
	public CriteriaBasedBatchDataPushToMarketo(List<Id> passedRecordIdList, String passedObjectType) {
        recordIdList = passedRecordIdList;
        objectType = passedObjectType;

        if(objectType.equalsIgnoreCase('Case')){
        	Set<String> caseFieldForQuerySet = new Set<String>();
			for(SFDC_Case_to_Marketo_Field_Mappings__c sfdcCaseMarketoFieldMap : SFDC_Case_to_Marketo_Field_Mappings__c.getAll().values()){
				if(sfdcCaseMarketoFieldMap.Sync_Field__c){
					caseFieldForQuerySet.add(sfdcCaseMarketoFieldMap.SFDC_Field_API_Name__c.toUpperCase());
				}
			}
			if(!caseFieldForQuerySet.isEmpty()){
				caseFieldForQuerySet.add('REASON');
				caseFieldForQuerySet.add('ACCOUNTID');
				caseFieldForQuerySet.add('RECORDTYPEID');
				List<String> caseFieldForQueryList = new List<String>();
				caseFieldForQueryList.addAll(caseFieldForQuerySet);
				query = 'select ' + String.join(caseFieldForQueryList, ', ') + ' from Case where Id in :recordIdList and Account.Marketo_ID__c != \'\' and Sync_to_Marketo__c = true';
			}
        }else if(objectType.equalsIgnoreCase('Account')){
        	Set<String> accountFieldForQuerySet = new Set<String>();
			for(SFDC_Account_to_Marketo_Field_Mappings__c sfdcAcctMarketoFieldMap : SFDC_Account_to_Marketo_Field_Mappings__c.getAll().values()){
				if(sfdcAcctMarketoFieldMap.Sync_Field__c){
					accountFieldForQuerySet.add(sfdcAcctMarketoFieldMap.SFDC_Field_API_Name__c.toUpperCase());
				}
			}
			if(!accountFieldForQuerySet.isEmpty()){
				accountFieldForQuerySet.add('MARKETO_ID__C');
				accountFieldForQuerySet.add('ID');
				accountFieldForQuerySet.add('RECORDTYPEID');
				List<String> accountFieldForQueryList = new List<String>();
				accountFieldForQueryList.addAll(accountFieldForQuerySet);
				query = 'select ' + String.join(accountFieldForQueryList, ', ') + ' from Account where Id in :recordIdList and Marketo_ID__c != \'\' and Sync_to_Marketo__c = true';
			}
        }else if(objectType.equalsIgnoreCase('Organic_Analysis__c')){
        	Set<String> caseFieldForQuerySet = new Set<String>();
			for(SFDC_Org_Case_to_Marketo_Field_Mappings__c sfdcOrganicCaseMarketoFieldMap : SFDC_Org_Case_to_Marketo_Field_Mappings__c.getAll().values()){
				if(sfdcOrganicCaseMarketoFieldMap.Sync_Field__c){
					caseFieldForQuerySet.add(sfdcOrganicCaseMarketoFieldMap.SFDC_Field_API_Name__c.toUpperCase());
				}
			}
			if(!caseFieldForQuerySet.isEmpty()){
				caseFieldForQuerySet.add('ACCOUNT_NAME__C');
				caseFieldForQuerySet.add('RECORDTYPEID');
				List<String> caseFieldForQueryList = new List<String>();
				caseFieldForQueryList.addAll(caseFieldForQuerySet);
				query = 'select ' + String.join(caseFieldForQueryList, ', ') + ' from Organic_Analysis__c where Id in :recordIdList and Account_Name__r.Marketo_ID__c != \'\' and Sync_to_Marketo__c = true';
			}
        }
        //query = passedQuery;
	}
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
		if(objectType.equalsIgnoreCase('Case') && !scope.isEmpty()){
			CaseObjectHelper.caseUpdateLeadsNotFuture('', '', JSON.serialize((List<Case>)scope), false, '');
		}else if(objectType.equalsIgnoreCase('Account') && !scope.isEmpty()){
			MarketoSyncService.createUpdateLeads('updateOnly', 'id', (List<Account>)scope, false, '');
		}else if(objectType.equalsIgnoreCase('Organic_Analysis__c') && !scope.isEmpty()){
			OrganicCaseObjectHelper.organicCaseUpdateLeadsNotFuture('', '', JSON.serialize((List<Organic_Analysis__c>)scope), false, '');
		}
	}
	
	public void finish(Database.BatchableContext BC) {
		
	}
	
}