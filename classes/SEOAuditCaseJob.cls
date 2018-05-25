global class SEOAuditCaseJob implements Schedulable {
	global void execute(SchedulableContext sc) {
		System.debug('SCHEDULE JOB');
		SEOAuditCaseBatch b = new SEOAuditCaseBatch();
		Database.executebatch(b);
	}
}