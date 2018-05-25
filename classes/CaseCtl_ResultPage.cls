public class CaseCtl_ResultPage{
    private final Case c;
    public final String MSG_MISSING_ID = 'Missing Case Id.';
       
    // Constructor   
    public CaseCtl_ResultPage(ApexPages.StandardController con){
        this.c = (Case)con.getRecord();
    }
    
    public PageReference resultMsg() {
        String cid = ApexPages.currentPage().getParameters().get('id');
        String strMessage = ApexPages.currentPage().getParameters().get('msg');
        String strSeverity = ApexPages.currentPage().getParameters().get('sev');
        
        if(cid==null){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, MSG_MISSING_ID));    
            return null;
        } else if(strMessage!=''){
            if(strSeverity=='confirm'){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Confirm, strMessage)); 
            } else if(strSeverity=='error'){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, strMessage)); 
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, strMessage)); 
            }               
            return null;
        } 
        
        return null;
    }
}