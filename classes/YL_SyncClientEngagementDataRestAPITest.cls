@isTest
private class YL_SyncClientEngagementDataRestAPITest {
	
	@isTest static void syncEngagementDataTest() {
		Account newAccount = new Account();
		newAccount.Name = 'Test Name';
		newAccount.Client_ID__c = 'test1';
		insert newAccount;

		RestRequest req = new RestRequest();
	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/clients/engagement';  //Request URL
		req.httpMethod = 'POST';//HTTP Request Type
		req.requestBody = Blob.valueof('[{"Engagement_Has_Active_Offer__c":"true","Engagement_Num_Contacts__c":"5","Engagement_Num_Emails_Sent__c":"10","Engagement_Num_Offers__c":null,"Engagement_Date_Last_Review_Requested__c":null,"Engagement_Has_Completed_Bulk_Import__c":"false","Engagement_Num_Automated_Email_Activated__c":null,"Engagement_Date_Last_Email_Sent__c":null,"Engagement_Date_Last_Offer_Created__c":null,"Client_ID__c":"test1","Engagement_Date_Last_Triggered_Email__c":null,"Engagement_Num_Review_Request_Last_7_Day__c":null}]');
		RestContext.request = req;
		RestContext.response= res;

		YL_SyncClientEngagementDataRestAPI.syncEngagementData();
	}
	
}