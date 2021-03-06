@isTest
global class test_TextbrokerMockEndpointConfirmExpErr implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req) {
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
        '<tbmo:approveExportOrdersResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:textbroker:core:201305" xmlns:tbmo="urn:textbroker:managedorder:201305">' +
            '<orderStatusUpdate>' +
                '<orderStatus id="1eba07c0-c9e8-11e2-8b8b-0800200c9a69" occurred="2006-05-04T18:13:51.0Z">' +
                    '<referenceID>' + refId1 + '</referenceID>' +
                    '<status code="ready_to_place">ready_to_place</status>' +
                    '<messages>' +
                        '<message severity="error"><![CDATA[Transition: approve_export can not be executed for this order.]]></message>' +
                    '</messages>' +
                '</orderStatus>' +
                '<orderStatus id="1eba07c0-c9e8-11e2-8b8b-0800200c9a70" occurred="2006-05-04T18:13:51.0Z">' +
                    '<referenceID>' + refId2 + '</referenceID>' +
                    '<status code="exported">exported status</status>' +
                '</orderStatus>' +
                '<orderStatus id="1eba07c0-c9e8-11e2-8b8b-0800200c9a71" occurred="2006-05-04T18:13:51.0Z">' +
                    '<referenceID>' + refId3 + '</referenceID>' +
                    '<status code="exported">exported status</status>' +
                '</orderStatus>' +
            '</orderStatusUpdate>' +
        '</tbmo:approveExportOrdersResponse>');
        return response;
    }
}