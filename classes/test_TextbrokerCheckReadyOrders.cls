@isTest
public class test_TextbrokerCheckReadyOrders {

	public testmethod static void testCall() {
		//Create cases with a Textbroker user
		List<Case> cases = test_TextbrokerObjectCreator.getTextbrokerCases(3);
		Id caseId1 = cases[0].Id;
		Id caseId2 = cases[1].Id;
		Id caseId3 = cases[2].Id;
		String textbrokerId1 = '1eba07c0-c9e8-11e2-8b8b-0800200c9a66';
		String textbrokerId2 = '1eba07c0-c9e8-11e2-8b8b-0800200c9a67';
		String textbrokerId3 = '1eba07c0-c9e8-11e2-8b8b-0800200c9a68';
		cases[0].CopyProviderId__c = textbrokerId1;
		cases[1].CopyProviderId__c = textbrokerId2;
		cases[2].CopyProviderId__c = textbrokerId3;

        // TEXTBROKER-28: Update CopyStatus__c
        for(Case c : cases) {
            cases[0].CopyStatus__c = 'Order/Revision Request Placed';
            cases[1].CopyStatus__c = 'Order/Revision Request Placed';
            cases[2].CopyStatus__c = 'Order/Revision Request Placed';
        }

		update cases;

		Test.startTest();
		//Set mock endpoint
		Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointReadyOrders(cases));
		TextbrokerDispatcher.checkReadyOrders();
		Test.stopTest();

		//Verify that response was processed and database updated
		List<Case> readyCases = [select Id, copyProviderId__c, CopyStatus__c from Case where Id IN :cases];
		System.assertEquals(3, readyCases.size());
		System.assertEquals(readyCases[0].Id, caseId1);
		System.assertEquals(readyCases[1].Id, caseId2);
		System.assertEquals(readyCases[2].Id, caseId3);
		System.assertEquals(readyCases[0].copyProviderId__c, textbrokerId1);
		System.assertEquals(readyCases[1].copyProviderId__c, textbrokerId2);
		System.assertEquals(readyCases[2].copyProviderId__c, textbrokerId3);
		System.assertEquals(readyCases[0].CopyStatus__c, 'Document Ready');
		System.assertEquals(readyCases[1].CopyStatus__c, 'Document Ready');
		System.assertEquals(readyCases[2].CopyStatus__c, 'Document Ready');
	}
}