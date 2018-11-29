public class CTSSyncServicePartial
{

    public static CTSObjectTriggerMap__mdt GetRoutingTableObject(string objName, string objRecordType, string caseReason, string caseOrigin, string productType)
    {
        CTSObjectTriggerMap__mdt routingObj;
        
        List<sObject> routeMappings = [SELECT Id, 
                        Additional_Filter__c,
                        CaseOrigin__c,
                        CaseReason__c,
                        CTSAPIIdentifier__c,
                        CTSAssignedToLoginName__c,
                        CTSEmailAddress__c,
                        CTSNoteType__c,
                        Description__c,
                        DetailsTemplateName__c,
                        IntegrationType__c,
                        IsActive__c,
                        IsAutoClose__c,
                        IsCreateCTSNote__c,
                        IsExcludeWBN__c,
                        NoteDetailsTemplateName__c,
                        Object__c,
                        Object__r.Object_API_Name__c,
                        ProductType__c,
                        RecordTypeName__c,
                        MasterLabel
                   FROM CTSObjectTriggerMap__mdt];
         
         /*0  Object Name
         1 Object Record Type
         2. Case Reason
         3. Case Origin
         4. Product Type*/
                
         Map<String, String> conditions = new Map<String, String>();
         conditions.put('Object__c', objName);
         conditions.put('RecordTypeName__c', objRecordType);
         conditions.put('CaseReason__c', caseReason);
         conditions.put('CaseOrigin__c', caseOrigin);
         conditions.put('ProductType__c', productType);
         
         //A. 0 & 1 & 2 & 3 & 4 
         routingObj = FindRoutingObject(routeMappings, conditions);
         if (routingObj != null)
             return routingObj;
          
         //B. 0 & 1 & 2 & 4    
         conditions.remove('CaseOrigin__c');         
         routingObj = FindRoutingObject(routeMappings, conditions);
         if (routingObj != null)
             return routingObj;
             
         //C. 0 & 1 & 3 & 4
         conditions.remove('CaseReason__c');
         conditions.put('CaseReason__c', caseReason); 
         routingObj = FindRoutingObject(routeMappings, conditions);
         if (routingObj != null)
             return routingObj;  
             
         //D. 0 & 1 & 4
         conditions.remove('CaseOrigin__c');
         conditions.remove('CaseReason__c');
         routingObj = FindRoutingObject(routeMappings, conditions);
         if (routingObj != null)
             return routingObj;
             
         //E. 0 & 1  
         conditions.remove('ProductType__c');
         routingObj = FindRoutingObject(routeMappings, conditions);
         if (routingObj != null)
             return routingObj;
             
         //F. If none of the criteria above are met we will route to a catch all queue , by searching for "Object Record Type = "CATCHALL"
         
         return routingObj;

                           
    }
   
    private static CTSObjectTriggerMap__mdt FindRoutingObject(List<sObject> routingTableObjs, Map<string, string> matchingConditions)
    {
        CTSObjectTriggerMap__mdt routingObj;
        
        return routingObj;
    }
    
}