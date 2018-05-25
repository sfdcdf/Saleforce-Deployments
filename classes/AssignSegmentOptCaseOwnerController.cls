public without sharing class AssignSegmentOptCaseOwnerController {

	//public List<Segment_Optimization_Case_Assignment__c> segmentOptOwnerList {get; set;}

	public Segment_Optimization_Case_Assignment__c newSegmentOptCaseAssignment {get; set;}
	public Boolean editMode {get; set;}

	public AssignSegmentOptCaseOwnerController() {
		//segmentOptOwnerList = new List<Segment_Optimization_Case_Assignment__c>();
		//getSegmentOwnerList();
		newSegmentOptCaseAssignment = new Segment_Optimization_Case_Assignment__c();
		editMode = false;
	}

	/*private void getSegmentOwnerList(){
		segmentOptOwnerList = [select Id, Name, OwnerId from Segment_Optimization_Case_Assignment__c order by Name];
	}*/

	public List<Segment_Optimization_Case_Assignment__c> segmentOptOwnerList {
		get{
			if(segmentOptOwnerList == null || segmentOptOwnerList.size() == 0){
				segmentOptOwnerList = new List<Segment_Optimization_Case_Assignment__c>();
				segmentOptOwnerList = [select Id, Name, OwnerId, LastModifiedDate, LastModifiedById from Segment_Optimization_Case_Assignment__c order by Name];
			}
			return segmentOptOwnerList;
		}
		set;
	}

	public void saveNewAssignment(){
		try{
			insert newSegmentOptCaseAssignment;
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.confirm,  newSegmentOptCaseAssignment.Name + ' has been assigned to ' + [select Name from User where Id =: newSegmentOptCaseAssignment.OwnerId].Name);
            ApexPages.addMessage(myMsg);
			newSegmentOptCaseAssignment = new Segment_Optimization_Case_Assignment__c();
			segmentOptOwnerList.clear();
		}catch(Exception E){

		}
	}

	public void saveListChanges(){
		try{
			List<Segment_Optimization_Case_Assignment__c> ownerChangedUpdateList = new List<Segment_Optimization_Case_Assignment__c>();
			Map<Id, Segment_Optimization_Case_Assignment__c> segmentCurrentValueMap = new Map<Id, Segment_Optimization_Case_Assignment__c>([select Id, Name, OwnerId from Segment_Optimization_Case_Assignment__c]);
			for(Segment_Optimization_Case_Assignment__c segAssign : segmentOptOwnerList){
				if(segAssign.OwnerId != segmentCurrentValueMap.get(segAssign.Id).OwnerId){
					ownerChangedUpdateList.add(segAssign);
				}
			}
			update ownerChangedUpdateList;
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.confirm,  'Assignments have been updated!');
            ApexPages.addMessage(myMsg);
		}catch(Exception E){

		}
	}

	public void editAssignments(){
		editMode = !editMode;
		segmentOptOwnerList.clear();
	}
}