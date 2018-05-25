@isTest 
global class test_TextbrokerMockEndpointReadyOrders implements HttpCalloutMock {
    
    List<Case> cases;
    
    public test_TextbrokerMockEndpointReadyOrders(List<Case> cases) {
    	this.cases = cases;
    }
    
    global HTTPResponse respond(HTTPRequest req) {
    	//No need to read the request because it has no body. It's just a GET request with 
    	//no parameters.

        // Create a fake response. Set response values, and return response.
        HttpResponse response = new HttpResponse();
		response.setBody(
		'<?xml version="1.0" encoding="UTF-8"?>' +
		'<tbmo:getReadyOrdersResponse xmlns="urn:textbroker:core:201305" xmlns:tbmo="urn:textbroker:manageorder:201305" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">' +
			'<orderStatusUpdate>' + 
				'<orderStatus id="1eba07c0-c9e8-11e2-8b8b-0800200c9a66" occurred="2006-05-04T18:13:51.0Z">' +
						'<referenceID>' + cases[0].Id + '</referenceID>' +
						'<status code="ready">ready status</status>' +
					'</orderStatus>' +
					'<orderStatus id="1eba07c0-c9e8-11e2-8b8b-0800200c9a67" occurred="2006-05-04T18:13:51.0Z">' +
						'<referenceID>' + cases[1].Id + '</referenceID>' +
						'<status code="ready">ready status</status>' +
					'</orderStatus>' +
					'<orderStatus id="1eba07c0-c9e8-11e2-8b8b-0800200c9a68" occurred="2006-05-04T18:13:51.0Z">' +
						'<referenceID>' + cases[2].Id + '</referenceID>' +
						'<status code="ready">ready status</status>' +
					'</orderStatus>' +
			'</orderStatusUpdate>' + 
		'</tbmo:getReadyOrdersResponse>');
		return response;
    }
}