@isTest
public class test_TextbrokerRemoteObjectCreator {

	public static List<Case> createReadyOrders(List<Case> cases) {
		return createTestData(cases, 'ready');
	}
	
	public static List<Case> createExportedOrders(List<Case> cases) {
		return createTestData(cases, 'exported');
	}
	
	public static List<Case> createRevisionReadyOrders(List<Case> cases) {
		return createTestData(cases, 'revision_ready');
	}
	
	public static List<Case> createAcceptedOrders(List<Case> cases) {
		return createTestData(cases, 'accepted');
	}
	
	public static void deleteAllOrders() {
		HttpRequest request = new HttpRequest();
		request.setMethod('GET');
		request.setEndpoint(TextbrokerHelper.getEndpoint('deleteTestData'));
		request.setHeader('X-ENABLE-TOKENAUTH', '1');
		request.setHeader('token', TextbrokerHelper.getConfigValue('token'));	
		Http http = new Http();
		HttpResponse response = http.send(request);
	}
	
	private static List<Case> createTestData(List<Case> cases, String action) {
		//Create cases locally
		List<TextbrokerOrder> orders = TextbrokerHelper.casesToOrders(cases);
		
		//Create request
		HttpRequest request = new HttpRequest();
		request.setMethod('PUT');
		request.setEndpoint(TextbrokerHelper.getEndpoint('createTestData') + action);
		request.setHeader('X-ENABLE-TOKENAUTH', '1');
		request.setHeader('token', TextbrokerHelper.getConfigValue('token'));
		request.setHeader('Content-Type', 'text/xml');
		
		/*
		Dom.Document doc = new Dom.Document();       
		dom.Xmlnode createOrdersRequest = doc.createRootElement('createOrdersRequest', TextbrokerHelper.tbmo, 'tbmo');
		createOrdersRequest.setAttribute('xmlns', TextbrokerHelper.ns);
        createOrdersRequest.setNamespace('xsi', TextbrokerHelper.xsi);
        
        dom.XmlNode ordersXml = createOrdersRequest.addChildElement('orders', TextbrokerHelper.ns, null);	
        */
        
        XmlStreamWriter w = new XmlStreamWriter();
        w.writeStartDocument('UTF-8', '1.0');

        // createOrdersRequest
        w.writeStartElement('tbmo', 'createOrdersRequest', TextbrokerHelper.tbmo);
        w.writeNamespace('tbmo', TextbrokerHelper.tbmo);
        w.writeDefaultNamespace(TextbrokerHelper.ns);
        w.writeNamespace('xsi', TextbrokerHelper.xsi);

        // orders
        w.writeStartElement(null, 'orders', null);
        
        if(orders != null && orders.size() > 0) {
	        for(TextbrokerOrder o : orders) {
	        	if(o != null)
	        		//o.addToParentAsXml(TextbrokerHelper.ns, ordersXml);
	        		o.addToParentAsXmlStream(w);
	        		
	        }
        }
        /*System.debug(LoggingLevel.WARN,'****DOC: ' + doc.toXmlString());
        /request.setBodyDocument(doc);*/
        	
        w.writeEndElement(); // end orders
        w.writeEndElement(); // end createOrdersRequest

        w.writeEndDocument();
        String xmlOutput = w.getXmlString();
        w.close();

        System.debug(LoggingLevel.WARN, '****XML: ' + xmlOutput);
        request.setBody(xmlOutput);
        	
		//Send request
        Http http = new Http();
		HttpResponse response = http.send(request);
		
		//Return local Cases created
		return cases;
	}
}