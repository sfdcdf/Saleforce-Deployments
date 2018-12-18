/****************************************************************************
  Eugene Ross Working copy
*****************************************************************************/
public without sharing class CTSSyncService_ERWorking{

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
        public String referenceAccountId {get; set;}
        public String referenceCustomerId {get; set;}
        public String referenceProductCode {get; set;}
        public String referenceProductInstanceId {get; set;}
        public Id sfdcTemplateIdForDetails {get; set;}
        public String status {get; set;}
        public String subject {get; set;}
    
    }

    public static List<CTSTicket> GetCTSTicket(List<CTSSFDCObjectBase> sfdcObjectList, List<Id> objectIds, Map<Id, CTSObjectTriggerMap__mdt> routingTableObjectInstance){
 
        CTSTicket ctsTicketInstance;
        List<CTSTicket> ctsTicketList = new List<CTSTicket>();
        Map<String, EmailTemplate> emailTemplateMap = new Map<String, EmailTemplate>();
        
        String objectName;
        String ticketDetails;
        Id emailTemplateId;
        String integrationType;
        String apiIdentifier;
        
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
                    
                        emailTemplateId = emailTemplateMap.get(rt.DetailsTemplateName__c).Id;
                        break;
                    }
                }
                
                integrationType = rt.IntegrationType__c;
                apiIdentifier = rt.CTSAPIIdentifier__c;
                
                // default ticket values
                ctsTicketInstance.apiIdentifier = apiIdentifier;
                ctsTicketInstance.status = initStatus;
                
                for(CTSSFDCObjectBase sfdcObj : sfdcObjectList){
                
                    if(rt.Object__r.Object_API_Name__c == sfdcObj.ObjectName){
                    
                        ctsTicketInstance.crmOrderNumber = sfdcObj.CRMOrderNumber;
                        ctsTicketInstance.contactFirstName = sfdcObj.ContactFirstName;
                        ctsTicketInstance.contactLastName = sfdcObj.ContactLastName;
                        ctsTicketInstance.contactPhone = sfdcObj.ContactPhone;
                        ctsTicketInstance.contactEmailAddress = sfdcObj.ContactEmailAddress;
                        ctsTicketInstance.referenceAccountId = sfdcObj.ReferenceAccountId;
                        ctsTicketInstance.referenceCustomerId = sfdcObj.ReferenceCustomerId;
                        ctsTicketInstance.referenceProductInstanceId = sfdcObj.ReferenceProductInstanceId;
                        ctsTicketInstance.domain = sfdcObj.Domain;
                        ctsTicketInstance.subject = sfdcObj.Subject;
                        ctsTicketInstance.detail = sfdcObj.Detail;
                        ctsTicketInstance.referenceProductCode = sfdcObj.ReferenceProductCodes;
                        ctsTicketInstance.alternateContactEmailAddress = sfdcObj.AlternateContactEmailAddress;
                        ctsTicketInstance.sfdcTemplateIdForDetails = emailTemplateId;
                                  
                        ctsTicketList.add(ctsTicketInstance);
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