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
        String autoRespConst = 'ARMail';
        String complTktConst = 'ContentCompleted';
        String fromAddress = '';
        String[] toAddresses;
        String subjectLine = '';
        String emailBody = '';
        String ctsTicketNumber = '';
        String sfdcCaseNumber = '';
        Integer ticketStart;
        Integer subjectLen;
        Integer caseStart;
        Integer caseEnd;
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
                    
                        // start parsing to get data
                        subjectLen = subjectLine.Length();
                        ticketStart = subjectLine.LastIndexOf('tkt:');
                        ctsTicketNumber = subjectLine.substring(ticketStart, subjectLen).replace('tkt:', '').replace(']', '');
                        caseStart = subjectLine.LastIndexOf('SFDCCase:');
                        caseEnd = subjectLine.IndexOf(']');
                        sfdcCaseNumber = subjectLine.substring(caseStart, caseEnd).replace('SFDCCase:', '').replace(']', '');
                        
                        System.Debug('**** CTS Ticket Number: ' + ctsTicketNumber);
                        
                        // auto response process
                        if(subjectLine.contains(autoRespConst)){
                        
                            // subject data validation; Need both Case and Ticket #
                            if(!String.isBlank(sfdcCaseNumber) && !String.isBlank(ctsTicketNumber)){
                            
                                // get related Case and update Ticket Number field
                                for(Case arc : 
                                    [SELECT Id,
                                            AccountId,
                                            CTS_Ticket_Number__c,
                                            CaseNumber,
                                            OwnerId
                                       FROM Case
                                      WHERE CaseNumber = :sfdcCaseNumber AND
                                            CTS_Ticket_Number__c = NULL]){
                                
                                    // set update value
                                    arc.CTS_Ticket_Number__c = ctsTicketNumber;
                                    
                                    // add to update list
                                    dmlCasesToUpdate.add(arc);
                                }
                            
                            }
                            else{
                                // send error email template and log errors
                                
                                // both CTS Ticket Number and SFDC Case Number are missing
                                if(String.isBlank(sfdcCaseNumber) && String.isBlank(ctsTicketNumber)){
                                
                                }
                                // only CTS Ticket Number is missing
                                else if(String.isBlank(sfdcCaseNumber) && !String.isBlank(ctsTicketNumber)){
                                
                                }
                                // only SFDC Case Number is missing
                                else{
                                
                                }
                            }
                          
                        }
                            
                        // completed ticket repsponse process
                        if(subjectLine.contains(complTktConst)){
                        
                            // subject data validation; Need only Ticket #
                            if(!String.isBlank(ctsTicketNumber)){
                            
                            }
                            else{
                                // send error email template and log errors; CTS Ticket Number is missing
                                
                                
                            }
                        
                        }
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