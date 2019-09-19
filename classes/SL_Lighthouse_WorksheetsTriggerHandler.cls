/**  
* \arg ClassName        : SL_Lighthouse_WorksheetsTriggerHandler
* \arg JIRATicket       : YODLET-1
* \arg CreatedOn        : 07/29/2015
* \arg LastModifiedOn   : 07/29/2015
* \arg CreatededBy      : Sathya
* \arg ModifiedBy       : 
* \arg Description      : Handler class for Lighthouse_Worksheets object.
*/
global class SL_Lighthouse_WorksheetsTriggerHandler extends SL_TriggerHandlerBase {

	public override void beforeInsert(List<SObject> newListGeneric){
		List<Lighthouse_Worksheets__c> newList = (List<Lighthouse_Worksheets__c>) newListGeneric;
		/*BEFORE INSERT METHODS START*/
		collectUpdatedLightHouseRecs(newList);
		/*BEFORE INSERT METHODS END*/
	}
	
	public override void beforeUpdate(Map<Id, SObject> oldMapGeneric, Map<Id, SObject> newMapGeneric){
		Map<Id, Lighthouse_Worksheets__c> oldMap = (Map<Id, Lighthouse_Worksheets__c>) oldMapGeneric;
		Map<Id, Lighthouse_Worksheets__c> newMap = (Map<Id, Lighthouse_Worksheets__c>) newMapGeneric;
		/*BEFORE UPDATE METHODS START*/
		collectUpdatedLightHouseRecs(newMap.values());
		/*BEFORE UPDATE METHODS END*/
	}
	
	public override void beforeDelete(Map<Id, SObject> oldMapGeneric){
		Map<Id, Lighthouse_Worksheets__c> oldMap = (Map<Id, Lighthouse_Worksheets__c>) oldMapGeneric;
		/*BEFORE DELETE METHODS START*/
		collectUpdatedLightHouseRecs(oldMap.values());
		/*BEFORE DELETE METHODS END*/
	}
	
	public override void afterInsert(Map<Id, SObject> newMapGeneric){
		Map<Id, Lighthouse_Worksheets__c> newMap = (Map<Id, Lighthouse_Worksheets__c>) newMapGeneric;
		/*AFTER INSERT METHODS START*/
		
		/*AFTER INSERT METHODS END*/
	}
	
	public override void afterUpdate(Map<Id, SObject> oldMapGeneric, Map<Id, SObject> newMapGeneric){
		Map<Id, Lighthouse_Worksheets__c> oldMap = (Map<Id, Lighthouse_Worksheets__c>) oldMapGeneric;
		Map<Id, Lighthouse_Worksheets__c> newMap = (Map<Id, Lighthouse_Worksheets__c>) newMapGeneric;
		/*AFTER UPDATE METHODS START*/
		
		/*AFTER UPDATE METHODS END*/
	}
	
	public override void afterDelete(Map<Id, SObject> oldMapGeneric){
		Map<Id, Lighthouse_Worksheets__c> oldMap = (Map<Id, Lighthouse_Worksheets__c>) oldMapGeneric;
		/*AFTER DELETE METHODS START*/
		
		/*AFTER DELETE METHODS END*/
	}
	
	public override void afterUndelete(Map<Id, SObject> newMapGeneric){
		Map<Id, Lighthouse_Worksheets__c> newMap = (Map<Id, Lighthouse_Worksheets__c>) newMapGeneric;
		/*AFTER UNDELETE METHODS START*/
		
		/*AFTER UNDELETE METHODS END*/
	}
	
	private void collectUpdatedLightHouseRecs(List<Lighthouse_Worksheets__c> lstNewLightHouse)
	{
		Set<Id> casesToProcess = new Set<Id>();
        // Itrating over new 'Lighthouse Worksheets' records to collect whose status Equals to "Complete"
        for(Lighthouse_Worksheets__c l : lstNewLightHouse){
          if(l.Status__c == 'Complete' && l.Case__c != null)
            casesToProcess.add(l.Case__c);
        }

        // Calling this method to update the 'Lighthouse Worksheets' related Parent_case.Status
        SL_CaseHandler.closeOut(casesToProcess);
	}
}