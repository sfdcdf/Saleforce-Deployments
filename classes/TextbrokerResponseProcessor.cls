public with sharing class TextbrokerResponseProcessor {

	public static void processCreateOrdersResponse(HttpResponse response) {

		System.debug(LoggingLevel.WARN, '****RESPONSE: ' + response.getBody());

		// TEXTBROKER-28
        processResponseUpdateFields(response, true, 'Order/Revision Request Placed', true, true);
	}

	public static void processCheckReadyResponse(HttpResponse response) {

        // TEXTBROKER-28
        processResponseUpdateFields(response, false, 'Document Ready', false, false);

    	//I think in this case we can ignore it if we get an error in the response because
    	//we are going to keep checking periodically anyway
	}

	public static void processExportOrderResponse(HttpResponse response, Id caseId) {

        System.debug(response.getBody()); // abrosius

        // TEXTBROKER-28: add error handling to this call
        // if error, API will return an XML document and an error status code
        if (response.getStatusCode() != 200) {

            // in this case, 'Document Ready' won't be used, since this response
            // only contains an error
            processResponseUpdateFields(response, false, 'Document Ready', true, false);

        } else {

            System.debug(LoggingLevel.WARN, '****EXPORT ORDERS RESPONSE (in process call): ' + response.getBody());

            //Retrieve Word document and attach it to the order
            //Blob responseAsBlob = Blob.valueOf(response.getBody());
            Blob responseAsBlob = response.getBodyAsBlob();  // abrosius
            Attachment attachment = new Attachment(); //Make an attachment
            attachment.Name ='Order' + System.now() + '.docx';
            attachment.Body = responseAsBlob;

            if(attachment.Body != null) {
                // abrosius@soliantconsulting.com 2013Nov26
                // attempt to lock the record for update to ensure that status gets set
                try {
                    Case c = [SELECT Id, CopyStatus__c from Case where Id = :caseId FOR UPDATE];

                    attachment.ContentType = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'; // ??? abrosius@soliantconsulting.com 2013Jul16
                    attachment.ParentId = caseId;
                    insert attachment;

                    // TEXTBROKER-28
                    c.CopyStatus__c = 'Document Retrieved';
                    update c;

                } catch (Exception lockError) {
                    //If we get an error response (something that is not the Word doc) we
                    //should keep trying periodically
                }

            }

	    }
	}

	public static void processConfirmOrdersExportedResponse(HttpResponse response) {

        // TEXTBROKER-28
        processResponseUpdateFields(response, true, 'Document Retrieval Confirmed', true, false);
	}

	public static void processRequestRevisionsResponse(HttpResponse response) {
		processResponseUpdateFields(response, true, 'Order/Revision Request Placed', true, false);
	}

	public static List<dom.Xmlnode> getOrderStatusUpdateChildren(HttpResponse response) {
		Dom.Document doc = response.getBodyDocument();
		dom.XmlNode root = doc.getRootElement();

        // TEXTBROKER-29: might return null for checkReadyOrders: exception will be thrown
        // on next line, but is trapped in processResponseUpdateFields below
		dom.XmlNode orderStatusUpdate = root.getChildElement('orderStatusUpdate', TextbrokerHelper.ns);
		List<dom.Xmlnode> orderStatusChildren = orderStatusUpdate.getChildElements();
		System.debug(LoggingLevel.WARN, '****NUMBER OF ORDER STATUS ELEMENTS RECEIVED: ' + orderStatusChildren.size());
		return orderStatusChildren;
	}

    /**
     * Process XML response, storing new status for each Case and if updateCopyProviderId
     * is true, it updates this value on the Case by extracting it from the response
     * If logErrors is true, it also logs errors to CopyStatusError if an error was encountered.
     *
     *
     * @author  Artie Brosius, abrosius@soliantconsulting.com
     * @date    2013-11-27
     *
     * @param   response                    the HTTPResponse returned from the Textbroker API
     * @param   parseAsStream               whether to parse the response with XMLStreamReader (true) or Dom methods (false)
     * @param   newStatus                   the new status value to set in CopyStatus for successfull Cases
     * @param   logErrors                   whether or not to store error messages in CopyStatusError field
     * @param   updateCopyProviderId        whether or not to update the TB ID on the Case
    */
    private static void processResponseUpdateFields(HttpResponse response, Boolean parseAsStream, String newStatus, Boolean logErrors, Boolean updateCopyProviderId) {
        List<Case> casesToUpdate = new List<Case>();

        if (parseAsStream) {
            // need to use XmlStreamReader for cases where error messages are returned in CDATA sections
            List<TextbrokerOrderStatus> orderStatuses = TextbrokerOrderStatus.parseAsXmlStream(response);
            for (TextbrokerOrderStatus status : orderStatuses) {
                casesToUpdate.add(processOrderStatus(status, newStatus, logErrors, updateCopyProviderId));
            }
        } else {

            // TEXTBROKER-29: traps for error with checkReadyOrders where no orderStatusUpdate element is returned
            try {
                List<dom.Xmlnode> orderStatuses = getOrderStatusUpdateChildren(response);

                for(dom.Xmlnode orderStatusXml : orderStatuses) {
                    TextbrokerOrderStatus orderStatus = new TextbrokerOrderStatus();
                    orderStatus.fromXml(orderStatusXml);
                    casesToUpdate.add(processOrderStatus(orderStatus, newStatus, logErrors, updateCopyProviderId));
                }
            } catch (System.NullPointerException e) {
                // eat it
            }
        }

        if (!casesToUpdate.isEmpty()) update casesToUpdate;
    }

    /**
     * Converts a TextbrokerOrderStatus into a Case record that can be updated
     *
     * @author  Artie Brosius, abrosius@soliantconsulting.com
     * @date    2014-01-08
     * @param   orderStatus                 the TextbrokerOrderStatus object
     * @param   newStatus                   the new status value to set in CopyStatus for successfull Cases
     * @param   logErrors                   whether or not to store error messages in CopyStatusError field
     * @param   updateCopyProviderId        whether or not to update the TB ID on the Case
     * @return  Case record
    */
    private static Case processOrderStatus(TextbrokerOrderStatus orderStatus, String newStatus, Boolean logErrors, Boolean updateCopyProviderId) {
        Case c;

        if(orderStatus.messages == null || orderStatus.messages.size() == 0) {
            System.debug(LoggingLevel.WARN, '****SETTING COPYSTATUS FIELD TO ' + newStatus + ' ON CASE WITH ID ' + orderStatus.caseId);
            c = new Case(Id = orderStatus.caseId);
            c.CopyStatus__c = newStatus;
            c.CopyStatusError__c = '';

            // update CopyProviderId__c ?
            if (updateCopyProviderId && orderStatus.textbrokerId != null) c.CopyProviderId__c = orderStatus.textbrokerId;

            // special case to update the Status field after a revision request is placed successfully
            if (newStatus == 'Order/Revision Request Placed') c.Status = 'New';

        } else if (logErrors) {
            System.debug(LoggingLevel.WARN, '****SETTING COPYSTATUS FIELD TO Error Occurred ON CASE WITH ID ' + orderStatus.caseId);
            c = new Case(Id = orderStatus.caseId);
            c.CopyStatus__c = 'Error Occurred';
            c.CopyStatusError__c = (orderStatus.getMessagesAsString()).left(255);
        }

        return c;
    }
}