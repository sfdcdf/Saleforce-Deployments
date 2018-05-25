@isTest
private class OnDemandSF2MarketoRecordSyncContrTest {
	
	@isTest static void test_OnDemandSF2MarketoRecordSyncControllerAccount() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":52,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Client_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Prospect_ID__c = '205';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@te3443st.co4443m';
		newAccount.Client_Type__c = 'Local';
		newAccount.Marketo_ID__c = '52';
		newAccount.Sync_to_Marketo__c = true;
		insert newAccount;

		Test.startTest();

		PageReference currentPage = Page.OnDemandSF2MarketoRecordSync;
		Test.setCurrentPage(currentPage);

		ApexPages.currentPage().getParameters().put('recordId', newAccount.Id);
		ApexPages.currentPage().getParameters().put('objectType', 'Account');

		OnDemandSF2MarketoRecordSyncController contr = new OnDemandSF2MarketoRecordSyncController();


		Test.stopTest();
	}

	@isTest static void test_OnDemandSF2MarketoRecordSyncControllerCase() {
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
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@tes788664778t.co5445m';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		newAccount.Sync_to_Marketo__c = true;
		insert newAccount;

		Case newCase = new Case();
		newCase.AccountId = newAccount.Id;
		newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
		newCase.Reason = 'CS Touch Plan';
		newCase.Status = 'New';
		newCase.OwnerId = UserInfo.getUserId();
		newCase.Scheduled_Call__c = DateTime.now().addHours(10);
		insert newCase;

		Test.startTest();
		PageReference currentPage = Page.OnDemandSF2MarketoRecordSync;
		Test.setCurrentPage(currentPage);

		ApexPages.currentPage().getParameters().put('recordId', newCase.Id);
		ApexPages.currentPage().getParameters().put('objectType', 'Case');

		OnDemandSF2MarketoRecordSyncController contr = new OnDemandSF2MarketoRecordSyncController();
		Test.stopTest();
	}

	@isTest static void test_OnDemandSF2MarketoRecordSyncControllerOrganicCase() {
		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		SFDC_Org_Case_to_Marketo_Field_Mappings__c fieldMapping = new SFDC_Org_Case_to_Marketo_Field_Mappings__c();
		fieldMapping.Name = 'TestField';
		fieldMapping.Sync_Field__c = true;
		fieldMapping.SFDC_Field_API_Name__c = 'Categories_Inputted_into_BLocal__c';
		insert fieldMapping;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		newAccount.Secondary_Segments__c = 'Locksmith';
		newAccount.Sync_to_Marketo__c = true;
		insert newAccount;

		Organic_Analysis__c newOrganicAnalysis = new Organic_Analysis__c();
        newOrganicAnalysis.Account_Name__c = newAccount.Id;
        newOrganicAnalysis.RecordTypeId = Schema.SObjectType.Organic_Analysis__c.getRecordTypeInfosByName().get('Maps Initial Claiming').getRecordTypeId();
        insert newOrganicAnalysis;

        Test.startTest();
        ApexPages.currentPage().getParameters().put('recordId', newOrganicAnalysis.Id);
		ApexPages.currentPage().getParameters().put('objectType', 'Organic_Analysis__c');

		OnDemandSF2MarketoRecordSyncController contr = new OnDemandSF2MarketoRecordSyncController();
        Test.stopTest();
	}
	
}