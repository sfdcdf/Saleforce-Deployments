public with sharing class TextbrokerOrderStatus {

	public String textbrokerId;
	public String caseId;
	public String status;
	public List<Message> messages;

	public void fromXml(Dom.XmlNode node) {
		textbrokerId = node.getAttribute('id', null);
		System.debug(LoggingLevel.WARN, '****TEXTBROKERID: ' + textbrokerId);
		for(dom.Xmlnode child : node.getChildElements()) {
			System.debug(LoggingLevel.WARN, '****CHILD ' + child.getName() + ' - TEXT: ' + child.getText());
			if(child.getName() == 'referenceID')
				caseId = child.getText();
			else if(child.getName() == 'status')
				status = child.getText();
		}

		dom.Xmlnode messagesElementXml = node.getChildElement('messages', TextbrokerHelper.ns);
		if(messagesElementXml != null) {
			this.messages = new List<Message>();
			List<dom.Xmlnode> messagesXml = messagesElementXml.getChildElements();
			if(messagesXml != null && messagesXml.size() > 0) {
				System.debug(LoggingLevel.WARN, '****ELEMENT HAS ERROR MESSAGES****');
				for(dom.XmlNode messageXml : messagesXml) {
					if(messageXml.getName() == 'message') {
						System.debug(LoggingLevel.WARN, '****ERROR MESSAGE: ' + messageXml.getText());
						Message message = new Message();
						message.fromXml(messageXml);
						this.messages.add(message);
					}
				}
			}
		}
	}

    public static List<TextbrokerOrderStatus> parseAsXmlStream(HttpResponse response) {
        List<TextbrokerOrderStatus> orderStatuses = new List<TextbrokerOrderStatus>();

        XmlStreamReader reader = response.getXmlStreamReader();

        // Read through the XML

        TextbrokerOrderStatus orderStatus; // temporary storage

        while(reader.hasNext()) {

            System.debug(LoggingLevel.WARN, reader.getLocalName());
            // start orderStatus element
            if (reader.getLocalName() == 'orderStatus' && reader.isStartElement()) {
                // create new TOS object and populate TB ID
                orderStatus = new TextbrokerOrderStatus();
                orderStatus.textbrokerId = reader.getAttributeValue(null, 'id'); // pass null for the default namespace
                orderStatuses.add(orderStatus);

                // process this orderStatus
                // only act on start tags, not end tags
                while (reader.hasNext()) {
                    if (reader.getLocalName() == 'referenceID' && reader.isStartElement()) {
                        reader.next(); // advance to the CHARACTER element
                        orderStatus.caseId = reader.getText();
                    } else if (reader.getLocalName() == 'status' && reader.isStartElement()) {
                        reader.next(); // advance to the CHARACTER element
                        orderStatus.status = reader.getText();
                    } else if (reader.getLocalName() == 'messages' && reader.isStartElement()) {
                        // loop through message elements
                        orderStatus.messages = new List<Message>();
                        while(reader.hasNext()) {
                            if (reader.getLocalName() == 'message' && reader.isStartElement()) {
                                Message m = new Message();
                                m.code = reader.getAttributeValue(null, 'code') != null ? Integer.valueOf(reader.getAttributeValue(null, 'code')) : null; // pass null for the default namespace
                                m.severity = reader.getAttributeValue(null, 'severity'); // pass null for the default namespace
                                reader.next(); // advance to the CHARACTER element
                                m.message = reader.getText();
                                orderStatus.messages.add(m);
                            }
                            reader.next();
                            if (reader.isEndElement() && reader.getLocalName() == 'messages') break;
                        }
                    }
                    reader.next();
                    if (reader.isEndElement() && reader.getLocalName() == 'orderStatus') break;
                }
            }
            reader.next();
        }

        System.debug(LoggingLevel.WARN, '****ORDER STATUSES: ' + orderStatuses);
        return orderStatuses;
    }

    public String getMessagesAsString() {

        String result = '';
        for (Message m : messages) {
            result  = result + m.code + ' (' + m.severity + '): ' + m.message + ';';
        }
        return result;
    }

    @TestVisible
	class Message {
		@TestVisible Integer code;
		@TestVisible String severity;
		@TestVisible String message;

        @TestVisible
		public void fromXml(Dom.XmlNode node) {
			String codeString = node.getAttribute('code', TextbrokerHelper.ns);
			if(codeString != null)
				code = Integer.valueOf(codeString);
			severity = node.getAttribute('severity', TextbrokerHelper.ns);
			message = node.getText();
		}
	}
}