public class CaseAutomateCSCSchedule implements Schedulable {
	public void execute(SchedulableContext sc) {
		CaseAutomateCSCBatch b = new CaseAutomateCSCBatch();
		database.executebatch(b, 50);
	}
}