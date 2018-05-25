@isTest
public with sharing class TextbrokerTestController {

	public String display { get; set; }
	Id recordTypeId = [select Id from RecordType where sObjectType = 'Case' and name = 'Organic Setup'][0].Id;
	List<Case> cases = [select Client_ID__c, Account.Name, CaseNumber, taskId__c,
			KeyWord_1_Service_Name__c, KeyWord_2_Service_Name__c, KeyWord_3_Service_Name__c,
			KeyWord_1_Unique_Proposition__c, KeyWord_2_Unique_Proposition__c, KeyWord_3_Unique_Proposition__c,
			Name_of_Business__c, Segment__c, Business_Address__c, Domain_Name_to_be_used_for_YO__c,
			Description_of_the_Business__c, Hours_of_Operation__c, Services_Offered__c, Geographic_Areas_To_Service__c,
			Unique_Selling_Points__c, Payment_Methods_Accepted__c, Country__c, Number_of_Pages__c
			from case where RecordTypeId = :recordTypeId limit 3];

	public void HttpsTestCall() {
	HttpRequest request = new HttpRequest();
		request.setMethod('GET');
		//request.setEndpoint('https://success.salesforce.com/');
		//request.setEndpoint('https://twitter.com/');
		request.setEndpoint('https://intern.textbroker.com');
		display = '-------REQUEST-----------\n';
		display = display + request.toString();
		Http http = new Http();
		HttpResponse response = http.send(request);
		display = display + '\n-------RESPONSE----------\n';
		display = display + response.getBody();
	}

	public void createOrders() {
		System.debug(LoggingLevel.WARN, '****Number of available test cases: ' + cases.size());

		//Create test orders
		List<TextbrokerOrder> ordersToTransfer = TextbrokerHelper.casesToOrders(cases);
		HttpRequest request = TextbrokerRequestBuilder.buildCreateOrdersRequestXmlStreamWriter(ordersToTransfer);

		displayRequestResponse(request);
	}

	public void checkReadyOrders() {
		//Send request to Textbroker to create cases in "ready" status
		test_TextbrokerRemoteObjectCreator.createRevisionReadyOrders(cases);

		HttpRequest request = TextbrokerRequestBuilder.buildCheckReadyOrdersRequest();
		displayRequestResponse(request);

		//We run this so that we have have some CopyProviderId__c values when clicking on the
		//exportOrder button
		TextbrokerDispatcher.checkReadyOrders();
	}

	public void exportOrder() {
		List<Case> transferredCases = [select CopyProviderId__c from case where CopyProviderId__c != null];
		String testId;
		if(transferredCases.size() > 0) {
			testId = transferredCases[0].CopyProviderId__c;
		} else {
			testId = 'a95a21ea-c94d-4d57-9ca1-6bb8febb846a';
		}

		HttpRequest request = TextbrokerRequestBuilder.buildExportOrderRequest(testId);
		displayRequestResponse(request);

		//Download the Word file instead of displaying the content?
		//HttpResponse response = http.send(request);
		//System.debug(LoggingLevel.WARN, '****RESPONSE: ' + response.getBody());
		//Blob responseAsBlob = Blob.valueOf(response.getBody());
	}

	public void confirmOrdersExported() {
		List<Case> casesToConfirm = [select CopyProviderId__c from case where CopyProviderId__c != null];
		if(casesToConfirm.size() == 0) {
			//Just pulling some case at random for testing purposes
			casesToConfirm = [select Id from case limit 1];
		}
		Map<Id, Case> casesToConfirmMap = new Map<Id, Case>(casesToConfirm);
		HttpRequest request = TextbrokerRequestBuilder.buildConfirmOrdersExportedRequest(new List<Id>(casesToConfirmMap.keySet()));
		displayRequestResponse(request);
	}

	/* Orders will be accepted by default.
	public void acceptOrders() {
		Map<Id, Case> casesMap = new Map<Id, Case>([select Id from case where RecordTypeId = :recordTypeId limit 3]);
		HttpRequest request = TextbrokerRequestBuilder.buildAcceptCasesRequest(new List<Id>(casesMap.keySet()));
		TextbrokerXmlPrinter.displayRequestResponse(request, display);
	}*/

	public void requestRevisions() {
		Map<Id, Case> casesMap = new Map<Id, Case>([select Id, Status_Notes__c from case where RecordTypeId = :recordTypeId limit 3]);
		HttpRequest request = TextbrokerRequestBuilder.buildRequestRevisionsRequestXmlStream(new List<Id>(casesMap.keySet()), new String[] {'test', 'test', 'test'});
		displayRequestResponse(request);
	}

	public void displayRequestResponse(HttpRequest request) {
		display = '-------REQUEST-----------\n';

		Dom.Document doc = request.getBodyDocument();
		if(doc == null) {
			display = display + request.toString() + '\n';
			display = display + request.getBody();
		} else {
			dom.Xmlnode root = doc.getRootElement();
			if(root == null) {
				display = display + 'ERROR - There is no root element';
			} else {
				display = display + TextbrokerXmlPrinter.printNodeOpeningTag(root, 0);
				display = display + TextbrokerXmlPrinter.printNodeText(root);
				display = display + TextbrokerXmlPrinter.prettyPrint(root, 0);
				display = display + TextbrokerXmlPrinter.printNodeClosingTag(root, 0);
			}
		}

		display = display + '\n-------RESPONSE----------\n';
		Http http = new Http();
		HttpResponse response = http.send(request);
		System.debug(LoggingLevel.WARN, '****RESPONSE: ' + response.getBody());
		display = display + response.getBody();
	}
}