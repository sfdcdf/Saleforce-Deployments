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
    
    public CTSSFDCCase (Id objId, String objName, CTSObjectTriggerMap__mdt mappingInstance)
    {
        super(objId, objName, mappingInstance);
        PopulateCaseFields(objId, mappingInstance);    
    }
    
    private void PopulateCaseFields(Id caseId, CTSObjectTriggerMap__mdt mappingInstance)
    {
        Case sfCase = [SELECT Id, AccountId, CaseNumber, Subject, Status, Sub_Status__c FROM Case WHERE Id = :caseId];
        
        if (sfCase != null)
        {
            Account acc = [SELECT Id, Client_First_Name__c, Client_Last_Name__c, Phone, Client_E_mail__c, Name, Client_ID__c, 
                       Website, Product_Type_Transactional__c, Email__c FROM ACCOUNT WHERE Id = :sfCase.AccountId];
        
            if (acc != null )
            {                                                     
               this.ContactFirstName = acc.Client_First_Name__c;
               this.ContactLastName = acc.Client_Last_Name__c;
               this.ContactPhone = acc.Phone;
               this.ContactEmailAddress = acc.Client_E_mail__c;
               this.ApiIdentifier = mappingInstance.CTSAPIIdentifier__c;
               this.ReferenceAccountId = acc.Id;
               this.ReferenceCustomerId = acc.Client_ID__c;
               this.CaseNumber = sfCase.CaseNumber;
               this.Domain = acc.Website;
               this.ReferenceProductCodes = acc.Product_Type_Transactional__c;
               this.TicketType = ''; //Which field of routing table?
               this.Status = sfCase.Status;
               this.SubStatus = sfCase.Sub_Status__c;
               this.AlternateContactEmailAddress = acc.Email__c;  
               List<EmailTemplate> et = [SELECT id FROM EmailTemplate where name = :mappingInstance.NoteDetailsTemplateName__c LIMIT 1];
               if (et.size() > 0)
               {
                   Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate((string)et[0].Id, null, caseId);
                   this.TicketingTicketNotes = mail.getPlainTextBody();  
               }                                                                   
            }                       
        }                              
    }       
}