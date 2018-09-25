/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 25-Sept-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 25-Sept-2018
  Description ........: Class is used to parse the CTS Email contents/ details and
  update Case data and attachments on the Case record
*****************************************************************************/
global class ProcessCTSInboundMessage implements Messaging.InboundEmailHandler{
 
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
 
        // Create an InboundEmailResult object for returning the result of the Apex Email Service
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        List<Case> dmlCasesToUpdate = new List<Case>();
        String ctsEmailConst = 'copywritingcts@web.com';
        String sfdcEmailConst = 'copywritingsfdc@web.com';
        String fromAddress = '';
        String[] toAddresses;
        String subjectLine = '';
        String emailBody = '';
        String ctsTicketNumber = '';
        String sfdcCaseNumber = '';
        Id sfdcCaseId = '';
        Id organicSetupId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Organic Setup').getRecordTypeId(); 
        Id lsAtvOrganicId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LS ATV Organic Setup').getRecordTypeId(); 
        Id lbwOrganicId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId(); 
        Set<Id> organicSetupIdsSet = new Set<Id>{organicSetupId, lsAtvOrganicId, lbwOrganicId};
        
        // set email message variables
        fromAddress = email.fromAddress;
        toAddresses = email.toAddresses;
        subjectLine = email.subject;
        emailBody = email.plainTextBody;
        
        // parse the Email message properties for relevant Case data after validating
        try {
            
            if(fromAddress == ctsEmailConst){
                for(String s : toAddresses){
                    if(s == sfdcEmailConst){
                    
                        // start parsing
                    
                    }
                }                
            }
        }
        catch (Exception e) {
            System.debug('Issue: ' + e);
        }
   
        // Set the result to true. No need to send an email back to the user with an error message
        result.success = true;
   
        // Return the result for the Apex Email Service
        return result;
    }
}