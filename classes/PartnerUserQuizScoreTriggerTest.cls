@isTest
private class PartnerUserQuizScoreTriggerTest {
	
	@isTest static void test_PartnerUserQuizScoreTriggerPassed() {
		//Create account
		Account portalAccount1 = new Account(
			Name = 'TestAccount'
		);
		Database.insert(portalAccount1);

		//Create contact
		Contact contact1 = new Contact(
			FirstName = 'Test',
			Lastname = 'McTesty',
			AccountId = portalAccount1.Id,
			Email = System.now().millisecond() + 'test@test.com'
		);
		Database.insert(contact1);

		Opportunity opportunity1 = new Opportunity(
			Name = 'Test Opp',
			StageName = 'Closed Won',
			Partner_Products_Available_To_Sell__c = 'Lighthouse Dental',
			AccountId = portalAccount1.Id,
			CloseDate = Date.today(),
			RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('CPP - Initial Transaction').getRecordTypeId(),
			Payment_Status__c = 'Received upon Signing'
		);
		Database.insert(opportunity1);

		Partner_User_Quiz_Scores__c puqz = new Partner_User_Quiz_Scores__c(
			ProProfs_Message__c = '{"quiz_id":"1025997","user_obtained_marks":"97","user_name":"Test Yodle","user_percent_marks":"96.97","attempt_date":"1462980808","time_taken":"0:12:36","user_Email":"' + contact1.Email + '","user_totalwrong_answers":"1","user_State":"","total_marks":"100","user_total_unanswered":"0","user_Id":"","result_id":"102930599","user_totalcorrect_answers":"32","user_City":"","user_Phone":"","quiz_title":"lighthouse-360-product-certification","user_Zipcode":"","user_Country":"","user_Address":"","quiz_name":"Lighthouse 360 Partner Certification","status":"new"}'
		);
		Database.insert(puqz);
	}

	@isTest static void test_PartnerUserQuizScoreTriggerFailed() {
		//Create account
		Account portalAccount1 = new Account(
			Name = 'TestAccount'
		);
		Database.insert(portalAccount1);

		//Create contact
		Contact contact1 = new Contact(
			FirstName = 'Test',
			Lastname = 'McTesty',
			AccountId = portalAccount1.Id,
			Email = System.now().millisecond() + 'test@test.com'
		);
		Database.insert(contact1);

		Opportunity opportunity1 = new Opportunity(
			Name = 'Test Opp',
			StageName = 'Closed Won',
			Partner_Products_Available_To_Sell__c = 'Lighthouse Dental',
			AccountId = portalAccount1.Id,
			CloseDate = Date.today(),
			RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('CPP - Initial Transaction').getRecordTypeId(),
			Payment_Status__c = 'Received upon Signing'
		);
		Database.insert(opportunity1);

		Partner_User_Quiz_Scores__c puqz = new Partner_User_Quiz_Scores__c(
			ProProfs_Message__c = '{"quiz_id":"1025997","user_obtained_marks":"70","user_name":"Test Yodle","user_percent_marks":"70.97","attempt_date":"1462980808","time_taken":"0:12:36","user_Email":"' + contact1.Email + '","user_totalwrong_answers":"1","user_State":"","total_marks":"100","user_total_unanswered":"0","user_Id":"","result_id":"102930599","user_totalcorrect_answers":"32","user_City":"","user_Phone":"","quiz_title":"lighthouse-360-product-certification","user_Zipcode":"","user_Country":"","user_Address":"","quiz_name":"Lighthouse 360 Partner Certification","status":"new"}'
		);
		Database.insert(puqz);
	}
	
}