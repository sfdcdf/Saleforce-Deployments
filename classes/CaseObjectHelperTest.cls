@isTest
private class CaseObjectHelperTest {
	
	@isTest static void test_syncCaseRecordLogic() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		List<SFDC_Case_to_Marketo_Field_Mappings__c> sfdcCaseToMarketoFieldList = new List<SFDC_Case_to_Marketo_Field_Mappings__c>();
		sfdcCaseToMarketoFieldList.add(new SFDC_Case_to_Marketo_Field_Mappings__c(Name='TestMarketoField', SFDC_Field_API_Name__c='Status', Sync_Field__c=true, Case_Reason_Criteria__c='CS Touch Plan'));
		sfdcCaseToMarketoFieldList.add(new SFDC_Case_to_Marketo_Field_Mappings__c(Name='Next_Scheduled_CSC', SFDC_Field_API_Name__c='Scheduled_Call__c', Sync_Field__c=true, Case_Reason_Criteria__c='CSC'));
		sfdcCaseToMarketoFieldList.add(new SFDC_Case_to_Marketo_Field_Mappings__c(Name='nextScheduledCall', SFDC_Field_API_Name__c='Scheduled_Call__c', Sync_Field__c=true, Case_Reason_Criteria__c='CS Touch Plan'));
		insert sfdcCaseToMarketoFieldList;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@tes788778t.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		newAccount.Sync_to_Marketo__c = true;
		insert newAccount;

		Test.startTest();

		Case newCase = new Case();
		newCase.AccountId = newAccount.Id;
		newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
		newCase.Reason = 'CS Touch Plan';
		newCase.Status = 'New';
		newCase.OwnerId = UserInfo.getUserId();
		newCase.Scheduled_Call__c = DateTime.now().addHours(10);
		insert newCase;

		newCase.Status = 'New Value';
		update newCase;
		Test.stopTest();
	}

	@isTest static void test_IssueResolutionCaseUpdateLead() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t3es788778t.4com';
		newAccount.Client_Type__c = 'Lighthouse';
		//newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		newAccount.Sync_to_Marketo__c = true;
		insert newAccount;

		Case newCase = new Case();
		newCase.AccountId = newAccount.Id;
		newCase.RecordTypeId = [select Id, Name, DeveloperName, SobjectType from RecordType where Name = 'Master' and SObjectType = 'Case'].Id;
		newCase.Reason = 'Account';
		newCase.Reason_Detail__c = 'Business Information';
		newCase.Status = 'New';
		newCase.OwnerId = UserInfo.getUserId();
		newCase.Origin = 'Phone';
		insert newCase;

		Test.startTest();
		newCase.Status = 'Closed';
		update newCase;
		Test.stopTest();
	}

	@isTest static void test_LBWNCSCase() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT()*2);
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t3es788778434t.44com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Product_Type__c = 'LBW';
		newAccount.Live_Date__c = Date.today();
		newAccount.Sync_to_Marketo__c = true;
		insert newAccount;

		Test.startTest();

		Case newCase = new Case();
		newCase.AccountId = newAccount.Id;
		newCase.RecordTypeId = [select Id, Name, DeveloperName, SobjectType from RecordType where Name = 'NCS - AutoLaunch' and SObjectType = 'Case'].Id;
		newCase.Reason = 'New Client Setup';
		newCase.Status = '1-MA Setup AutoLaunch';
		newCase.Sub_Status__c = 'New';
		newCase.OwnerId = UserInfo.getUserId();
		newCase.GCC1_Date_Time__c = DateTime.now().addDays(2);
		insert newCase;

		Test.stopTest();
	}
	
}