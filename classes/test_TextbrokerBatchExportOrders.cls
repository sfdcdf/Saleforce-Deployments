@isTest
public with sharing class test_TextbrokerBatchExportOrders {

    @isTest
    public static void testStart() {

        TextbrokerBatchExportOrders batch = new TextbrokerBatchExportOrders();

        Test.startTest();

        Database.QueryLocator locator = batch.doStart(null);

        Test.stopTest();

        System.assertEquals('SELECT Id FROM Case WHERE CopyStatus__c = \'Document Ready\''.deleteWhitespace(), locator.getQuery().deleteWhitespace());
    }

    @isTest
    public static void testExecute() {

        List<Case> cases = new List<Case>();
        Case c = (test_TextbrokerObjectCreator.getTextbrokerCases(1))[0];
        c.CopyProviderId__c = '1eba07c0-c9e8-11e2-8b8b-0800200c9a66';
        // TEXTBROKER-28
        c.CopyStatus__c = 'Document Ready';
        cases.add(c);
        update c;

        TextbrokerBatchExportOrders batch = new TextbrokerBatchExportOrders();

        Test.startTest();

        Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointExportOrder());

        batch.doExecute(cases);
        Test.stopTest();

        //Verify Word document was attached to case
        Attachment attachment = [select ParentId, ContentType, Body from Attachment where ParentId = :c.Id];
        //System.assertEquals('application/msword', attachment.ContentType);
        System.assertEquals('application/vnd.openxmlformats-officedocument.wordprocessingml.document', attachment.ContentType); // abrosius@soliantconsulting.com 2013Jul16: not sure this was necessary
        System.assertEquals('This is a test.', attachment.Body.toString());
    }

}