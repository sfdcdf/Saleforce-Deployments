public virtual class CTSSFDCObjectBase
{
    public Id Id { get; set; }
    public String ObjectName { get; set; }
    public string Status { get; set; }
    public String Subject { get; set; }
    public String Detail { get; set; }
    public string ContactFirstName { get; set; }
    public string ContactLastName { get; set; }
    public string ContactEmailAddress { get; set; } 
    public string ContactPhone { get; set; }
    public string ReferenceAccountId { get; set; }
    public string ReferenceCustomerId { get; set; }
    public string ReferenceProductInstanceId { get; set; }
    public string ReferenceProductCodes { get; set; }
    public string Domain { get; set; }  
    public string ApiIdentifier { get; set; } 
    public string AlternateContactEmailAddress { get; set; } 
    public string CRMOrderNumber { get; set; }
    public string CTSEmailAddress { get; set; }
    
    private void CTSSFDCObjectBase(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Messaging.SingleEmailMessage mail)
    {
        this.Id = objId;
        this.ObjectName = objName;
        this.ApiIdentifier = requestInstance.API_Identifier__c;
        this.CTSEmailAddress = requestInstance.CTS_Email_Address__c; 
        this.Status = 'Open';
        this.Subject = mail.getSubject();
        this.Detail = mail.getPlainTextBody();        
        //Manually append Account level info to Detail field
        this.Detail = this.Detail + '\r\n Client Id: ' + ReferenceCustomerId;
        this.Detail = this.Detail + '\r\n Client First Name: ' + ContactFirstName;
        this.Detail = this.Detail + '\r\n Client Last Name: ' + ContactLastName;
        this.Detail = this.Detail + '\r\n Client Email: ' + ContactEmailAddress;        
        this.Detail = this.Detail + '\r\n Client Phone: ' + ContactPhone;
        this.Detail = this.Detail + '\r\n Product Code: ' + ReferenceProductCodes;
        this.Detail += '\r\n';
                
              
        /*system.debug('email subject: ' + this.Subject);
        system.debug('email body: ' + this.Detail); */  
                 
    }
    
    public CTSSFDCObjectBase(Case sfCase, String objName, SFDCToCTSAsynchRequest__c requestInstance, Messaging.SingleEmailMessage mail)
    {        
        this.ContactFirstName = sfCase.Account.Client_First_Name__c;
        this.ContactLastName = sfCase.Account.Client_Last_Name__c;
        this.ContactEmailAddress = sfCase.Account.Email__c;
        this.ContactPhone = sfCase.Account.Phone;
        this.ReferenceAccountId = sfCase.Account.Id;
        this.ReferenceCustomerId = sfCase.Account.Client_ID__c;  
        this.ReferenceProductInstanceId = sfCase.Id;                                  
        this.Domain = sfCase.Account.Website;
        this.ReferenceProductCodes = sfCase.Account.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = sfCase.Client_Email__c;
        this.CRMOrderNumber = sfCase.CaseNumber;  
        CTSSFDCObjectBase(sfCase.Id, objName, requestInstance, mail);          
    }
    
    
    public CTSSFDCObjectBase(Organic_Analysis__c organicCase, String objName, SFDCToCTSAsynchRequest__c requestInstance,  Messaging.SingleEmailMessage mail)
    {        
        this.ContactFirstName = organicCase.Account_Name__r.Client_First_Name__c;
        this.ContactLastName = organicCase.Account_Name__r.Client_Last_Name__c;
        this.ContactEmailAddress = organicCase.Account_Name__r.Email__c; 
        this.ContactPhone = organicCase.Account_Name__r.Phone;
        this.ReferenceAccountId = organicCase.Account_Name__r.Id;
        this.ReferenceCustomerId = organicCase.Account_Name__r.Client_ID__c;  
        this.ReferenceProductInstanceId = organicCase.Id;                                
        this.Domain = organicCase.Account_Name__r.Website;
        this.ReferenceProductCodes = organicCase.Account_Name__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = organicCase.Account_Name__r.Email__c;  
        this.CRMOrderNumber = organicCase.Name;         
        CTSSFDCObjectBase(organicCase.Id, objName, requestInstance, mail);
    }
    
    public CTSSFDCObjectBase(Quality_Case__c qualityCase, String objName, SFDCToCTSAsynchRequest__c requestInstance,  Messaging.SingleEmailMessage mail)
    {        
        this.ContactFirstName = qualityCase.Account_Name__r.Client_First_Name__c;
        this.ContactLastName = qualityCase.Account_Name__r.Client_Last_Name__c;
        this.ContactEmailAddress = qualityCase.Account_Name__r.Email__c;     
        this.ContactPhone = qualityCase.Account_Name__r.Phone;
        this.ReferenceAccountId = qualityCase.Account_Name__r.Id;
        this.ReferenceCustomerId = qualityCase.Account_Name__r.Client_ID__c;   
        this.ReferenceProductInstanceId = qualityCase.Id;                                
        this.Domain = qualityCase.Account_Name__r.Website;
        this.ReferenceProductCodes = qualityCase.Account_Name__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = qualityCase.Account_Name__r.Email__c;
        this.CRMOrderNumber = qualityCase.Name; 
        CTSSFDCObjectBase(qualityCase.Id, objName, requestInstance, mail);             
    }
    
    public CTSSFDCObjectBase(Best_Practice_Evaluation__c bpe, String objName, SFDCToCTSAsynchRequest__c requestInstance,  Messaging.SingleEmailMessage mail)
    {        
        this.ContactFirstName = bpe.Account_Name__r.Client_First_Name__c;
        this.ContactLastName = bpe.Account_Name__r.Client_Last_Name__c;
        this.ContactEmailAddress = bpe.Account_Name__r.Email__c;    
        this.ContactPhone = bpe.Account_Name__r.Phone;
        this.ReferenceAccountId = bpe.Account_Name__r.Id;
        this.ReferenceCustomerId = bpe.Account_Name__r.Client_ID__c;
        this.ReferenceProductInstanceId = bpe.Id;                                   
        this.Domain = bpe.Account_Name__r.Website;
        this.ReferenceProductCodes = bpe.Account_Name__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = bpe.Account_Name__r.Email__c;  
        this.CRMOrderNumber = bpe.Name;  
        CTSSFDCObjectBase(bpe.Id, objName, requestInstance, mail);          
    }
    
    public CTSSFDCObjectBase(Customer_Surveys__c customerSurvey, String objName, SFDCToCTSAsynchRequest__c requestInstance,  Messaging.SingleEmailMessage mail)
    {        
        this.ContactFirstName = customerSurvey.Account__r.Client_First_Name__c;
        this.ContactLastName = customerSurvey.Account__r.Client_Last_Name__c;
        this.ContactEmailAddress = customerSurvey.Account__r.Email__c;    
        this.ContactPhone = customerSurvey.Account__r.Phone;
        this.ReferenceAccountId = customerSurvey.Account__r.Id;
        this.ReferenceCustomerId = customerSurvey.Account__r.Client_ID__c;  
        this.ReferenceProductInstanceId = customerSurvey.Id;                                 
        this.Domain = customerSurvey.Account__r.Website;
        this.ReferenceProductCodes = customerSurvey.Account__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = customerSurvey.Account__r.Email__c; 
        this.CRMOrderNumber = customerSurvey.Name;           
        CTSSFDCObjectBase(customerSurvey.Id, objName, requestInstance, mail);
    }
    
    /*public CTSSFDCObjectBase(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Lighthouse_Worksheets__c sheet)
    {        
        this.ContactFirstName = sheet.Practice_Name__r.Client_First_Name__c;
        this.ContactLastName = sheet.Practice_Name__r.Client_Last_Name__c;
        this.ContactPhone = sheet.Practice_Name__r.Phone;
        this.ReferenceAccountId = sheet.Practice_Name__r.Id;
        this.ReferenceCustomerId = sheet.Practice_Name__r.Client_ID__c;                                   
        this.Domain = sheet.Practice_Name__r.Website;
        this.ReferenceProductCodes = sheet.Practice_Name__r.Product_Type_Transactional__c;        
        this.AlternateContactEmailAddress = sheet.Practice_Name__r.Email__c;  
        CTSSFDCObjectBase(objId, objName, requestInstance);           
    }
    */
    
    
    //Will be moved to CTSSyncServie
    /*private Messaging.SingleEmailMessage PopulateEmailSubjectBody(String emailTemplateId)
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
    }*/
}