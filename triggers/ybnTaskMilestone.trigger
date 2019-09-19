trigger ybnTaskMilestone on Task (before insert, before update) {

	String milestoneField			= 'Milestone__c';
	String milestoneShortField		= 'Modified_Milestone__c';
	Integer milestoneShortLength 	= 4;
	
	for (Task t : trigger.new) {
	
		// Only continue if there is a milestone value
		if (t.get(milestoneField) == null) continue;
	
		// Update the short milestone field with the first 'milestoneShortLength' chars on the long milestone field
		String milestone = ((String) t.get(milestoneField)).left(milestoneShortLength);
		t.put(milestoneShortField, milestone);
	}	
	
}