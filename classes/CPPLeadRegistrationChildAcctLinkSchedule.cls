global class CPPLeadRegistrationChildAcctLinkSchedule implements Schedulable {
	global void execute(SchedulableContext sc) {
		CPPLeadRegistrationChildAccountLinkBatch b = new CPPLeadRegistrationChildAccountLinkBatch();
		database.executebatch(b, 2000);
	}
}