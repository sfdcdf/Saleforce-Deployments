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
        this.Subject = mail.getSubject();
        this.Detail = mail.getPlainTextBody();       
    }
    
    private Messaging.SingleEmailMessage PopulateEmailSubjectBody(String emailTemplateName)
    {
        EmailTemplate et=[SELECT id FROM EmailTemplate where name = :emailTemplateName LIMIT 1];
        Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate((string)et.Id, null, Id, Messaging.AttachmentRetrievalOption.NONE);
        return mail;      
    }
}