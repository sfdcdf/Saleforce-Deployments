@isTest
private class OrganicCaseTriggerTest {
    
    @isTest static void test_ReasonForSubmission() {
    	//new TestCustomSettingInitializer();
        Account newAccount = new Account();
        newAccount.Name = 'Test Account';
        insert newAccount;

        Organic_Analysis__c newOrganicAnalysis = new Organic_Analysis__c();
        newOrganicAnalysis.Account_Name__c = newAccount.Id;
        newOrganicAnalysis.Reason_for_Submission__c = 'Test Submission Pick Value';
        insert newOrganicAnalysis;
    }

    @isTest static void test_syncOrganicCaseRecordLogic(){
    	//new TestCustomSettingInitializer();

    	String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

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

		Test.startTest();
		Organic_Analysis__c newOrganicAnalysis = new Organic_Analysis__c();
        newOrganicAnalysis.Account_Name__c = newAccount.Id;
        newOrganicAnalysis.RecordTypeId = Schema.SObjectType.Organic_Analysis__c.getRecordTypeInfosByName().get('Maps Initial Claiming').getRecordTypeId();
        insert newOrganicAnalysis;
        Test.stopTest();
    }

    @isTest static void test_syncOrganicCaseRecordLogicUpdate(){
    	//new TestCustomSettingInitializer();

    	String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

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
        OrganicCaseObjectHelper.alreadyFiredOrganicCaseObjectHelper = false;
        newOrganicAnalysis.Sync_to_Marketo__c = false;
        update newOrganicAnalysis;
        Test.stopTest();
    }

    @isTest static void test_syncOrganicCaseRecordLogicFieldUpdate(){
    	//new TestCustomSettingInitializer();

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
        OrganicCaseObjectHelper.alreadyFiredOrganicCaseObjectHelper = false;
        newOrganicAnalysis.Categories_Inputted_into_BLocal__c = 'Test Change';
        update newOrganicAnalysis;
        Test.stopTest();
    }

    @isTest static void test_organicCaseUpdateLeadsNotFuture(){
    	//new TestCustomSettingInitializer();

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
        newOrganicAnalysis.Categories_Inputted_into_BLocal__c = 'Test Change';
        insert newOrganicAnalysis;

        Test.startTest();
        Database.executeBatch(new CriteriaBasedBatchDataPushToMarketo(new List<Id>{newOrganicAnalysis.Id}, 'Organic_Analysis__c'));
        Test.stopTest();
    }
    
}