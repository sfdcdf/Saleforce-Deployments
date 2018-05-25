public without sharing class MDFRequestStatusAndClaimFormController {
	public List<Partner_Marketing_Development_Fund__c> pmdfStatusList {get; set;}
	public List<Partner_Marketing_Development_Fund__c> pmdfClaimList {get; set;}
	public Partner_Marketing_Development_Fund__c pmdfSelected {get; set;}
	public Partner_Quarterly_Managed_Account_Count__c pqmacLastQuarter {get; set;}
	public Partner_MDF_Quarterly_Budget_Setting__mdt pmdfQuarterlyBudgetSetting {get; set;}
	public Integer currentRequestTotal {get; set;}

	private static List<Partner_MDF_Quarterly_Budget_Setting__mdt> mdfQuarterlyBudgetSettingList = PartnerMDFQuarterlyBudgetSettingsHelper.retrieveMDFQuarterlyBudgetSettingsList();
	private static Period currentQuarterPeriod = [Select StartDate, EndDate From Period Where type = 'Quarter' and StartDate = THIS_FISCAL_QUARTER];
	private static Period lastQuarterDate = [Select StartDate, EndDate From Period Where type = 'Quarter' and StartDate = LAST_FISCAL_QUARTER];
	private static User currentUser = [select Id, UserRoleId, IsPortalEnabled, AccountId from User where Id =: UserInfo.getUserId()];

	private String clientAccountId;

	public MDFRequestStatusAndClaimFormController() {
		if(String.isNotBlank(currentUser.AccountId)){
			clientAccountId = currentUser.AccountId;
		}else if(String.isNotBlank(ApexPages.currentPage().getParameters().get('clientAccountId'))){
			clientAccountId = ApexPages.currentPage().getParameters().get('clientAccountId');
		}

		currentRequestTotal = 0;
		populateClaimList();
		populateStatusList();
		pmdfSelected = new Partner_Marketing_Development_Fund__c();
		pqmacLastQuarter = new Partner_Quarterly_Managed_Account_Count__c();
		pmdfQuarterlyBudgetSetting = new Partner_MDF_Quarterly_Budget_Setting__mdt();


		if(String.isNotBlank(ApexPages.currentPage().getParameters().get('initialSelectedId'))){
			pmdfSelected = [select Id, Name, MDF_Status__c, Claimed_By__c, Date_of_Activity__c, Total_Cost_of_Activity__c, Claim_Notes__c from Partner_Marketing_Development_Fund__c where Id =: ApexPages.currentPage().getParameters().get('initialSelectedId') and Partner_Account__c =: clientAccountId];
		}
		for(Partner_Quarterly_Managed_Account_Count__c pqmac : [select Id, End_of_Quarter_Date__c, Parent_Account__c, Child_Accounts_End_of_Quarter_Count__c, (select Id, Child_Account__c, Child_Account__r.Name, Child_Account__r.Phone, Child_Account__r.Order_Date__c, Child_Account__r.Live_Date__c, Child_Account__r.Status__c from Partner_Quarterly_Managed_Child_Accounts__r order by Child_Account__r.Name) from Partner_Quarterly_Managed_Account_Count__c where Parent_Account__c =: clientAccountId and End_of_Quarter_Date__c =: lastQuarterDate.EndDate]){
			pqmacLastQuarter = pqmac;
		}
		for(Partner_MDF_Quarterly_Budget_Setting__mdt pmdfqbs : mdfQuarterlyBudgetSettingList){
			if(pqmacLastQuarter.Child_Accounts_End_of_Quarter_Count__c >= pmdfqbs.Minimum_Managed_Accounts__c){
				pmdfQuarterlyBudgetSetting = pmdfqbs;
				break;
			}
		}

	}

	public void populateStatusList(){
		pmdfStatusList = new List<Partner_Marketing_Development_Fund__c>();

		for(Partner_Marketing_Development_Fund__c record : [select Id, Name, MDF_Status__c, Total_Cost_of_Activity__c, Requested_By__c, Type_of_Activity__c, What_is_the_goal_of_the_activity__c, When_will_the_activity_happen__c, MDF_Date_Submitted__c, Estimated_Cost_of_Activity__c, Other_Activity__c from Partner_Marketing_Development_Fund__c where MDF_Date_Submitted__c >=: currentQuarterPeriod.StartDate and Id not in :pmdfClaimList and Partner_Account__c =: clientAccountId order by MDF_Date_Submitted__c]){
			pmdfStatusList.add(record);
			if(record.MDF_Status__c != 'Request Denied' && record.MDF_Status__c != 'Request Expired'){
				currentRequestTotal += (record.Total_Cost_of_Activity__c != null) ? (Integer)record.Total_Cost_of_Activity__c : (Integer)record.Estimated_Cost_of_Activity__c;
			}
		}
	}

	public void populateClaimList(){
		pmdfClaimList = new List<Partner_Marketing_Development_Fund__c>();

		for(Partner_Marketing_Development_Fund__c record : [select Id, Name, MDF_Status__c, Total_Cost_of_Activity__c, Requested_By__c, Type_of_Activity__c, What_is_the_goal_of_the_activity__c, When_will_the_activity_happen__c, MDF_Date_Submitted__c, Estimated_Cost_of_Activity__c, Other_Activity__c from Partner_Marketing_Development_Fund__c where MDF_Status__c = 'Request Approved' and Partner_Account__c =: clientAccountId order by MDF_Date_Submitted__c]){
			pmdfClaimList.add(record);
			if(record.MDF_Status__c != 'Request Denied' && record.MDF_Status__c != 'Request Expired'){
				currentRequestTotal += (record.Total_Cost_of_Activity__c != null) ? (Integer)record.Total_Cost_of_Activity__c : (Integer)record.Estimated_Cost_of_Activity__c;
			}
		}
	}

	public void refreshData(){
		currentRequestTotal = 0;
		populateClaimList();
		populateStatusList();
		//pmdfSelected = new Partner_Marketing_Development_Fund__c();
	}

	public void selectedPMDF(){
		String pmdfSelectedId = ApexPages.currentPage().getParameters().get('pmdfSelectedId');

		if(String.isNotBlank(pmdfSelectedId)){
			pmdfSelected = [select Id, Name, MDF_Status__c, Claimed_By__c, Date_of_Activity__c, Total_Cost_of_Activity__c, Claim_Notes__c from Partner_Marketing_Development_Fund__c where Id =: pmdfSelectedId and Partner_Account__c =: clientAccountId];
		}else{
			pmdfSelected = new Partner_Marketing_Development_Fund__c();
		}
	
		if(String.isBlank(pmdfSelected.Claimed_By__c) && pmdfSelected.MDF_Status__c == 'Request Approved'){
			pmdfSelected.Claimed_By__c = UserInfo.getUserId();
		}
	}

	public void saveClaimForm(){
		try{
			pmdfSelected.MDF_Status__c = 'Claim Submitted';
			update pmdfSelected;
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Please make sure to attach all proof of activity to speed up the claim process!');
	        ApexPages.addMessage(myMsg);
        }catch(Exception E){

        }
	}

	public PageReference attachFile(){
		String retUrlValue = '/LighthouseDental/apex/PartnerMarketingDevelopmentFundsTab?selectedTab=name3&initialSelectedId=' + pmdfSelected.Id;
		PageReference pageRef = new PageReference('/LighthouseDental/p/attach/NoteAttach?pid=' + pmdfSelected.Id + '&parentname=' + pmdfSelected.Name);
		pageRef.getParameters().put('retURL', retUrlValue);
		pageRef.setRedirect(true);
		
		return pageRef;
	}
}