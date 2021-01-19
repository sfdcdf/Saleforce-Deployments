trigger ybnTaskEmailUserSignUp on Task (after insert) {
    
    Set<Id> userIds = new Set<Id>();
    Set<Id> taskIds = new Set<Id>();
    Map<Id, Task> taskObjects = new Map<Id, Task>();
    
    try{
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>{};
        
        for (Task t : trigger.new) {
            if (t.Activity_Type__c != 'Network Communications Portal Notification') continue;
            if (t.OwnerId == null) continue;
            
            userIds.add(t.OwnerId);
            taskObjects.put(t.Id, t);
            taskIds.add(t.Id);
        }
        
        Map<Id, User> users = new Map<Id, User>(
            [SELECT Id, Name, Email
            FROM User WHERE Id IN :userIds]
        );
            
        //Messaging.reserveSingleEmailCapacity(taskIds.size());
        
        for (Id taskId : taskIds) {
            Task t = taskObjects.get(taskId);
            User u = users.get(t.OwnerId);
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            String[] toAddresses = new String[] {};
            toAddresses.add(u.Email);
            if (toAddresses.size() == 0) continue;
            mail.setToAddresses(toAddresses);
            
            mail.setReplyTo('sfdc@yodle.com');
            mail.setSenderDisplayName('Yodle SFDC');
            mail.setSubject('network communication portal ' + t.Relationship_Name__c);
            
            String body = '';
            if (t.Relationship_Name__c != null) {
                body += 'Relationship Name: ' + t.Relationship_Name__c + '\n\n';    
            }
            if (t.Description != null) {
                body += 'Summary: ' + t.Description + '\n\n';
            }
            if (t.Milestone__c != null) {
                body += 'Activity Detail: ' + t.Milestone__c + '\n\n';
            }
            body += URL.getSalesforceBaseUrl().toExternalForm() + '/' + taskId;
            
            mail.setPlainTextBody(body);
            emails.add(mail);
        }
        
        Messaging.reserveSingleEmailCapacity(emails.size());
        
        if (emails.size() > 0) {
            System.debug('**YBN** Sending emails');
                Messaging.SendEmailResult[] results = Messaging.sendEmail(emails); 
        }
    }
    catch(Exception e){
            System.debug('**YBN** Error Sending email' + e.getMessage());
    }   
}