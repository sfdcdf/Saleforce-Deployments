/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 16-Nov-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 16-Nov-2018
  Description ........: CTS Sync Service class provides the mapping and data elements to send data to CTS from Salesforce
  to create tickets and reference the ticket back to the SFDC object
*****************************************************************************/
public without sharing class CTSSyncService{

    private class CTSTicket{
    
        public String apiIdentifier {get; set;}
        public String contactFirstName {get; set;}
        public String contactLastName {get; set;}
        public String contactPhone {get; set;}
        public String contactEmailAddress {get; set;}
        public String referenceAccountId {get; set;}
        public String referenceCustomerId {get; set;}
    
    }

    // will return object triggered by scheduled job; not void
    public static CTSTicket GetCTSTicket(string objectName, CTS_SFDC_Object_Base objectInstance, Id objectId, CTSObjectTriggerMap__mdt routingTableObjectInstance){
 
        CTSTicket ctsTicketInstance;
        
        return ctsTicketInstance;
        
    }
    
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
    
    
    public static CTSObjectTriggerMap__mdt GetRoutingTableObject(string objName, string objRecordType, string caseReason, string caseOrigin, string productType)
    {
        CTSObjectTriggerMap__mdt routingObj;
        
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
         
         /*0  Object Name
         1 Object Record Type
         2. Case Reason
         3. Case Origin
         4. Product Type*/
                
         Map<String, String> fieldMap = new Map<String, String>();
         fieldMap.put('Object__c', objName);
         fieldMap.put('RecordTypeName__c', objRecordType);
         fieldMap.put('CaseReason__c', caseReason);
         fieldMap.put('CaseOrigin__c', caseOrigin);
         fieldMap.put('ProductType__c', productType);
         
         //A. 0 & 1 & 2 & 3 & 4 
         routingObj = FindRoutingObject(routeMappings, fieldMap);
         if (routingObj != null)
             return routingObj;
          
         //B. 0 & 1 & 2 & 4    
         fieldMap.remove('CaseOrigin__c');         
         routingObj = FindRoutingObject(routeMappings, fieldMap);
         if (routingObj != null)
             return routingObj;
             
         //C. 0 & 1 & 3 & 4
         fieldMap.remove('CaseReason__c');
         fieldMap.put('CaseReason__c', caseReason); 
         routingObj = FindRoutingObject(routeMappings, fieldMap);
         if (routingObj != null)
             return routingObj;  
             
         //D. 0 & 1 & 4
         fieldMap.remove('CaseOrigin__c');
         fieldMap.remove('CaseReason__c');
         routingObj = FindRoutingObject(routeMappings, fieldMap);
         if (routingObj != null)
             return routingObj;
             
         //E. 0 & 1  
         fieldMap.remove('ProductType__c');
         routingObj = FindRoutingObject(routeMappings, fieldMap);
         if (routingObj != null)
             return routingObj;
             
         //F. If none of the criteria above are met we will route to a catch all queue , by searching for "Object Record Type = "CATCHALL"
         for(SObject obj : routeMappings) {
             if (obj.get('RecordTypeName__c') == 'CATCHALL')
             {
                 return (CTSObjectTriggerMap__mdt)obj; 
             }
                 
         }
         
         return routingObj;

                           
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