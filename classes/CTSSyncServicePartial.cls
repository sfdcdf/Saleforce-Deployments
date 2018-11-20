public class CTSSyncServicePartial
{
    public static CTS_SFDC_Object_Base GetSFDCObject(string objectName, Id objectId, CTSObjectTriggerMap__mdt mappingInstance, string CTSIntegrationType)    
    {
       CTS_SFDC_Object_Base baseObject;
       
       switch on objectName {
           when 'Case' {
               baseObject = new CTSSFDCCase(objectId, objectName, mappingInstance);               
           }
           when 'Organic_Analysis__c', 'Quality_Case__c', 'Best_Practice_Evaluation__c', 'Customer_Surveys__c', 'Lighthouse_Worksheets__c' {
               baseObject = new CTS_SFDC_Object_Base(objectId, objectName, mappingInstance);
           }                     
           when else {
               system.debug('Not a valid object name: ' + objectName);                
           }
       }
                     
       return baseObject;

    }          
}