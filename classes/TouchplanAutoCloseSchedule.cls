global class TouchplanAutoCloseSchedule implements Schedulable {
	global void execute(SchedulableContext sc) {
		TouchplanAutoCloseBatch b = new TouchplanAutoCloseBatch();
		database.executebatch(b, 500);
	}
}