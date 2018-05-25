public class CaseCtl_MultiRequest{
    
    private final Case parCase;
        
    //private ybnRequest child {get;set;}
    public List<Case> lstOldCases {get;private set;}
    public List<ybnRequest> lstRequests {get;set;}
    public String selectedRow {get;set;}
    public Integer count;
    
    // Constructor   
    public CaseCtl_MultiRequest(ApexPages.StandardController stdCon){       
        List<String> lstFields = new List<String>{'CaseNumber', 'Subject', 'Description', 'Account.Name', 'AccountId'};
        stdCon.addFields(lstFields);
        
        this.parCase = (Case) stdCon.getRecord();
        //this.child = new ybnRequest(0);
        this.lstOldCases = new List<Case>();
        this.lstRequests = new List<ybnRequest>();
        this.selectedRow = '';
        this.count = 0;
        addRow();
    }
    // Wrapper Class
    public class ybnRequest{
        public Integer rowNum {get;set;}
        public Boolean closeCase {get;set;}
        public Attachment rowAtt {get;set;}
        public Case newCase {get;set;}
        
        public ybnRequest(Integer rowNum){
            Id rtYbnRequest = Utilities.GetRecTypeId('Case', 'YBN Request');
            this.rowNum = rowNum;
            this.closeCase = false;
            this.rowAtt = new Attachment();
            this.newCase = new Case();
            this.newCase.RecordTypeId = rtYbnRequest;
            this.newCase.Priority = 'Major';
        }
    }
    
    public Case getParent(){
        return parCase;
    }
    
    public List<Case> getExistingCases(){
        if(parCase.Id==null){
            return null;
        } else {        
            return [SELECT Id, CaseNumber, Status, Type, Reason, Priority, YBNRequestReason__c, YBNRequestDetail__c, Description
                FROM Case WHERE ParentId =: parCase.Id];
        }
    }   
    
    public void add(){ 
        count += 1;               
        addRow();       
    }
    
    public void addRow(){    
        // Clear attachments to avoid view state limit.  Attachments should be added after all cases have been created.
        for(ybnRequest req: lstRequests){
                if(req.rowAtt.body!=null)  req.rowAtt = new Attachment();
        }
                
        ybnRequest yr = new ybnRequest(count);
        lstRequests.add(yr);
    }
    
    public void remove(){
        lstRequests.remove(Integer.valueOf(selectedRow));
        count -= 1;
        if(lstRequests.size()>0){
            for(Integer x=0; x<lstRequests.size();x++){
                lstRequests[x].rowNum = x;
            }
        }
    }
    
    public PageReference createCases() {      
        Database.DMLOptions dmo = new Database.DMLOptions();
        dmo.AssignmentRuleHeader.useDefaultRule = true;
        
        Set<String> setNotReasons = new Set<String>{'Billing/Finance'};
        Set<String> setNotDetails = new Set<String>{'Credit Approval', 'Refund Approval'};
        List<Case> lstNewCases = new List<Case>();
        Map<Integer, Attachment> mapAtts = new Map<Integer, Attachment>();
        
        for(ybnRequest yr: lstRequests){
            system.debug('$$$ case: ' + yr);
            yr.newCase.ParentId = parCase.Id;
            yr.newCase.AccountId = parCase.AccountId;
            yr.newCase.Subject = yr.newCase.Type + ' - ' + yr.newCase.YBNRequestReason__c + ' / ' + yr.newCase.YBNRequestDetail__c;
            yr.newCase.ApexCaseUpdate__c = system.now();
            if(yr.closeCase==true && yr.newCase.Type!='Work Item')  yr.newCase.Status = 'Closed';
            
            if(yr.newCase.Type=='Work Item' 
            && !(setNotReasons.contains(yr.newCase.YBNRequestReason__c) && setNotDetails.contains(yr.newCase.YBNRequestDetail__c)))
            {
                yr.newcase.setOptions(dmo);
            }
            
            lstNewCases.add(yr.newCase);
            
            if(yr.rowAtt.body!=null){
                Attachment newAtt = yr.rowAtt.clone(false, false);
                mapAtts.put(yr.rowNum, newAtt); 
                yr.rowAtt = new Attachment();
            }          
        }
            
        insert lstNewCases;
        
        if(mapAtts.size()>0){
            for(Integer x: mapAtts.keySet()){      
                mapAtts.get(x).parentId = lstNewCases[x].Id;
            }
                
            insert mapAtts.values();
        }

        PageReference pageRef = new PageReference('/apex/CaseResultPage');
        pageref.getParameters().put('id', parCase.Id);
        pageref.getParameters().put('msg', 'Cases Created Successfully');
        pageref.getParameters().put('sev', 'confirm');
        pageref.setRedirect(true);
        
        return pageRef;
    }
}