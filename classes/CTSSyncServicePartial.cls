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
                  
    
    public static HttpResponse CallOutCTSForAPI(String requestBody, CTS_Integration_Setting__mdt integrationSetting){
       
        Http h = new Http();
       
        HttpRequest req = new HttpRequest();        
        req.setEndpoint('callout:CTSSyncService');
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
               bodyJSON.writeObjectField('detail', ticket.detail.escapeHtml4());
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
    
    
    public static Map<Id, Messaging.SingleEmailMessage> GetEmailMap(Map<Id, SFDCToCTSAsynchRequest__c> requestMap)
    {
        Map<Id, Messaging.SingleEmailMessage> emailMap = new Map<Id, Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage[] mails = new Messaging.SingleEmailMessage[] {};
        
        CTS_Integration_Setting__mdt integrationSettings = [SELECT DefaultContactId__c FROM CTS_Integration_Setting__mdt WHERE IsActive__c = true LIMIT 1];
        
        for (Id objId : requestMap.keySet())
        {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[]{'YodleSFDC@fake.com'};
            mail.setToAddresses(toAddresses);
            mail.setUseSignature(false);
            mail.setSaveAsActivity(false);
            mail.setSenderDisplayName('YodleSFDC');   
            mail.setTargetObjectId(integrationSettings.DefaultContactId__c);
            mail.setWhatId(objId); 
            mail.setTemplateId(requestMap.get(objId).EmailTemplateId__c);
            mails.add(mail);
        }
        
        Savepoint sp = Database.setSavepoint();
        Messaging.sendEmail(mails);
        Database.rollback(sp);
        
        Integer index = 0;
        for (Id objId : requestMap.keySet())
        {
            emailMap.put(objId, mails[index]);
            index++;
        }
        
        return emailMap;
    }    
    
    public static List<CTSSFDCObjectBase> GetSFDCObject(string objectName, Map<Id, SFDCToCTSAsynchRequest__c> requestMap)    
    {          
    
       CTSSFDCObjectBase baseObject;
       List<CTSSFDCObjectBase> ctsSFDCObjectList = new List<CTSSFDCObjectBase>();              
       SFDCToCTSAsynchRequest__c asyncRequest;
       
       //Render email subject and body in batch       
       Map<Id, Messaging.SingleEmailMessage> emailMap = GetEmailMap(requestMap);
                                             
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
                               WHERE Id IN : requestMap.keySet()])
               {
                   asyncRequest = requestMap.get(sfCase.Id);
                   Messaging.SingleEmailMessage mail = emailMap.get(sfCase.Id);
                   baseObject = new CTSSFDCObjectBase(sfCase, objectName, asyncRequest, mail);
                   ctsSFDCObjectList.add(baseObject);                    
               }
               
           }
           when 'Organic_Analysis__c' {
               for (Organic_Analysis__c organicCase : [SELECT Id,
                                     Account_Name__r.Client_First_Name__c,
                                     Account_Name__r.Client_Last_Name__c,
                                     Account_Name__r.Phone,
                                     Account_Name__r.Email__c,
                                     Account_Name__r.Product_Type_Transactional__c,
                                     Account_Name__r.Id,
                                     Account_Name__r.Name,
                                     Account_Name__r.Client_ID__c,
                                     Account_Name__r.Website                                      
                               FROM Organic_Analysis__c 
                               WHERE Id IN : requestMap.keySet()])
               {
                   asyncRequest = requestMap.get(organicCase.Id);
                   Messaging.SingleEmailMessage mail = emailMap.get(organicCase.Id);
                   baseObject = new CTSSFDCObjectBase(organicCase, objectName, asyncRequest, mail);
                   ctsSFDCObjectList.add(baseObject);
               }
               
           }  
           when 'Quality_Case__c' {
               for (Quality_Case__c qualityCase : [SELECT Id,
                                     Account_Name__r.Client_First_Name__c,
                                     Account_Name__r.Client_Last_Name__c,
                                     Account_Name__r.Phone,
                                     Account_Name__r.Email__c,
                                     Account_Name__r.Product_Type_Transactional__c,
                                     Account_Name__r.Id,
                                     Account_Name__r.Name,
                                     Account_Name__r.Client_ID__c,
                                     Account_Name__r.Website                                      
                               FROM Quality_Case__c
                               WHERE Id IN : requestMap.keySet()])
               {
                   asyncRequest = requestMap.get(qualityCase.Id);
                   Messaging.SingleEmailMessage mail = emailMap.get(qualityCase.Id);
                   baseObject = new CTSSFDCObjectBase(qualityCase, objectName, asyncRequest, mail);
                   ctsSFDCObjectList.add(baseObject);
               }
               
           }           
           when 'Best_Practice_Evaluation__c' {
              for (Best_Practice_Evaluation__c bpe: [SELECT Id,
                                     Account_Name__r.Client_First_Name__c,
                                     Account_Name__r.Client_Last_Name__c,
                                     Account_Name__r.Phone,
                                     Account_Name__r.Email__c,
                                     Account_Name__r.Product_Type_Transactional__c,
                                     Account_Name__r.Id,
                                     Account_Name__r.Name,
                                     Account_Name__r.Client_ID__c,
                                     Account_Name__r.Website                                      
                               FROM Best_Practice_Evaluation__c
                               WHERE Id IN : requestMap.keySet()])
               {
                   asyncRequest = requestMap.get(bpe.Id);
                   Messaging.SingleEmailMessage mail = emailMap.get(bpe.Id);
                   baseObject = new CTSSFDCObjectBase(bpe, objectName, asyncRequest, mail);
                   ctsSFDCObjectList.add(baseObject);
               }
               
           }           
           when 'Customer_Surveys__c' {
               for (Customer_Surveys__c customerSurvey: [SELECT Id,
                                     Account__r.Client_First_Name__c,
                                     Account__r.Client_Last_Name__c,
                                     Account__r.Phone,
                                     Account__r.Email__c,
                                     Account__r.Product_Type_Transactional__c,
                                     Account__r.Id,
                                     Account__r.Name,
                                     Account__r.Client_ID__c,
                                     Account__r.Website                                      
                               FROM Customer_Surveys__c 
                               WHERE Id IN : requestMap.keySet()])
               {
                   asyncRequest = requestMap.get(customerSurvey.Id);
                   Messaging.SingleEmailMessage mail = emailMap.get(customerSurvey.Id);
                   baseObject = new CTSSFDCObjectBase(customerSurvey, objectName, asyncRequest, mail);
                   ctsSFDCObjectList.add(baseObject);
               }
               
           }           
           /*when 'Lighthouse_Worksheets__c' {
               for (Lighthouse_Worksheets__c sheet: [SELECT Id,
                                     Practice_Name__r.Client_First_Name__c,
                                     Practice_Name__r.Client_Last_Name__c,
                                     Practice_Name__r.Phone,
                                     Practice_Name__r.Email__c,
                                     Practice_Name__r.Product_Type_Transactional__c,
                                     Practice_Name__r.Id,
                                     Practice_Name__r.Name,
                                     Practice_Name__r.Client_ID__c,
                                     Practice_Name__r.Website                                      
                               FROM Lighthouse_Worksheets__c
                               WHERE Id IN : requestMap.keySet()])
               {
                   asyncRequest = requestMap.get(sheet.Id);
                   baseObject = new CTS_SFDC_Object_Base(sheet.Id, objectName, asyncRequest, sheet);
                   ctsSFDCObjectList.add(baseObject);
               }
               
           }  */                            
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
        
        Map<Id, String> objRecordTypeMap = new Map<Id, String>();
        for (RecordType type: [SELECT Id, Name FROM RecordType WHERE sObjectType = :objName])
             objRecordTypeMap.put(type.Id, type.Name);        
        
        String query;
        if (objName.equals('Case'))        
            query = 'SELECT Id, RecordTypeId, Reason, Origin, Product_Type__C FROM Case WHERE Id in :objIds';
        else
            query = 'SELECT Id, RecordTypeId FROM ' + objName + ' WHERE Id in :objIds';    
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
             fieldMap.put('RecordTypeName__c', objRecordTypeMap.get((Id)sfObj.get('RecordTypeId')));
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
             
             //If no routing object can be found, we add NULL value to Map
             if (!routingObjMap.keySet().contains((Id)sfObj.get('Id')))
                 routingObjMap.put((Id)sfObj.get('Id'), null);
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
    
    
    public static void ProcessCreateTicketAPIResponse(String ctsCreateTicketResponse)
    {
        System.Debug('*** Entering Method ProcessCreateTicketAPIResponse ***');
    
        try
        {
            String jsonString = ctsCreateTicketResponse;
            String objNameAndId;
            String objectId;
            Map<String, Object> clientJSONMap = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
            string res = JSON.serialize(clientJSONMap.get('response'));
            List<CTSTicketResponse> ctsTicketResp = (List<CTSTicketResponse>)JSON.deserialize(res, List<CTSTicketResponse >.class);
            List<SFDCToCTSAsynchRequest__c> dmlAsyncRecordsUpdate = new List<SFDCToCTSAsynchRequest__c>();
            Set<String> objectIds = new Set<String>();
            
            //CTSTicketResponse.Response respMainNode;
            //CTSTicketResponse.Data respDataNode;
            //CTSTicketResponse.Errors respErrorNode;
            
            for(CTSTicketResponse ctr : ctsTicketResp){
            
                objNameAndId = ctr.clientRequestId;
            
                if(objNameAndId.startsWith('Case')){
                    objectIds.add(objNameAndId.SubStringAfter('_'));
                }
                else{
                    objectIds.add(objNameAndId.SubStringAfter('__c_'));
                }
                
                System.Debug('Object Ids in Set List: ' + objectIds);
            }
            
            List<SFDCToCTSAsynchRequest__c> asyncRecords = 
                [SELECT Id,
                        API_Identifier__c,
                        CTS_Email_Address__c,
                        EmailTemplateId__c,
                        ErrorDescription__c,
                        ExternalTicketId__c,
                        Integration_Type__c,
                        Name,
                        NumberOfRetryAttempts__c,
                        ObjectId__c,
                        Object_Name__c,
                        ProcessedDateTime__c,
                        ScheduledDateTime__c,
                        Status__c
                   FROM SFDCToCTSAsynchRequest__c
                  WHERE ObjectId__c IN :objectIds];
            
            for(CTSTicketResponse ctr : ctsTicketResp){
            
                objNameAndId = ctr.clientRequestId;
                String ctsTicketNumber = ctr.Data.details[0].ticketNumber;
                String asyncStatus = (ctr.status == 'Success' ? 'SUCCESS' : 'ERROR');
                String errorMsg = (ctr.errors != null ? ctr.errors.message : null);
                
                if(objNameAndId.startsWith('Case')){
                    objectId = objNameAndId.SubStringAfter('_');
                }
                else{
                    objectId = objNameAndId.SubStringAfter('__c_');
                }
                
                System.Debug('Client Request Id Returned: ' + objNameAndId);
                System.Debug('Ticket Number Returned: ' + ctsTicketNumber);
                System.Debug('Status Returned: ' + asyncStatus);
                System.Debug('Error Message Returned: ' + errorMsg);
                
                for(SFDCToCTSAsynchRequest__c asyncRecord : asyncRecords){
                
                    if(asyncRecord.ObjectId__c == objectId){
                        
                        Integer retryAttempts = Integer.valueOf(asyncRecord.NumberOfRetryAttempts__c);
                        
                        asyncRecord.Status__c = asyncStatus;
                        asyncRecord.ProcessedDateTime__c = System.Now();
                            
                        if(asyncStatus == 'SUCCESS'){
                                
                            asyncRecord.ExternalTicketId__c = ctsTicketNumber;
                        }
                        else{
                        
                            if(asyncRecord.NumberOfRetryAttempts__c < 3){
                            
                                retryAttempts += 1;
                            }
                            
                            asyncRecord.ErrorDescription__c = errorMsg;
                            asyncRecord.NumberOfRetryAttempts__c = retryAttempts;
                        }
                        
                        dmlAsyncRecordsUpdate.add(asyncRecord);
                    }
                }
            }
            
            if(dmlAsyncRecordsUpdate.size() > 0){
            
                update dmlAsyncRecordsUpdate;
            }
            
            System.Debug('Number of Async Records Updated: ' + String.valueOf(dmlAsyncRecordsUpdate.size()));
            System.Debug('*** End Method ProcessCreateTicketAPIResponse ***');
        }
        catch(Exception e)
        {
            System.Debug('An error occurred in ProcessCreateTicketAPIResponse: ' + e.getMessage());
        }
    }
    
    
}