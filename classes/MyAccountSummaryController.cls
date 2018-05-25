global without sharing class MyAccountSummaryController {
	// hardcode an account id for demo purposes
	static String accountId;
	private static User currentUser = [select Id, AccountId from User where Id =: UserInfo.getUserId()];

	public Boolean displayAccountSummary {get; set;}

	public MyAccountSummaryController(){
		displayAccountSummary = false;
		if(String.isNotBlank(currentUser.AccountId)){
			displayAccountSummary = true;
		}else if(String.isNotBlank(ApexPages.currentPage().getParameters().get('clientAccountId'))){
			displayAccountSummary = true;
		}
	}

	global static String getAccount() {
		if(String.isNotBlank(currentUser.AccountId)){
			accountId = currentUser.AccountId;
		}else if(String.isNotBlank(ApexPages.currentPage().getParameters().get('clientAccountId'))){
			accountId = ApexPages.currentPage().getParameters().get('clientAccountId');
		}else{
			accountId = [select Id, Name from Account where RecordType.Name = 'Partner Master Account' and Partner_Status__c = 'Customer' order by Name limit 1].Id;
		}

		return JSON.serialize([select name, Client_ID__c, Phone, Children_Accounts_Live__c, BillingStreet, BillingState, BillingCity, billingpostalcode, Partner_Status__c from account where id = :accountId][0]);
	}    

	global static String getChildAccounts() {
		List<ChildAccountWrapper> newChildAccountWrapper = new List<ChildAccountWrapper>();
		for(Account record : [select name, Phone, Client_ID__c, Status__c, Order_Date__c, Live_Date__c, (select Install_Date__c, RecordType.Name, CSC_Completed_Date__c, Status__c from Lighthouse_Worksheets__r where RecordType.Name in ('Installation Worksheet', 'CSC Worksheet - Dental') order by CreatedDate DESC) from Account where ParentId = :accountId and (NOT Name like '%TEST') order by Name]){
			ChildAccountWrapper newChildWrapper = new ChildAccountWrapper();
			newChildWrapper.name = record.Name;
			newChildWrapper.phone = record.Phone;
			newChildWrapper.clientId = record.Client_ID__c;
			newChildWrapper.status = record.Status__c;
			newChildWrapper.orderDate = record.Order_Date__c;
			newChildWrapper.liveDate = record.Live_Date__c;

			for(Lighthouse_Worksheets__c lw : record.Lighthouse_Worksheets__r){
				if(lw.RecordType.Name == 'Installation Worksheet' && newChildWrapper.installCompleted == null && lw.Install_Date__c != null){
					newChildWrapper.installCompleted = lw.Install_Date__c;
				}else if(lw.RecordType.Name == 'CSC Worksheet - Dental' && String.isBlank(newChildWrapper.cscStatus)){
					newChildWrapper.cscStatus = lw.Status__c;
					newChildWrapper.cscCompleted = lw.CSC_Completed_Date__c;
				}
			}


			newChildAccountWrapper.add(newChildWrapper);
		}
		return JSON.serialize(newChildAccountWrapper);
	}

	private Class ChildAccountWrapper {
		private String name;
		private String phone;
		private String clientId;
		private String status;
		private Date orderDate;
		private Date liveDate;
		private Date installCompleted;
		private Date cscCompleted;
		private String cscStatus;
	}
}