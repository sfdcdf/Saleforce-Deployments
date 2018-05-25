@isTest
private class AssignSegmentOptCaseOwnerControllerTest {
	
	@isTest static void test_AssignSegmentOptCaseOwnerController() {
		Segment_Optimization_Case_Assignment__c segAssign = new Segment_Optimization_Case_Assignment__c();
		segAssign.Name = 'Dentist';
		segAssign.OwnerId = [select Id from User where IsActive = true and Profile.Name = 'System Administrator' and Id != :UserInfo.getUserId() limit 1].Id;
		insert segAssign;

		Test.startTest();
		Test.setCurrentPage(Page.AssignSegmentOptimizationCaseOwner);

		AssignSegmentOptCaseOwnerController contr = new AssignSegmentOptCaseOwnerController();
		List<Segment_Optimization_Case_Assignment__c> segList = contr.segmentOptOwnerList;

		contr.newSegmentOptCaseAssignment.Name = 'DEFAULT';
		contr.newSegmentOptCaseAssignment.OwnerId = segAssign.OwnerId;
		contr.saveNewAssignment();

		contr.editAssignments();

		contr.segmentOptOwnerList[0].OwnerId = UserInfo.getUserId();
		contr.saveListChanges();
		Test.stopTest();
	}
	
}