public with sharing class TextbrokerDispatcher {

	private static Set<Id> organicSetupRecordTypeId;
	private static Id textBrokerUserId;

	public static void processTextbrokerTrigger(List<Case> triggerNew, List<Case> triggerOld, Map<Id, Case> triggerNewMap,
	Map<Id, Case> triggerOldMap) {

		organicSetupRecordTypeId = new Set<Id>();
		organicSetupRecordTypeId.addAll(TextbrokerHelper.getorganicSetupRecordTypeId());
		textbrokerUserId = TextbrokerHelper.getTextbrokerUserId();

		List<Id> casesToTransferIds = new List<Id>();
		List<Id> casesThatNeedRevisionsIds = new List<Id>();
		List<String> revisionsMessages = new List<String>();

		//Get the Ids of all parent accounts
		List<Id> parentAccountIds = new List<Id>();
		for(Case c : triggerNew) {
			parentAccountIds.add(c.AccountId);
		}

		Map<Id, Account> parentAccounts = new Map<Id, Account>([select Id, Name from Account where Id in :parentAccountIds]);

		for(Case c : triggerNew) {
			Id oldOwnerId = null;
			String oldStatus = null;

			if(triggerOldMap != null && triggerOldMap.get(c.Id) != null) {
				oldStatus = triggerOldMap.get(c.Id).Status;
				oldOwnerId = triggerOldMap.get(c.Id).OwnerId;
			}

            System.debug(c);

            System.debug(LoggingLevel.WARN, '****Case oldOwnerId: ' + oldOwnerId);
            System.debug(LoggingLevel.WARN, '****Case OwnerId: ' + c.OwnerId);
            System.debug(LoggingLevel.WARN, '****Case RecordTypeId: ' + c.RecordTypeId);
            System.debug(LoggingLevel.WARN, '****TB OwnerId: ' + textbrokerUserId);
            System.debug(LoggingLevel.WARN, '****Organic Setup RecordTypeId: ' + organicSetupRecordTypeId);


			//Verify that it's the right Record type, and that before the owner was not Textbroker and now it is.
			if ( organicSetupRecordTypeId.contains(c.RecordTypeId) && c.OwnerId == textBrokerUserId && c.OwnerId != oldOwnerId) {
				Boolean canBeTransferred = true;

				Account parentAccount = parentAccounts.get(c.AccountId);
				if(parentAccount == null || String.isBlank(parentAccount.Name)) {
					String errorMessage = 'Account Name is a required field when assigning cases to Textbroker.';
					c.addError(errorMessage);
					System.debug(LoggingLevel.WARN, '****' + errorMessage);
					canBeTransferred = false;
				}

				if(String.isBlank(c.Client_ID__c)) {
					String errorMessage = 'Client ID is a required field when assigning cases to Textbroker.';
					c.addError(errorMessage);
					canBeTransferred = false;
				}

				if(String.isBlank(c.taskId__c)) {
					String errorMessage = 'Task ID is a required field when assigning cases to Textbroker.';
					c.addError(errorMessage);
					canBeTransferred = false;
				}

/* this field is defaulted
				if(String.isBlank(c.CaseNumber)) {
					String errorMessage = 'Case Number is a required field when assigning cases to Textbroker.';
					c.addError(errorMessage);
					canBeTransferred = false;
				}
*/

/* this is a formula field
				if(String.isBlank(c.Number_of_Pages__c)) {
					String errorMessage = 'Number Of Pages is a required field when assigning cases to Textbroker.';
					c.addError(errorMessage);
					canBeTransferred = false;
				}
*/
				if(String.isBlank(c.Country__c)) {
					String errorMessage = 'Country is a required field when assigning cases to Textbroker.';
					c.addError(errorMessage);
					canBeTransferred = false;
				}

                // TEXTBROKER-28
                if(! String.isBlank(c.CopyProviderId__c)) {
                    String errorMessage = 'Copy Provider ID must be empty when assigning cases to Textbroker';
                    c.addError(errorMessage);
                    canBeTransferred = false;
                }

                // TEXTBROKER-28
                if(c.CopyStatus__c != 'New Order') {
                    String errorMessage = 'Please change Copy Status to \'New Order\' when assigning cases to Textbroker';
                    c.addError(errorMessage);
                    canBeTransferred = false;
                }

				if(canBeTransferred) {
					System.debug(LoggingLevel.WARN, '****CASE TO TRANSFER ID: ' + c.Id);
					casesToTransferIds.add(c.Id);
				}
			}
			//We need to verify that it's the right Record type, and that before the status was not Revision Needed and now it is.
			else if( organicSetupRecordTypeId.contains(c.RecordTypeId) && c.Status == 'Revisions Needed' && c.Status != oldStatus
                        && c.CopyStatus__c == 'Revisions Needed') {

                Boolean canBeTransferred = true;

                // prevent saving record if Status Notes is blank
                if(String.isBlank(c.Status_Notes__c)) {
                    String errorMessage = 'Status Notes is a required field when requesting revisions from Textbroker.';
                    c.addError(errorMessage);
                    canBeTransferred = false;
                }

                if(canBeTransferred) {
    				System.debug(LoggingLevel.WARN, '****CASE THAT NEEDS REVISION ID: ' + c.Id);
    				casesThatNeedRevisionsIds.add(c.Id);
    				revisionsMessages.add(c.Status_Notes__c);
                }
			}
		}

		System.debug(LoggingLevel.WARN, '****CASES TO TRANSFERIDS SIZE: ' + casesToTransferIds.size());
		if(casesToTransferIds.size() > 0) {
			createOrdersFuture(casesToTransferIds);
		}

		System.debug(LoggingLevel.WARN, '****CASES THAT NEED REVISIONS SIZE: ' + casesThatNeedRevisionsIds.size());
		if(casesThatNeedRevisionsIds.size() > 0) {
			requestRevisionsFuture(casesThatNeedRevisionsIds, revisionsMessages);
		}
	}

	/** Creates the orders in Textbroker's system when cases are assigned to them **/
	@future(callout=true)
	public static void createOrdersFuture(List<Id> casesToTransferIds) {
		//CopyProviderId__c will be null if the order has not yet been transferred

        // abrosius@soliantconsulting.com 2013Nov26: added more validation to match TextbrokerDispatcher.processTextbrokerTrigger()
        // and support for new CopyStatus__c field

		List<Case> casesToTransfer =
            [   SELECT
                        Id,
                        Client_ID__c,
                        Account.Name,
                        CaseNumber,
                        taskId__c,
                        KeyWord_1_Service_Name__c,
                        KeyWord_2_Service_Name__c,
                        KeyWord_3_Service_Name__c,
                        KeyWord_1_Unique_Proposition__c,
                        KeyWord_2_Unique_Proposition__c,
                        KeyWord_3_Unique_Proposition__c,
                        Name_of_Business__c,
                        Segment__c,
                        Business_Address__c,
                        Domain_Name_to_be_used_for_YO__c,
                        Description_of_the_Business__c,
                        Hours_of_Operation__c,
                        Services_Offered__c,
                        Geographic_Areas_To_Service__c,
                        Unique_Selling_Points__c,
                        Payment_Methods_Accepted__c,
                        Country__c,
                        Number_of_Pages__c,
                        Homepage__c
                FROM    Case
                WHERE   Id IN :casesToTransferIds
                AND     OwnerId = :TextbrokerHelper.getTextbrokerUserId()               // inline bind to helper method
                AND     RecordTypeId in :TextbrokerHelper.getorganicSetupRecordTypeId()  // inline bind to helper method
                AND     CopyProviderId__c = NULL
                AND     Account.Name != NULL
                AND     Client_ID__c != NULL
                AND     taskId__c != NULL
                AND     CaseNumber != NULL
                AND     Number_of_Pages__c != NULL
                AND     Country__c != NULL
                AND     CopyStatus__c = 'New Order'                 // TEXTBROKER-28
            ];

		if(casesToTransfer.size() > 0) {
			List<TextbrokerOrder> ordersToTransfer = TextbrokerHelper.casesToOrders(casesToTransfer);

			// abrosius@soliantconsulting.com 2013Jul17: changed method to use XmlStreamWriter to build request body
			HttpRequest request = TextbrokerRequestBuilder.buildCreateOrdersRequestXmlStreamWriter(ordersToTransfer);
			System.debug(LoggingLevel.WARN, '****CREATE ORDERS REQUEST: ' + request.getBody());
			Http http = new Http();
			HttpResponse response = http.send(request);

			TextbrokerResponseProcessor.processCreateOrdersResponse(response);
		}
	}

	/** Sends revision request when case status changes to "Revisions Needed" **/
	@future(callout=true)
	public static void requestRevisionsFuture(List<Id> casesThatNeedRevisionsIds, List<String> revisionsMessages) {
		if(casesThatNeedRevisionsIds != null && casesThatNeedRevisionsIds.size() > 0) {

			// abrosius@soliantconsulting.com 2013Jul17: changed method to use XmlStreamWriter to build request body
			HttpRequest request = TextbrokerRequestBuilder.buildRequestRevisionsRequestXmlStream(casesThatNeedRevisionsIds, revisionsMessages);
			System.debug(LoggingLevel.WARN, '****REVISIONS REQUESTED REQUEST: ' + request.getBody());

			Http http = new Http();
			HttpResponse response = http.send(request);

			TextbrokerResponseProcessor.processRequestRevisionsResponse(response);
		}
	}

	/** Checks for orders that are ready to get exported **/
	@future(callout=true)
	public static void checkReadyOrders() {
		HttpRequest request = TextbrokerRequestBuilder.buildCheckReadyOrdersRequest();
		Http http = new Http();
		HttpResponse response = http.send(request);

		TextbrokerResponseProcessor.processCheckReadyResponse(response);
	}

	/** Downloads the docx for the order that is provided in the request as parameter **/
    // TEXTBROKER-28: removed future annotation since this method is now only called from a Batch context
	public static void exportOrder(Id caseId) {
		HttpRequest request = TextbrokerRequestBuilder.buildExportOrderRequest(caseId); // abrosius@soliantconsulting.com 2013Jul16: changed to pass caseId
        System.debug(LoggingLevel.WARN, '****EXPORT ORDERS REQUEST: ' + request.getBody());
		Http http = new Http();
		HttpResponse response = http.send(request);

        System.debug(LoggingLevel.WARN, '****EXPORT ORDERS RESPONSE: ' + response.getBody());
		TextbrokerResponseProcessor.processExportOrderResponse(response, caseId);
	}

	/** Updates the status for the submitted orders in Textbroker's system as exported.
		It should be called after a docx was successfully downloaded to confirm the document was received. **/
	@future(callout=true)
	public static void confirmOrdersExported(List<Id> casesToConfirmIds) {
		HttpRequest request = TextbrokerRequestBuilder.buildConfirmOrdersExportedRequest(casesToConfirmIds);
		Http http = new Http();
		System.debug('****Confirm Orders Exported Request: ' + request.getBody());
		HttpResponse response = http.send(request);

		TextbrokerResponseProcessor.processConfirmOrdersExportedResponse(response);
	}
}