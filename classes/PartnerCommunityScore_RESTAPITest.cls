@isTest
private class PartnerCommunityScore_RESTAPITest {
	
	@isTest static void test_PartnerCommunityScore_RESTAPIInvalid() {
		RestRequest req = new RestRequest();
	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/partnerUserQuizScore';  //Request URL
		req.httpMethod = 'GET';//HTTP Request Type
		RestContext.request = req;
		RestContext.response= res;

		PartnerCommunityScore_RESTAPI.scoreAPI();
	}

	@isTest static void test_PartnerCommunityScore_RESTAPIValid() {
		RestRequest req = new RestRequest();
	  	RestResponse res = new RestResponse();

		req.requestURI = '/services/apexrest/partnerUserQuizScore';  //Request URL
		req.httpMethod = 'GET';//HTTP Request Type
		req.addParameter('quiz_id', 'IdQuiz');
		RestContext.request = req;

		PartnerCommunityScore_RESTAPI.scoreAPI();
	}
	
}