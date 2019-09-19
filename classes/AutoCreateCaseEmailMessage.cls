/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 4-Oct-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 4-Oct-2018
  Description ........: Class contains invocable method to create email message associated to Case when email template 
  notification is sent to CTS system
*****************************************************************************/
public class AutoCreateCaseEmailMessage
{
    @InvocableMethod
    public static void CreateEmailMessage(List<Id> caseIds)
    {
        try{
        
            if(caseIds.size() > 0){
            
                Set<Id> acctIdSet = new Set<Id>();
                Map<Id, Case> caseDetailsMap = new Map<Id, Case>();
                List<EmailMessage> dmlEmailMessage = new List<EmailMessage>();
                String ctsEmail = 'copywritingcts@web.com';
                String sfdcEmail = 'copywritingsfdc@web.com';
                String subjectLine = '';
                String htmlBody = '';
                String baseUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
                
                // get Account Ids and add to set
                for(Case c :
                    [SELECT Id,
                            AccountId,
                            RecordType.Name,
                            CreatedDate,
                            Description,
                            Status,
                            IsClosed,
                            CaseNumber,
                            Name_of_Business_for_Name_Campaign__c,
                            Domain_Name_to_be_used_for_YO__c,
                            Description_of_the_Business__c,
                            Segment__c,
                            Homepage__c,
                            Number_of_Pages__c,
                            Services_Offered__c,
                            Geographic_Areas_To_Service__c,
                            Unique_Selling_Points__c,
                            Speical_Recognitions_Degrees_Certs__c,
                            Business_Size__c,
                            Location_Type__c,
                            KeyWord_3_Service_Name__c,
                            KeyWord_3_Unique_Proposition__c,
                            KeyWord_1_Service_Name__c,
                            KeyWord_1_Unique_Proposition__c,
                            KeyWord_2_Service_Name__c,
                            KeyWord_2_Unique_Proposition__c
                       FROM Case
                      WHERE Id IN :caseIds]){
                
                    // check to ensure AccountId is populated on Case
                    if(c.AccountId != null){
                    
                        // add AccountId from Case to set
                        acctIdSet.add(c.AccountId);
                        caseDetailsMap.put(c.AccountId, c);
                    }
                }
                
                if(acctIdSet.size() > 0){
                    
                    // get Account details for Email Message record creation
                    for(Account a:
                        [SELECT Id,
                                Product_Type_Transactional__c,
                                Name,
                                Client_ID__c
                           FROM Account
                          WHERE Id IN :acctIdSet]){
                    
                        if(!String.isBlank(a.Id)){
                            
                            // start building email message detail for insert
                            subjectLine ='Organic Setup Case from [SFDCCase:' + caseDetailsMap.get(a.Id).CaseNumber + ']/[NumberofPages:' + caseDetailsMap.get(a.Id).Number_of_Pages__c + '] ARMail';
                            
                            htmlBody =  'Case Number: ' + caseDetailsMap.get(a.Id).CaseNumber + '<br/><br/> ';
                            htmlBody += 'CID: ' + a.Client_ID__c + '<br/><br/>';
                            htmlBody += 'Product Type: ' + a.Product_Type_Transactional__c + '<br/><br/><br/>';
                            htmlBody += '-----------------------------------------------------------<br/><br/><br/>';
                            htmlBody += 'Instructions: ' + caseDetailsMap.get(a.Id).Description + '<br/><br/>';
                            htmlBody += 'Name of Business: ' + caseDetailsMap.get(a.Id).Name_of_Business_for_Name_Campaign__c + '<br/><br/>';
                            htmlBody += 'Domain Name to be used for YO: ' + caseDetailsMap.get(a.Id).Domain_Name_to_be_used_for_YO__c + '<br/><br/>';
                            htmlBody += 'Short Description of the Business: ' + caseDetailsMap.get(a.Id).Description_of_the_Business__c + '<br/><br/>';
                            htmlBody += 'Segment/Industry: ' + caseDetailsMap.get(a.Id).Segment__c + '<br/><br/>';
                            htmlBody += 'Homepage/Vertical: ' + caseDetailsMap.get(a.Id).Homepage__c + '<br/><br/>';
                            htmlBody += 'Offered/Offering: ' + caseDetailsMap.get(a.Id).Services_Offered__c + '<br/><br/>';
                            htmlBody += 'Geographic Areas To Service: ' + caseDetailsMap.get(a.Id).Geographic_Areas_To_Service__c + '<br/><br/>';
                            htmlBody += 'USPs (If Available): ' + caseDetailsMap.get(a.Id).Unique_Selling_Points__c + '<br/><br/>';
                            htmlBody += 'Special Recognitions/Degrees/Certs: ' + caseDetailsMap.get(a.Id).Speical_Recognitions_Degrees_Certs__c + '<br/><br/>';
                            htmlBody += 'Business Size: ' + caseDetailsMap.get(a.Id).Business_Size__c + '<br/><br/>';
                            htmlBody += 'Location Type: ' + caseDetailsMap.get(a.Id).Location_Type__c + '<br/><br/><br/>';
                            htmlBody += '-----------------------------------------------------------<br/><br/><br/>';
                            htmlBody += 'Max Essentials Only<br/><br/>';
                            htmlBody += 'Homepage: ' + caseDetailsMap.get(a.Id).KeyWord_3_Service_Name__c + caseDetailsMap.get(a.Id).KeyWord_3_Unique_Proposition__c + '<br/><br/>';
                            htmlBody += 'Page 2: ' + caseDetailsMap.get(a.Id).KeyWord_1_Service_Name__c + caseDetailsMap.get(a.Id).KeyWord_1_Unique_Proposition__c + '<br/><br/>';
                            htmlBody += 'Page 3: ' + caseDetailsMap.get(a.Id).KeyWord_2_Service_Name__c + caseDetailsMap.get(a.Id).KeyWord_2_Unique_Proposition__c + '<br/><br/><br/>';
                            htmlBody += '-----------------------------------------------------------<br/><br/><br/>';
                            htmlBody += 'Case Link: <a href="' + baseUrl + '/' + caseDetailsMap.get(a.Id).Id + '" target="_blank">' + baseUrl + '/' + caseDetailsMap.get(a.Id).Id + '</a><br/><br/>';
                            
                            // construct new EmailMessage record
                            EmailMessage newMsg = new EmailMessage();
                            newMsg.FromAddress = sfdcEmail;
                            newMsg.ToAddress = ctsEmail;
                            newMsg.HtmlBody = htmlBody;
                            newMsg.Incoming = false;
                            newMsg.MessageDate = System.Now();
                            newMsg.ParentId = caseDetailsMap.get(a.Id).Id;
                            newMsg.Status = '3';
                            newMsg.Subject = subjectLine;
                            
                            // add message to list for insert
                            dmlEmailMessage.add(newMsg);
                        }
                    }
                    
                    if(dmlEmailMessage.size() > 0){
                    
                        // insert EmailMessage record realted to Case
                        insert dmlEmailMessage;
                    }
                }
            }
        }
        catch(Exception e){
            System.Debug('An error occurred: ' + e.getMessage());
            
            List<DebugInfo__c> dmlDebugLogsToInsert = new List<DebugInfo__c>();
            DebugInfo__c debugInfo = new DebugInfo__c();
            debugInfo.DebugData__c = 'An error occurred Creating EmailMessage record on Case for CTS Initiation Process: ' + e.getMessage();
            dmlDebugLogsToInsert.add(debugInfo);
        }
    }
}