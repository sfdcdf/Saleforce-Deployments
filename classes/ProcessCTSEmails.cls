/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 6-Dec-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 6-Dec-2018
  Description ........: Class is used to parse the CTS Email contents/ details and
  update Case data and attachments on the Case record
*****************************************************************************/
global class ProcessCTSEmails implements Messaging.InboundEmailHandler{

    List<Attachment> dmlAttachmentsToInsert = new List<Attachment>();
    List<Case> dmlCasesToUpdate = new List<Case>();
    List<Organic_Analysis__c> dmlOrganicCasesToUpdate = new List<Organic_Analysis__c>();
    List<Quality_Case__c> dmlQualityCasesToUpdate = new List<Quality_Case__c>();
    List<Customer_Surveys__c> dmlCustSurveysToUpdate = new List<Customer_Surveys__c>();
    Integer objIdSubjStart;
    Integer objIdSubjEnd;
    String objIdSubj;
    String fromAddress;
    String[] toAddresses;
    String subjectLine;
    String complTktConst;
    String sfdcListenerEmail;

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
 
        // Define variables used
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
   
        complTktConst = CTSSyncService.GetConfigValue('SubjectLineParse_contentcomplete');
        System.Debug('Completed Ticket Config Value: ' + complTktConst);
        
        sfdcListenerEmail = CTSSyncService.GetConfigValue('ListenerEmailSrvc_sfdc');
        System.Debug('SFDC Listener Config Value: ' + sfdcListenerEmail);
        
        fromAddress = email.fromAddress;
        toAddresses = email.toAddresses;
        subjectLine = email.subject;         
   
        try
        {
            for(String s : toAddresses){
                
                if(subjectLine.contains(complTktConst)){
                
                    objIdSubjStart = subjectLine.LastIndexOf(': ');
                    objIdSubjEnd = subjectLine.trim().length();
                    objIdSubj = subjectLine.substring(objIdSubjStart, objIdSubjEnd);
                    
                    // Organic Case
                    if(objIdSubj.contains('YO-')){
                    
                        
                    
                    }
                    // Quality Case
                    else if(objIdSubj.contains('Q-')){
                    
                    }
                    // Customer Survey
                    else if(objIdSubj.contains('Survey-')){
                    
                    }
                    // Case
                    else{
                    
                    }
                }
            }
        }
        catch(Exception e)
        {
            System.debug('An Error occurred in method handleInboundEmail: ' + e);
        }
   
        // Set the result to true. No need to send an email back to the user with an error message
        result.success = true;
   
        // Return the result for the Apex Email Service
        return result;
    }
    
    void UpdateSFDCObjectCloseStatus(List<String> objNames)
    {
        
    }
    
    // Method to add attachment to related Case
    void addAttachment(Case relatedCase, Messaging.InboundEmail email){
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
            for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
                Attachment attachment = new Attachment();
                    
                // Attach to the related Case record
                attachment.ParentId = relatedCase.Id;
                attachment.Name = email.binaryAttachments[i].filename;
                attachment.Body = email.binaryAttachments[i].body;
                dmlAttachmentsToInsert.add(attachment);
            }
        }
    }
}