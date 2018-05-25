@isTest
global class test_TextbrokerMockEndpointAcceptOrders implements HttpCalloutMock {

	global HTTPResponse respond(HTTPRequest req) {
		/* Orders will be accepted by default.
    	//Read request
        dom.XmlNode root = req.getBodyDocument().getRootElement();
        System.debug(LoggingLevel.WARN,'****ROOT NAME: ' + root.getName());
        List<dom.XmlNode> orders = root.getChildElement('orderStatusUpdate', TextbrokerHelper.ns).getChildElements();
        System.assertEquals(3, orders.size());
        
        String refId1 = orders[0].getChildElement('referenceID', TextbrokerHelper.ns).getText();
        String refId2 = orders[1].getChildElement('referenceID', TextbrokerHelper.ns).getText();
        String refId3 = orders[2].getChildElement('referenceID', TextbrokerHelper.ns).getText();
        
        // Create a fake response. Set response values, and return response.
        HttpResponse response = new HttpResponse();
		response.setBody(
		'<?xml version="1.0" encoding="UTF-8"?>' +
		'<tbmo:acceptOrdersResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:textbroker:core:201305" xmlns:tbmo="urn:textbroker:managedorder:201305">' +
		    '<orderStatusUpdate>' +
		        '<orderStatus id="178209d0-c9e8-11e2-8b8b-0800200c9a66" occurred="2006-05-04T18:13:51.0Z">' +
		            '<referenceID>' + refId1 + '</referenceID>' +
		            '<status code="accepted">accepted status</status>' +
		        '</orderStatus>' +
		        '<orderStatus id="178209d0-c9e8-11e2-8b8b-0800200c9a67" occurred="2006-05-04T18:13:51.0Z">' +
		            '<referenceID>' + refId2 + '</referenceID>' +
		            '<status code="accepted">accepted status</status>' +
		        '</orderStatus>' +
		        '<orderStatus id="178209d0-c9e8-11e2-8b8b-0800200c9a68" occurred="2006-05-04T18:13:51.0Z">' +
		            '<referenceID>' + refId3 + '</referenceID>' +
		            '<status code="accepted">accepted status</status>' +
		        '</orderStatus>' +
		    '</orderStatusUpdate>' +
		'</tbmo:acceptOrdersResponse>');
		return response;
		*/
		return null;
    }
}