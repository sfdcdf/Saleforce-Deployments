global class DeleteNoneAccountMarketoActivitySchedule implements Schedulable {
	global void execute(SchedulableContext sc) {
		Database.executeBatch(new DeleteNoneAccountMarketoActivityBatch());
	}
}