@isTest
private class LHFS_CustomRestAPITest {
	@isTest static void cancelledClientsSuccess() {
		RestRequest req = new RestRequest();
	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/cancelledClients';  //Request URL
		req.httpMethod = 'GET';//HTTP Request Type
		req.addHeader('yotoken', 'eW9kYXRhMjAxNg==');
		RestContext.request = req;
		RestContext.response= res;

		LHFS_CustomRestAPI.cancelledClients();
	}

	@isTest static void cancelledClientsFailNoToken() {
		RestRequest req = new RestRequest();
	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/cancelledClients';  //Request URL
		req.httpMethod = 'GET';//HTTP Request Type
		//req.addHeader('yotoken', 'eW9kYXRhMjAxNg==');
		RestContext.request = req;
		RestContext.response= res;

		LHFS_CustomRestAPI.cancelledClients();
	}

	@isTest static void cancelledClientsFailWrongToken() {
		RestRequest req = new RestRequest();
	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/cancelledClients';  //Request URL
		req.httpMethod = 'GET';//HTTP Request Type
		req.addHeader('yotoken', 'MjMyMg==');
		RestContext.request = req;
		RestContext.response= res;

		LHFS_CustomRestAPI.cancelledClients();
	}
}