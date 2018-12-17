public class CTSSFDCCase extends CTS_SFDC_Object_Base
{    
    
    public string ContactEmailAddress { get; set; }       
    public string CaseNumber { get; set; }        
    public string TicketType { get; set; }    
    public string SubStatus { get; set; }      
    public string TicketingTicketNotes { get; set; }    
    public CTSSFDCCase (Id objId, String objName, SFDCToCTSAsynchRequest__c requestInstance, Case sfCase)
    {
        super(objId, objName, requestInstance, sfCase);
        PopulateCaseFields(objId, requestInstance, sfCase);    
    }
    
    private void PopulateCaseFields(Id caseId, SFDCToCTSAsynchRequest__c requestInstance, Case sfCase)
    {       
        this.ContactEmailAddress = sfCase.Client_Email__c;
        this.CaseNumber = sfCase.CaseNumber;                                                                      
        //this.ContactFirstName = sfCase.Account.Client_First_Name__c;
        //this.ContactLastName = sfCase.Account.Client_Last_Name__c;
        //this.ContactPhone = sfCase.Account.Phone;
        //this.ReferenceAccountId = sfCase.Account.Id;
        //this.ReferenceCustomerId = sfCase.Account.Client_ID__c;               
        //this.ApiIdentifier = requestInstance.API_Identifier__c;                
        //this.Domain = sfCase.Account.Website;
        //this.ReferenceProductCodes = sfCase.Account.Product_Type_Transactional__c;
        //this.TicketType = ''; 
        //this.Status = 'Open';
        //this.SubStatus = sfCase.Sub_Status__c;
        //this.AlternateContactEmailAddress = sfCase.Account.Email__c;  
        /* List<EmailTemplate> et = [SELECT id FROM EmailTemplate where name = :mappingInstance.NoteDetailsTemplateName__c LIMIT 1];
        if (et.size() > 0)
        {
            Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate((string)et[0].Id, null, caseId);
            this.TicketingTicketNotes = mail.getPlainTextBody();  
        } */                                                                                                                                          
    }       
}