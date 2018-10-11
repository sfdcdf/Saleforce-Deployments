@isTest(seeAllData=true)
private class ProcessCTSInboundMessageTest
{
    private static testMethod void processMsgTest()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        List<String> toAddresses = new List<String>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Organic Setup').getRecordTypeId();
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        System.Debug('Account from (Account): ' + acctName);
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        String caseNumber = caseData.CaseNumber;
        caseData.RecordTypeId = caseRecordTypeId;
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
        
        
        // CONTENT COMPLETE MESSAGE
        
        // Create a new email and envelope object
        Messaging.InboundEmail email2 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env2 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email2.Subject = 'Organic Setup Case Content Completed[tkt:9999999]';
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
        
        // Create a new email and envelope object
        Messaging.InboundEmail email2_1 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env2_1 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email2_1.Subject = 'Organic Setup Case Content Completed[tkt:9999999]';
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
        
        Test.stopTest();
    }
    
    private static testMethod void processMsg2Test()
    {
       // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> caseList = Test.LoadData(Case.sObjectType, 'testCases');
        List<Id> caseIds = new List<Id>();
        List<Case> dmlCases = new List<Case>();
        List<String> toAddresses = new List<String>();
        Date todayDt = Date.Today();
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('NCS - AutoLaunch').getRecordTypeId();
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        String acctName = acct.Name;
        
        System.Debug('Account from (Account): ' + acctName);
        
        Case caseData = (Case)caseList[0];
        Id caseId = caseData.Id;
        String caseNumber = caseData.CaseNumber;
        caseData.RecordTypeId = caseRecordTypeId;
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
        
        // AR: MISSING CASE NUMBER
        
        // Create a new email and envelope object
        Messaging.InboundEmail email4 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env4 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email4.Subject = 'RE: Organic Setup Case from ARMail [tkt:9999999]';
        email4.HtmlBody = 'Organic Case Details in Body';
        email4.PlainTextBody = 'Organic Case Complete Details in Body';
        email4.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess4 = new ProcessCTSInboundMessage();
        emailProcess4.handleInboundEmail(email4, env4);
        
        // AR: MISSING TICKET NUMBER
        
        // Create a new email and envelope object
        Messaging.InboundEmail email5 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env5 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email5.Subject = 'RE: Organic Setup Case from [SFDCCase:' + caseNumber + ']/[NumberofPages:4] ARMail';
        email5.HtmlBody = 'Organic Case Details in Body';
        email5.PlainTextBody = 'Organic Case Complete Details in Body';
        email5.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess5 = new ProcessCTSInboundMessage();
        emailProcess5.handleInboundEmail(email5, env5);
        
        // AR: MISSING TICKET NUMBER AND CASE
        
        // Create a new email and envelope object
        Messaging.InboundEmail email6 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env6 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email6.Subject = 'RE: Organic Setup Case from ARMail';
        email6.HtmlBody = 'Organic Case Details in Body';
        email6.PlainTextBody = 'Organic Case Complete Details in Body';
        email6.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess6 = new ProcessCTSInboundMessage();
        emailProcess6.handleInboundEmail(email6, env6);
        
        // CC: MISSING ATTACHMENT
        
        // Create a new email and envelope object
        Messaging.InboundEmail email7 = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env7 = new Messaging.InboundEnvelope();
        
        // Set up the data for the email
        email7.Subject = 'Organic Setup Case Content Complete[tkt:9999999]';
        email7.HtmlBody = 'Organic Case Details in Body';
        email7.PlainTextBody = 'Organic Case Complete Details in Body';
        email7.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSInboundMessage emailProcess7 = new ProcessCTSInboundMessage();
        emailProcess7.handleInboundEmail(email7, env7);
        
        Test.stopTest();
    }
}