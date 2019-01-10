/****************************************************************************
  Company/ Author ....: E. Ross | R. Wang
  Date Created .......: 16-Nov-2018
  Description ........: CTS Sync Service class provides the mapping and data elements to send data to CTS from Salesforce
  to create tickets and reference the ticket back to the SFDC object
*****************************************************************************/
public without sharing class CTSSyncService{

    public class CTSTicket{
    
        public string alternateContactEmailAddress {get; set;}
        public String apiIdentifier {get; set;}
        public String contactFirstName {get; set;}
        public String contactLastName {get; set;}
        public String contactPhone {get; set;}
        public String contactEmailAddress {get; set;}
        public string crmOrderNumber {get; set;}
        public String detail {get; set;}
        public String domain {get; set;}
        public String objectName {get; set;}
        public String referenceAccountId {get; set;}
        public String referenceCustomerId {get; set;}
        public String referenceProductCode {get; set;}
        public String referenceProductInstanceId {get; set;}
        public String status {get; set;}
        public String subject {get; set;}
    }
    
    public static List<CTSTicket> GetCTSTicket(List<CTSSFDCObjectBase> sfdcObjectList){
 
        System.Debug('*** Entering Method GetCTSTicket ***');
 
        CTSTicket ctsTicketInstance = new CTSTicket();
        List<CTSTicket> ctsTicketList = new List<CTSTicket>();
        
        for(CTSSFDCObjectBase sfdcObj : sfdcObjectList){
                
            ctsTicketInstance.apiIdentifier = sfdcObj.ApiIdentifier;
            ctsTicketInstance.crmOrderNumber = sfdcObj.CRMOrderNumber;
            ctsTicketInstance.contactFirstName = (sfdcObj.ContactFirstName != null ? sfdcObj.ContactFirstName : '');
            ctsTicketInstance.contactLastName = (sfdcObj.ContactLastName != null ? sfdcObj.ContactLastName : '');
            ctsTicketInstance.contactPhone = (sfdcObj.ContactPhone != null ? sfdcObj.ContactPhone : '');
            ctsTicketInstance.contactEmailAddress = (sfdcObj.ContactEmailAddress != null ? sfdcObj.ContactEmailAddress : '');
            ctsTicketInstance.objectName = sfdcObj.ObjectName;
            ctsTicketInstance.referenceAccountId = sfdcObj.ReferenceAccountId;
            ctsTicketInstance.referenceCustomerId = (sfdcObj.ReferenceCustomerId != null ? sfdcObj.ReferenceCustomerId : '');
            ctsTicketInstance.referenceProductInstanceId = sfdcObj.ReferenceProductInstanceId;
            ctsTicketInstance.domain = (sfdcObj.Domain != null ? sfdcObj.Domain : '');
            ctsTicketInstance.subject = (sfdcObj.Subject != null ? sfdcObj.Subject : '');
            ctsTicketInstance.status = sfdcObj.Status;
            ctsTicketInstance.detail = (sfdcObj.Detail != null ? sfdcObj.Detail : '');
            ctsTicketInstance.referenceProductCode = sfdcObj.ReferenceProductCodes;
            ctsTicketInstance.alternateContactEmailAddress = (sfdcObj.AlternateContactEmailAddress != null ? sfdcObj.AlternateContactEmailAddress : '');
                                  
            ctsTicketList.add(ctsTicketInstance);
        }
        
        System.Debug('Number of Rows in Ticket List: ' + String.valueOf(ctsTicketList.size()));
        System.Debug('CTS Ticket Returned: ' + ctsTicketList);
        System.Debug('*** End Method GetCTSTicket ***');
        
        return ctsTicketList;
    }
    
    public static Map<Id, Messaging.SingleEmailMessage> GetEmailMap(Map<Id, SFDCToCTSAsynchRequest__c> requestMap)
    {
        Map<Id, Messaging.SingleEmailMessage> emailMap = new Map<Id, Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage[] mails = new Messaging.SingleEmailMessage[] {};
        
        CTS_Integration_Setting__mdt integrationSetting = GetCTSIntegrationSettings();
        
        for (Id objId : requestMap.keySet())
        {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[]{'eugene.ross@web.com'};
            mail.setToAddresses(toAddresses);
            mail.setUseSignature(false);
            mail.setSaveAsActivity(false);
            mail.setSenderDisplayName('YodleSFDC');   
            mail.setTargetObjectId(integrationSetting.DefaultContactId__c);
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
       System.Debug('*** Entering Method GetSFDCObject ***');
    
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
       
       System.Debug('Number of Rows in SFDCObject List: ' + String.valueOf(ctsSFDCObjectList.size()));
       System.Debug('SFDCObject Returned: ' + ctsSFDCObjectList);
       System.Debug('*** End Method GetSFDCObject ***');
                                   
       return ctsSFDCObjectList;

    }    
    
    
    public static Map<Id,CTSObjectTriggerMap__mdt> GetRoutingTableObject(string objName, List<Id> objIds)
    {
        System.Debug('*** Entering Method GetRoutingTableObject ***');
    
        Map<Id, String> objRecordTypeMap = new Map<Id, String>();
        for (RecordType type: [SELECT Id, Name FROM RecordType WHERE sObjectType = :objName])
             objRecordTypeMap.put(type.Id, type.Name);   
        
        CTSObjectTriggerMap__mdt routingObj;
        Map<Id, CTSObjectTriggerMap__mdt> routingObjMap = new Map<Id, CTSObjectTriggerMap__mdt>();
                        
        String query;
        if (objName.equals('Case'))        
            query = 'SELECT Id, RecordTypeId, Reason, Origin, Product_Type__c FROM Case WHERE Id in :objIds';
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
             System.Debug(sfObj);          
             Map<String, String> fieldMap = new Map<String, String>();
             fieldMap.put('Object__c', ctsObjectsMap.get(objName));             
             fieldMap.put('RecordTypeName__c', objRecordTypeMap.get((Id)sfObj.get('RecordTypeId')));
             if (objName.equals('Case'))
             {
                 fieldMap.put('CaseReason__c', (String)sfObj.get('Reason'));
                 fieldMap.put('CaseOrigin__c', (String)sfObj.get('Origin'));
                 fieldMap.put('ProductType__c', (String)sfObj.get('Product_Type__c'));
                        
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
         
         System.Debug('Number of Rows in RoutingTable Map: ' + String.valueOf(routingObjMap.size()));
         System.Debug('RoutingTableObject Returned: ' + routingObjMap);
         System.Debug('*** End Method GetRoutingTableObject ***');
         
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
    
    public static String GetCTSTicketJSON(List<CTSTicket> ctsTickets)
    {
        System.Debug('*** Entering Method GetCTSTicketJSON ***');
       /* {
            "clientInfo": {
                "apiAccessKey": " SAMPLE number",
                "aplicationName" : "CTS",
                "messageId": "qwdv-lusm-oqps"
            },
            "request": []
          } */   
          
       CTS_Integration_Setting__mdt integrationSetting = GetCTSIntegrationSettings();              
       
       JSONGenerator bodyJSON = JSON.createGenerator(false);
       bodyJSON.writeStartObject();
       
       //clientInfo
       bodyJSON.writeFieldName('clientInfo');
       bodyJSON.writeStartObject();       
       bodyJSON.writeObjectField('apiAccessKey', integrationSetting.ESBapiAccessKey__c);      
       bodyJSON.writeEndObject();
       
       //request
       bodyJSON.writeFieldName('request');
       bodyJSON.writeStartArray();
           for (CTSTicket ticket : ctsTickets)
           {           
               bodyJSON.writeStartObject();
               
               bodyJSON.writeObjectField('platformId', 'YODLE');
               bodyJSON.writeObjectField('action', 'Create');
               bodyJSON.writeObjectField('clientRequestId', ticket.objectName + '_' + ticket.referenceProductInstanceId);
               bodyJSON.writeObjectField('objectType', 'TicketingTicket');
               bodyJSON.writeObjectField('requestedService', integrationSetting.RequestedService__c);
               
               bodyJSON.writeFieldName('data');
               bodyJSON.writeStartObject();               
               bodyJSON.writeObjectField('crmId', integrationSetting.CTScrmId__c);
               bodyJSON.writeFieldName('ticketingTicket');
               bodyJSON.writeStartObject();
               bodyJSON.writeObjectField('apiIdentifier', ticket.apiIdentifier.length() > 100 ? ticket.apiIdentifier.substring(0, 100): ticket.apiIdentifier);
               bodyJSON.writeObjectField('contactFirstName', ticket.contactFirstName.length() > 100 ? ticket.contactFirstName.substring(0, 100): ticket.contactFirstName);
               bodyJSON.writeObjectField('contactLastName', ticket.contactLastName.length() > 100 ? ticket.contactLastName.substring(0, 100): ticket.contactLastName);
               bodyJSON.writeObjectField('contactPhone', ticket.contactPhone.length() > 50 ? ticket.contactPhone.substring(0, 50): ticket.contactPhone);
               bodyJSON.writeObjectField('contactEmailAddress', ticket.contactEmailAddress.length() > 320 ? ticket.contactEmailAddress.substring(0, 320): ticket.contactEmailAddress);
               bodyJSON.writeObjectField('crmOrderNumber', ticket.crmOrderNumber.length() > 50 ? ticket.crmOrderNumber.substring(0, 50): ticket.crmOrderNumber);
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
       
       System.Debug('CTSTicketJSON Returned: ' + bodyJSON.getAsString());
       System.Debug('*** End Method GetCTSTicketJSON ***');
                                  
       return bodyJSON.getAsString();
    }
     
     @future(callout=true)
     public static void CallOutCTSForAPI(String requestBody){
        
        System.Debug('*** Entering Method CallOutCTSForAPI ***');
        
        Http h = new Http();
       
        HttpRequest req = new HttpRequest();        
        req.setEndpoint('callout:CTSIntegrationService');
        req.setClientCertificateName('CTSESBProxyCert');
        req.setBody(requestBody);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(120000);

        // Send the request, and return a response
        System.Debug('*** Sending Request to CTS for Ticket ***');
        
        Boolean isSuccessful = true;
        HttpResponse res;
        
        try{
            res = h.send(req);
        }
        catch(Exception e){
            // create method to handle Async Request records (UpdateSFDCToCTSAsynchRequest)
            isSuccessful = false;
            System.Debug('An error occurred sending request to CTS: ' + e.getMessage());
        }
        finally{
            if(isSuccessful){
                ProcessCreateTicketAPIResponse(res.getBody());
            }
        }
        
        System.Debug('*** Request Sent from CallCTSOutForAPI***');
        System.Debug('CallOutCTSForAPI Request: ' + requestBody);
        System.Debug('CallOutCTSForAPI Response: ' + String.valueOf(res));
        System.Debug('*** End Method CallOutCTSForAPI ***');
    }       
    
     /*public static HttpResponse CallOutCTSForAPI_Original(String requestBody, CTS_Integration_Setting__mdt integrationSetting){
        
        System.Debug('*** Entering Method CallOutCTSForAPI ***');
        
        Http h = new Http();
       
        HttpRequest req = new HttpRequest();        
        //req.setEndpoint(integrationSetting.ESBAPIEndPoint__c);
        req.setEndpoint('callout:CTSIntegrationService');
        req.setBody(requestBody);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(120000);

        // Send the request, and return a response
        HttpResponse res = h.send(req);

        System.Debug('CallOutCTSForAPI Request: ' + requestBody);
        System.Debug('CallOutCTSForAPI Response: ' + String.valueOf(res));
        System.Debug('*** End Method CallOutCTSForAPI ***');

        return res;
    }*/ 
    
    public static void CallOutCTSForEmail(List<CTSSFDCObjectBase> baseObj)
    {
        try{
        
            List<Messaging.SingleEmailMessage> ctsNotificationsLst = new List<Messaging.SingleEmailMessage>();
            OrgWideEmailAddress[] owea = [SELECT Id FROM OrgWideEmailAddress WHERE Address = 'sfdc@yodle.com'];
            String sfdcEmailAddress = GetConfigValue('SFDC_Case_Email');
            Set<String> uniqueEmailAddressesSet = new Set<String>();
            
            for(CTSSFDCObjectBase obj : baseObj){
            
                if(!String.IsBlank(obj.Subject) && !String.IsBlank(obj.Detail)){
                
                    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                    List<String> toAddress = new List<String>();
                    String fromAddress = GetConfigValue('ServiceAddressEmail_sfdc');
                    String fromDisplayName = 'SFDC CTS Notifications';
                    uniqueEmailAddressesSet.add(obj.CTSEmailAddress);
                    uniqueEmailAddressesSet.add(sfdcEmailAddress);
                    
                    for(String s : uniqueEmailAddressesSet){
                        toAddress.add(s);
                    }
                 
                    message.setToAddresses(toAddress);
                    message.setReplyTo(fromAddress);
                    message.setOrgWideEmailAddressId(owea.get(0).Id);
                    message.setSubject(obj.Subject);
                    message.setHtmlBody(obj.Detail);
            
                    ctsNotificationsLst.add(message);
                }
            }
            
            if(ctsNotificationsLst.size() > 0){
                                    
                // send notifications
                Messaging.sendEmail(ctsNotificationsLst);
            }
        }
        catch(Exception e){
        
            // log error
            System.Debug('An error occurred in CallOutCTSForEmail: ' + e.getMessage());
        }
    }
    
    public static void CreateSFDCToCTSAsynchRequest(String objectName, List<Id> objectIds)
    {
        System.Debug('*** Entering Method CreateSFDCToCTSAsynchRequest ***');
        
        try
        {
            Map<Id,CTSObjectTriggerMap__mdt> routingTable = GetRoutingTableObject(objectName, objectIds);
            Map<String, EmailTemplate> emailTemplateMap = new Map<String, EmailTemplate>();
            List<SFDCToCTSAsynchRequest__c> dmlSFDCToCTSAsynchRequestList = new List<SFDCToCTSAsynchRequest__c>();
            
            for(EmailTemplate et :
                [SELECT Id,
                        DeveloperName
                   FROM EmailTemplate
                  WHERE Folder.Name = 'CTS Templates']){
                  
                emailTemplateMap.put(et.DeveloperName, et);
            }
            
            for(Id objId : objectIds){
            
                for(CTSObjectTriggerMap__mdt rt : routingTable.values()){
                
                    SFDCToCTSAsynchRequest__c newAsyncRecord = new SFDCToCTSAsynchRequest__c();
                    
                    switch on rt.IntegrationType__c{
                        
                        when 'API' {
                            
                            newAsyncRecord.API_Identifier__c = rt.CTSAPIIdentifier__c;
                        }
                        when else {
                            
                            newAsyncRecord.CTS_Email_Address__c = rt.CTSEmailAddress__c;
                        }
                    }
                    
                    newAsyncRecord.EmailTemplateId__c = emailTemplateMap.get(rt.DetailsTemplateName__c).Id;
                    newAsyncRecord.Integration_Type__c = rt.IntegrationType__c;
                    newAsyncRecord.NumberOfRetryAttempts__c = 0;
                    newAsyncRecord.ObjectId__c = objId;
                    newAsyncRecord.Object_Name__c = objectName;
                    newAsyncRecord.ScheduledDateTime__c = System.Now();
                    newAsyncRecord.Status__c ='NEW';
                
                    dmlSFDCToCTSAsynchRequestList.add(newAsyncRecord);
                
                }
            
            }
            
            System.Debug('Number of Async Request Records Created: ' + String.valueOf(dmlSFDCToCTSAsynchRequestList.size()));
            
            if(dmlSFDCToCTSAsynchRequestList.size() > 0){
            
                insert dmlSFDCToCTSAsynchRequestList;
            }
            
            System.Debug('*** End Method CreateSFDCToCTSAsynchRequest ***');
        }
        catch(Exception e)
        {
            System.Debug('An error occurred in CreateSFDCToCTSAsynchRequest: ' + e.getMessage());
        }
    }
    
    public static void ProcessSFDCToCTSAsynchRequest(String objectName, List<SFDCToCTSAsynchRequest__c> asyncRequestObj)
    {
        System.Debug('*** Entering Method ProcessSFDCToCTSAsynchRequest ***');
    
        try
        {
            Map<Id, SFDCToCTSAsynchRequest__c> asyncRequestMap =  new Map<Id, SFDCToCTSAsynchRequest__c>();
            List<CTSSFDCObjectBase> sfdcObjList = new List<CTSSFDCObjectBase>();
            List<CTSTicket> ctsTicketList = new List<CTSTicket>();
            CTS_Integration_Setting__mdt integrationSettings = GetCTSIntegrationSettings();
            
            for(SFDCToCTSAsynchRequest__c ar : asyncRequestObj){
                asyncRequestMap.put(ar.ObjectId__c, ar);
            }
            
            if(asyncRequestMap.size() > 0){
            
                sfdcObjList = GetSFDCObject(objectName, asyncRequestMap);
                ctsTicketList = GetCTSTicket(sfdcObjList);
                String ticketJSON ='';
                //HttpResponse ctsResp = new HttpResponse();
                
                ticketJSON = GetCTSTicketJSON(ctsTicketList);
                CallOutCTSForAPI(ticketJSON);
                //ProcessCreateTicketAPIResponse(ctsResp);
                
                /*for(SFDCToCTSAsynchRequest__c asr : asyncRequestObj){
                
                    if(asr.Integration_Type__c == 'API'){
                        ticketJSON = GetCTSTicketJSON(ctsTicketList);
                        ctsResp = CallOutCTSForAPI(ticketJSON, integrationSettings);
                        ProcessCreateTicketAPIResponse(ctsResp, asyncRequestObj);
                    }
                    else{
                        CallOutCTSForEmail(sfdcObjList);
                    }
                }*/
            }
            System.Debug('Number of Records Processed: ' + String.valueOf(asyncRequestObj.size()));
            System.Debug('List of Records Processed: ' + asyncRequestObj);
            System.Debug('*** End Method ProcessSFDCToCTSAsynchRequest ***');
        }
        catch(Exception e)
        {
            System.Debug('An error occurred in ProcessSFDCToCTSAsynchRequest: ' + e.getMessage());
        }
    }
    
    /* public static void ProcessCreateTicketAPIResponse(String ctsCreateTicketResponse)
    {
        System.Debug('*** Entering Method ProcessCreateTicketAPIResponse ***');
    
        try
        {
            String jsonString = ctsCreateTicketResponse;
            String objNameAndId;
            String objectId;
            List<CTSTicketResponse> ctsTicketResp = (List<CTSTicketResponse>)JSON.deserialize(jsonString, List<CTSTicketResponse>.class);
            List<SFDCToCTSAsynchRequest__c> dmlAsyncRecordsUpdate = new List<SFDCToCTSAsynchRequest__c>();
            Set<String> objectIds = new Set<String>();
            
            CTSTicketResponse.Response respMainNode;
            CTSTicketResponse.Data respDataNode;
            CTSTicketResponse.Errors respErrorNode;
            
            for(CTSTicketResponse ctr : ctsTicketResp){
            
                objNameAndId = respMainNode.clientRequestId;
            
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
            
                objNameAndId = respMainNode.clientRequestId;
                String ctsTicketNumber = respDataNode.ticketNumber;
                String asyncStatus = (respMainNode.status == 'Success' ? 'SUCCESS' : 'ERROR');
                String errorMsg = (!String.IsBlank(respErrorNode.message) ? respErrorNode.message : null);
                
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
    } */
    
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
            List<CTSTicketResponse> ctsTicketResp = (List<CTSTicketResponse>)JSON.deserialize(res, List<CTSTicketResponse>.class);
            List<SFDCToCTSAsynchRequest__c> dmlAsyncRecordsUpdate = new List<SFDCToCTSAsynchRequest__c>();
            Set<String> objectIds = new Set<String>();                       
            
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
                String ctsTicketNumber = (ctr.Data != null ? ctr.Data.details[0].ticketNumber : '');
                String asyncStatus = (ctr.status == 'Success' ? 'SUCCESS' : 'ERROR');
                String errorMsg = (ctr.errors != null ? ctr.errors[0].message : null);
                
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
    
    public static void UpdateSFDCObject(List<Id> objectIds)
    {
        System.Debug('*** Entering Method UpdateSFDCObject ***');
    
        List<Case> dmlCases = new List<Case>();
        List<Quality_Case__c> dmlQualityCases = new List<Quality_Case__c>();
        List<Organic_Analysis__c> dmlOrganicCases = new List<Organic_Analysis__c>();
        List<Customer_Surveys__c> dmlCustomerSurveys = new List<Customer_Surveys__c>();
        Map<String, SFDCToCTSAsynchRequest__c> asyncRequestMap = new Map<String, SFDCToCTSAsynchRequest__c>();
        Map<Id, Case> caseMap = new Map<Id, Case>();
        Map<Id, Quality_Case__c> qualityCaseMap = new Map<Id, Quality_Case__c>();
        Map<Id, Organic_Analysis__c> orgCaseMap = new Map<Id, Organic_Analysis__c>();
        Map<Id, Customer_Surveys__c> custSurveysMap = new Map<Id, Customer_Surveys__c>();
    
        for(SFDCToCTSAsynchRequest__c ar :
            [SELECT Id,
                    ExternalTicketId__c,
                    ObjectId__c,
                    Object_Name__c
               FROM SFDCToCTSAsynchRequest__c
              WHERE Id IN: objectIds]){
        
            asyncRequestMap.put(ar.ObjectId__c, ar);
        }
        
        if(asyncRequestMap.size() > 0){
        
            for(Case c : 
                [SELECT Id,
                        External_Ticket_ID__c,
                        External_Ticket_System__c
                   FROM Case
                  WHERE Id IN: objectIds]){
            
                caseMap.put(c.Id, c);
            }
            
            for(Organic_Analysis__c oa :
                [SELECT Id,
                        External_Ticket_ID__c,
                        External_Ticket_System__c
                   FROM Organic_Analysis__c
                  WHERE Id IN: objectIds]){
            
                orgCaseMap.put(oa.Id, oa);
            }
            
            for(Quality_Case__c qc :
                [SELECT Id,
                        External_Ticket_ID__c,
                        External_Ticket_System__c
                   FROM Quality_Case__c
                  WHERE Id IN: objectIds]){
            
                qualityCaseMap.put(qc.Id, qc);
            }
            
            for(Customer_Surveys__c cs :
                [SELECT Id,
                        External_Ticket_ID__c,
                        External_Ticket_System__c
                   FROM Customer_Surveys__c
                  WHERE Id IN: objectIds]){
            
                custSurveysMap.put(cs.Id, cs);
            }
        
            for(SFDCToCTSAsynchRequest__c arMap : asyncRequestMap.values()){
            
                System.Debug('Object to Update: ' + arMap.Object_Name__c);
            
                switch on arMap.Object_Name__c{
                    when 'Case' {
                       
                       for(Case c : caseMap.values()){
                           
                           if(arMap.ObjectId__c == String.valueOf(c.Id)){
                           
                               c.External_Ticket_ID__c = arMap.ExternalTicketId__c;
                               c.External_Ticket_System__c = 'CTS';
                                    
                               dmlCases.add(c);
                           }
                        }
                    }
                    when 'Quality_Case__c' {
                        
                        for(Quality_Case__c qc : qualityCaseMap.values()){
                            
                            if(arMap.ObjectId__c == String.valueOf(qc.Id)){
                            
                                qc.External_Ticket_ID__c = arMap.ExternalTicketId__c;
                                qc.External_Ticket_System__c = 'CTS';
                                    
                                dmlQualityCases.add(qc);
                            }
                        }
                    }
                    when 'Organic_Analysis__c' {
                        
                        for(Organic_Analysis__c oa : orgCaseMap.values()){
                            
                            if(arMap.ObjectId__c == String.valueOf(oa.Id)){
                            
                                oa.External_Ticket_ID__c = arMap.ExternalTicketId__c;
                                oa.External_Ticket_System__c = 'CTS';
                                    
                                dmlOrganicCases.add(oa);
                            }
                        }
                    }
                    when 'Customer_Surveys__c' {
                        
                        for(Customer_Surveys__c cs : custSurveysMap.values()){
                            
                            if(arMap.ObjectId__c == String.valueOf(cs.Id)){
                            
                                cs.External_Ticket_ID__c = arMap.ExternalTicketId__c;
                                cs.External_Ticket_System__c = 'CTS';
                                    
                                dmlCustomerSurveys.add(cs);
                            }
                        }
                    }
                }
            }
            
            if(dmlCases.size() > 0)
            {
                update dmlCases;
            }
            if(dmlQualityCases.size() > 0)
            {
                update dmlQualityCases;
            }
            if(dmlOrganicCases.size() > 0)
            {
                update dmlOrganicCases;
            }
            if(dmlCustomerSurveys.size() > 0)
            {
                update dmlCustomerSurveys;
            }
        }
        System.Debug('Number of Case Records: ' + String.valueOf(dmlCases.size()));
        System.Debug('Number of Organic Case Records: ' + String.valueOf(dmlOrganicCases.size()));
        System.Debug('Number of Quality Case Records: ' + String.valueOf(dmlQualityCases.size()));
        System.Debug('Number of Customer Survey Records: ' + String.valueOf(dmlCustomerSurveys.size()));
        System.Debug('*** End Method UpdateSFDCObject ***');
    }
    
    public static CTS_Integration_Setting__mdt GetCTSIntegrationSettings()
    {
        CTS_Integration_Setting__mdt ctsIntSettings = 
            [SELECT Id,
                    MasterLabel,
                    AsyncDelayInterval__c,
                    AsyncRetrievalSize__c,
                    BatchSize__c,
                    CTScrmId__c,
                    DefaultContactId__c,
                    ESBapiAccessKey__c,
                    RequestedService__c,
                    IsActive__c
               FROM CTS_Integration_Setting__mdt
              WHERE IsActive__c = true
              LIMIT 1];
                  
        return ctsIntSettings;
    }
    
    private static String GetConfigValue(string configLabel)
    {
        String configValue = 
            [SELECT Id, 
                    External_System_Name__c, 
                    MasterLabel, 
                    Configuration_Label__c, 
                    Data_Type__c, 
                    Configuration_Value__c 
               FROM Integration_Configuration__mdt 
              WHERE Is_Active__c = true AND
                    External_System_Name__c = 'CTS' AND
                    Configuration_Label__c = :configLabel
              LIMIT 1].Configuration_Value__c;
              
         return configValue;
    }
}