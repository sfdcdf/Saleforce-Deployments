/***
@Name       : CaseBatch_ClonePrimaryMLO
@Created    : Ron Gong, 01/03/2016
@Description: Batch class to insert the clone(s) of the primary MLO case.
***/
public class CaseBatch_ClonePrimaryMLO implements Database.Batchable<Case>{
    private Set<Id> setCaseIds;
    
    public CaseBatch_ClonePrimaryMLO(Set<Id> caseIds){
        this.setCaseIds = caseIds;
    }

    public Iterable<Case> start(Database.batchableContext BC){
        return new CaseItable_ClonePrimaryMLO(setCaseIds);
    }
    
    public void execute(Database.BatchableContext BC, List<Case> scope){
        insert scope;
    }
    
    public void finish(Database.BatchableContext BC){
        List<Case> lstCases = new List<Case>();
        for(Case c: [SELECT Id, Apex_Case_Cloned__c FROM Case WHERE Id IN :setCaseIds]){
            c.Apex_Case_Cloned__c = True;
            lstCases.add(c);
        }
        
        if(lstCases.size()>0) update lstCases;
    }
}