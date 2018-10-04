public without sharing class DreamforcePortalHomeController {

    public String clientId {get; set;}
    public String accountId {get; set;}
    public String accountName {get; set;}
    public String userIPAddress {get; set;}
    public String errRedirURL {get; set;}
    public Boolean setRedirectTrue {get; set;}
    
    public DreamforcePortalHomeController() {
    
        clientId = apexpages.currentpage().getparameters().get('clientId');
    }

    public PageReference onPageLoad(){
        
        if(clientId.trim().length() < 1){
            setRedirectTrue = true;
        }
        else{
            setRedirectTrue = false;
        }
        
        // get Salesforce Account Id based on Client Id from method
        getAccountIdByClientId(clientId);
        
        // get IP address of user viewing page
        getUserIpAddress();
        
        System.Debug('*** Client Id: ' + clientId);
        System.Debug('*** Account Id: ' + accountId);
        System.Debug('*** Account Name: ' + accountName);
        System.Debug('*** User IP Address: ' + userIPAddress);
        
        // if client Id is invalid
        if(setRedirectTrue){
            
            errRedirURL = 'https://dreamforce-yodle.cs25.force.com/dfPortal/DreamforcePortalCustomErr';
        
            // redirect to errorpage
            PageReference retURL = new PageReference(errRedirURL);
            retURL.setRedirect(true);
            
            return retURL;
        }
        
        return null;
    }
    
    // method to return Salesforce Account Id based on the Client Id passed
    public void getAccountIdByClientId(String clientIdParam){
    
        accountId = [SELECT Id FROM Account WHERE Client_ID__c = :clientIdParam LIMIT 1].Id;
        accountName = [SELECT Name FROM Account WHERE Id = :accountId LIMIT 1].Name;
        
        if(String.isBlank(accountId)){
            accountId = '';
            accountName = '';
        }
    }
    
    // method to return JSON response of Account Details
    public static String getAccountDetails(){
    
        String clientId = apexpages.currentpage().getparameters().get('clientId');
        String accountId = [SELECT Id FROM Account WHERE Client_ID__c = :clientId LIMIT 1].Id;
    
        // return JSON for API client UI
        return JSON.serialize( 
            [SELECT Id,
                    Client_Id__c,
                    Name,
                    RecordType.Name,
                    IMS_Rep__r.Name,
                    Client_Type__c,
                    Sales_Person__c,
                    Product_Type_Transactional__c
               FROM Account
              WHERE Id = :accountId
              LIMIT 1]);
    }
    
    // method to return JSON response of Case List based on Account Id
    public static String getAccountCaseList(){
    
        String clientId = apexpages.currentpage().getparameters().get('clientId');
        String accountId = [SELECT Id FROM Account WHERE Client_ID__c = :clientId LIMIT 1].Id;
    
        // return JSON for API client UI
        return JSON.serialize( 
            [SELECT Id,
                    CaseNumber,
                    RecordType.Name,
                    Account.Name,
                    Owner.Name,
                    Subject,
                    Status,
                    Sub_Status__c,
                    Reason,
                    Origin,
                    Description,
                    Parent.CaseNumber,
                    CreatedDate,
                    ClosedDate
               FROM Case
              WHERE AccountId = :accountId
           ORDER BY CreatedDate DESC]);
    }
    
    // method to return the viewing user's IP address
    public void getUserIpAddress() {
    
        userIPAddress = ApexPages.currentPage().getHeaders().get('True-Client-IP');
        
        if (String.IsBlank(userIPAddress)) {
        
            userIPAddress = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
        }
        
        System.Debug('USER IP ADDRESS: ' + userIPAddress);
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