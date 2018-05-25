@isTest
private class YL2SFOnDemandSyncTest {

	@testSetup static void testCTData(){
		YL2SFAccountFieldMapping__c status = new YL2SFAccountFieldMapping__c();
		status.Name = 'status';
		status.Salesforce_Field_API_Name__c = 'Status__c';
		insert status;

		YL2SFAccountFieldMapping__c clientType = new YL2SFAccountFieldMapping__c();
		clientType.Name = 'clientType';
		clientType.Salesforce_Field_API_Name__c = 'Client_Type__c';
		insert clientType;

		YL2SFAccountFieldMapping__c accountManager = new YL2SFAccountFieldMapping__c();
		accountManager.Name = 'accountManager';
		accountManager.Salesforce_Field_API_Name__c = 'IMS_Rep__c';
		accountManager.Email2UsernameMap__c = true;
		insert accountManager;
	}
	
	@isTest static void test_yl2SFSyncGet() {
		RestRequest req = new RestRequest();
	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/YLToSFSync';  //Request URL
		req.httpMethod = 'GET';//HTTP Request Type
		RestContext.request = req;
		RestContext.response= res;

		YL2SFOnDemandSync.yl2SFSyncGet();
	}

	@isTest static void test_yl2SFSyncPostPass() {
		Account acct = new Account();
		acct.Name = 'Test Account';
		acct.Client_ID__c = '326471';
		insert acct;

		RestRequest req = new RestRequest();
		req.requestBody = Blob.valueof('[{"yodle.core.client":{"id":326471,"status":"Provisioning"}}]');

	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/YLToSFSync';  //Request URL
		req.httpMethod = 'POST';//HTTP Request Type
		RestContext.request = req;
		RestContext.response= res;

		YL2SFOnDemandSync.yl2SFSyncPost();
	}

	@isTest static void test_yl2SFSyncClientYodleTeamPostPass() {
		Account acct = new Account();
		acct.Name = 'Test Account';
		acct.Client_ID__c = '326471';
		insert acct;

		RestRequest req = new RestRequest();
		req.requestBody = Blob.valueof('[{"yodle.core.client":{"clientYodleTeam":{"salesRep":{"id":3641913971,"username":"pierce.birkhold@yodle.com.rvdev2017"},"accountManager":{"id":6779228372,"username":"' + UserInfo.getUserName() + '"},"setupSpecialist":{"id":6765141532,"username":"bradley.ferguson@yodle.com.rvdev2017"}},"status":"Live","id":326471}}]');

	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/YLToSFSync';  //Request URL
		req.httpMethod = 'POST';//HTTP Request Type
		RestContext.request = req;
		RestContext.response= res;

		YL2SFOnDemandSync.yl2SFSyncPost();
	}

	@isTest static void test_rebrandingPass() {
		Account acct = new Account();
		acct.Name = 'Test Account';
		acct.Client_ID__c = '555555';
		insert acct;

		RestRequest req = new RestRequest();
		req.requestBody = Blob.valueof('[{"yodle.core.client":{"id":555555, "rebranding":{"salesforceId":"SFIDe5jAZLXyBt0","clientType":"Local","productType":"ESSENTIALS","productPlanId":"Essentials","legacyBrandCompanyName":"OutRank by Rogers","rebrandedThemeKey":"yodle-main","accountManagerName":"Customer Care","rogersId":"","channelDevelopment":""}}}]');

	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/YLToSFSync';  //Request URL
		req.httpMethod = 'POST';//HTTP Request Type
		RestContext.request = req;
		RestContext.response= res;

		YL2SFOnDemandSync.yl2SFSyncPost();
	}

	@isTest static void test_yl2SFSyncPostFail() {
		RestRequest req = new RestRequest();
		req.requestBody = Blob.valueof('[{"yodle.core.client":{"id":326471,"status":"Provisioning"}}]');

	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/YLToSFSync';  //Request URL
		req.httpMethod = 'POST';//HTTP Request Type
		RestContext.request = req;
		RestContext.response= res;

		YL2SFOnDemandSync.yl2SFSyncPost();
	}
	
}