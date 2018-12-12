public virtual class CTS_SFDC_Object_Base
{
    public Id Id { get; set; }
    public String ObjectName { get; set; }
    public String Subject { get; set; }
    public String Detail { get; set; }
    
    public CTS_SFDC_Object_Base(Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance)
    {
        this.Id = objId;
        this.ObjectName = objName;
        Messaging.SingleEmailMessage mail = PopulateEmailSubjectBody(requestInstance.EmailTemplateId__c);
        if (mail != null)
        {
            this.Subject = mail.getSubject();
            this.Detail = mail.getPlainTextBody(); 
            system.debug('email subject: ' + this.Subject);
            system.debug('email body: ' + this.Detail);   
        }           
    }
    
    private Messaging.SingleEmailMessage PopulateEmailSubjectBody(String emailTemplateId)
    {                
         Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateId, null, Id, Messaging.AttachmentRetrievalOption.NONE);
         return mail;                      
    }
}