trigger ybnEventMilestone on Event (before insert, before update) {
	String milestoneField			= 'Milestone__c';
	String milestoneShortField		= 'Modified_Milestone__c';
	Integer milestoneShortLength 	= 4;
	
	for (Event e : trigger.new) {
	
		// Only continue if there is a milestone value
		if (e.get(milestoneField) == null) continue;
	
		// Update the short milestone field with the first 'milestoneShortLength' chars on the long milestone field
		String milestone = ((String) e.get(milestoneField)).left(milestoneShortLength);
		e.put(milestoneShortField, milestone);
	}	
}