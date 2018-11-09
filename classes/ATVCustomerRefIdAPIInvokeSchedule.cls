/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 11-Nov-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 11-Nov-2018
  Description ........: Schedulable class to invoke external Endpoint URL on a schedule
*****************************************************************************/
global class ATVCustomerRefIdAPIInvokeSchedule Implements Schedulable {

    global void execute(SchedulableContext sc) {
    
        invokeATVCustRefIdUpdtService();
    }
    
    public void invokeATVCustRefIdUpdtService()
    {
        // get endpoint URL value from Custom Metadata Type
        String endpointUrl = 
            [SELECT Configuration_Value__c 
               FROM Integration_Configuration__mdt 
              WHERE Is_Active__c = true AND
                    External_System_Name__c = 'Dreamforce API' AND
                    Configuration_Label__c = 'AccountUUIDUpdateURL' LIMIT 1].Configuration_Value__c;
        
        // Instantiate a new http object
        Http h = new Http();
        
        //Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpointUrl);
        req.setMethod('GET');
        
        // send Http Request; no response needed
        h.send(req);
    }
}