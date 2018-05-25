@isTest
global class test_TextbrokerMockEndpointExportOrderNo implements HttpCalloutMock {

	//To test the proper handling of a document with no body
	global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response. Set response values, and return response.
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);

        //Simulating an empty response
		return response;
    }
}