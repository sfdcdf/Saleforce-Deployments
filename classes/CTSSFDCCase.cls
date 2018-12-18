public class CTSSFDCCase extends CTSSFDCObjectBase
{    
        
    public CTSSFDCCase (Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Case sfCase)
    {
        super(objId, objName, requestInstance, sfCase);
        PopulateCaseFields(objId, requestInstance, sfCase);    
    }
    
    private void PopulateCaseFields(Id caseId, SFDCToCTSAsynchRequest__c requestInstance, Case sfCase)
    {       
                                                                                                                                  
    }       
}