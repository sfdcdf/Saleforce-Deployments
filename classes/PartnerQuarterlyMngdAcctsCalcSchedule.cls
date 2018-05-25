public class PartnerQuarterlyMngdAcctsCalcSchedule implements Schedulable {
	public void execute(SchedulableContext sc) {
		PartnerQuarterlyManagedAccountsCalc b = new PartnerQuarterlyManagedAccountsCalc();
		database.executebatch(b);
	}
}