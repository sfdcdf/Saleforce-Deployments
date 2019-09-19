public with sharing class MDFRequestHistoryController {
	public List<Partner_Marketing_Development_Fund__c> pmdfHistoryList {get; set;}
	public Partner_Marketing_Development_Fund__c pmdfSelected {get; set;}
	public String selectedOrderBy {get; set;}

	private String clientAccountId;

	private static User currentUser = [select Id, UserRoleId, IsPortalEnabled, AccountId from User where Id =: UserInfo.getUserId()];

	public MDFRequestHistoryController() {
		pmdfSelected = new Partner_Marketing_Development_Fund__c();
		selectedOrderBy = 'MDF_Date_Submitted__c DESC';
		populateHistoryList();
		if(String.isNotBlank(ApexPages.currentPage().getParameters().get('initialSelectedId'))){
			pmdfSelected = [select Id, Name, MDF_Status__c, Claimed_By__c, Date_of_Activity__c, Total_Cost_of_Activity__c, Claim_Notes__c from Partner_Marketing_Development_Fund__c where Id =: ApexPages.currentPage().getParameters().get('initialSelectedId') and Partner_Account__c =: clientAccountId];
		}
	}

	public void populateHistoryList(){
		if(String.isNotBlank(currentUser.AccountId)){
			clientAccountId = currentUser.AccountId;
		}else if(String.isNotBlank(ApexPages.currentPage().getParameters().get('clientAccountId'))){
			clientAccountId = ApexPages.currentPage().getParameters().get('clientAccountId');
		}

		pmdfHistoryList = new List<Partner_Marketing_Development_Fund__c>();

		for(Partner_Marketing_Development_Fund__c record : Database.query('select Id, Name, Total_Cost_of_Activity__c, MDF_Status__c, Requested_By__c, Type_of_Activity__c, What_is_the_goal_of_the_activity__c, When_will_the_activity_happen__c, MDF_Date_Submitted__c, Estimated_Cost_of_Activity__c, Other_Activity__c from Partner_Marketing_Development_Fund__c where Partner_Account__c = :clientAccountId order by ' +  selectedOrderBy)){
			pmdfHistoryList.add(record);
		}
	}

	public void selectedPMDF(){
		String pmdfSelectedId = ApexPages.currentPage().getParameters().get('pmdfSelectedId');
		if(String.isNotBlank(pmdfSelectedId)){
			pmdfSelected = [select Id, Name, MDF_Status__c, Claimed_By__c, Date_of_Activity__c, Total_Cost_of_Activity__c, Claim_Notes__c from Partner_Marketing_Development_Fund__c where Id =: pmdfSelectedId and Partner_Account__c =: clientAccountId];
		}else{
			pmdfSelected = new Partner_Marketing_Development_Fund__c();
		}
	}

	public void refreshData(){
		populateHistoryList();
	}

	public List<SelectOption> getOrderByList() {
 	 	List<SelectOption> options = new List<SelectOption>();
 	 	options.add(new SelectOption('MDF_Date_Submitted__c ASC','MDF Date Submitted ASC'));
 	 	options.add(new SelectOption('MDF_Date_Submitted__c DESC','MDF Date Submitted DESC'));
 	 	options.add(new SelectOption('Name ASC','Partner Marketing Development Fund Number ASC'));
 	 	options.add(new SelectOption('Name DESC','Partner Marketing Development Fund Number DESC'));
 	 	options.add(new SelectOption('MDF_Status__c ASC','MDF Status ASC'));
 	 	options.add(new SelectOption('MDF_Status__c DESC','MDF Status DESC'));
 	 	options.add(new SelectOption('Estimated_Cost_of_Activity__c ASC','Estimated Cost of Activity ASC'));
 	 	options.add(new SelectOption('Estimated_Cost_of_Activity__c DESC','Estimated Cost of Activity DESC'));
 	 	options.add(new SelectOption('Total_Cost_of_Activity__c ASC','Total Cost of Activity ASC'));
 	 	options.add(new SelectOption('Total_Cost_of_Activity__c DESC','Total Cost of Activity DESC'));
 	 	options.add(new SelectOption('Type_of_Activity__c ASC','Type of Activity ASC'));
 	 	options.add(new SelectOption('Type_of_Activity__c DESC','Type of Activity DESC'));
 	 	return options;
  	}
}