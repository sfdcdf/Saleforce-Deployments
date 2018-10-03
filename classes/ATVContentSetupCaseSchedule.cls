public class ATVContentSetupCaseSchedule implements Schedulable {
    public void execute(SchedulableContext sc) {
        ATVContentSetupCaseBatch b = new ATVContentSetupCaseBatch();
        database.executebatch(b, 50);
    }
}