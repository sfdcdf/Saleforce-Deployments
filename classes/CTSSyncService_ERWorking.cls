/****************************************************************************
  Eugene Ross Working copy
*****************************************************************************/
public without sharing class CTSSyncService_ERWorking{

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
                        asyncRecord.ScheduledDateTime__c = System.Now();
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