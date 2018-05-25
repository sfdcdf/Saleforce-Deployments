@isTest
public class test_TextbrokerAcceptOrders {

	/* Orders will be accepted by default.
	public testmethod static void testCall() {
		//Create cases belonging to Textbroker user
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
		
		//Change the cases' status to 'Work Completed'
		for(Case c : cases) {
			c.Status = 'Work Completed';
		}
		
		Test.startTest();
		//Set mock endpoint
		Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointAcceptOrders());
		update cases;
		Test.stopTest();
		
		//Verify that the database has been updated	
		List<Case> acceptedCases = [select Id, copyProviderId__c, CopyConfirmedAccepted__c from Case where CopyConfirmedAccepted__c = true];
		System.assertEquals(3, acceptedCases.size());
		System.assertEquals(acceptedCases[0].Id, caseId1);
		System.assertEquals(acceptedCases[1].Id, caseId2);
		System.assertEquals(acceptedCases[2].Id, caseId3);
		System.assertEquals(acceptedCases[0].copyProviderId__c, textbrokerId1);
		System.assertEquals(acceptedCases[1].copyProviderId__c, textbrokerId2);
		System.assertEquals(acceptedCases[2].copyProviderId__c, textbrokerId3);
		System.assertEquals(acceptedCases[0].CopyConfirmedAccepted__c, true);
		System.assertEquals(acceptedCases[1].CopyConfirmedAccepted__c, true);
		System.assertEquals(acceptedCases[2].CopyConfirmedAccepted__c, true);	
	}*/
}