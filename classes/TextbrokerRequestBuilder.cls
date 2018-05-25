public with sharing class TextbrokerRequestBuilder {

    public static HttpRequest buildCreateOrdersRequestXmlStreamWriter(List<TextbrokerOrder> ordersToTransfer) {
        HttpRequest request = createXmlPutRequest(TextbrokerHelper.getEndpoint('createOrders'));

        XmlStreamWriter w = new XmlStreamWriter();
        w.writeStartDocument('UTF-8', '1.0');

        // createOrdersRequest
        w.writeStartElement('tbmo', 'createOrdersRequest', TextbrokerHelper.tbmo);
        w.writeNamespace('tbmo', TextbrokerHelper.tbmo);
        w.writeDefaultNamespace(TextbrokerHelper.ns);
        w.writeNamespace('xsi', TextbrokerHelper.xsi);

        // orders
        w.writeStartElement(null, 'orders', null);

        // order loop
        if(ordersToTransfer != null && ordersToTransfer.size() > 0) {
            for(TextbrokerOrder o : ordersToTransfer) {
                if(o != null) o.addToParentAsXmlStream(w);
            }
        }

        w.writeEndElement(); // end orders
        w.writeEndElement(); // end createOrdersRequest

        w.writeEndDocument();
        String xmlOutput = w.getXmlString();
        w.close();

        System.debug(LoggingLevel.WARN, '****XML: ' + xmlOutput);
        request.setBody(xmlOutput);
        return request;
    }

	public static HttpRequest buildCheckReadyOrdersRequest() {
		HttpRequest request = new HttpRequest();
		request.setMethod('GET');
		request.setEndpoint(TextbrokerHelper.getEndpoint('checkReadyOrders'));
		request.setHeader('X-ENABLE-TOKENAUTH', '1');
		request.setHeader('token', TextbrokerHelper.getConfigValue('token'));
   		//No XML in the request
        System.debug(LoggingLevel.WARN, '****REQUEST: ' + request.toString());
        return request;
	}

	public static HttpRequest buildExportOrderRequest(String caseId) {
		HttpRequest request = new HttpRequest();
		request.setMethod('GET');
		request.setEndpoint(TextbrokerHelper.getEndpoint('exportOrder') + caseId);
		request.setHeader('X-ENABLE-TOKENAUTH', '1');
		request.setHeader('token', TextbrokerHelper.getConfigValue('token'));

        // abrosius@soliantconsulting.com 2013Jul17
        System.debug('****Accept header: ' + request.getHeader('Accept'));
        request.setHeader('Accept', 'application/octet-stream, application/vnd.openxmlformats-officedocument.wordprocessingml.document');
        System.debug('****Accept header: ' + request.getHeader('Accept'));

		//No XML in the request. The request will fail if we include a body.
		return request;
	}

	public static HttpRequest buildConfirmOrdersExportedRequest(List<Id> casesToConfirmIds) {
		HttpRequest request = createXmlPutRequest(TextbrokerHelper.getEndpoint('confirmOrderExported'));

		Dom.Document doc = new Dom.Document();
		dom.Xmlnode root = createRoot('approveExportOrdersRequest', doc);
        addOrderStatusToRoot(root, casesToConfirmIds, null);

        System.debug(LoggingLevel.WARN, '****DOC: ' + doc.toXmlString());
        request.setBodyDocument(doc);
        return request;
	}

    public static HttpRequest buildRequestRevisionsRequestXmlStream(List<Id> casesThatNeedRevisionsIds, List<String> messages) {
        HttpRequest request = createXmlPutRequest(TextbrokerHelper.getEndpoint('orderRevisions'));

        XmlStreamWriter w = new XmlStreamWriter();
        w.writeStartDocument('UTF-8', '1.0');

        // reviseOrdersRequest
        w.writeStartElement('tbmo', 'reviseOrdersRequest', TextbrokerHelper.tbmo);
        w.writeNamespace('tbmo', TextbrokerHelper.tbmo);
        w.writeDefaultNamespace(TextbrokerHelper.ns);

        // orderStatusUpdate
        w.writeStartElement(null, 'orderStatusUpdate', null);

        // orderStatus loop
        addOrderStatusToRootXmlStream(w, casesThatNeedRevisionsIds, messages);

        w.writeEndElement(); // end orderStatusUpdate
        w.writeEndElement(); // end reviseOrdersRequest

        w.writeEndDocument();
        String xmlOutput = w.getXmlString();
        w.close();

        System.debug(LoggingLevel.WARN, '****XML: ' + xmlOutput);
        request.setBody(xmlOutput);
        return request;
    }

	private static HttpRequest createXmlPutRequest(String endpoint) {
		HttpRequest request = new HttpRequest();
		request.setMethod('PUT');
		request.setEndpoint(endpoint);
		request.setHeader('Content-Type', 'text/xml');
		request.setHeader('X-ENABLE-TOKENAUTH', '1');
		request.setHeader('token', TextbrokerHelper.getConfigValue('token'));
		return request;
	}

	private static dom.Xmlnode createRoot(String rootName, Dom.Document doc) {
		dom.Xmlnode root = doc.createRootElement(rootName, TextbrokerHelper.tbmo, 'tbmo');
		root.setAttribute('xmlns', TextbrokerHelper.ns);
        root.setNamespace('xsi', TextbrokerHelper.xsi);
        return root;
	}

	private static void addOrderStatusToRoot(dom.XmlNode root, List<Id> caseIds, List<String> messages) {
		dom.XmlNode orderStatusUpdateXml = root.addChildElement('orderStatusUpdate', TextbrokerHelper.ns, null);
        if(caseIds != null && caseIds.size() > 0) {
	        for(Integer i = 0; i < caseIds.size(); i++) {
		        dom.Xmlnode orderStatusXml = orderStatusUpdateXml.addChildElement('orderStatus', TextbrokerHelper.ns, null);
		        orderStatusXml.addChildElement('referenceID', TextbrokerHelper.ns, null).addTextNode(caseIds[i]);
		        if(messages != null && messages.size() > i) {
					dom.Xmlnode messagesXml =  orderStatusXml.addChildElement('messages', TextbrokerHelper.ns, null);
					if(messages[i] != null) {
						dom.Xmlnode messageXml = messagesXml.addChildElement('message', TextbrokerHelper.ns, null);
						messageXml.setAttribute('severity', 'error');
						messageXml.addTextNode('<![CDATA[' + messages[i] + ']]>');
					}
		        }
	        }
        }
	}

    private static void addOrderStatusToRootXmlStream(XmlStreamWriter w, List<Id> caseIds, List<String> messages) {
        if(caseIds != null && caseIds.size() > 0) {
            for(Integer i = 0; i < caseIds.size(); i++) {
                // orderStatus
                w.writeStartElement(null, 'orderStatus', null);

                //referenceID
                w.writeStartElement(null, 'referenceID', null);
                w.writeCharacters(caseIds[i]);
                w.writeEndElement();


                if(messages != null && messages.size() > i) {
                    // messages
                    w.writeStartElement(null, 'messages', null);

                    if(messages[i] != null) {
                        // message
                        w.writeStartElement(null, 'message', null);
                        w.writeAttribute(null, null, 'severity', 'error');
                        w.writeCData(messages[i]);
                        w.writeEndElement(); // end message
                    }

                    w.writeEndElement(); // end messages
                }

                w.writeEndElement(); // end orderStatus

            }
        }
    }

}