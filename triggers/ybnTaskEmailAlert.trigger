trigger ybnTaskEmailAlert on Task (before insert, before update) {
    
    Id recordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipTaskRecordTypeId();
    Set<Id> accountIds = new Set<Id>();
    Set<Id> taskIds = new Set<Id>();
    Map<Id, Task> taskObjects = new Map<Id, Task>();
    
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>{};
    
    for (Task t : trigger.new) {
    
        if (!t.Send_Email_Alert_to_SD_AD__c) continue;
        if (t.RecordTypeId != recordTypeId) continue;
        if (t.Status != 'Completed') continue;
        if (t.WhatId == null) continue;
        if (!(((String)t.WhatId).startsWith('001'))) continue;
        
        t.Send_Email_Alert_to_SD_AD__c = false;
        
        accountIds.add(t.WhatId);
        taskObjects.put(t.Id, t);
        taskIds.add(t.Id);
            
    }
    
    Map<Id, Account> accounts = new Map<Id, Account>(
        [SELECT Id, Name, Account_Director__c, Account_Director__r.Email, Sales_Person__c, Sales_Person__r.Email
        FROM Account WHERE Id IN :accountIds]
    );
    
    //Messaging.reserveSingleEmailCapacity(taskIds.size());
    
    for (Id taskId : taskIds) {
        Task t = taskObjects.get(taskId);
        Account a = accounts.get(t.WhatId);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        String[] toAddresses = new String[] {};
        if (a.Account_Director__r.Email != null) {
            toAddresses.add(a.Account_Director__r.Email);
        }
        if (a.Sales_Person__r.Email != null) {
            toAddresses.add(a.Sales_Person__r.Email);
        }
        
        if (toAddresses.size() == 0) continue;
        mail.setToAddresses(toAddresses);
        
        mail.setReplyTo('sfdc@yodle.com');
        mail.setSenderDisplayName('Yodle SFDC');
        mail.setSubject('Activity Recorded for ' + a.Name);
        
        String body = '';
        body += 'Activity Detail: ' + t.Milestone__c + '\n\n';
        body += 'Summary: ' + t.Description + '\n\n';
        body += 'Action items: ' + t.Action_Items__c + '\n\n';
        body += 'Issues or client concerns: ' + t.Summary_of_Issues_Client_Concerns__c + '\n\n';
        body += URL.getSalesforceBaseUrl().toExternalForm() + '/' + taskId;
        
        mail.setPlainTextBody(body);
        emails.add(mail);
    }
    
    
    if (emails.size() > 0) {
        System.debug('**YBN** Sending emails');
        Messaging.SendEmailResult[] results = Messaging.sendEmail(emails);
    }
    
}