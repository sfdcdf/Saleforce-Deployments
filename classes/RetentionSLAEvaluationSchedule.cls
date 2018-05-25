public class RetentionSLAEvaluationSchedule implements Schedulable {
	public void execute(SchedulableContext sc) {
		RetentionSLAEvaluationBatch b = new RetentionSLAEvaluationBatch();
		database.executebatch(b);
	}
}