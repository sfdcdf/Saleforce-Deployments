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

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
 
        // Define variables used
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
   
        // Set the result to true. No need to send an email back to the user with an error message
        result.success = true;
   
        // Return the result for the Apex Email Service
        return result;
    }
}