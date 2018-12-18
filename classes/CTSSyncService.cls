/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 16-Nov-2018
  Description ........: CTS Sync Service class provides the mapping and data elements to send data to CTS from Salesforce
  to create tickets and reference the ticket back to the SFDC object
  
  -- Modifications: --
  Last Modified By ...: E. Ross
  Last Modified Date .: 4-Dec-2018
  Description: Updated GetCTSTicket to bulkify and ensure no SOQL queries inside of loops
*****************************************************************************/
public without sharing class CTSSyncService{

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

    public static List<CTSTicket> GetCTSTicket(string objectName, List<Id> objectIds, Map<Id, CTSObjectTriggerMap__mdt> routingTableObjectInstance){
 
        CTSTicket ctsTicketInstance;
        List<CTSTicket> ctsTicketList = new List<CTSTicket>();
        Map<String, EmailTemplate> emailTemplateMap = new Map<String, EmailTemplate>();
        
        String ticketDetails;
        Id emailTemplateId;
        String integrationType;
        String apiIdentifier;
        String templateName;
        String recordTypeName;
        
        // retrieved from GetConfigValue private method
        String ctsTemplateFolder = GetConfigValue('CTSTemplatesFolder');
        String initStatus = GetConfigValue('CTSTicketStatusDefault').toUppercase();
        
        for(EmailTemplate e:
            [SELECT Id,
                    Name
               FROM EmailTemplate 
              WHERE Folder.Name = :ctsTemplateFolder]){
        
            emailTemplateMap.put(e.Name, e);    
        
        }
        
        for(CTSObjectTriggerMap__mdt rt : routingTableObjectInstance.values()){
            
            if(emailTemplateMap.size() > 0){
                
                for(EmailTemplate et : emailTemplateMap.values()){
                    
                    if(et.Name == emailTemplateMap.get(rt.DetailsTemplateName__c).Name){
                    
                        templateName = emailTemplateMap.get(rt.DetailsTemplateName__c).Name;
                        break;
                    }
                }
                
                integrationType = rt.IntegrationType__c;
                apiIdentifier = rt.CTSAPIIdentifier__c;
                recordTypeName = rt.RecordTypeName__c;
                
                // default ticket values
                ctsTicketInstance.apiIdentifier = apiIdentifier;
                ctsTicketInstance.status = initStatus;
                
                switch on objectName{
                    when 'Case' {
                        for(Case c : 
                            [SELECT Id,
                                    Account.Client_First_Name__c,
                                    Account.Client_Last_Name__c,
                                    Account.Phone,
                                    Account.Email__c,
                                    Client_Email__c,
                                    Account.Name,
                                    Account.Client_ID__c,
                                    Account.Website,
                                    Subject,
                                    CaseNumber,
                                    Account.Product_Type_Transactional__c,
                                    RecordType.Name
                               FROM Case
                              WHERE Id IN :objectIds]){
                            
                            if (c.RecordType.Name == recordTypeName)
                            {
                                Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateMap.get(rt.DetailsTemplateName__c).Id, null, c.Id);
                                ticketDetails = mail.getPlainTextBody();
                                emailTemplateId = emailTemplateMap.get(rt.DetailsTemplateName__c).Id;
                                    
                                ctsTicketInstance.contactFirstName = c.Account.Client_First_Name__c;
                                ctsTicketInstance.contactLastName = c.Account.Client_Last_Name__c;
                                ctsTicketInstance.contactPhone = c.Account.Phone;
                                ctsTicketInstance.contactEmailAddress = c.Client_Email__c;
                                ctsTicketInstance.referenceAccountId = c.Account.Name;
                                ctsTicketInstance.referenceCustomerId = c.Account.Client_ID__c;
                                ctsTicketInstance.referenceProductInstanceId = c.CaseNumber;
                                ctsTicketInstance.domain = c.Account.Website;
                                ctsTicketInstance.subject = c.Subject;
                                ctsTicketInstance.detail = ticketDetails;
                                ctsTicketInstance.referenceProductCode = c.Account.Product_Type_Transactional__c;
                                ctsTicketInstance.alternateContactEmailAddress = c.Account.Email__c;
                                ctsTicketInstance.sfdcTemplateIdForDetails = emailTemplateId;
                                
                                ctsTicketList.add(ctsTicketInstance);
                            }   
                        }
                    }
                    when 'Organic_Analysis__c' {
                       for(Organic_Analysis__c oc :
                           [SELECT Id,
                                   Name,
                                   Account_Name__r.Client_First_Name__c,
                                   Account_Name__r.Client_Last_Name__c,
                                   Account_Name__r.Phone,
                                   Account_Name__r.Email__c,
                                   Client_Email_Address__c,
                                   Account_Name__r.Id,
                                   Account_Name__r.Client_ID__c,
                                   Account_Name__r.Product_Type_Transactional__c,
                                   Account_Name__r.Name,
                                   RecordType.Name
                              FROM Organic_Analysis__c 
                             WHERE Id IN :objectIds]){
                                
                            if (oc.RecordType.Name == recordTypeName)
                            {
                                Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateMap.get(rt.DetailsTemplateName__c).Id, null, oc.Id);
                                ticketDetails = mail.getPlainTextBody();
                                emailTemplateId = emailTemplateMap.get(rt.DetailsTemplateName__c).Id;
                                    
                                ctsTicketInstance.contactFirstName = oc.Account_Name__r.Client_First_Name__c;
                                ctsTicketInstance.contactLastName = oc.Account_Name__r.Client_Last_Name__c;
                                ctsTicketInstance.contactPhone = oc.Account_Name__r.Phone;
                                ctsTicketInstance.contactEmailAddress = oc.Client_Email_Address__c;
                                ctsTicketInstance.referenceAccountId = oc.Account_Name__r.Name;
                                ctsTicketInstance.referenceCustomerId = oc.Account_Name__r.Client_ID__c;
                                ctsTicketInstance.referenceProductInstanceId = oc.Name;
                                ctsTicketInstance.domain = oc.Account_Name__r.Website;
                                ctsTicketInstance.subject = recordTypeName + ' | ' + oc.Account_Name__r.Name;
                                ctsTicketInstance.detail = ticketDetails;
                                ctsTicketInstance.referenceProductCode = oc.Account_Name__r.Product_Type_Transactional__c;
                                ctsTicketInstance.alternateContactEmailAddress = oc.Account_Name__r.Email__c;
                                ctsTicketInstance.sfdcTemplateIdForDetails = emailTemplateId;
                                
                                ctsTicketList.add(ctsTicketInstance);
                            }
                        }             
                    }
                    when 'Quality_Case__c' {
                       for(Quality_Case__c qc :
                           [SELECT Id,
                                   Name,
                                   Subject__c,
                                   Account_Name__r.Client_First_Name__c,
                                   Account_Name__r.Client_Last_Name__c,
                                   Account_Name__r.Phone,
                                   Account_Name__r.Email__c,
                                   Account_Name__r.Client_E_mail__c,
                                   Account_Name__r.Id,
                                   Account_Name__r.Client_ID__c,
                                   Account_Name__r.Product_Type_Transactional__c,
                                   Account_Name__r.Name,
                                   RecordType.Name
                              FROM Quality_Case__c
                             WHERE Id IN :objectIds]){
                                
                            if (qc.RecordType.Name == recordTypeName)
                            {
                                Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateMap.get(rt.DetailsTemplateName__c).Id, null, qc.Id);
                                ticketDetails = mail.getPlainTextBody();
                                emailTemplateId = emailTemplateMap.get(rt.DetailsTemplateName__c).Id;
                                    
                                ctsTicketInstance.contactFirstName = qc.Account_Name__r.Client_First_Name__c;
                                ctsTicketInstance.contactLastName = qc.Account_Name__r.Client_Last_Name__c;
                                ctsTicketInstance.contactPhone = qc.Account_Name__r.Phone;
                                ctsTicketInstance.contactEmailAddress = qc.Account_Name__r.Client_E_mail__c;
                                ctsTicketInstance.referenceAccountId = qc.Account_Name__r.Name;
                                ctsTicketInstance.referenceCustomerId = qc.Account_Name__r.Client_ID__c;
                                ctsTicketInstance.referenceProductInstanceId = qc.Name;
                                ctsTicketInstance.domain = qc.Account_Name__r.Website;
                                ctsTicketInstance.subject = qc.Subject__c + ' | ' + qc.Account_Name__r.Name;
                                ctsTicketInstance.detail = ticketDetails;
                                ctsTicketInstance.referenceProductCode = qc.Account_Name__r.Product_Type_Transactional__c;
                                ctsTicketInstance.alternateContactEmailAddress = qc.Account_Name__r.Email__c;
                                ctsTicketInstance.sfdcTemplateIdForDetails = emailTemplateId;
                                
                                ctsTicketList.add(ctsTicketInstance);
                            }
                        }             
                    }
                    when 'Best_Practice_Evaluation__c' {
                       for(Best_Practice_Evaluation__c bpe :
                           [SELECT Id,
                                   Name,
                                   Account_Name__r.Client_First_Name__c,
                                   Account_Name__r.Client_Last_Name__c,
                                   Account_Name__r.Phone,
                                   Account_Name__r.Email__c,
                                   Account_Name__r.Client_E_mail__c,
                                   Account_Name__r.Id,
                                   Account_Name__r.Client_ID__c,
                                   Account_Name__r.Product_Type_Transactional__c,
                                   Account_Name__r.Name,
                                   RecordType.Name
                              FROM Best_Practice_Evaluation__c
                             WHERE Id IN :objectIds]){
                                
                            if (bpe.RecordType.Name == recordTypeName)
                            {
                                Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateMap.get(rt.DetailsTemplateName__c).Id, null, bpe.Id);
                                ticketDetails = mail.getPlainTextBody();
                                emailTemplateId = emailTemplateMap.get(rt.DetailsTemplateName__c).Id;
                                    
                                ctsTicketInstance.contactFirstName = bpe.Account_Name__r.Client_First_Name__c;
                                ctsTicketInstance.contactLastName = bpe.Account_Name__r.Client_Last_Name__c;
                                ctsTicketInstance.contactPhone = bpe.Account_Name__r.Phone;
                                ctsTicketInstance.contactEmailAddress = bpe.Account_Name__r.Client_E_mail__c;
                                ctsTicketInstance.referenceAccountId = bpe.Account_Name__r.Name;
                                ctsTicketInstance.referenceCustomerId = bpe.Account_Name__r.Client_ID__c;
                                ctsTicketInstance.referenceProductInstanceId = bpe.Name;
                                ctsTicketInstance.domain = bpe.Account_Name__r.Website;
                                ctsTicketInstance.subject = '';
                                ctsTicketInstance.detail = ticketDetails;
                                ctsTicketInstance.referenceProductCode = bpe.Account_Name__r.Product_Type_Transactional__c;
                                ctsTicketInstance.alternateContactEmailAddress = bpe.Account_Name__r.Email__c;
                                ctsTicketInstance.sfdcTemplateIdForDetails = emailTemplateId;
                                
                                ctsTicketList.add(ctsTicketInstance);
                            }
                       }             
                    }
                    when 'Customer_Surveys__c' {
                       for(Customer_Surveys__c cs :
                           [SELECT Id,
                                   Name,
                                   Client_Email_Survey__c,
                                   Client_ID__c,
                                   Customer_Survey_Name__c,
                                   Account__r.Client_First_Name__c,
                                   Account__r.Client_Last_Name__c,
                                   Account__r.Phone,
                                   Account__r.Email__c,
                                   Account__r.Client_E_mail__c,
                                   Account__r.Id,
                                   Account__r.Client_ID__c,
                                   Account__r.Product_Type_Transactional__c,
                                   Account__r.Name,
                                   RecordType.Name
                              FROM Customer_Surveys__c
                             WHERE Id IN :objectIds]){
                                
                            if (cs.RecordType.Name == recordTypeName)
                            {
                                Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateMap.get(rt.DetailsTemplateName__c).Id, null, cs.Id);
                                ticketDetails = mail.getPlainTextBody();
                                emailTemplateId = emailTemplateMap.get(rt.DetailsTemplateName__c).Id;
                                    
                                ctsTicketInstance.contactFirstName = cs.Account__r.Client_First_Name__c;
                                ctsTicketInstance.contactLastName = cs.Account__r.Client_Last_Name__c;
                                ctsTicketInstance.contactPhone = cs.Account__r.Phone;
                                ctsTicketInstance.contactEmailAddress = cs.Client_Email_Survey__c;
                                ctsTicketInstance.referenceAccountId = cs.Account__r.Name;
                                ctsTicketInstance.referenceCustomerId = cs.Client_ID__c;
                                ctsTicketInstance.referenceProductInstanceId = cs.Name;
                                ctsTicketInstance.domain = cs.Account__r.Website;
                                ctsTicketInstance.subject = cs.Customer_Survey_Name__c + ' | ' + cs.Account__r.Name;
                                ctsTicketInstance.detail = ticketDetails;
                                ctsTicketInstance.referenceProductCode = cs.Account__r.Product_Type_Transactional__c;
                                ctsTicketInstance.alternateContactEmailAddress = cs.Account__r.Email__c;
                                ctsTicketInstance.sfdcTemplateIdForDetails = emailTemplateId;
                                
                                ctsTicketList.add(ctsTicketInstance);
                            }
                        }             
                    }
                }
            }
        }
        
        return ctsTicketList;
    }
    
    public static List<CTS_SFDC_Object_Base> GetSFDCObject(string objectName, Map<Id, SFDCToCTSAsynchRequest__c> requestMap)    
    {          
    
       CTS_SFDC_Object_Base baseObject;
       List<CTS_SFDC_Object_Base> ctsSFDCObjectList = new List<CTS_SFDC_Object_Base>();              
       SFDCToCTSAsynchRequest__c asyncRequest;
                                             
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
                   asyncRequest = requestMap.get((String)sfCase.Id);
                   baseObject = new CTSSFDCCase(sfCase.Id, objectName, asyncRequest, sfCase);
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
                   baseObject = new CTS_SFDC_Object_Base(organicCase.Id, objectName, asyncRequest, organicCase);
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
                   baseObject = new CTS_SFDC_Object_Base(qualityCase.Id, objectName, asyncRequest, qualityCase);
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
                   baseObject = new CTS_SFDC_Object_Base(bpe.Id, objectName, asyncRequest, bpe);
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
                   baseObject = new CTS_SFDC_Object_Base(customerSurvey.Id, objectName, asyncRequest, customerSurvey);
                   ctsSFDCObjectList.add(baseObject);
               }
               
           }           
           when 'Lighthouse_Worksheets__c' {
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
    
     public static HttpResponse CallOutCTSForAPI(String requestBody, CTS_Integration_Setting__mdt integrationSetting){
       
        Http h = new Http();
       
        HttpRequest req = new HttpRequest();        
        //req.setEndpoint(integrationSetting.ESBAPIEndPoint__c);
        req.setEndpoint('callout:CTSSyncService');
        req.setBody(requestBody);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(120000);

        // Send the request, and return a response
        HttpResponse res = h.send(req);       

        return res;
    }    
    
    public void CallOutCTSForEmail(String objectId, String emailTemplateId, String ctsEmailAddress)
    {
        try{
        
            List<Messaging.SingleEmailMessage> ctsNotificationsLst = new List<Messaging.SingleEmailMessage>();
            OrgWideEmailAddress[] owea = [SELECT Id FROM OrgWideEmailAddress WHERE Address = 'sfdc@yodle.com'];
            String sfdcEmailAddress = GetConfigValue('SFDC_Case_Email');
            Set<String> uniqueEmailAddressesSet = new Set<String>();
            String messageSubject;
            String messageBody;
            
            // Render template data and bind elements to variables
            Messaging.SingleEmailMessage renderedDetails = Messaging.renderStoredEmailTemplate(emailTemplateId, null, objectId);
            messageSubject = renderedDetails.getSubject();
            messageBody = renderedDetails.getPlainTextBody();
            
            if(!String.IsBlank(messageSubject) && !String.IsBlank(messageBody)){
            
                // set message content from email template for CTS
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                List<String> toAddress = new List<String>();
                String fromAddress = GetConfigValue('ServiceAddressEmail_sfdc');
                String fromDisplayName = 'Salesforce Notifications';
                uniqueEmailAddressesSet.add(ctsEmailAddress);
                uniqueEmailAddressesSet.add(sfdcEmailAddress);
                for(String s : uniqueEmailAddressesSet){
                    toAddress.add(s);
                }
             
                message.setToAddresses(toAddress);
                message.setReplyTo(fromAddress);
                message.setOrgWideEmailAddressId(owea.get(0).Id);
                message.setSubject(messageSubject);
                message.setHtmlBody(messageBody);
        
                ctsNotificationsLst.add(message);
                
                if(ctsNotificationsLst.size() > 0){
                                
                    // send notifications
                    Messaging.sendEmail(ctsNotificationsLst);
                }
            }
        }
        catch(Exception e){
        
            // log error
            System.Debug('* An error occurred: ' + e.getMessage());
        }
    }
    
    public void CreateSFDCToCTSAsynchRequest(string integrationType, string objectName, List<Id> objectIds, Map<Id, CTSObjectTriggerMap__mdt> routingTableObjectInstance){
    
        List<CTSTicket> ctsTicket = GetCTSTicket(objectName, objectIds, routingTableObjectInstance);
        List<SFDCToCTSAsynchRequest__c> newAsyncRecordsList = new List<SFDCToCTSAsynchRequest__c>();
        
        for(CTSTicket t : ctsTicket){
        
            for(CTSObjectTriggerMap__mdt rt : routingTableObjectInstance.values()){
            
                if(rt.Object__r.Object_API_Name__c == objectName){
                        
                    for(Id objectId : objectIds){
                            
                        SFDCToCTSAsynchRequest__c asyncRecord = new SFDCToCTSAsynchRequest__c();
                        asyncRecord.API_Identifier__c = rt.CTSAPIIdentifier__c;
                        asyncRecord.CTS_Email_Address__c = rt.CTSEmailAddress__c;
                        asyncRecord.EmailTemplateId__c = t.sfdcTemplateIdForDetails;
                        asyncRecord.Integration_Type__c = integrationType;
                        asyncRecord.NumberOfRetryAttempts__c = 0;
                        asyncRecord.ObjectId__c = objectId;
                        asyncRecord.Object_Name__c = objectName;
                        asyncRecord.ScheduledDateTime__c = System.Now(); // placeholder only; need to update
                        asyncRecord.Status__c = t.status;
                        
                        newAsyncRecordsList.add(asyncRecord);
                    }
                }
            }   
        }
        
        if(newAsyncRecordsList.size() > 0){
            insert newAsyncRecordsList;
        }
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