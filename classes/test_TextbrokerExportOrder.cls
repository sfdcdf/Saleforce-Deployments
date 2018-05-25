@isTest
public with sharing class test_TextbrokerExportOrder {

	public testmethod static void testCall() {

        Case c = (test_TextbrokerObjectCreator.getTextbrokerCases(1))[0];
		c.CopyProviderId__c = '1eba07c0-c9e8-11e2-8b8b-0800200c9a66';
        // TEXTBROKER-28
        c.CopyStatus__c = 'Document Ready';
		update c;

		//Send request to retrieve Word document
		Test.startTest();
		//Set mock endpoint
		Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointExportOrder());
		TextbrokerDispatcher.exportOrder(c.Id);
		Test.stopTest();

		//Verify Word document was attached to case
		Attachment attachment = [select ParentId, ContentType, Body from Attachment where ParentId = :c.Id];
		//System.assertEquals('application/msword', attachment.ContentType);
		System.assertEquals('application/vnd.openxmlformats-officedocument.wordprocessingml.document', attachment.ContentType); // abrosius@soliantconsulting.com 2013Jul16: not sure this was necessary
		System.assertEquals('This is a test.', attachment.Body.toString());
	}

	public testmethod static void testEmptyBody() {

        Case c = (test_TextbrokerObjectCreator.getTextbrokerCases(1))[0];
		c.CopyProviderId__c = '1eba07c0-c9e8-11e2-8b8b-0800200c9a66';
        // TEXTBROKER-28
        c.CopyStatus__c = 'Document Ready';
		update c;

		//Send request to retrieve Word document
		Test.startTest();
		//Set mock endpoint
		Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointExportOrderNo());
		TextbrokerDispatcher.exportOrder(c.Id);
		Test.stopTest();

		//Verify Word document was NOT attached to case, and that no exception was thrown
		List<Attachment> attachments = [select ParentId, ContentType, Body from Attachment where ParentId = :c.Id];
		System.assertEquals(0, attachments.size());
	}
}