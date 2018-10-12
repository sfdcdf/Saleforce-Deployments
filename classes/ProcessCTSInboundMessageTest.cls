@isTest(seeAllData=true)
private class ProcessCTSInboundMessageTest
{
    private static testMethod void webCopyOwnerTests()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        List<String> toAddresses = new List<String>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Organic Setup').getRecordTypeId();
        Id webCopywrite = [SELECT Id FROM User WHERE Alias = 'webcopy' LIMIT 1].Id;
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        System.Debug('Account from (Account): ' + acctName);
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        String caseNumber = caseData.CaseNumber;
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acctId;
        caseData.OwnerId = webCopywrite;
        dmlCases.add(caseData);
        
        System.Debug('Account from (Case): ' + caseData.Account.Name);
        
        if(dmlCases.size() > 0){
            update dmlCases;
            
            for(Case c : dmlCases){
                caseIds.add(c.Id);
            }
        }
        
        // start test
        Test.startTest();
        
        toAddresses.add('copywritingsfdc@web.com');
        
        // AUTO-RESPONSE MESSAGE
        
        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email
        email.Subject = 'RE: Organic Setup Case from [SFDCCase:' + caseNumber + ']/[NumberofPages:4] ARMail [tkt:9999999]';
        email.HtmlBody = 'Organic Case Details in Body';
        email.PlainTextBody = 'Organic Case Details in Body';
        email.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess = new ProcessCTSInboundMessage();
        emailProcess.handleInboundEmail(email, env);
        
        
        // NO VALID KEYWORD MESSAGE
        
        // Create a new email and envelope object
        Messaging.InboundEmail email3 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env3 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email3.Subject = 'Keywords Missing Here';
        email3.HtmlBody = 'Organic Case Complete Details in Body';
        email3.PlainTextBody = 'Organic Case Details in Body';
        email3.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess3 = new ProcessCTSInboundMessage();
        emailProcess3.handleInboundEmail(email3, env3);
        
        
        // VALID CONTENT COMPLETE
        
        // Create a new email and envelope object
        Messaging.InboundEmail email2 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env2 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email2.Subject = 'Organic Setup Case Content Complete[tkt:9999999]';
        email2.HtmlBody = 'Organic Case Details in Body';
        email2.PlainTextBody = 'Organic Case Complete Details in Body';
        email2.toAddresses = toAddresses;
        
         // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email2.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };
        
        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess2 = new ProcessCTSInboundMessage();
        emailProcess2.handleInboundEmail(email2, env2);
        
        // AR: MISSING CASE NUMBER
        
        // Create a new email and envelope object
        Messaging.InboundEmail email4 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env4 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email4.Subject = 'RE: Organic Setup Case from [SFDCCase:] ARMail [tkt:9999999]';
        email4.HtmlBody = 'Organic Case Details in Body';
        email4.PlainTextBody = 'Organic Case Complete Details in Body';
        email4.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess4 = new ProcessCTSInboundMessage();
        emailProcess4.handleInboundEmail(email4, env4);
        
        // AR: MISSING CASE NUMBER AND TICKET
        
        // Create a new email and envelope object
        Messaging.InboundEmail email5 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env5 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email5.Subject = 'RE: Organic Setup Case from [SFDCCase:] ARMail [tkt:]';
        email5.HtmlBody = 'Organic Case Details in Body';
        email5.PlainTextBody = 'Organic Case Complete Details in Body';
        email5.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess5 = new ProcessCTSInboundMessage();
        emailProcess5.handleInboundEmail(email5, env5);
        
        // AR: MISSING TICKET
        
        // Create a new email and envelope object
        Messaging.InboundEmail email15 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env15 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email15.Subject = 'RE: Organic Setup Case from [SFDCCase:' + caseNumber + '] ARMail [tkt:]';
        email15.HtmlBody = 'Organic Case Details in Body';
        email15.PlainTextBody = 'Organic Case Complete Details in Body';
        email15.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess15 = new ProcessCTSInboundMessage();
        emailProcess15.handleInboundEmail(email15, env15);
        
        Test.stopTest();
    }
    
    private static testMethod void itProOwnerTests()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        List<String> toAddresses = new List<String>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Organic Setup').getRecordTypeId();
        Id itProQueue = [SELECT Id FROM Group WHERE Name = 'IT Pro SEO Optimization' LIMIT 1].Id;
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        System.Debug('Account from (Account): ' + acctName);
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        String caseNumber = caseData.CaseNumber;
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.OwnerId = itProQueue;
        caseData.AccountId = acctId;
        caseData.External_Ticket_ID__c = '9999999';
        dmlCases.add(caseData);
        
        System.Debug('Account from (Case): ' + caseData.Account.Name);
        
        if(dmlCases.size() > 0){
            update dmlCases;
            
            ContentVersion contentVersion = new ContentVersion(
              Title = 'Penguins',
              PathOnClient = 'Penguins.jpg',
              VersionData = Blob.valueOf('Test Content'),
              IsMajorVersion = true
            );
            insert contentVersion;    
            
            for(Case c : dmlCases){
            
            
                List<ContentDocument> documents = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument LIMIT 1];
                
                //create ContentDocumentLink  record 
                ContentDocumentLink cdl = New ContentDocumentLink();
                cdl.LinkedEntityId = c.id;
                cdl.ContentDocumentId = documents[0].Id;
                cdl.shareType = 'V';
                insert cdl;
            
            }
        }
        
        // start test
        Test.startTest();
        
        toAddresses.add('copywritingsfdc@web.com');
        
        // Create a new email and envelope object
        Messaging.InboundEmail email2_1 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env2_1 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email2_1.Subject = 'Organic Setup Case Content Complete[tkt:9999999]';
        email2_1.HtmlBody = 'Organic Case Details in Body';
        email2_1.PlainTextBody = 'Organic Case Complete Details in Body';
        email2_1.toAddresses = toAddresses;
        
         // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment2_1 = new Messaging.InboundEmail.BinaryAttachment();
        attachment2_1.body = blob.valueOf('my attachment text');
        attachment2_1.fileName = 'textfile.txt';
        attachment2_1.mimeTypeSubType = 'text/plain';
        
        email2_1.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment2_1 };
        
        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess2_1 = new ProcessCTSInboundMessage();
        emailProcess2_1.handleInboundEmail(email2_1, env2_1);
        
        
        // NO TICKET or ATTACHMENT
        // Create a new email and envelope object
        Messaging.InboundEmail email21 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env21 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email21.Subject = 'Organic Setup Case Content Complete[tkt:]';
        email21.HtmlBody = 'Organic Case Details in Body';
        email21.PlainTextBody = 'Organic Case Complete Details in Body';
        email21.toAddresses = toAddresses;
        
        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess21 = new ProcessCTSInboundMessage();
        emailProcess21.handleInboundEmail(email21, env21);
        
        Test.stopTest();
    }
    
    private static testMethod void unknownOwnerErrorHandlingTest()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        List<String> toAddresses = new List<String>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Organic Setup').getRecordTypeId();
        Id caseOwner = [SELECT Id FROM User WHERE Alias = 'damp' LIMIT 1].Id;
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        System.Debug('Account from (Account): ' + acctName);
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        String caseNumber = caseData.CaseNumber;
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.OwnerId = caseOwner;
        caseData.External_Ticket_ID__c = '9999999';
        caseData.AccountId = acctId;
        dmlCases.add(caseData);
        
        System.Debug('Account from (Case): ' + caseData.Account.Name);
        
        if(dmlCases.size() > 0){
            update dmlCases;
            
            for(Case c : dmlCases){
                caseIds.add(c.Id);
            }
        }
        
        // start test
        Test.startTest();
        
        toAddresses.add('copywritingsfdc@web.com');
        
        // Create a new email and envelope object
        Messaging.InboundEmail email8 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env8 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email8.Subject = 'Organic Setup Case Content Complete[tkt:9999999]';
        email8.HtmlBody = 'Organic Case Details in Body';
        email8.PlainTextBody = 'Organic Case Complete Details in Body';
        email8.toAddresses = toAddresses;
        
         // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment3 = new Messaging.InboundEmail.BinaryAttachment();
        attachment3.body = blob.valueOf('my attachment text');
        attachment3.fileName = 'textfile.txt';
        attachment3.mimeTypeSubType = 'text/plain';
        
        email8.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment3 };
        
        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess8 = new ProcessCTSInboundMessage();
        emailProcess8.handleInboundEmail(email8, env8);
        
        Test.stopTest();
    }
}