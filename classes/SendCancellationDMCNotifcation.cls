/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 26-Apr-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 26-Apr-2018
  Description ........: Class contains invocable method to send notification emails to DMC where email address is 
                        from cross object Account email field (Sales Rep Email).
*****************************************************************************/
public class SendCancellationDMCNotifcation
{
    @InvocableMethod
    public static void SendDMCNotification(List<Id> cancelRequestIds)
    {
        try{
        
            if(cancelRequestIds.size() > 0){
            
                Set<Id> acctIdSet = new Set<Id>();
                Map<Id, Cancellation_Request__c> cancelRequestDetailsMap = new Map<Id, Cancellation_Request__c>();
                List<Messaging.SingleEmailMessage> notificationsLst = new List<Messaging.SingleEmailMessage>();
                OrgWideEmailAddress[] owea = [SELECT Id FROM OrgWideEmailAddress WHERE Address = 'sfdc@yodle.com'];
                
                // get Account Ids and add to set
                for(Cancellation_Request__c c :
                    [SELECT Id,
                            Account_Name__c,
                            CreatedDate,
                            Closed_Date__c,
                            Outcome__c,
                            IsClosed__c,
                            Name
                       FROM Cancellation_Request__c
                      WHERE Id IN :cancelRequestIds]){
                
                    // check to ensure AccountId is populated on Cancellation Request
                    if(c.Account_Name__c != null){
                    
                        // add AccountId from Cancellation Request to set
                        acctIdSet.add(c.Account_Name__c);
                        cancelRequestDetailsMap.put(c.Account_Name__c, c);
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
                            String subjectStatus = (cancelRequestDetailsMap.get(a.Id).Outcome__c == 'New' ? 'Cancel Request Created' : 'Cancel Request Status Update');
                            String fromAddress = 'sfdc@yodle.com';
                            String fromDisplayName = 'Salesforce Notifications';
                            String subjectLine = a.Name + ' - ' + subjectStatus;
                            toAddress.add(a.Sales_Rep_Email__c);
                            String body = 'Below are the Account details related to Cancellation Request ' + cancelRequestDetailsMap.get(a.Id).Name + ': <br/><br/> ';
                            body += '<b>Account:</b> ' + a.Name + '<br/><br/>';
                            body += '<b>Create Date:</b> ' + cancelRequestDetailsMap.get(a.Id).CreatedDate + '<br/><br/>';
                            body += '<b>Status:</b> ' + cancelRequestDetailsMap.get(a.Id).Outcome__c + '<br/><br/>';
                            body += '<b>Close Date:</b> ' + (cancelRequestDetailsMap.get(a.Id).IsClosed__c == true ? String.valueOf(cancelRequestDetailsMap.get(a.Id).Closed_Date__c) : 'Not Yet Closed') + '<br/><br/>';
     
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