@isTest
private class CTSSyncServiceTestPartial {
    
    
    public class MockHttpResponseGenerator implements HttpCalloutMock {
        // Implement this interface method
        public HTTPResponse respond(HTTPRequest req) {
           
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{   \"originalMessageId\": \"ba74ff70-151f-11e9-b1ce-00505684b32f\",   \"platformId\": null,   \"actionType\": null,   \"client_ip\": \"136.147.62.8,10.40.177.20\",   \"applicationName\": \"SFDC Salesforce.com Yodle\",   \"esbServer\": \"qa1esb01.registeredsite.com\",   \"eventTimestamp\": \"2019-01-10T21:36:02.960Z\",   \"day\": \"2019-01-10T21:36:00.000Z\",   \"muleMessageId\": \"ba74ff70-151f-11e9-b1ce-00505684b32f\",   \"response\": [      {         \"providerApplicationName\": \"Ticketing\",         \"clientRequestId\": \"Case_5001b000005BprnAAC\",         \"status\": \"Failure\",         \"errors\": [            {               \"source\": \"ALL\",               \"statusCode\": \"ESB_GENERIC_FLOW_ERROR\",               \"message\": \"Message id = ba74ff70-151f-11e9-b1ce-00505684b32f from flow ESB_GENERIC_FLOW endpoint vm:messages.adapter.generic.wrapper got an error.Exception message is = The request cannot be processed, java.lang.Exception: REMOTE_SERVICE_INTERNAL_SERVER_ERROR\",               \"errorId\": null            }         ],         \"data\": null,         \"messageId\": \"ba74ff70-151f-11e9-b1ce-00505684b32f\"      }   ]}');
            res.setStatusCode(200);
            return res;
        }
    }
    
    
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
        system.debug('Async requests: ' + requestMap);
        
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
    
        Account newAccount = new Account();
        newAccount.Name = 'Testing CTS API integration';
        newAccount.Client_First_Name__c = 'Test';
        newAccount.Client_Last_Name__c = 'CTS';
        newAccount.Client_ID__c = '1234';        
        insert newAccount;
        
        Case newCase = new Case();                
        newCase.AccountId = newAccount.Id;
        insert newCase;
    
        Test.startTest();           
        Map<Id,CTSObjectTriggerMap__mdt> routingObjs = CTSSyncService.GetRoutingTableObject('Case', new List<Id> { newCase.Id });       
        Test.stopTest();
        system.debug('Routing table instance: ' + routingObjs);
        system.assert(routingObjs != null && routingObjs.get(newCase.Id).MasterLabel == 'LSATV Cases CatchAll');         
    }
           
    
    
    @isTest static void test_GetCTSTicketJSON() {
        String jsonTickets;
        
        List<CTSSyncService.CTSTicket> ctsTickets = new list<CTSSyncService.CTSTicket>();
        
        CTSSyncService.CTSTicket ticket1 = new CTSSyncService.CTSTicket();
        ticket1.apiIdentifier  = 'apiIdentifier1';
        ticket1.contactFirstName = 'contactFirstName1';
        ticket1.contactLastName  = 'contactLastName1';
        ticket1.contactPhone = '(1)514-1234567';        
        ticket1.contactEmailAddress = 'fake@yop.com';
        ticket1.crmOrderNumber = '123456';
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
        ticket2.crmOrderNumber = '234567';
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
        system.assert(!String.isBlank(jsonTickets));
                  
    } 
    
    @isTest 
    static void test_GetCTSTicket() {    
        List<CTSSFDCObjectBase> sfdcObjList = new List<CTSSFDCObjectBase>();
        CTSSFDCObjectBase sfdcObj = new CTSSFDCObjectBase();
        sfdcObj.ApiIdentifier = 'SF_NETSOL_000001';
        sfdcObj.CRMOrderNumber = '11284031';
        sfdcObj.ContactFirstName = 'CTS FN';
        sfdcObj.ContactLastName = 'CTS LN';
        sfdcObj.ContactPhone = '123-4567890';
        sfdcObj.ContactEmailAddress = 'ctsintegration@fake.com';
        sfdcObj.ObjectName = 'Case';
        sfdcObj.ReferenceAccountId = '0011b00000RzOEfAAN';
        sfdcObj.ReferenceCustomerId = '9999999';
        sfdcObj.ReferenceProductInstanceId = '5001b000005Bq5RAAS';
        sfdcObj.Domain = 'www.testsite.com';
        sfdcObj.Subject = 'Lead Stream TP 2 : 11284031';
        sfdcObj.Status = 'Open';
        sfdcObj.Detail = 'Outbound Call\r\n\r\nCase Number: 11284031\r\nSubject: Lead Stream TP 2\r\nAuto Close Date: \r\n\r\nDescription: CTS Test\r\n\r\nTotal Account Revenue: $0\r\n________________________________________________________________\r\n\r\nStatus: \r\nScheduled Call: \r\nClient Satisfaction: \r\nNotes:\r\n Client Id: 9999999\r\n Client First Name: CTS FN\r\n Client Last Name: CTS LN\r\n Client Email: eugene.ross@web.com\r\n Client Phone: (555) 345-6734\r\n Product Code: Lead Stream ATV\r\n';
        sfdcObj.ReferenceProductCodes = 'Lead Stream ATV';
        sfdcObj.AlternateContactEmailAddress = 'ctsintegration@fake.com';
        sfdcObjList.add(sfdcObj);
        List<CTSSyncService.CTSTicket> ctsTickets = CTSSyncService.GetCTSTicket(sfdcObjList);
        System.debug('CTS tickets: ' + ctsTickets);
        System.assert(ctsTickets.size() == 1);
    }
    
    @isTest
    static void test_CallOutCTSForAPI() {
         Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
         String requestBody = '{"clientInfo":{"apiAccessKey":"453bf6392c38444a98023807aaa5ea8d5bd32a80767c4098ba76955c83b2f991"},"request":[{"platformId":"YODLE","action":"Create","clientRequestId":"Case_5001b000005Bq5RAAS","objectType":"TicketingTicket","requestedService":"CTSv2","data":{"crmId":"552e519a-1898-4f4b-b909-a223a916b876","ticketingTicket":{"apiIdentifier":"SF_NETSOL_000001","contactFirstName":"CTS FN","contactLastName":"CTS LN","contactPhone":"(555) 345-6734","contactEmailAddress":"eugene.ross@web.com","crmOrderNumber":"11284031","referenceAccountId":"0011b00000RzOEfAAN","referenceCustomerId":"9999999","referenceProductInstanceId":"5001b000005Bq5RAAS","domain":"www.testsite.com","subject":"Lead Stream TP 2 : 11284031","detail":"Outbound Call\r\n\r\nCase Number: 11284031\r\nSubject: Lead Stream TP 2\r\nAuto Close Date: \r\n\r\nDescription: CTS Test\r\n\r\nTotal Account Revenue: $0\r\n________________________________________________________________\r\n\r\nStatus: \r\nScheduled Call: \r\nClient Satisfaction: \r\nNotes:\r\n Client Id: 9999999\r\n Client First Name: CTS FN\r\n Client Last Name: CTS LN\r\n Client Email: eugene.ross@web.com\r\n Client Phone: (555) 345-6734\r\n Product Code: Lead Stream ATV\r\n","referenceProductCode":"Lead Stream ATV","status":"Open","alternateContactEmailAddress":"eugene.ross@web.com"}}}]}';
         CTSSyncService.CallOutCTSForAPI(requestBody);
    }
    
    @isTest
    static void test_CallOutCTSForEmail() {
        List<CTSSFDCObjectBase> objList = new List<CTSSFDCObjectBase>();
        CTSSFDCObjectBase sfdcObj = new CTSSFDCObjectBase();
        sfdcObj.ApiIdentifier = 'SF_NETSOL_000001';
        sfdcObj.CRMOrderNumber = '11284031';
        sfdcObj.ContactFirstName = 'CTS FN';
        sfdcObj.ContactLastName = 'CTS LN';
        sfdcObj.ContactPhone = '123-4567890';
        sfdcObj.ContactEmailAddress = 'ctsintegration@fake.com';
        sfdcObj.ObjectName = 'Case';
        sfdcObj.ReferenceAccountId = '0011b00000RzOEfAAN';
        sfdcObj.ReferenceCustomerId = '9999999';
        sfdcObj.ReferenceProductInstanceId = '5001b000005Bq5RAAS';
        sfdcObj.Domain = 'www.testsite.com';
        sfdcObj.Subject = 'Lead Stream TP 2 : 11284031';
        sfdcObj.Status = 'Open';
        sfdcObj.Detail = 'Outbound Call\r\n\r\nCase Number: 11284031\r\nSubject: Lead Stream TP 2\r\nAuto Close Date: \r\n\r\nDescription: CTS Test\r\n\r\nTotal Account Revenue: $0\r\n________________________________________________________________\r\n\r\nStatus: \r\nScheduled Call: \r\nClient Satisfaction: \r\nNotes:\r\n Client Id: 9999999\r\n Client First Name: CTS FN\r\n Client Last Name: CTS LN\r\n Client Email: eugene.ross@web.com\r\n Client Phone: (555) 345-6734\r\n Product Code: Lead Stream ATV\r\n';
        sfdcObj.ReferenceProductCodes = 'Lead Stream ATV';
        sfdcObj.AlternateContactEmailAddress = 'ctsintegration@fake.com';
        sfdcObj.CTSEmailAddress = 'ticketingtest@fake.com';
        objList.add(sfdcObj);        
        
        Test.StartTest();
        CTSSyncService.CallOutCTSForEmail(objList);
        Integer invocations = Limits.getEmailInvocations();
        System.Debug('Email invocations: ' + invocations);
        Test.stopTest();
 
        System.assertEquals(1, invocations, 'An email has not been sent');
    }
    
}