public without sharing class CTSSyncServicePartial
{
       
    /* public class CTSObjectAttributes{
    
        public String ObjName {get; set;}
        public String ObjRecordType {get; set;}
        public String CaseReason {get; set;}
        public String CaseOrigin{get; set;}
        public String ProductType {get; set;}            
    } */

    public static Map<Id,CTSObjectTriggerMap__mdt> GetRoutingTableObject(string objName, List<Id> objIds)
    {
        CTSObjectTriggerMap__mdt routingObj;
        Map<Id, CTSObjectTriggerMap__mdt> routingObjMap = new Map<Id, CTSObjectTriggerMap__mdt>();
        
        String query = 'SELECT Id, RecordType, Reason, Origin, Product_Type__C FROM ' + objName + ' WHERE Id in :objIds';        
        List<SObject> ctsSalesforceObjectList = Database.query(query);
                                   
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
         
         for (SObject sfObj : ctsSalesforceObjectList)
         {             
             Map<String, String> fieldMap = new Map<String, String>();
             fieldMap.put('Object__c', ctsObjectsMap.get(objName));
             fieldMap.put('RecordTypeName__c', (String)sfObj.get('RecordType'));
             fieldMap.put('CaseReason__c', (String)sfObj.get('Reason'));
             fieldMap.put('CaseOrigin__c', (String)sfObj.get('Origin'));
             fieldMap.put('ProductType__c', (String)sfObj.get('ProductType__C'));
         
             //A. 0 & 1 & 2 & 3 & 4 
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjMap.put((Id)sfObj.get('Id'), routingObj);
                 continue;
             }
                              
             //B. 0 & 1 & 2 & 4    
             fieldMap.remove('CaseOrigin__c');         
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjMap.put((Id)sfObj.get('Id'), routingObj);
                 continue;
             }                           
                 
             //C. 0 & 1 & 3 & 4
             fieldMap.remove('CaseReason__c');
             fieldMap.put('CaseOrigin__c', (String)sfObj.get('Origin')); 
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjMap.put((Id)sfObj.get('Id'), routingObj);
                 continue;
             }                 
                 
             //D. 0 & 1 & 4
             fieldMap.remove('CaseOrigin__c');        
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjMap.put((Id)sfObj.get('Id'), routingObj);
                 continue;
             }                 
                 
             //E. 0 & 1  
             fieldMap.remove('ProductType__c');
             routingObj = FindRoutingObject(routeMappings, fieldMap);
             if (routingObj != null)
             {
                 routingObjMap.put((Id)sfObj.get('Id'), routingObj);
                 continue;
             }
                 
                 
             //F. If none of the criteria above are met we will route to a catch all queue , by searching for "Object Record Type = "CATCHALL"
             for(SObject obj : routeMappings) {
                 if (obj.get('RecordTypeName__c') == 'CATCHALL' && obj.get('Object__c') == ctsObjectsMap.get(objName))
                 {                     
                     routingObjMap.put((Id)sfObj.get('Id'), (CTSObjectTriggerMap__mdt)obj);
                     break;
                 }
                     
             }
          
         }
         
         return routingObjMap;                                        
                           
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