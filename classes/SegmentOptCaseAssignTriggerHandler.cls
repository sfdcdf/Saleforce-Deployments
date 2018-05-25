public without sharing class SegmentOptCaseAssignTriggerHandler {

	private static Id optimizationRTID = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Optimization').getRecordTypeId();
	private static Set<String> wbnClientTypeSet = new Set<String>{'YBN', 'National Account', 'National Master Account'};
	private static Set<String> segmentSet {
		get{
			segmentSet = new Set<String>();
			for(Segment_Optimization_Case_Assignment__c record : [select Name from Segment_Optimization_Case_Assignment__c]){
				segmentSet.add(record.Name);
			}
			return segmentSet;
		}
	}

	public static void beforeInsert(List<Segment_Optimization_Case_Assignment__c> newList){
		for(Segment_Optimization_Case_Assignment__c record : newList){
			if(segmentSet.contains(record.Name)){
				record.Name.addError('Segment is already in the system. Please update the owner in the current record.');
			}else{
				segmentSet.add(record.Name);
			}
		}
	}

	public static void afterInsert(Map<Id, Segment_Optimization_Case_Assignment__c> newMapValue){
		updateOptimizationCaseOwners(newMapValue.values());
	}

	public static void beforeUpdate(Map<Id, Segment_Optimization_Case_Assignment__c> newMapValue, Map<Id, Segment_Optimization_Case_Assignment__c> oldMapValue){

	}

	public static void afterUpdate(Map<Id, Segment_Optimization_Case_Assignment__c> newMapValue, Map<Id, Segment_Optimization_Case_Assignment__c> oldMapValue){
		List<Segment_Optimization_Case_Assignment__c> changedOwnerOptimizationList = new List<Segment_Optimization_Case_Assignment__c>();
		for(Segment_Optimization_Case_Assignment__c record : newMapValue.values()){
			Segment_Optimization_Case_Assignment__c oldRecord = (Segment_Optimization_Case_Assignment__c)oldMapValue.get(record.Id);
			if(record.OwnerId != oldRecord.OwnerId){
				changedOwnerOptimizationList.add(record);
			}
		}

		if(!changedOwnerOptimizationList.isEmpty()){
			updateOptimizationCaseOwners(changedOwnerOptimizationList);
		}
	}

	public static void updateOptimizationCaseOwners(List<Segment_Optimization_Case_Assignment__c> optCaseList){
		Map<String, Id> segmentOwnerIdMap = new Map<String, Id>();
		for(Segment_Optimization_Case_Assignment__c record : optCaseList){
			segmentOwnerIdMap.put(record.Name, record.OwnerId);
		}

		List<Case> updateCaseOwnerList = new List<Case>();
		for(Case record : [select Id, OwnerId, Partner_Segment__c, Client_Type__c from Case where RecordTypeId = : optimizationRTID and IsClosed = false and Partner_Segment__c in : segmentOwnerIdMap.keySet() and Client_Type__c != '' and Client_Type__c not in : wbnClientTypeSet and CALENDAR_YEAR(CreatedDate) >= 2017]){
			record.OwnerId = segmentOwnerIdMap.get(record.Partner_Segment__c);
			updateCaseOwnerList.add(record);
		}
		if(!updateCaseOwnerList.isEmpty()){
			//Database.update(updateCaseOwnerList, false);
			update updateCaseOwnerList;
		}
	}

	/*private void validateSegmentName(List<Segment_Optimization_Case_Assignment__c> segOwnerList){

	}*/

}