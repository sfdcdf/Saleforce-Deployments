public without sharing class OnDemandSF2MarketoRecordSyncController {
	private String query;
    private Id recordId;
    private String objectType;

    public String marketoResponse {get; set;}

	public OnDemandSF2MarketoRecordSyncController() {
		recordId = ApexPages.currentPage().getParameters().get('recordId');
        objectType = ApexPages.currentPage().getParameters().get('objectType');

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
				query = 'select ' + String.join(caseFieldForQueryList, ', ') + ' from Case where Id = :recordId and Account.Marketo_ID__c != \'\' and Sync_to_Marketo__c = true';
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
				query = 'select ' + String.join(accountFieldForQueryList, ', ') + ' from Account where Id = :recordId and Marketo_ID__c != \'\' and Sync_to_Marketo__c = true';
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
				query = 'select ' + String.join(caseFieldForQueryList, ', ') + ' from Organic_Analysis__c where Id = :recordId and Account_Name__r.Marketo_ID__c != \'\' and Sync_to_Marketo__c = true';
			}
        }

        List<sObject> queryReturn = Database.query(query);

        if(objectType.equalsIgnoreCase('Case') && !queryReturn.isEmpty()){
			marketoResponse = CaseObjectHelper.caseUpdateLeadsNotFuture('', '', JSON.serialize((List<Case>)queryReturn), false, '');
		}else if(objectType.equalsIgnoreCase('Account') && !queryReturn.isEmpty()){
			marketoResponse = MarketoSyncService.createUpdateLeads('updateOnly', 'id', (List<Account>)queryReturn, false, '');
		}else if(objectType.equalsIgnoreCase('Organic_Analysis__c') && !queryReturn.isEmpty()){
			marketoResponse = OrganicCaseObjectHelper.organicCaseUpdateLeadsNotFuture('', '', JSON.serialize((List<Organic_Analysis__c>)queryReturn), false, '');
		}
	}
}