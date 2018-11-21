public virtual class CTS_SFDC_Object_Base
{
    public Id Id { get; set; }
    public String ObjectName { get; set; }
    public String Subject { get; set; }
    public String Detail { get; set; }
    
    public CTS_SFDC_Object_Base(Id objId, String objName, CTSObjectTriggerMap__mdt mappingInstance)
    {
        this.Id = objId;
        this.ObjectName = objName;
        Messaging.SingleEmailMessage mail = PopulateEmailSubjectBody(mappingInstance.DetailsTemplateName__c);
        if (mail != null)
        {
            this.Subject = mail.getSubject();
            this.Detail = mail.getPlainTextBody(); 
            system.debug('email subject: ' + this.Subject);
            system.debug('email body: ' + this.Detail);   
        }           
    }
    
    private Messaging.SingleEmailMessage PopulateEmailSubjectBody(String emailTemplateName)
    {        
        List<EmailTemplate> et = [SELECT id FROM EmailTemplate where name = :emailTemplateName LIMIT 1];
        if (et.size() > 0)
        {
            Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate((string)et[0].Id, null, Id, Messaging.AttachmentRetrievalOption.NONE);
            return mail;
        }
        return null;
              
    }
}