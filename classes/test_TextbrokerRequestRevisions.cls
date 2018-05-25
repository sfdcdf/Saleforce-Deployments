@isTest
public class test_TextbrokerRequestRevisions {

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

		//Change the cases' status to 'Revisions Needed'
		for(Case c : cases) {
			c.Status = 'Revisions Needed';
			c.Status_Notes__c = 'Reasons for revision request go here';

            // TEXTBROKER-28
            c.CopyStatus__c = 'Revisions Needed';
		}


		Textbroker_Trigger_Switch__c theSwitch = test_TextbrokerObjectCreator.getTriggerSwitch(); // abrosius@soliantconsulting.com 2013Jul17

		Test.startTest();
		//Set mock endpoint
		Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointReqRevisions());
		TextbrokerHelper.enforceTextbrokerTriggerAfter = true; // abrosius@soliantconsulting.com 2013Jul17: reset to true to allow trigger to fire with this, the second DML statement for these cases in this transaction
		update cases;
		Test.stopTest();

		//Verify that the database has been updated
		List<Case> needRevisionCases = [select Id, CopyStatus__c, copyProviderId__c from Case where Id IN :cases];
		System.assertEquals(3, needRevisionCases.size());
		System.assertEquals(needRevisionCases[0].Id, caseId1);
		System.assertEquals(needRevisionCases[1].Id, caseId2);
		System.assertEquals(needRevisionCases[2].Id, caseId3);
		System.assertEquals(needRevisionCases[0].copyProviderId__c, textbrokerId1);
		System.assertEquals(needRevisionCases[1].copyProviderId__c, textbrokerId2);
		System.assertEquals(needRevisionCases[2].copyProviderId__c, textbrokerId3);
		System.assertEquals(needRevisionCases[0].CopyStatus__c, 'Order/Revision Request Placed');
		System.assertEquals(needRevisionCases[1].CopyStatus__c, 'Order/Revision Request Placed');
		System.assertEquals(needRevisionCases[2].CopyStatus__c, 'Order/Revision Request Placed');
	}


    public testmethod static void testCallWithErrors() {
        //Create cases belonging to Textbroker user
        List<Case> cases = test_TextbrokerObjectCreator.getTextbrokerCases(3);
        Id caseId1 = cases[0].Id;   // this one will throw an error
        Id caseId2 = cases[1].Id;   // this one will throw an error
        Id caseId3 = cases[2].Id;   // this one will not throw an error
        String textbrokerId1 = '1eba07c0-c9e8-11e2-8b8b-0800200c9a66';
        String textbrokerId2 = '1eba07c0-c9e8-11e2-8b8b-0800200c9a67';
        String textbrokerId3 = '1eba07c0-c9e8-11e2-8b8b-0800200c9a68';
        cases[0].CopyProviderId__c = textbrokerId1;
        cases[1].CopyProviderId__c = textbrokerId2;
        cases[2].CopyProviderId__c = textbrokerId3;

        //Change the cases' status to 'Revisions Needed'
        for(Case c : cases) {
            c.Status = 'Revisions Needed';
            c.Status_Notes__c = 'Reasons for revision request go here';

            // TEXTBROKER-28
            c.CopyStatus__c = 'Revisions Needed';
        }


        Textbroker_Trigger_Switch__c theSwitch = test_TextbrokerObjectCreator.getTriggerSwitch(); // abrosius@soliantconsulting.com 2013Jul17

        Test.startTest();
        //Set mock endpoint
        Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointReqRevError());
        TextbrokerHelper.enforceTextbrokerTriggerAfter = true; // abrosius@soliantconsulting.com 2013Jul17: reset to true to allow trigger to fire with this, the second DML statement for these cases in this transaction
        update cases;
        Test.stopTest();

        //Verify that the database has been updated
        List<Case> needRevisionCases = [select Id, CopyStatus__c, copyProviderId__c from Case where Id IN :cases];
        System.assertEquals(3, needRevisionCases.size());
        System.assertEquals(caseId1, needRevisionCases[0].Id);
        System.assertEquals(caseId2, needRevisionCases[1].Id);
        System.assertEquals(caseId3, needRevisionCases[2].Id);
        System.assertEquals(textbrokerId1, needRevisionCases[0].copyProviderId__c);
        System.assertEquals(textbrokerId2, needRevisionCases[1].copyProviderId__c);
        System.assertEquals(textbrokerId3, needRevisionCases[2].copyProviderId__c);
        System.assertEquals('Error Occurred', needRevisionCases[0].CopyStatus__c);
        System.assertEquals('Error Occurred', needRevisionCases[1].CopyStatus__c);
        System.assertEquals('Order/Revision Request Placed', needRevisionCases[2].CopyStatus__c);
    }
}