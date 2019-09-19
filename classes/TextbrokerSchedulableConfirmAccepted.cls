/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
/*
 * Confirms that orders was accepted. And order is considered accepted when the case status
 * changes to 'Work Completed'
 *
 * To run it every hour execute the following as Anonymous:
		System.schedule('Textbroker - Confirm Accepted Orders', '0 0 * * * ?', new TextbrokerSchedulableConfirmAccepted());
 */
global with sharing class TextbrokerSchedulableConfirmAccepted implements Schedulable {
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
		/* Orders will be accepted by default.
		List<Id> organicSetupRecordTypeId = TextbrokerHelper.getorganicSetupRecordTypeId();
		Map<Id, Case> acceptedCases = new Map<Id, Case>([select Id from Case 
											where RecordTypeId in :organicSetupRecordTypeId 
											and Status = 'Work Completed' 
											and CopyConfirmedAccepted__c = false]);
		
		TextbrokerDispatcher.acceptCasesFuture(new List<ID>(acceptedCases.KeySet()));
		*/
	}
}