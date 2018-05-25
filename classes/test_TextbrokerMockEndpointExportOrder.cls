@isTest
global class test_TextbrokerMockEndpointExportOrder implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response. Set response values, and return response.
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);

        //Create Word document
        Document doc = new Document();
        doc.name = 'TextbrokerTestFile';
        String content = 'This is a test.';
        doc.body = Blob.valueOf(content);
        //doc.contentType = 'application/msword';
        doc.contentType = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'; // abrosius@soliantconsulting.com 2013Jul16: not sure this was necessary
        //Add it to the response
		response.setBodyAsBlob(doc.body);
		return response;
    }

}