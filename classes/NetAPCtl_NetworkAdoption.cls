public with sharing class NetAPCtl_NetworkAdoption{
    private final Opportunity opp;
    private Integer count;
    
    public String selectedRow {get;set;}
    //public List<NetworkAdoptionProduct__c> lstNAPs {get;set;}
    public List<netProd> lstNetProds {get;set;}
    
    public NetAPCtl_NetworkAdoption(ApexPages.StandardController con) {
        List<NetworkAdoptionProduct__c> lstNAPs = new List<NetworkAdoptionProduct__c>();
        this.opp = (Opportunity) con.getRecord();        
        system.debug('$$$ opp: ' + opp);
        if(opp.Id!=null){
            lstNAPs = [SELECT Id, Product__c, SalesPrice__c, Quantity__c, AdoptionPct__c, StartDate__c, 
                        AdoptionLen__c, Opportunity__c 
                       FROM NetworkAdoptionProduct__c WHERE Opportunity__c = :opp.Id];
            system.debug('$$$ lstNAPs: ' + lstNAPs);
            this.lstNetProds = new List<netProd>();
            
            if(lstNAPs.size()>0){
                for(Integer x=0; x<lstNAPs.size(); x++){                   
                    this.lstNetProds.add(new netProd(x, lstNAPs[x]));                    
                }
                this.count = lstNAPs.size()-1;   
            } else {
                
                this.count = -1;
                addRow();   
            }
        }        
    }   
    
    public void addRow(){
        Boolean hasError = false;
        
        if(lstNetProds.size()>0){
            Set<String> setProdNames = new Set<String>();
            
            for(netProd np: lstNetProds){
                if(setProdNames.contains(np.nap.Product__c)){
                    np.nap.Product__c.addError('Duplicate product. Please update or remove.');
                    hasError = true;
                } else if(np.nap.AdoptionPct__c > 100){
                    np.nap.AdoptionPct__c.addError('100% max');
                    hasError = true;
                } else {
                    setProdNames.add(np.nap.Product__c);
                }
            }
        }
        
        if(hasError==false){
            count += 1;
            lstNetProds.add(new netProd(count, null));
        }
    }
    
    public void remove(){
        lstNetProds.remove(Integer.valueOf(selectedRow));
        count -= 1;
        if(lstNetProds.size()>0){
            for(Integer x=0; x<lstNetProds.size();x++){
                lstNetProds[x].rowNum = x;
            }
        }
    }
    
    public PageReference createRecords(){
        Boolean hasError = false;
        Set<String> setProdNames = new Set<String>();
        List<NetworkAdoptionProduct__c> lstToInsert = new List<NetworkAdoptionProduct__c>();

        if(lstNetProds.size()>0){                      
            for(netProd np: lstNetProds){
                if(setProdNames.contains(np.nap.Product__c)){
                    np.nap.Product__c.addError('Duplicate product. Please update or remove.');
                    hasError = true;
                } else if(np.nap.AdoptionPct__c > 100){
                    np.nap.AdoptionPct__c.addError('100% max');
                    hasError = true;
                } else {
                    if(np.nap.Opportunity__c==null)  np.nap.Opportunity__c = opp.Id;
                    lstToInsert.add(np.nap);
                    setProdNames.add(np.nap.Product__c);
                }
            }
        }
        
        if(hasError==true)  return null;  
        
        if(lstToInsert.size()>0)  upsert lstToInsert;
        
        PageReference pageRef = new PageReference('/apex/OppResultPage');
        pageref.getParameters().put('id', opp.Id);
        pageref.getParameters().put('msg', 'Adoption Products Created Successfully');
        pageref.getParameters().put('sev', 'confirm');
        pageref.setRedirect(true);
        
        return pageRef;
    }
    
    public PageReference back(){
        PageReference pageRef = new PageReference('/' + opp.Id);
        pageRef.setRedirect(true);
        
        return pageRef;
    }
    
    // Wrapper
    public class netProd{
        public Integer rowNum {get;set;}
        public NetworkAdoptionProduct__c nap {get;set;}
        
        public netProd(Integer rn, NetworkAdoptionProduct__c netProd){
            this.rowNum = rn;
            
            if(netProd==null)  this.nap = new NetworkAdoptionProduct__c();
            else  this.nap = netProd;
        }
    }
    
    public PageReference resultMsg() {
        String strMsg_MissingId = 'Missing Id';
        String oid = ApexPages.currentPage().getParameters().get('id');
        String strMessage = ApexPages.currentPage().getParameters().get('msg');
        String strSeverity = ApexPages.currentPage().getParameters().get('sev');
        
        if(oid==null){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, strMsg_MissingId));    
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