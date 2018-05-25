/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 26-Apr-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 26-Apr-2018
  Description ........: Class contains invocable method to send notification emails to DMC where email address is 
                        from cross object Account email field (Sales Rep Email).
*****************************************************************************/
public class SendCaseDMCNotifcation
{
    @InvocableMethod
    public static void SendDMCNotification(List<Id> caseIds)
    {
        try{
        
            if(caseIds.size() > 0){
            
                Set<Id> acctIdSet = new Set<Id>();
                Map<Id, Case> caseDetailsMap = new Map<Id, Case>();
                List<Messaging.SingleEmailMessage> notificationsLst = new List<Messaging.SingleEmailMessage>();
                OrgWideEmailAddress[] owea = [SELECT Id FROM OrgWideEmailAddress WHERE Address = 'sfdc@yodle.com'];
                
                // get Account Ids and add to set
                for(Case c :
                    [SELECT Id,
                            AccountId,
                            RecordType.Name,
                            CreatedDate,
                            ClosedDate,
                            Status,
                            IsClosed,
                            CaseNumber
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
                    
                    // get Email Address from associated Account
                    for(Account a:
                        [SELECT Id,
                                Sales_Rep_Email__c,
                                Name
                           FROM Account
                          WHERE Id IN :acctIdSet]){
                    
                        if(a.Sales_Rep_Email__c != null){
                        
                            // send notification to DMC
                            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                        
                            List<String> toAddress = new List<String>();
                            String subjectStatus = (caseDetailsMap.get(a.Id).Status == 'New' ? 'Case Created' : 'Case Status Update');
                            String fromAddress = 'sfdc@yodle.com';
                            String fromDisplayName = 'Salesforce Notifications';
                            String subjectLine = a.Name + ' - ' + caseDetailsMap.get(a.Id).RecordType.Name + ' ' + subjectStatus;
                            toAddress.add(a.Sales_Rep_Email__c);
                            String body = 'Below are the Account details related to Case #' + caseDetailsMap.get(a.Id).CaseNumber + ': <br/><br/> ';
                            body += '<b>Account:</b> ' + a.Name + '<br/><br/>';
                            body += '<b>Create Date:</b> ' + caseDetailsMap.get(a.Id).CreatedDate + '<br/><br/>';
                            body += '<b>Status:</b> ' + caseDetailsMap.get(a.Id).Status + '<br/><br/>';
                            body += '<b>Close Date:</b> ' + (caseDetailsMap.get(a.Id).IsClosed == true ? String.valueOf(caseDetailsMap.get(a.Id).ClosedDate) : 'Not Yet Closed') + '<br/><br/>';
     
                            // set message content
                            message.setToAddresses(toAddress);
                            message.setReplyTo(fromAddress);
                            message.setOrgWideEmailAddressId(owea.get(0).Id);
                            message.setSubject(subjectLine);
                            message.setHtmlBody(body);

                            notificationsLst.add(message);
                        }
                    }
                    
                    if(notificationsLst.size() > 0){
                        
                        // send notifications
                        Messaging.sendEmail(notificationsLst);
                    }
                }
            }
        }
        catch(Exception e){
            System.Debug('An error occurred: ' + e.getMessage());
        }
    }
}