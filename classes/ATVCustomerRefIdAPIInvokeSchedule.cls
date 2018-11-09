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
    
    public PageReference invokeATVCustRefIdUpdtService()
    {
        String endpointUrl = 
            [SELECT Configuration_Value__c 
               FROM Integration_Configuration__mdt 
              WHERE Is_Active__c = true AND
                    External_System_Name__c = 'Dreamforce API' AND
                    Configuration_Label__c = 'AccountUUIDUpdateURL' LIMIT 1].Configuration_Value__c;
        
        PageReference apiSrvcPage = new PageReference(endpointUrl);
        apiSrvcPage.setRedirect(true);
        return apiSrvcPage;
    }
}