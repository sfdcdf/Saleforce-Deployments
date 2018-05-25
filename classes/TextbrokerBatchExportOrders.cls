/**
 * Batch class to perform callout to Textbroker to fetch ("export")
 * completed Word documents and attach them to their associate Case
 * record.  Always call with batch size of 10 or below to avoid
 * callout limits
 *
 * @author  Artie Brosius, abrosius@soliantconsulting.com
 * @date    2013-11-27
*/
global class TextbrokerBatchExportOrders implements Database.Batchable<sObject>, Database.AllowsCallouts {

	global String query =   'SELECT     Id ' +
                            'FROM       Case ' +
                            'WHERE      CopyStatus__c = \'Document Ready\' ';

	global Database.QueryLocator start(Database.BatchableContext BC) {
		return doStart(BC);
	}

    @testVisible
    private Database.QueryLocator doStart(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }

   	global void execute(Database.BatchableContext BC, List<Case> scope) {
	   doExecute(scope);
	}

    @testVisible
    private void doExecute(List<Case> scope) {
        // export one at a time
        for (Case c : scope) {
            TextbrokerDispatcher.exportOrder(c.Id);
        }
    }

	global void finish(Database.BatchableContext BC) {

	}

}