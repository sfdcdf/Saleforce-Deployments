/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 26-Dec-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 26-Dec-2018
  Description ........: Class contains invocable method to call CTS Sync Service method to create 
  new SFDCtoCTSAsyncRequest records
*****************************************************************************/
public class CTSAsyncRequestCreate
{
    @InvocableMethod
    public static void CreateNewAsyncRequest(List<Id> objectIds)
    {
        System.Debug('**CTS** Entering Invocable CreateNewAsyncRequest ***');
        System.Debug('**CTS** Object Ids List Size: ' + String.valueOf(objectIds.size()));
        System.Debug('**CTS** Object Ids List Values: ' + objectIds);
        
        String caseSignature = '500';
        String orgCaseSignature = 'a0m';
        String qualityCaseSignature = 'a2n';
        String customerSurveySignature = 'a0R';
        String objectName = '';
        
        try
        {
            if(objectIds.size() > 0){
            
                for(Id objId : objectIds){
                
                    if(String.valueOf(objId).startsWith(caseSignature)){
                        objectName = 'Case';
                        break;
                    }
                    if(String.valueOf(objId).startsWith(orgCaseSignature)){
                        objectName = 'Organic_Analysis__c';
                        break;
                    }
                    if(String.valueOf(objId).startsWith(qualityCaseSignature)){
                        objectName = 'Quality_Case__c';
                        break;
                    }
                    if(String.valueOf(objId).startsWith(customerSurveySignature)){
                        objectName = 'Customer_Surveys__c';
                        break;
                    }
                }
                
                System.Debug('**CTS** Object Name: ' + objectName);
                
                //ESB Proxy not compatible with multi requests in one payload, have to send one by one
                //Can't be more than 10 records in batch due to Email invocation upper limit
                for(Id objId : objectIds){                
                    if(!String.IsBlank(objectName) && !Test.isRunningTest()){
                        CTSSyncService.CreateSFDCToCTSAsynchRequest(objectName, new List<Id> {objId});
                    }
                }
            }
        }
        catch(Exception e)
        {
            System.Debug('**CTS** An error occurred: ' + e);
        }
    }
}