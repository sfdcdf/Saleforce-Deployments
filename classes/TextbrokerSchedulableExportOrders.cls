/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
/*
 *
 * Exports (retrieve sthe Word document) of ready orders in Textbroker's system.
 *
 * To run it every 15 minutes execute the following as Anonymous:
 		System.schedule('Textbroker - Export Orders 1', '0 0 * * * ?', new TextbrokerSchedulableExportOrders());
 		System.schedule('Textbroker - Export Orders 2', '0 15 * * * ?', new TextbrokerSchedulableExportOrders());
 		System.schedule('Textbroker - Export Orders 3', '0 30 * * * ?', new TextbrokerSchedulableExportOrders());
 		System.schedule('Textbroker - Export Orders 4', '0 45 * * * ?', new TextbrokerSchedulableExportOrders());
 */
global with sharing class TextbrokerSchedulableExportOrders implements Schedulable {
    Integer i1 = 1; 
    Integer i2 = 1; 
    Integer i3 = 1; 
    Integer i4 = 1; 
    Integer i5 = 1; 
    Integer i6 = 1; 
    Integer i7 = 1; 
    Integer i8 = 1; 
    Integer i9 = 1; 
    Integer i10 = 1; 

	global void execute(SchedulableContext sc) {
        // check limits in total concurrent batches (5) and do not run if this batch class is already queued to run
		/*if(TextbrokerHelper.getActiveAndQueudedBatchJobs() < 5 && ! TextbrokerHelper.getIsActiveOrQueuedForBatchClass('TextbrokerBatchExportOrders')) {

            TextbrokerBatchExportOrders batch = new TextbrokerBatchExportOrders();

            if (Test.isRunningTest()) {
                batch.query = batch.query + ' LIMIT 1'; // limit to 1 run during tests
            }

            // schedule the export order process to run in batches
            Database.executeBatch(batch, 1); // limit to 1 to avoid callout/DML chaining limits
		}*/
	}
}