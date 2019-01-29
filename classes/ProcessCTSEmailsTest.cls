/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 28-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 28-Jan-2019
  Description ........: Test Class for ProcessCTSEmails
*****************************************************************************/
@isTest(seeAllData=true)
private class ProcessCTSEmailsTest
{
    private static testMethod void closeCaseRecordTest()
    {
        List<String> toAddresses = new List<String>();
        Id caseId = [SELECT Id FROM Case WHERE IsClosed = false LIMIT 1].Id;
        
        // start test
        Test.startTest();
        
        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        toAddresses.add('SFDCListenerService@web.com');
        
        // Set up the data for the email
        email.Subject = 'Notify SFDC to Close,Reference Record: ' + String.valueOf(caseId) + ' [Tkt:3245676]';
        email.HtmlBody = 'Close SFDC Record';
        email.PlainTextBody = 'Close SFDC Record';
        email.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSEmails emailProcess = new ProcessCTSEmails();
        emailProcess.handleInboundEmail(email, env);
        
        Test.stopTest();
    }
    
    private static testMethod void closeOrgCaseRecordTest()
    {
        List<String> toAddresses = new List<String>();
        Id orgCaseId = [SELECT Id FROM Organic_Analysis__c WHERE IsClosed__c = false LIMIT 1].Id;
        
        // start test
        Test.startTest();
        
        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        toAddresses.add('SFDCListenerService@web.com');
        
        // Set up the data for the email
        email.Subject = 'Notify SFDC to Close,Reference Record: ' + String.valueOf(orgCaseId) + ' [Tkt:3245677]';
        email.HtmlBody = 'Close SFDC Record';
        email.PlainTextBody = 'Close SFDC Record';
        email.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSEmails emailProcess = new ProcessCTSEmails();
        emailProcess.handleInboundEmail(email, env);
        
        Test.stopTest();
    }
    
    private static testMethod void closeQualityCaseRecordTest()
    {
        List<String> toAddresses = new List<String>();
        Id qualityCaseId = [SELECT Id FROM Quality_Case__c WHERE IsClosed__c = false LIMIT 1].Id;
        
        // start test
        Test.startTest();
        
        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        toAddresses.add('SFDCListenerService@web.com');
        
        // Set up the data for the email
        email.Subject = 'Notify SFDC to Close,Reference Record: ' + String.valueOf(qualityCaseId) + ' [Tkt:3245678]';
        email.HtmlBody = 'Close SFDC Record';
        email.PlainTextBody = 'Close SFDC Record';
        email.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSEmails emailProcess = new ProcessCTSEmails();
        emailProcess.handleInboundEmail(email, env);
        
        Test.stopTest();
    }
    
    private static testMethod void closeCustSurveyRecordTest()
    {
        List<String> toAddresses = new List<String>();
        Id custSurveyId = [SELECT Id FROM Customer_Surveys__c WHERE Status__c != 'Closed Completed' LIMIT 1].Id;
        
        // start test
        Test.startTest();
        
        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        toAddresses.add('SFDCListenerService@web.com');
        
        // Set up the data for the email
        email.Subject = 'Notify SFDC to Close,Reference Record: ' + String.valueOf(custSurveyId) + ' [Tkt:3245679]';
        email.HtmlBody = 'Close SFDC Record';
        email.PlainTextBody = 'Close SFDC Record';
        email.toAddresses = toAddresses;

        // Call the email service class and test it with the data in this method
        ProcessCTSEmails emailProcess = new ProcessCTSEmails();
        emailProcess.handleInboundEmail(email, env);
        
        Test.stopTest();
    }
}