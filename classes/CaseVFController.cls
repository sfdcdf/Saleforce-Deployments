public class CaseVFController {
    private final Case c;
    
    public final String MSG_MISSING_ID = 'Missing Case Id.';
    public final String MSG_ALREADY_CLONED = 'Case has already been cloned.';
    public final String MSG_NOT_CLOSED = 'Case has to be closed.';
    public final String MSG_PROCESSED = 'Multi-Location case clone process has been executed.';
    
    // Constructor   
    public CaseVFController(ApexPages.StandardController con){
        this.c = (Case)con.getRecord();
    }
    
    /***
    @Name       : cloneCase
    @Created    : Ron Gong, 12/22/2015
    @Description: VFPage method to clone cases across multiple location accounts
    @Modification History :
    Subba , for YO-65510 , 7/5/2017 : To Handle the Status 'Completed - Client Declined'
    ***/
    public PageReference cloneCase() {
        String cid = ApexPages.currentPage().getParameters().get('id');
        Set<String> setStatus = new Set<String>{'Completed', 'Incomplete after 2nd Attempt', 'Completed on Callback','Completed - Client Declined'};
        
        if(cid==null){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, MSG_MISSING_ID));    
            return null;
        } else if(!setStatus.contains(c.Status)){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, MSG_NOT_CLOSED));    
            return null;
        } else if(c.Apex_Case_Cloned__c){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, MSG_ALREADY_CLONED));    
            return null;
        }
        
        //CaseMethods.cloneCaseToMultiLoc(new Set<Id>{c.Id});
        Database.executeBatch(new CaseBatch_ClonePrimaryMLO(new Set<Id>{c.Id}), 50);
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Confirm, MSG_PROCESSED)); 
        return null;
    }
    
}