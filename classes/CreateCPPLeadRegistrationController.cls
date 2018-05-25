public with sharing class CreateCPPLeadRegistrationController {
	public CPP_Lead_Registration__c registerLead {get; set;}
	private ApexPages.StandardController sController;

	public CreateCPPLeadRegistrationController(ApexPages.StandardController stdController) {
		sController = stdController;
		registerLead = (CPP_Lead_Registration__c)stdController.getRecord();
		User currentUser = [select Id, AccountId from User where Id = :UserInfo.getUserId()];
		if(String.isNotBlank(currentUser.AccountId)){
			registerLead.Partner_Account__c = currentUser.AccountId;
			registerLead.Submitted_By__c = [select ContactId from User where Id =: UserInfo.getUserId()].ContactId;
		}
		registerLead.Date_Submitted__c = Date.today();
	}

	public PageReference saveAndNew(){
		try{
			sController.save();
			Schema.DescribeSObjectResult describeResult = sController.getRecord().getSObjectType().getDescribe();

			PageReference pr = new PageReference('/' + describeResult.getKeyPrefix() + '/e?');  
            // Don't redirect with the viewstate of the current record.  
            pr.setRedirect(true);  
            return pr;
		}catch(Exception E){
			ApexPages.addMessages(e);
			return null;
		}
	}
}