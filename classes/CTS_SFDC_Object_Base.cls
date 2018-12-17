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
         //renderStoredEmailTemplate has the issue of SOQL governor limit
         //Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(emailTemplateId, null, Id, Messaging.AttachmentRetrievalOption.NONE);
                  
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         String[] toAddresses = new String[]{'YodleSFDC@fake.com'};
         mail.setToAddresses(toAddresses);
         mail.setUseSignature(false);
         mail.setSaveAsActivity(false);
         mail.setSenderDisplayName('YodleSFDC');
         mail.setTargetObjectId(This.Id);
         mail.setTemplateId(emailTemplateId);
         Savepoint sp = Database.setSavepoint();
         Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
         Database.rollback(sp);
         return mail;                      
    }
}