@isTest
public with sharing class test_TextbrokerHelper {

	public testmethod static void testCasesToOrders() {
		List<Case> casesToTransfer = test_TextbrokerObjectCreator.getTextbrokerCases(5);
		List<TextbrokerOrder> ordersToTransfer = TextbrokerHelper.casesToOrders(casesToTransfer);
		System.assertEquals(ordersToTransfer.size(), casesToTransfer.size());

		for(Integer i = 0; i < ordersToTransfer.size(); i++) {
			System.assertEquals(casesToTransfer[i].Id, ordersToTransfer[i].referenceID);
			System.assertEquals('Test Account - ' + casesToTransfer[i].CaseNumber + ' - tk0001', ordersToTransfer[i].title);
			System.assertNotEquals(null, ordersToTransfer[i].briefing);
		}
	}

    public testmethod static void testUpdateCopyStatusAndError() {
        List<Case> casesToUpdate = test_TextbrokerObjectCreator.getTextbrokerCases(3);

        Test.startTest();

        TextbrokerHelper.writeCopyStatusErrorToCase(casesToUpdate, 'This is a test error string');

        Test.stopTest();

        List<Case> updatedCases = [SELECT Id, CopyStatus__c, CopyStatusError__c FROM Case WHERE Id IN :casesToUpdate];
        for(Integer i = 0; i < casesToUpdate.size(); i++) {
            System.assertEquals('Error Occurred', updatedCases[i].CopyStatus__c);
            System.assertEquals('This is a test error string', updatedCases[i].CopyStatusError__c);
        }
    }
}