public with sharing class MDFRequestFormController {
	public Partner_Marketing_Development_Fund__c pmdf {get; set;}

	private User currentUser;

	public MDFRequestFormController() {
		pmdf = new Partner_Marketing_Development_Fund__c();

		if(UserInfo.getUserType() == 'Standard'){
			currentUser = [select Id, Name, AccountId, IsPortalEnabled from User where Id =: UserInfo.getUserId()];
		}else{
			currentUser = [select Id, Name, AccountId, IsPortalEnabled, Account.Name, ContactId, Contact.Name, Account.OwnerId from User where Id =: UserInfo.getUserId()];
		}

		if(String.isNotBlank(currentUser.AccountId)){
			pmdf.Partner_Account__c = currentUser.AccountId;
			pmdf.OwnerId = currentUser.Account.OwnerId;
		}else if(String.isNotBlank(ApexPages.currentPage().getParameters().get('clientAccountId'))){
			pmdf.Partner_Account__c = ApexPages.currentPage().getParameters().get('clientAccountId');
			pmdf.OwnerId = [select OwnerId from Account where Id = :ApexPages.currentPage().getParameters().get('clientAccountId')].OwnerId;
		}
		pmdf.Requested_By__c = currentUser.Id;
		pmdf.MDF_Date_Submitted__c = Date.today();
	}

	public void refreshRerender(){

	}

	public PageReference submitMDFRequestForm(){
		try{
			insert pmdf;

			PageReference pageRef = Page.PartnerMarketingDevelopmentFundsTab;
			pageRef.getParameters().put('selectedTab', 'name3');
			pageRef.getParameters().put('initialSelectedId', pmdf.Id);
			pageRef.setRedirect(true);
			return pageRef;
		}catch(Exception E){
			return null;
		}
	}
}