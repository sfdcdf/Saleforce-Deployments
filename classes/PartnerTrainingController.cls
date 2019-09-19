public without sharing class PartnerTrainingController {
	public Partner_Community_HTML__c htmlInfo {get; set;}
	
	public PartnerTrainingController() {
		htmlInfo = [select Id, Name, HTML__c, Field_Bindings__c from Partner_Community_HTML__c where Name = 'LighthouseTraining' and Active__c = true limit 1];

		User currentUser = [select Id, Name, AccountId, IsPortalEnabled, Account.Partner_Score__c from User where Id =: UserInfo.getUserId()];

		if(currentUser.IsPortalEnabled && String.isNotBlank(currentUser.AccountId)){
			currentUser = [select Id, Name, AccountId, Account.OwnerId, IsPortalEnabled, ContactId, Account.Partner_Score__c from User where Id =: UserInfo.getUserId()];

			User acctOwner = [select Id, Name, Title, Phone, Email from User where Id =: currentUser.Account.OwnerId];
			system.debug(acctOwner);
			htmlInfo.HTML__c = htmlInfo.HTML__c.replace('{Owner.Name}', acctOwner.Name);
			if(String.isNotBlank(acctOwner.Title)){
				htmlInfo.HTML__c = htmlInfo.HTML__c.replace('{Owner.Title}', acctOwner.Title);
			}
			if(String.isNotBlank(acctOwner.Phone)){
				htmlInfo.HTML__c = htmlInfo.HTML__c.replace('{Owner.Phone}', acctOwner.Phone);
			}
			if(String.isNotBlank(acctOwner.Email)){
				htmlInfo.HTML__c = htmlInfo.HTML__c.replace('{Owner.Email}', acctOwner.Email);
			}

			Account acct = [select Id, Name, Partner_Score__c from Account where Id =: currentUser.AccountId];
			htmlInfo.HTML__c = htmlInfo.HTML__c.replace('{Account.Name}', acct.Name);

			if(String.isNotBlank(currentUser.ContactId)){
				Contact cont = [select Id, Name from Contact where Id = :currentUser.ContactId];
				htmlInfo.HTML__c = htmlInfo.HTML__c.replace('{Contact.Name}', cont.Name);
			}
		}

	}
}