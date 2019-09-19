public with sharing class SL_CaseHandler {
	public SL_CaseHandler() {
		
	} 

	public static void closeOut(Set<Id> casesToProcess){
		for(Case c: [SELECT Id, ParentId 
    					FROM Case 
    					WHERE (NOT Status like 'Closed%') 
    					AND ParentId in :casesToProcess])
    	{
    		casesToProcess.remove(c.ParentId);
    	}

    	for(Lighthouse_Worksheets__c l: [SELECT Id, Case__c 
    					FROM Lighthouse_Worksheets__c 
    					WHERE Status__c != 'Complete'
    					AND	Status__c != 'Delete Case'
    					AND Case__c in :casesToProcess])
    	{
    		casesToProcess.remove(l.Case__c);
    	}


    	for(Organic_Analysis__c o: [SELECT Id, Case_URL__c 
			    					FROM Organic_Analysis__c 
			    					WHERE (NOT Status__c like 'Closed%')
			    					AND	Status__c != 'Delete Case'
			    					AND Case_URL__c in :casesToProcess])
    	{
    		casesToProcess.remove(o.Case_URL__c);
    	}

    	List<Case> caseObjToProcess = [SELECT Id, Status FROM Case WHERE Id in :CasesToProcess AND IsClosed = false];
    	for(Case c :caseObjToProcess){
    		c.Status = 'All Work Completed – Contact Client';
    	}
    	update caseObjToProcess;
	}
}