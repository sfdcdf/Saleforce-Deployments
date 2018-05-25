@isTest
global class test_TextbrokerMockEndpointCreateOrders implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req) {
       	//Read request

        // abrosius@soliantconsulting.com 2013Jul17: need to construct an XML document from the response
        // since are now using XmlStreamWriter to construct the request body
        Dom.Document doc = new Dom.Document();
        doc.load(req.getBody());
        dom.XmlNode root = doc.getRootElement();
        //dom.XmlNode root = req.getBodyDocument().getRootElement();

        List<dom.XmlNode> orders = root.getChildElement('orders', TextbrokerHelper.ns).getChildElements();
        System.assertEquals(3, orders.size());

        String refId1 = orders[0].getChildElement('referenceID', TextbrokerHelper.ns).getText();
        String refId2 = orders[1].getChildElement('referenceID', TextbrokerHelper.ns).getText();
        String refId3 = orders[2].getChildElement('referenceID', TextbrokerHelper.ns).getText();

        // Create a fake response. Set response values, and return response.
        HttpResponse response = new HttpResponse();
		String body =
			'<?xml version="1.0" encoding="UTF-8"?>' +
			'<tbmo:createOrdersResponse xmlns:tbmo="urn:textbroker:managedorder:201305" xmlns="urn:textbroker:core:201305">' +
				'<orderStatusUpdate>' +
					'<orderStatus id="1eba07c0-c9e8-11e2-8b8b-0800200c9a66" occurred="2006-05-04T18:13:51.0Z">' +
						'<referenceID>' + refId1 + '</referenceID>' +
						'<status code="created">created status</status>' +
					'</orderStatus>' +
					'<orderStatus id="1eba07c0-c9e8-11e2-8b8b-0800200c9a67" occurred="2006-05-04T18:13:51.0Z">' +
						'<referenceID>' + refId2 + '</referenceID>' +
						'<status code="created">created status</status>' +
					'</orderStatus>' +
					'<orderStatus id="1eba07c0-c9e8-11e2-8b8b-0800200c9a68" occurred="2006-05-04T18:13:51.0Z">' +
						'<referenceID>' + refId3 + '</referenceID>' +
						'<status code="created">created status</status>' +
					'</orderStatus>' +
				'</orderStatusUpdate>' +
			'</tbmo:createOrdersResponse>';
		System.debug(LoggingLevel.WARN,'****MOCK RESPONSE: ' + body);
		response.setBody(body);
		return response;
    }

}