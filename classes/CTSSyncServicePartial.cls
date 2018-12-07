public without sharing class CTSSyncServicePartial
{
       
    public class CTSObjectAttributes{
    
        public String ObjName {get; set;}
        public String ObjRecordType {get; set;}
        public String CaseReason {get; set;}
        public String CaseOrigin{get; set;}
        public String ProductType {get; set;}            
    } 

    public static List<CTSObjectTriggerMap__mdt> GetRoutingTableObject(List<CTSObjectAttributes> attributes)
    {
        CTSObjectTriggerMap__mdt routingObj;
        List<CTSObjectTriggerMap__mdt> routingObjs = new List<CTSObjectTriggerMap__mdt>();
        
        List<SObject> routeMappings = [SELECT Id, 
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
                   
         Map<String, Id> ctsObjectsMap = new Map<String, Id>();
         for (CTS_Salesforce_Object_Ref__mdt ctsObject : [SELECT Id, Object_API_Name__c FROM CTS_Salesforce_Object_Ref__mdt])
             ctsObjectsMap.put(ctsObject.Object_API_Name__c, ctsObject.Id);
         
         /*0  Object Name
         1 Object Record Type
         2. Case Reason
         3. Case Origin
         4. Product Type*/
         
         for (CTSObjectAttributes attribute : attributes)
         {             
             Map<String, String> fieldMap = new Map<String, String>();
             fieldMap.put('Object__c', ctsObjectsMap.get(attribute.ObjName));
             fieldMap.put('RecordTypeName__c', attribute.ObjRecordType);
             fieldMap.put('CaseReason__c', attribute.CaseReason);
             fieldMap.put('CaseOrigin__c', attribute.CaseOrigin);
             fieldMap.put('ProductType__c', attribute.ProductType);
         
             //A. 0 & 1 & 2 & 3 & 4 
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjs.add(routingObj);
                 break;
             }
                
              
             //B. 0 & 1 & 2 & 4    
             fieldMap.remove('CaseOrigin__c');         
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjs.add(routingObj);
                 break;
             }                           
                 
             //C. 0 & 1 & 3 & 4
             fieldMap.remove('CaseReason__c');
             fieldMap.put('CaseOrigin__c', attribute.CaseOrigin); 
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjs.add(routingObj);
                 break;
             }                 
                 
             //D. 0 & 1 & 4
             fieldMap.remove('CaseOrigin__c');        
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjs.add(routingObj);
                 break;
             }                 
                 
             //E. 0 & 1  
             fieldMap.remove('ProductType__c');
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjs.add(routingObj);
                 break;
             }
                 
                 
             //F. If none of the criteria above are met we will route to a catch all queue , by searching for "Object Record Type = "CATCHALL"
             for(SObject obj : routeMappings) {
                 if (obj.get('RecordTypeName__c') == 'CATCHALL' && obj.get('Object__c') == ctsObjectsMap.get(attribute.ObjName))
                 {                     
                     routingObjs.add(routingObj);
                     break;
                 }
                     
             }
             
             // should we add a empty instance as placeholder?
             routingObjs.add(new CTSObjectTriggerMap__mdt());
         }
         
         return routingObjs;                                        
                           
    }
   
    private static CTSObjectTriggerMap__mdt FindRoutingObject(List<sObject> routingTableObjs, Map<string, string> fieldMap)
    {                
        for(SObject obj : routingTableObjs) {
            Boolean matched = true;
            for(string key : fieldMap.keySet()) {
               string inputValue = fieldMap.get(key);
               string routingObjFieldValue = (String)obj.get(key);
               if (inputValue != routingObjFieldValue)
               {
                   matched = false;
                   break;
               }
            }
            if (matched)
                return (CTSObjectTriggerMap__mdt)obj;        
        } 
        
        return null;
    }  
   
    
}