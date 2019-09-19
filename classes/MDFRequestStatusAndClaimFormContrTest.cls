@isTest
private class MDFRequestStatusAndClaimFormContrTest {

	@testSetup static void partnerUserTestSetup() {
		UserRole portalRole = [Select Id From UserRole Where PortalType = 'None' Limit 1];
		system.debug('portalRole is ' + portalRole);

		Profile profile1 = [Select Id from Profile where name = 'System Administrator'];
		User portalAccountOwner1 = new User(
			UserRoleId = portalRole.Id,
			ProfileId = profile1.Id,
			Username = System.now().millisecond() + 'te43st2@teyodles44432t.com',
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
				OwnerId = portalAccountOwner1.Id,
				RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Partner Master Account').getRecordTypeId(),
				Partner_Status__c = 'Customer'
			);
			Database.insert(portalAccount1);

			//Create Child Account
			List<Account> childAccountList = new List<Account>();
			for(Integer i = 0; i <= 5; i++){
				Account childAccount1 = new Account(
					Name = 'TestAccount childAccount ' + String.valueof(i),
					OwnerId = portalAccountOwner1.Id,
					RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId(),
					Status__c = 'LIVE',
					ParentId = portalAccount1.Id
				);
				childAccountList.add(childAccount1);
			}

			Database.insert(childAccountList);

			//Create Last Quarter Count
			Partner_Quarterly_Managed_Account_Count__c lastQuarterManagedAccountCount = new Partner_Quarterly_Managed_Account_Count__c(
				OwnerId = portalAccountOwner1.Id,
				Parent_Account__c = portalAccount1.Id,
				End_of_Quarter_Date__c = [Select StartDate, EndDate From Period Where type = 'Quarter' and StartDate = LAST_FISCAL_QUARTER].EndDate
			);
			Database.insert(lastQuarterManagedAccountCount);

			//Create Last Quarter Child Account
			List<Partner_Quarterly_Managed_Child_Account__c> managedChildAccountList = new List<Partner_Quarterly_Managed_Child_Account__c>();
			for(Account record : childAccountList){
				Partner_Quarterly_Managed_Child_Account__c lastQuarterChildManagedAccount = new Partner_Quarterly_Managed_Child_Account__c(
					Child_Account__c = record.Id,
					Partner_Quarterly_Managed_Account_Count__c = lastQuarterManagedAccountCount.Id
				);
				managedChildAccountList.add(lastQuarterChildManagedAccount);
			}
			Database.insert(managedChildAccountList);

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
				Username = System.now().millisecond() + 'test12345@test.com',
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
	
	@isTest static void test_MDFRequestStatusAndClaimFormContr() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		User user1 = [select Id, AccountId, Account.OwnerId from User where Email = 'test12345@test.com'];

		System.runAs (user1){
			//Test.setCurrentPage(Page.MDFRequestStatusAndClaimForm);
			MDFRequestStatusAndClaimFormController contr = new MDFRequestStatusAndClaimFormController();

			Partner_Marketing_Development_Fund__c pmdf = new Partner_Marketing_Development_Fund__c();
			pmdf.OwnerId = user1.Account.OwnerId;
			pmdf.Partner_Account__c = user1.AccountId;
			pmdf.Requested_By__c = user1.Id;
			pmdf.Estimated_Cost_of_Activity__c = 100;
			pmdf.Type_of_Activity__c = 'White Papers';
			pmdf.When_will_the_activity_happen__c = Date.today().addDays(5);
			pmdf.What_is_the_goal_of_the_activity__c = 'Test Test';
			pmdf.MDF_Date_Submitted__c = Date.today();
			pmdf.Explain_activity_in_detail__c = 'Test Teset TEset';
			insert pmdf;

			contr.refreshData();

			pmdf.MDF_Status__c = 'Request Approved';
			update pmdf;

			contr.refreshData();

			ApexPages.currentPage().getParameters().put('pmdfSelectedId', pmdf.Id);

			contr.selectedPMDF();

			contr.saveClaimForm();

			contr.attachFile();
		}
	}
	
}