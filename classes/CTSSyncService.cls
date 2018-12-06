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

    public static List<CTSTicket> GetCTSTicket(string objectName, List<Id> objectIds, List<CTSObjectTriggerMap__mdt> routingTableObjectInstance){
 
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
        String initStatus = GetConfigValue('CTSTicketStatusDefault');
        
        for(EmailTemplate e:
            [SELECT Id,
                    Name
               FROM EmailTemplate 
              WHERE Folder.Name = :ctsTemplateFolder]){
        
            emailTemplateMap.put(e.Name, e);    
        
        }
        
        for(CTSObjectTriggerMap__mdt rt : routingTableObjectInstance){
            
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
                    when 'Lighthouse_Worksheets__c' {
                       for(Lighthouse_Worksheets__c lhw :
                           [SELECT Id,
                                   Name,
                                   Subject__c,
                                   Client_Email__c,
                                   Primary_website__c,
                                   Client_Email_from_Acct__c,
                                   Practice_Name__r.Client_First_Name__c,
                                   Practice_Name__r.Client_Last_Name__c,
                                   Practice_Name__r.Phone,
                                   Practice_Name__r.Email__c,
                                   Practice_Name__r.Client_E_mail__c,
                                   Practice_Name__r.Id,
                                   Practice_Name__r.Client_ID__c,
                                   Practice_Name__r.Product_Type_Transactional__c,
                                   Practice_Name__r.Name,
                                   RecordType.Name
                              FROM Lighthouse_Worksheets__c
                             WHERE Id IN :objectIds]){
                                
                            if (lhw.RecordType.Name == recordTypeName)
                            {
                                Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateMap.get(rt.DetailsTemplateName__c).Id, null, lhw.Id);
                                ticketDetails = mail.getPlainTextBody();
                                emailTemplateId = emailTemplateMap.get(rt.DetailsTemplateName__c).Id;
                                        
                                ctsTicketInstance.contactFirstName = lhw.Practice_Name__r.Client_First_Name__c;
                                ctsTicketInstance.contactLastName = lhw.Practice_Name__r.Client_Last_Name__c;
                                ctsTicketInstance.contactPhone = lhw.Practice_Name__r.Phone;
                                ctsTicketInstance.contactEmailAddress = lhw.Client_Email__c;
                                ctsTicketInstance.referenceAccountId = lhw.Practice_Name__r.Name;
                                ctsTicketInstance.referenceCustomerId = lhw.Practice_Name__r.Client_ID__c;
                                ctsTicketInstance.referenceProductInstanceId = lhw.Name;
                                ctsTicketInstance.domain = lhw.Primary_website__c;
                                ctsTicketInstance.subject = lhw.Subject__c;
                                ctsTicketInstance.detail = ticketDetails;
                                ctsTicketInstance.referenceProductCode = lhw.Practice_Name__r.Product_Type_Transactional__c;
                                ctsTicketInstance.alternateContactEmailAddress = lhw.Client_Email_from_Acct__c;
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
    
    public static CTS_SFDC_Object_Base GetSFDCObject(string objectName, Id objectId, CTSObjectTriggerMap__mdt mappingInstance)    
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
         
         List<CTS_Salesforce_Object_Ref__mdt> ctsObjects = [SELECT Id FROM CTS_Salesforce_Object_Ref__mdt WHERE Object_API_Name__c = :objName LIMIT 1];
                
         Map<String, String> fieldMap = new Map<String, String>();
         fieldMap.put('Object__c', ctsObjects[0].Id);
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
         fieldMap.put('CaseOrigin__c', caseOrigin); 
         routingObj = FindRoutingObject(routeMappings, fieldMap);
         if (routingObj != null)
             return routingObj;  
             
         //D. 0 & 1 & 4
         fieldMap.remove('CaseOrigin__c');        
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
             if (obj.get('RecordTypeName__c') == 'CATCHALL' && obj.get('Object__c') == ctsObjects[0].Id)
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
    
    public static List<String> GetCTSTicketJSON(List<CTSTicket> ctsTickets)
    {
       List<String> jsonTickets = new List<String>();
       
       for (CTSTicket ticket : ctsTickets)
       {
           JSONGenerator bodyJSON = JSON.createGenerator(false); 
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
           // categoryId? mandatory
           // sfdcTemplateIdForDetails?
           bodyJSON.writeEndObject();
           jsonTickets.add(bodyJSON.getAsString());
       }
       
       
       return jsonTickets;
    }
}