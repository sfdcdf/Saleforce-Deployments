/*
 * Checks for orders that need to be transferred. In case the transfer from the trigger failed.
 *
 * To run it every hour execute the following as Anonymous:
 		System.schedule('Textbroker - Create Orders', '0 0 * * * ?', new TextbrokerSchedulableCreateOrders());
 */
global with sharing class TextbrokerSchedulableCreateOrders implements Schedulable {

	global void execute(SchedulableContext sc) {
		List<Id> organicSetupRecordTypeId = TextbrokerHelper.getorganicSetupRecordTypeId();
		Id textbrokerUserId = TextbrokerHelper.getTextbrokerUserId();

		//We consider that the order is ready when the owner is Textbroker, but the TextbrokerId is not populated

        // abrosius@soliantconsulting.com 2013Nov26: added more validation to match TextbrokerDispatcher.processTextbrokerTrigger()
        // and support for new CopyStatus__c field
        Map<Id, Case> casesToTransferMap = new Map<Id, Case>(
            [   SELECT  Id
                FROM    Case
                WHERE   OwnerId = :textbrokerUserId
                AND     RecordTypeId in :organicSetupRecordTypeId
                AND     CopyProviderId__c = NULL
                AND     Account.Name != NULL
                AND     Client_ID__c != NULL
                AND     taskId__c != NULL
                //AND     CaseNumber != NULL            // this field is defaulted
                //AND     Number_of_Pages__c != NULL    // this is a formula field
                AND     Country__c != NULL
                AND     CopyStatus__c = 'New Order'                 // TEXTBROKER-28
            ]);

		if (! casesToTransferMap.isEmpty()) {
            TextbrokerDispatcher.createOrdersFuture(new List<Id>(casesToTransferMap.keySet()));
        }
	}

}