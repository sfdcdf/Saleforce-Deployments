public with sharing class CPPAccountPickerComponentController {

	public String selectedAcctId {get; set;}
	public Boolean renderAcctPicker {get; set;}

	public CPPAccountPickerComponentController() {
		if(String.isNotBlank(ApexPages.currentPage().getParameters().get('clientAccountId'))){
			selectedAcctId = ApexPages.currentPage().getParameters().get('clientAccountId');
		}
		renderAcctPicker = false;
		for(User record : [select Id, AccountId from User where Id =: UserInfo.getUserId()]){
			if(String.isBlank(record.AccountId)){
				renderAcctPicker = true;
			}
		}
	}

	public List<SelectOption> getCPPAcctList() {
 	 	List<SelectOption> options = new List<SelectOption>();
 	 	options.add(new SelectOption('', 'Select an Account'));
 	 	for(Account acct : [select Id, Name from Account where RecordType.Name = 'Partner Master Account' and Partner_Status__c = 'Customer' order by Name]){
 	 		options.add(new SelectOption(acct.Id, acct.Name));
 	 	}
 	 	return options;
  	}

  	public PageReference selectAcct(){
  		PageReference pageRef = ApexPages.currentPage();
  		pageRef.getParameters().clear();
  		pageRef.getParameters().put('clientAccountId', selectedAcctId);
  		pageRef.setRedirect(true);
  		return pageRef;
  	}

}