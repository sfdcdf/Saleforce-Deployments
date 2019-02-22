public virtual class CTS_SFDC_Object_Base
{
    public Id Id { get; set; }
    public String ObjectName { get; set; }
    public string Status { get; set; }
    public String Subject { get; set; }
    public String Detail { get; set; }
    public string ContactFirstName { get; set; }
    public string ContactLastName { get; set; }
    public string ContactPhone { get; set; }
    public string ReferenceAccountId { get; set; }
    public string ReferenceCustomerId { get; set; }
    public string ReferenceProductCodes { get; set; }
    public string Domain { get; set; }  
    public string ApiIdentifier { get; set; } 
    public string AlternateContactEmailAddress { get; set; } 
    
    private void CTS_SFDC_Object_Base(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance)
    {
        this.Id = objId;
        this.ObjectName = objName;
        this.ApiIdentifier = requestInstance.API_Identifier__c; 
        this.Status = 'Open';
        Messaging.SingleEmailMessage mail = PopulateEmailSubjectBody(requestInstance.EmailTemplateId__c);
        if (mail != null)
        {
            this.Subject = mail.getSubject();
            this.Detail = mail.getPlainTextBody(); 
            system.debug('email subject: ' + this.Subject);
            system.debug('email body: ' + this.Detail);   
        }           
    }
    
    public CTS_SFDC_Object_Base(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Case sfCase)
    {
        CTS_SFDC_Object_Base(objId, objName, requestInstance);
        this.ContactFirstName = sfCase.Account.Client_First_Name__c;
        this.ContactLastName = sfCase.Account.Client_Last_Name__c;
        this.ContactPhone = sfCase.Account.Phone;
        this.ReferenceAccountId = sfCase.Account.Id;
        this.ReferenceCustomerId = sfCase.Account.Client_ID__c;                                   
        this.Domain = sfCase.Account.Website;
        this.ReferenceProductCodes = sfCase.Account.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = sfCase.Account.Email__c;             
    }
    
    
    public CTS_SFDC_Object_Base(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Organic_Analysis__c organicCase)
    {
        CTS_SFDC_Object_Base(objId, objName, requestInstance);
        this.ContactFirstName = organicCase.Account_Name__r.Client_First_Name__c;
        this.ContactLastName = organicCase.Account_Name__r.Client_Last_Name__c;
        this.ContactPhone = organicCase.Account_Name__r.Phone;
        this.ReferenceAccountId = organicCase.Account_Name__r.Id;
        this.ReferenceCustomerId = organicCase.Account_Name__r.Client_ID__c;                                   
        this.Domain = organicCase.Account_Name__r.Website;
        this.ReferenceProductCodes = organicCase.Account_Name__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = organicCase.Account_Name__r.Email__c;             
    }
    
    public CTS_SFDC_Object_Base(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Quality_Case__c qualityCase)
    {
        CTS_SFDC_Object_Base(objId, objName, requestInstance);
        this.ContactFirstName = qualityCase.Account_Name__r.Client_First_Name__c;
        this.ContactLastName = qualityCase.Account_Name__r.Client_Last_Name__c;
        this.ContactPhone = qualityCase.Account_Name__r.Phone;
        this.ReferenceAccountId = qualityCase.Account_Name__r.Id;
        this.ReferenceCustomerId = qualityCase.Account_Name__r.Client_ID__c;                                   
        this.Domain = qualityCase.Account_Name__r.Website;
        this.ReferenceProductCodes = qualityCase.Account_Name__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = qualityCase.Account_Name__r.Email__c;             
    }
    
    public CTS_SFDC_Object_Base(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Best_Practice_Evaluation__c bpe)
    {
        CTS_SFDC_Object_Base(objId, objName, requestInstance);
        this.ContactFirstName = bpe.Account_Name__r.Client_First_Name__c;
        this.ContactLastName = bpe.Account_Name__r.Client_Last_Name__c;
        this.ContactPhone = bpe.Account_Name__r.Phone;
        this.ReferenceAccountId = bpe.Account_Name__r.Id;
        this.ReferenceCustomerId = bpe.Account_Name__r.Client_ID__c;                                   
        this.Domain = bpe.Account_Name__r.Website;
        this.ReferenceProductCodes = bpe.Account_Name__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = bpe.Account_Name__r.Email__c;             
    }
    
    public CTS_SFDC_Object_Base(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Customer_Surveys__c customerSurvey)
    {
        CTS_SFDC_Object_Base(objId, objName, requestInstance);
        this.ContactFirstName = customerSurvey.Account__r.Client_First_Name__c;
        this.ContactLastName = customerSurvey.Account__r.Client_Last_Name__c;
        this.ContactPhone = customerSurvey.Account__r.Phone;
        this.ReferenceAccountId = customerSurvey.Account__r.Id;
        this.ReferenceCustomerId = customerSurvey.Account__r.Client_ID__c;                                   
        this.Domain = customerSurvey.Account__r.Website;
        this.ReferenceProductCodes = customerSurvey.Account__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = customerSurvey.Account__r.Email__c;             
    }
    
    public CTS_SFDC_Object_Base(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Lighthouse_Worksheets__c sheet)
    {
        CTS_SFDC_Object_Base(objId, objName, requestInstance);
        this.ContactFirstName = sheet.Practice_Name__r.Client_First_Name__c;
        this.ContactLastName = sheet.Practice_Name__r.Client_Last_Name__c;
        this.ContactPhone = sheet.Practice_Name__r.Phone;
        this.ReferenceAccountId = sheet.Practice_Name__r.Id;
        this.ReferenceCustomerId = sheet.Practice_Name__r.Client_ID__c;                                   
        this.Domain = sheet.Practice_Name__r.Website;
        this.ReferenceProductCodes = sheet.Practice_Name__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = sheet.Practice_Name__r.Email__c;             
    }
    
    private Messaging.SingleEmailMessage PopulateEmailSubjectBody(String emailTemplateId)
    {    
         //renderStoredEmailTemplate has the issue of SOQL governor limit
         //Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateId, null, Id, Messaging.AttachmentRetrievalOption.NONE);
                  
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         String[] toAddresses = new String[]{'YodleSFDC@fake.com'};
         mail.setToAddresses(toAddresses);
         mail.setUseSignature(false);
         mail.setSaveAsActivity(false);
         mail.setSenderDisplayName('YodleSFDC');         
         mail.setWhatId(This.Id); 
         mail.setTemplateId(emailTemplateId);
         Savepoint sp = Database.setSavepoint();
         Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
         Database.rollback(sp);
         return mail;                      
    }
}