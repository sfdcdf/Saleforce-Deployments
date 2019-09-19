/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
*/

public class CaseCtl_ResultPage{
    Integer i1 = 1; 
    Integer i2 = 1; 
    Integer i3 = 1; 
    Integer i4 = 1; 
    Integer i5 = 1; 
    Integer i6 = 1; 
    Integer i7 = 1; 
    Integer i8 = 1; 
    Integer i9 = 1; 
    Integer i10 = 1; 
    /*
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
    }*/
}