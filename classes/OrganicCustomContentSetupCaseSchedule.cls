public class OrganicCustomContentSetupCaseSchedule implements Schedulable {
	public void execute(SchedulableContext sc) {
		OrganicCustomContentSetupCaseBatch b = new OrganicCustomContentSetupCaseBatch();
		database.executebatch(b, 50);
	}
}