public class AccountMarketoActivitySchedule implements Schedulable {

	DateTime dateTimeParameter;

	public AccountMarketoActivitySchedule(){//(DateTime sinceDateTime){
		dateTimeParameter = DateTime.now().addHours(-2); //= sinceDateTime;
	}

	public void execute(SchedulableContext sc) {
		System.enqueueJob(new AccountMarketoActivityQueueable(dateTimeParameter, ''));
	}
}