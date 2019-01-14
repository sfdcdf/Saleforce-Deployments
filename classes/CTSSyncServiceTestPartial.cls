@isTest
private class CTSSyncServiceTestPartial {
    
    @isTest 
    static void test_GetSFDCObject() {
        Map<Id, SFDCToCTSAsynchRequest__c> requestMap = new Map<Id, SFDCToCTSAsynchRequest__c>();
        Map<String, EmailTemplate> emailTemplateMap = new Map<String, EmailTemplate>();
        for(EmailTemplate et :
                [SELECT Id,
                        DeveloperName
                   FROM EmailTemplate
                  WHERE Folder.Name = 'CTS Templates']){
                  
                emailTemplateMap.put(et.DeveloperName, et);
            }
       
        Account newAccount = new Account();
        newAccount.Name = 'Testing CTS API integration';
        newAccount.Client_First_Name__c = 'Test';
        newAccount.Client_Last_Name__c = 'CTS';
        newAccount.Client_ID__c = '1234';        
        insert newAccount;

        Case newCase = new Case();        
        newCase.Status = 'Open';
        newCase.AccountId = newAccount.Id;
        insert newCase;
        
        //Get routing table object
        CTSObjectTriggerMap__mdt rt = [SELECT Additional_Filter__c,
                    CaseOrigin__c,
                    CaseReason__c,
                    CTSAPIIdentifier__c,
                    CTSAssignedToLoginName__c,
                    CTSEmailAddress__c,
                    CTSNoteType__c,
                    Description__c,
                    DetailsTemplateName__c,
                    IntegrationType__c,
                    IsActive__c,
                    IsAutoClose__c,
                    IsCreateCTSNote__c,
                    IsExcludeWBN__c,
                    NoteDetailsTemplateName__c,
                    Object__c,
                    Object__r.Object_API_Name__c,
                    ProductType__c,
                    RecordTypeName__c,
                    MasterLabel
               FROM CTSObjectTriggerMap__mdt 
              WHERE MasterLabel = 'LSATV Charge Failures' LIMIT 1];
              
        system.debug('Routing table instance: ' + rt);
        
        //Get async request table object
        SFDCToCTSAsynchRequest__c newAsyncRecord = new SFDCToCTSAsynchRequest__c();
        newAsyncRecord.API_Identifier__c = rt.CTSAPIIdentifier__c;
        newAsyncRecord.EmailTemplateId__c = emailTemplateMap.get(rt.DetailsTemplateName__c).Id;
        newAsyncRecord.Integration_Type__c = 'Api';
        newAsyncRecord.NumberOfRetryAttempts__c = 0;
        newAsyncRecord.ObjectId__c = newCase.Id;
        newAsyncRecord.Object_Name__c = 'Case';
        newAsyncRecord.ScheduledDateTime__c = System.Now();
        newAsyncRecord.Status__c ='NEW';
        
        Insert newAsyncRecord;
        
        requestMap.put(newCase.Id, newAsyncRecord);        
        
        Test.startTest();
        List<CTSSFDCObjectBase> objs = CTSSyncService.GetSFDCObject('Case', requestMap);       
        Test.stopTest();
                 
        system.assert(objs[0].Id == newCase.Id);
        system.assert(objs[0].ObjectName == 'Case');
        system.assert(objs[0].ContactFirstName == 'Test');
        system.assert(objs[0].ContactLastName == 'CTS');
        system.assert(objs[0].Status == 'Open');        
        system.assert(objs[0].Detail != null); 
        
    }
    
    
    @isTest static void test_GetRoutingTableObject() {
        
       /* Test.startTest();
        CTSObjectTriggerMap__mdt routingObj = CTSSyncService.GetRoutingTableObject('Case', 'Charge Failure', '', '', 'Leads By Web');       
        Test.stopTest();
        system.debug('Mapping instance: ' + routingObj);
        system.assert(routingObj != null && routingObj.MasterLabel == 'LBW Charge Failures'); */
        
    }
           
    
    
    @isTest static void test_GetCTSTicketJSON() {
       /* List<String> jsonTickets;
        
        List<CTSSyncService.CTSTicket> ctsTickets = new list<CTSSyncService.CTSTicket>();
        
        CTSSyncService.CTSTicket ticket1 = new CTSSyncService.CTSTicket();
        ticket1.apiIdentifier  = 'apiIdentifier1';
        ticket1.contactFirstName = 'contactFirstName1';
        ticket1.contactLastName  = 'contactLastName1';
        ticket1.contactPhone = '(1)514-1234567';        
        ticket1.contactEmailAddress = 'fake@yop.com';
        ticket1.referenceAccountId = 'referenceAccountId1';
        ticket1.referenceCustomerId = 'referenceCustomerId1';
        ticket1.referenceProductInstanceId = 'referenceProductInstanceId1';
        ticket1.domain = 'domain1';
        ticket1.subject = 'subject1';
        ticket1.detail = 'detail1';
        ticket1.referenceProductCode = 'Lead Stream ATV';
        ticket1.status = 'Paused';
        ticket1.alternateContactEmailAddress = 'fake2@yopmail.com';
       
        
        ctsTickets.add(ticket1);
        
        CTSSyncService.CTSTicket ticket2 = new CTSSyncService.CTSTicket();
        
        ticket2.apiIdentifier  = 'apiIdentifier2';
        ticket2.contactFirstName = 'contactFirstName2';
        ticket2.contactLastName  = 'contactLastName2';
        ticket2.contactPhone = '(1)514-1234567';        
        ticket2.contactEmailAddress = 'fake3@yop.com';
        ticket2.referenceAccountId = 'referenceAccountId2';
        ticket2.referenceCustomerId = 'referenceCustomerId2';
        ticket2.referenceProductInstanceId = 'referenceProductInstanceId2';
        ticket2.domain = 'domain1';
        ticket2.subject = 'subject2';
        ticket2.detail = 'detail2';
        ticket2.referenceProductCode = 'Lead Stream ATV';
        ticket2.status = 'Paused';
        ticket2.alternateContactEmailAddress = 'fake4@yopmail.com';
        
        
        ctsTickets.add(ticket2);
        
        jsonTickets = CTSSyncService.GetCTSTicketJSON(ctsTickets);
        system.debug('Json tickets: ' + jsonTickets);
        system.assert(jsonTickets != null && jsonTickets.size() > 0);
        for (string jsonTicket : jsonTickets)
        {
            system.debug('Json ticket: ' + jsonTicket);
            system.assert(!String.isBlank(jsonTicket));
        } */            
    } 
    
}