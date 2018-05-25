@isTest
public class test_TextbrokerCreateOrders {

	public testmethod static void testCall() {

		//Create cases with a non-Textbroker user
		List<Case> cases = test_TextbrokerObjectCreator.getImsCases(3);
		Map<Id, Case> casesMap = new Map<Id, Case>(cases);

		User textbrokerUser = test_TextbrokerObjectCreator.getTextbrokerUser();
		RecordType organicSetupRecordType = test_TextbrokerObjectCreator.getOrganicSetupRecordType();
		Textbroker_Trigger_Switch__c theSwitch = test_TextbrokerObjectCreator.getTriggerSwitch(); // abrosius@soliantconsulting.com 2013Jul17

		//Update cases to Textbroker user
		for(Case c : cases) {
			c.OwnerId = textbrokerUser.Id;
			c.RecordTypeId = organicSetupRecordType.Id;
		}

		Test.startTest();
		//Set mock endpoint
		Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointCreateOrders());
		TextbrokerHelper.enforceTextbrokerTriggerAfter = true; // abrosius@soliantconsulting.com 2013Jul17: reset to true to allow trigger to fire with this, the second DML statement for these cases in this transaction
		update cases;
		Test.stopTest();

		//Verify database has been updated and Textbroker IDs have been stored
		List<Case> updatedCases = [select CopyProviderID__c, CopyStatus__c from case where Id in :casesMap.keySet()];
		System.assertEquals(3, updatedCases.size());
		System.assertEquals('1eba07c0-c9e8-11e2-8b8b-0800200c9a66', updatedCases[0].CopyProviderId__c);
		System.assertEquals('1eba07c0-c9e8-11e2-8b8b-0800200c9a67', updatedCases[1].CopyProviderId__c);
		System.assertEquals('1eba07c0-c9e8-11e2-8b8b-0800200c9a68', updatedCases[2].CopyProviderId__c);
        System.assertEquals('Order/Revision Request Placed', updatedCases[0].CopyStatus__c);
        System.assertEquals('Order/Revision Request Placed', updatedCases[1].CopyStatus__c);
        System.assertEquals('Order/Revision Request Placed', updatedCases[2].CopyStatus__c);
	}


    public testmethod static void testCallWithError() {

        //Create cases with a non-Textbroker user
        List<Case> cases = test_TextbrokerObjectCreator.getImsCases(3);
        Map<Id, Case> casesMap = new Map<Id, Case>(cases);

        User textbrokerUser = test_TextbrokerObjectCreator.getTextbrokerUser();
        RecordType organicSetupRecordType = test_TextbrokerObjectCreator.getOrganicSetupRecordType();
        Textbroker_Trigger_Switch__c theSwitch = test_TextbrokerObjectCreator.getTriggerSwitch(); // abrosius@soliantconsulting.com 2013Jul17

        //Update cases to Textbroker user
        // the Case with CopyProviderId__c = '1eba07c0-c9e8-11e2-8b8b-0800200c9a66' will throw an error
        for(Case c : cases) {
            c.OwnerId = textbrokerUser.Id;
            c.RecordTypeId = organicSetupRecordType.Id;
        }

        Test.startTest();
        //Set mock endpoint
        Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointCreateOrdErr());
        TextbrokerHelper.enforceTextbrokerTriggerAfter = true; // abrosius@soliantconsulting.com 2013Jul17: reset to true to allow trigger to fire with this, the second DML statement for these cases in this transaction
        update cases;
        Test.stopTest();

        //Verify database has been updated and Textbroker IDs have been stored
        List<Case> updatedCases = [select CopyProviderID__c, CopyStatus__c from case where Id in :casesMap.keySet()];
        System.assertEquals(3, updatedCases.size());
        System.assertEquals(null, updatedCases[0].CopyProviderId__c); // error case
        System.assertEquals('1eba07c0-c9e8-11e2-8b8b-0800200c9a67', updatedCases[1].CopyProviderId__c);
        System.assertEquals('1eba07c0-c9e8-11e2-8b8b-0800200c9a68', updatedCases[2].CopyProviderId__c);
        System.assertEquals('Error Occurred', updatedCases[0].CopyStatus__c);
        System.assertEquals('Order/Revision Request Placed', updatedCases[1].CopyStatus__c);
        System.assertEquals('Order/Revision Request Placed', updatedCases[2].CopyStatus__c);
    }

}