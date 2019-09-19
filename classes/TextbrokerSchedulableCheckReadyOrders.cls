/*/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
 * Checks for ready orders (orders to be retrieved) in Textbroker's system.
 *
 * To run it every hour execute the following as Anonymous:
        System.schedule('Textbroker - Check Ready Orders', '0 0 * * * ?', new TextbrokerSchedulableCheckReadyOrders());
 */
global with sharing class TextbrokerSchedulableCheckReadyOrders implements Schedulable {
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
        //Query Textbroker system for ready orders. This will set the the CopyStatus__c
        // field to 'Document Ready' for those cases that are ready.
        //TextbrokerDispatcher.checkReadyOrders();
    }

}