/***
@Name       : CaseItable_ClonePrimaryMLO
@Created    : Ron Gong, 01/03/2016
@Description: Iterable class to call the custom iterator.  Pass set as parameter.
***/
global class CaseItable_ClonePrimaryMLO implements Iterable<Case>{
    Set<Id> setCaseIds;
    
    public CaseItable_ClonePrimaryMLO(Set<Id> setCaseIds){
        this.setCaseIds = setCaseIds;
    }
    
    global Iterator<Case> Iterator(){
        return new CaseItor_ClonePrimaryMLO(setCaseIds);
    }
}