@isTest
public class test_TextbrokerConfirmExport {


	public testmethod static void testCall() {
		//Send request to create cases in "exported" status
		//CANNOT CALL A EXTERNAL WEB SERVICE IN A TEST!!
		//List<Case> ordersToConfirm = test_TextbrokerRemoteObjectCreator.createExportedOrders(3);

		//Create cases to confirm
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
            c.CopyStatus__c = 'Document Retrieved';
        }

		update cases;
		Map<Id, Case> casesToConfirmMap = new Map<Id, Case>(cases);
		System.assertEquals(3, casesToConfirmMap.size());

		//Send request to confirm Word document was retrieved
		Test.startTest();
		//Set mock endpoint
		Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointConfirmExport());

        // sort the Case IDs to ensure we get matches between the Case IDs and the TB IDs in the mock response
        List<Id> caseIdList = new List<Id>(casesToConfirmMap.keySet());
        caseIdList.sort();
        TextbrokerDispatcher.confirmOrdersExported(caseIdList);
		Test.stopTest();

		//Verify that response was processed and database updated
        Map<Id, Case> exportedCases = new Map<Id, Case>([select Id, copyProviderId__c, CopyStatus__c from Case where Id IN :cases ORDER BY CopyProviderId__c]);
		System.assertEquals(3, exportedCases.size());
        System.assertEquals(textbrokerId1, exportedCases.get(caseId1).copyProviderId__c);
        System.assertEquals(textbrokerId2, exportedCases.get(caseId2).copyProviderId__c);
        System.assertEquals(textbrokerId3, exportedCases.get(caseId3).copyProviderId__c);
        System.assertEquals('Document Retrieval Confirmed', exportedCases.get(caseId1).CopyStatus__c);
        System.assertEquals('Document Retrieval Confirmed', exportedCases.get(caseId2).CopyStatus__c);
        System.assertEquals('Document Retrieval Confirmed', exportedCases.get(caseId3).CopyStatus__c);

	}

    public testmethod static void testCallWithError() {
        //Send request to create cases in "exported" status
        //CANNOT CALL A EXTERNAL WEB SERVICE IN A TEST!!
        //List<Case> ordersToConfirm = test_TextbrokerRemoteObjectCreator.createExportedOrders(3);

        //Create cases to confirm
        List<Case> cases = test_TextbrokerObjectCreator.getTextbrokerCases(3);
        Id caseId1 = cases[0].Id;
        Id caseId2 = cases[1].Id;
        Id caseId3 = cases[2].Id;
        System.debug(caseId1);
        System.debug(caseId2);
        System.debug(caseId3);
        String textbrokerId1 = '1eba07c0-c9e8-11e2-8b8b-0800200c9a69';   // this one will throw an error
        String textbrokerId2 = '1eba07c0-c9e8-11e2-8b8b-0800200c9a70';   // this one will not throw an error
        String textbrokerId3 = '1eba07c0-c9e8-11e2-8b8b-0800200c9a71';   // this one will not throw an error
        cases[0].CopyProviderId__c = textbrokerId1;
        cases[1].CopyProviderId__c = textbrokerId2;
        cases[2].CopyProviderId__c = textbrokerId3;

        // TEXTBROKER-28: Update CopyStatus__c
        for(Case c : cases) {
            c.CopyStatus__c = 'Document Retrieved';
        }

        update cases;
        Map<Id, Case> casesToConfirmMap = new Map<Id, Case>(cases);
        System.assertEquals(3, casesToConfirmMap.size());

        //Send request to confirm Word document was retrieved
        Test.startTest();
        //Set mock endpoint
        Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointConfirmExpErr());

        // sort the Case IDs to ensure we get matches between the Case IDs and the TB IDs in the mock response
        List<Id> caseIdList = new List<Id>(casesToConfirmMap.keySet());
        caseIdList.sort();
        TextbrokerDispatcher.confirmOrdersExported(caseIdList);
        Test.stopTest();

        //Verify that response was processed and database updated
        Map<Id, Case> exportedCases = new Map<Id, Case>([select Id, copyProviderId__c, CopyStatus__c from Case where Id IN :cases ORDER BY CopyProviderId__c]);
        for (Case aCase : exportedCases.values()) {
            System.debug(aCase);
        }

        System.assertEquals(3, exportedCases.size());
        System.assertEquals(textbrokerId1, exportedCases.get(caseId1).copyProviderId__c);
        System.assertEquals(textbrokerId2, exportedCases.get(caseId2).copyProviderId__c);
        System.assertEquals(textbrokerId3, exportedCases.get(caseId3).copyProviderId__c);
        System.assertEquals('Error Occurred', exportedCases.get(caseId1).CopyStatus__c);
        System.assertEquals('Document Retrieval Confirmed', exportedCases.get(caseId2).CopyStatus__c);
        System.assertEquals('Document Retrieval Confirmed', exportedCases.get(caseId3).CopyStatus__c);
    }

}