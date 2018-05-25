/*
 * Checks for ready orders (orders to be retrieved) in Textbroker's system.
 *
 * To run it every hour execute the following as Anonymous:
 		System.schedule('Textbroker - Check Ready Orders', '0 0 * * * ?', new TextbrokerSchedulableCheckReadyOrders());
 */
global with sharing class TextbrokerSchedulableCheckReadyOrders implements Schedulable {

	global void execute(SchedulableContext sc) {
		//Query Textbroker system for ready orders. This will set the the CopyStatus__c
		// field to 'Document Ready' for those cases that are ready.
		TextbrokerDispatcher.checkReadyOrders();
	}

}