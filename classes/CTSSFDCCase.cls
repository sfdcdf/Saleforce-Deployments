public class CTSSFDCCase extends CTS_SFDC_Object_Base
{    
    public string ContactFirstName { get; set; }
    public string ContactLastName { get; set; }
    public string ContactPhone { get; set; }
    public string ContactEmailAddress { get; set; }
    public string ApiIdentifier { get; set; }
    public string ReferenceAccountId { get; set; }
    public string ReferenceCustomerId { get; set; }
    public string CaseNumber { get; set; }
    public string Domain { get; set; }    
    public string ReferenceProductCodes { get; set; }
    public string TicketType { get; set; }
    public string Status { get; set; }
    public string SubStatus { get; set; }  
    public string AlternateContactEmailAddress { get; set; }
    public string TicketingTicketNotes { get; set; }
    
    public CTSSFDCCase (Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Case sfCase)
    {
        super(objId, objName, requestInstance);
        PopulateCaseFields(objId, requestInstance, sfCase);    
    }
    
    private void PopulateCaseFields(Id caseId, SFDCToCTSAsynchRequest__c requestInstance, Case sfCase)
    {                                                                             
        this.ContactFirstName = sfCase.Account.Client_First_Name__c;
        this.ContactLastName = sfCase.Account.Client_Last_Name__c;
        this.ContactPhone = sfCase.Account.Phone;
        this.ContactEmailAddress = sfCase.Client_Email__c;
        this.ApiIdentifier = requestInstance.API_Identifier__c;
        this.ReferenceAccountId = sfCase.Account.Id;
        this.ReferenceCustomerId = sfCase.Account.Client_ID__c;
        this.CaseNumber = sfCase.CaseNumber;
        this.Domain = sfCase.Account.Website;
        this.ReferenceProductCodes = sfCase.Account.Product_Type_Transactional__c;
        this.TicketType = ''; //Which field of routing table?
        this.Status = sfCase.Status;
        this.SubStatus = sfCase.Sub_Status__c;
        this.AlternateContactEmailAddress = sfCase.Account.Email__c;  
        /* List<EmailTemplate> et = [SELECT id FROM EmailTemplate where name = :mappingInstance.NoteDetailsTemplateName__c LIMIT 1];
        if (et.size() > 0)
        {
            Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate((string)et[0].Id, null, caseId);
            this.TicketingTicketNotes = mail.getPlainTextBody();  
        } */                                                                                                                                          
    }       
}