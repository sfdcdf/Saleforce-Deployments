/**  
* \arg ClassName        : SL_Organic_AnalysisTriggerHandler
* \arg JIRATicket       : YODLET-1
* \arg CreatedOn        : 07/29/2015
* \arg LastModifiedOn   : 07/29/2015
* \arg CreatededBy      : Sathya
* \arg ModifiedBy       : 
* \arg Description      : Handler class for Organic_Analysis object.
*/
global class SL_Organic_AnalysisTriggerHandler extends SL_TriggerHandlerBase {

    public override void beforeInsert(List<SObject> newListGeneric){
        List<Organic_Analysis__c> newList = (List<Organic_Analysis__c>) newListGeneric;
        /*BEFORE INSERT METHODS START*/
        collectUpdatedOrganicRecs(newList);
        /*BEFORE INSERT METHODS END*/
    }
    
    public override void beforeUpdate(Map<Id, SObject> oldMapGeneric, Map<Id, SObject> newMapGeneric){
        Map<Id, Organic_Analysis__c> oldMap = (Map<Id, Organic_Analysis__c>) oldMapGeneric;
        Map<Id, Organic_Analysis__c> newMap = (Map<Id, Organic_Analysis__c>) newMapGeneric;
        /*BEFORE UPDATE METHODS START*/
        collectUpdatedOrganicRecs(newMap.values());
        /*BEFORE UPDATE METHODS END*/
    }
    
    public override void beforeDelete(Map<Id, SObject> oldMapGeneric){
        Map<Id, Organic_Analysis__c> oldMap = (Map<Id, Organic_Analysis__c>) oldMapGeneric;
        /*BEFORE DELETE METHODS START*/
        collectUpdatedOrganicRecs(oldMap.values());
        /*BEFORE DELETE METHODS END*/
    }
    
    public override void afterInsert(Map<Id, SObject> newMapGeneric){
        Map<Id, Organic_Analysis__c> newMap = (Map<Id, Organic_Analysis__c>) newMapGeneric;
        /*AFTER INSERT METHODS START*/
        
        /*AFTER INSERT METHODS END*/
    }
    
    public override void afterUpdate(Map<Id, SObject> oldMapGeneric, Map<Id, SObject> newMapGeneric){
        Map<Id, Organic_Analysis__c> oldMap = (Map<Id, Organic_Analysis__c>) oldMapGeneric;
        Map<Id, Organic_Analysis__c> newMap = (Map<Id, Organic_Analysis__c>) newMapGeneric;
        /*AFTER UPDATE METHODS START*/
        
        /*AFTER UPDATE METHODS END*/
    }
    
    public override void afterDelete(Map<Id, SObject> oldMapGeneric){
        Map<Id, Organic_Analysis__c> oldMap = (Map<Id, Organic_Analysis__c>) oldMapGeneric;
        /*AFTER DELETE METHODS START*/
        
        /*AFTER DELETE METHODS END*/
    }
    
    public override void afterUndelete(Map<Id, SObject> newMapGeneric){
        Map<Id, Organic_Analysis__c> newMap = (Map<Id, Organic_Analysis__c>) newMapGeneric;
        /*AFTER UNDELETE METHODS START*/
        
        /*AFTER UNDELETE METHODS END*/
    }
    
    private void collectUpdatedOrganicRecs(List<Organic_Analysis__c> newList) {
        Set<Id> casesToProcess = new Set<Id>();
        // Itrating over new 'Orgnaic Anlysis' records to collect whose status contains "Closed"
        for(Organic_Analysis__c o : newList) {
            if(o.Status__c.contains('Closed') && o.Case_URL__c != null)
                casesToProcess.add(o.Case_URL__c);  
        }
        
        // Calling this method to update the 'Orgnaic Anlysis' related Parent_case.Status
        SL_CaseHandler.closeOut(casesToProcess);
    }
     
}