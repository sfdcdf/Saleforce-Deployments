@isTest
private class CTSSyncServiceTest {
    
    @isTest static void test_GetSFDCObject() {
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
        
        CTSObjectTriggerMap__mdt mapping = [SELECT Additional_Filter__c,
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
              WHERE MasterLabel = 'LBW Charge Failures' LIMIT 1];
              
        system.debug('Mapping instance: ' + mapping);
        
        Test.startTest();
        CTSSFDCCase obj = (CTSSFDCCase)CTSSyncService.GetSFDCObject('Case', newCase.Id, mapping);       
        Test.stopTest();
                 
        system.assert(obj.Id == newCase.Id);
        system.assert(obj.ObjectName == 'Case');
        system.assert(obj.ContactFirstName == 'Test');
        system.assert(obj.ContactLastName == 'CTS');
        system.assert(obj.Status == 'Open');        
        system.assert(obj.Detail != null);
        
    }
    
    
    @isTest static void test_GetRoutingTableObject() {
        
        Test.startTest();
        CTSObjectTriggerMap__mdt routingObj = CTSSyncService.GetRoutingTableObject('Case', 'Charge Failure', '', '', 'Leads By Web');       
        Test.stopTest();
        system.debug('Mapping instance: ' + routingObj);
        system.assert(routingObj != null && routingObj.MasterLabel == 'LBW Charge Failures');
        
    }
           
    
    
    @isTest static void test_GetCTSTicketJSON() {
        List<String> jsonTickets;
        
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
        }            
    }
    
}