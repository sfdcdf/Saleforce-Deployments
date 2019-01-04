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
                
                System.Debug('** Object Name: ' + objectName);
            
                if(!String.IsBlank(objectName)){
                    CTSSyncService.CreateSFDCToCTSAsynchRequest(objectName, objectIds);
                }
            }
        }
        catch(Exception e)
        {
            System.Debug('An error occurred: ' + e);
        }
    }
}