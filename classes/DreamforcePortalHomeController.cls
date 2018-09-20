public with sharing class DreamforcePortalHomeController {

    public String clientId {get; set;}
    
    public DreamforcePortalHomeController() {
    
        clientId = apexpages.currentpage().getparameters().get('clientId');
    }

    public PageReference onPageLoad(){
        
    
        return null;
    }
    
    public static String getUserIpAddress() {
    
        string returnValue = '';
        
        returnValue = ApexPages.currentPage().getHeaders().get('True-Client-IP');
        
        if (String.IsBlank(returnValue)) {
        
            returnValue = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
        }
        
        System.Debug('USER IP ADDRESS: ' + returnValue);
        
        return returnValue;
    }
    
    // Class for parsing and validating IP address
    public class IpAddress{
    
        private String sIp; //ip as string
        private Double dIp; //ip as double
    
        private Double ipFromString(){
            String[] elts = sIp.split('\\.');
            return      Double.valueOf(elts[0]) * Math.pow(255, 3) + 
                        Double.valueOf(elts[1]) * Math.pow(255, 2) +
                        Double.valueOf(elts[2]) * Math.pow(255, 1) + //=*255
                        Double.valueOf(elts[3]) * Math.pow(255, 0);  //=*1 
        }
    
        public IpAddress(String ip){
            sIp = ip;
            dIp = this.ipFromString();
        }
    
        public Double asDouble(){
            return dIp;
        }
    
        public Boolean isInRange(IpAddress lowBoundary, IpAddress highBoundary){
            return (this.asDouble() >= lowBoundary.asDouble()) && (this.asDouble() <= highBoundary.asDouble());
        }
    }
}