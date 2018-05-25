@isTest
private class ElectricWelcomeControllerTest {
	
	@testSetup static void testDataSetup() {
		UserRole portalRole = [Select Id From UserRole Where PortalType = 'None' Limit 1];
		system.debug('portalRole is ' + portalRole);

		Profile profile1 = [Select Id from Profile where name = 'System Administrator'];
		User portalAccountOwner1 = new User(
			UserRoleId = portalRole.Id,
			ProfileId = profile1.Id,
			Username = System.now().millisecond() + 'tes43t2@te43st.com',
			Alias = 'batman',
			Email='bruce.wayne@wayneenterprises.com',
			EmailEncodingKey='UTF-8',
			Firstname='Bruce',
			Lastname='Wayne',
			LanguageLocaleKey='en_US',
			LocaleSidKey='en_US',
			TimeZoneSidKey='America/Chicago',
			Phone = '5555555555',
			Title = 'Test Title'
		);
		Database.insert(portalAccountOwner1);

		System.runAs ( portalAccountOwner1 ) {
			//Create account
			Account portalAccount1 = new Account(
				Name = 'TestAccount',
				OwnerId = portalAccountOwner1.Id
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
				Date_certification_complete__c = Date.today(),
				Partner_Products_Available_To_Sell__c = 'Lighthouse Dental',
				AccountId = portalAccount1.Id,
				CloseDate = Date.today(),
				RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('CPP - Initial Transaction').getRecordTypeId(),
				Payment_Status__c = 'Received upon Signing'
			);
			Database.insert(opportunity1);

			Partner_Community_HTML__c pchtml = new Partner_Community_HTML__c(
				Name = 'WelcomePage',
				HTML__c = '<div> '
					+ '<div class="h1">Welcome to your <br />Partner Portal</div>'
					+ '<div class="body1">Hi {Contact.Name}'
					+ '<p>'
					+ 'In this portal you have access to all of the sales, training, and marketing material you need to enable your clients to use Lighthouse 360. You also have access to the partner community.'
					+ '<p>'
					+ 'In the partner community you can chat with other partners about best practices, the industry, or feedback on any initiatives you are working on. The community is also a great place to form new relationships to help you expand your current reach.' 
					+ '<p>'
					+ 'As your Partner Account Manager, I\'ll be your single point of contact to help assist you with anything you need. Here is my contact info:'
					+ '<p>'
					+ 'Name: {Owner.Name}<br />'
					+ 'Title: {Owner.Title}<br />'
					+ 'Phone: {Owner.Phone}<br />'
					+ 'Email: {Owner.Email}<br />'
					+ '<p>'
					+ '<p>'
					+ 'I\'m looking forward to helping you succeed!'
					+ '<p>'
					+ '-{Owner.Name}</div>'
					+ '</div> ',
				Active__c = true
			);
			Database.insert(pchtml);

			//Create user
			Profile portalProfile = [SELECT Id FROM Profile where UserType = 'PowerPartner' Limit 1];
			User user1 = new User(
				Username = System.now().millisecond() + 'tes344t12345@te4444st.com',
				ContactId = contact1.Id,
				ProfileId = portalProfile.Id,
				Alias = 'test123',
				Email = 'test12345@test.com',
				EmailEncodingKey = 'UTF-8',
				LastName = 'McTesty',
				CommunityNickname = 'test12345',
				TimeZoneSidKey = 'America/Los_Angeles',
				LocaleSidKey = 'en_US',
				LanguageLocaleKey = 'en_US'
			);
			Database.insert(user1);
		}
	}
	
	@isTest static void test_PartnerCommunityWelcomeControllerAsInternalUser() {
		ElectricWelcomeController.getWelcomePage();
	}

	@isTest static void test_PartnerCommunityWelcomeControllerAsExternalUser() {
		User user1 = [select Id from User where Email = 'test12345@test.com'];

		System.runAs (user1){
			ElectricWelcomeController.getWelcomePage();
		}
	}
	
}