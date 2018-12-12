public without sharing class CTSSyncServicePartial
{         
    
    public class CTSTicket{
    
        public String apiIdentifier {get; set;}
        public String contactFirstName {get; set;}
        public String contactLastName {get; set;}
        public String contactPhone {get; set;}
        public String contactEmailAddress {get; set;}
        public String referenceAccountId {get; set;}
        public String referenceCustomerId {get; set;}
        public String referenceProductInstanceId {get; set;}
        public String domain {get; set;}
        public String subject {get; set;}
        public String detail {get; set;}
        public String referenceProductCode {get; set;}
        public String status {get; set;}
        public string alternateContactEmailAddress {get; set;}
        public Id sfdcTemplateIdForDetails {get; set;}
    
    }
    
    public static List<CTS_SFDC_Object_Base> GetSFDCObject(string objectName, List<Id> objIds)    
    {          
    
       CTS_SFDC_Object_Base baseObject;
       List<CTS_SFDC_Object_Base> ctsSFDCObjectList = new List<CTS_SFDC_Object_Base>();       
       List<SFDCToCTSAsynchRequest__c> requestList = [SELECT ObjectId__c, API_Identifier__c, CTS_Email_Address__c, EmailTemplateId__c FROM SFDCToCTSAsynchRequest__c WHERE ObjectId__c IN :objIds];
       Map<String, SFDCToCTSAsynchRequest__c> requestMap = new Map<String, SFDCToCTSAsynchRequest__c>();
       SFDCToCTSAsynchRequest__c asyncRequest;
       
       for (SFDCToCTSAsynchRequest__c request : requestList)
       {
           requestMap.put(request.ObjectId__c, request); 
       }
                                                
       switch on objectName {
           when 'Case' {
              for (Case sfCase :  [SELECT Id,
                                     Account.Client_First_Name__c,
                                     Account.Client_Last_Name__c,
                                     Account.Phone,
                                     Account.Email__c,
                                     Account.Product_Type_Transactional__c,
                                     Account.Id,
                                     Account.Name,
                                     Account.Client_ID__c,
                                     Account.Website,  
                                     Client_Email__c,
                                     Subject,
                                     CaseNumber,                                       
                                     RecordType.Name,
                                     Status,
                                     Sub_Status__c
                               FROM Case
                               WHERE Id IN :objIds])
               {
                   asyncRequest = requestMap.get((String)sfCase.Id);
                   baseObject = new CTSSFDCCase(sfCase.Id, objectName, asyncRequest, sfCase);
                   ctsSFDCObjectList.add(baseObject);                    
               }
               
           }
           when 'Organic_Analysis__c', 'Quality_Case__c', 'Best_Practice_Evaluation__c', 'Customer_Surveys__c', 'Lighthouse_Worksheets__c' {
               for (Id objId : objIds)
               {
                   asyncRequest = requestMap.get((String)objId);
                   baseObject = new CTS_SFDC_Object_Base(objId, objectName, asyncRequest);
                   ctsSFDCObjectList.add(baseObject);
               }
               
           }                     
           when else {
               system.debug('Not a valid object name: ' + objectName);                
           }
       }
                                   
       return ctsSFDCObjectList;

    }     

    public static Map<Id,CTSObjectTriggerMap__mdt> GetRoutingTableObject(string objName, List<Id> objIds)
    {
        CTSObjectTriggerMap__mdt routingObj;
        Map<Id, CTSObjectTriggerMap__mdt> routingObjMap = new Map<Id, CTSObjectTriggerMap__mdt>();
        
        String query;
        if (objName.equals('Case'))        
            query = 'SELECT Id, RecordType, Reason, Origin, Product_Type__C FROM Case WHERE Id in :objIds';
        else
            query = 'SELECT Id, RecordType FROM ' + objName + ' WHERE Id in :objIds';    
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
             if (objName.equals('Case'))
             {
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
                 
                 fieldMap.remove('ProductType__c');
             }               
                 
             //E. 0 & 1               
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
    
    
    public static HttpResponse CallOutCTSForAPI(String requestBody, CTS_Integration_Setting__mdt integrationSetting){
       
        Http h = new Http();
       
        HttpRequest req = new HttpRequest();        
        req.setEndpoint(integrationSetting.ESBAPIEndPoint__c);
        req.setBody(requestBody);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(120000);

        // Send the request, and return a response
        HttpResponse res = h.send(req);       

        return res;
    }
    
    
    public static String GetCTSTicketJSON(List<CTSTicket> ctsTickets)
    {
    
       /* {
            "clientInfo": {
                "apiAccessKey": " SAMPLE number",
                "aplicationName" : "CTS",
                "messageId": "qwdv-lusm-oqps"
            },
            "request": []
          } */                 
       
       JSONGenerator bodyJSON = JSON.createGenerator(false);
       bodyJSON.writeStartObject();
       
       //clientInfo
       bodyJSON.writeFieldName('clientInfo');
       bodyJSON.writeStartObject();
       //to do, read from config
       bodyJSON.writeObjectField('apiAccessKey', '453bf6392c38444a98023807aaa5ea8d5bd32a80767c4098ba76955c83b2f991');      
       bodyJSON.writeEndObject();
       
       //request
       bodyJSON.writeFieldName('request');
       bodyJSON.writeStartArray();
           for (CTSTicket ticket : ctsTickets)
           {           
               bodyJSON.writeStartObject();
               
               bodyJSON.writeObjectField('platformId', 'YODLE');
               bodyJSON.writeObjectField('action', 'Create');
               //To to, no obj name & obj id in CTSTicket object
               bodyJSON.writeObjectField('clientRequestId', 'SFDC');
               bodyJSON.writeObjectField('objectType', 'Ticket');
               
               bodyJSON.writeFieldName('data');
               bodyJSON.writeStartObject();
               //to do, read from config
               bodyJSON.writeObjectField('crmId', '552e519a-1898-4f4b-b909-a223a916b876');
               bodyJSON.writeFieldName('ticket');
               bodyJSON.writeStartObject();
               bodyJSON.writeObjectField('apiIdentifier', ticket.apiIdentifier.length() > 100 ? ticket.apiIdentifier.substring(0, 100): ticket.apiIdentifier);
               bodyJSON.writeObjectField('contactFirstName', ticket.contactFirstName.length() > 100 ? ticket.contactFirstName.substring(0, 100): ticket.contactFirstName);
               bodyJSON.writeObjectField('contactLastName', ticket.contactLastName.length() > 100 ? ticket.contactLastName.substring(0, 100): ticket.contactLastName);
               bodyJSON.writeObjectField('contactPhone', ticket.contactPhone.length() > 50 ? ticket.contactPhone.substring(0, 50): ticket.contactPhone);
               bodyJSON.writeObjectField('contactEmailAddress', ticket.contactEmailAddress.length() > 320 ? ticket.contactEmailAddress.substring(0, 320): ticket.contactEmailAddress);
               bodyJSON.writeObjectField('referenceAccountId', ticket.referenceAccountId.length() > 320 ? ticket.referenceAccountId.substring(0, 320): ticket.referenceAccountId);
               bodyJSON.writeObjectField('referenceCustomerId', ticket.referenceCustomerId.length() > 320 ? ticket.referenceCustomerId.substring(0, 320): ticket.referenceCustomerId);
               bodyJSON.writeObjectField('referenceProductInstanceId', ticket.referenceProductInstanceId.length() > 320 ? ticket.referenceProductInstanceId.substring(0, 320): ticket.referenceProductInstanceId);
               bodyJSON.writeObjectField('domain', ticket.domain.length() > 255 ? ticket.domain.substring(0, 255): ticket.domain);
               bodyJSON.writeObjectField('subject', ticket.subject.length() > 100 ? ticket.subject.substring(0, 100): ticket.subject);
               bodyJSON.writeObjectField('detail', ticket.detail);
               bodyJSON.writeObjectField('referenceProductCode', ticket.referenceProductCode.length() > 100 ? ticket.referenceProductCode.substring(0, 100): ticket.referenceProductCode);
               bodyJSON.writeObjectField('status', ticket.status.length() > 100 ? ticket.status.substring(0, 100): ticket.status);
               bodyJSON.writeObjectField('alternateContactEmailAddress', ticket.alternateContactEmailAddress.length() > 100 ? ticket.alternateContactEmailAddress.substring(0, 100): ticket.alternateContactEmailAddress);
               bodyJSON.writeEndObject();
               bodyJSON.writeEndObject();                                              
               bodyJSON.writeEndObject();           
           }
       bodyJSON.writeEndArray();    
       
       bodyJSON.writeEndObject();
                                  
       return bodyJSON.getAsString();
    }       
}