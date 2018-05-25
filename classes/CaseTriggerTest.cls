@isTest
private class CaseTriggerTest {
	
	@isTest static void testWebToCaseTriggerFromLHFSAndoidApp() {
		Account testAccount = new Account();
		testAccount.Name = 'Test Account Name';
		testAccount.Client_ID__c = 'TestId';
		insert testAccount;

		Case newCase = new Case();
		newCase.Client_ID__c = testAccount.Client_ID__c;
		newCase.Origin = 'LHFS Android App';
		insert newCase;

		Case newCaseData = [select Id, AccountId, Reason, Reason_Detail__c from Case where Id =: newCase.Id];

		system.assertEquals(newCaseData.AccountId, testAccount.Id);
		system.assertEquals(newCaseData.Reason, 'Inbound Inquiry');
		system.assertEquals(newCaseData.Reason_Detail__c, 'Other');
	}

	@isTest static void testWebToCaseTriggerFromLHFSiOSApp() {
		Account testAccount = new Account();
		testAccount.Name = 'Test Account Name';
		testAccount.Client_ID__c = 'TestId';
		insert testAccount;

		Case newCase = new Case();
		newCase.Client_ID__c = testAccount.Client_ID__c;
		newCase.Origin = 'LHFS iOS App';
		insert newCase;

		Case newCaseData = [select Id, AccountId, Reason, Reason_Detail__c from Case where Id =: newCase.Id];

		system.assertEquals(newCaseData.AccountId, testAccount.Id);
		system.assertEquals(newCaseData.Reason, 'Inbound Inquiry');
		system.assertEquals(newCaseData.Reason_Detail__c, 'Other');
	}

	@isTest static void test_LBWNextScheduledTouchpointTest() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t3esf788778t.4co4fasm';
		newAccount.Client_Type__c = 'Local';
		newAccount.Product_Type__c = 'LBW';
		//newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		newAccount.Sync_to_Marketo__c = true;
		newAccount.Next_Scheduled_Touchpoint__c = Date.today().addDays(40);
		insert newAccount;

		Test.startTest();
		Case newCase = new Case();
		newCase.AccountId = newAccount.Id;
		newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
		newCase.Reason = 'CS Touch Plan';
		newCase.Status = 'New';
		newCase.OwnerId = UserInfo.getUserId();
		insert newCase;
		Test.stopTest();
	}

	@isTest static void test_OrganicSetupCaseTaskID() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()*.01) + '@t3esf788778t.4co4fasm';
		newAccount.Client_Type__c = 'Local';
		newAccount.Product_Type__c = 'LBW';
		//newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		newAccount.Sync_to_Marketo__c = true;
		newAccount.Product_Plan_Id__c = 'LEADS_BY_WEB';
		newAccount.Client_Experience_Key__c = 'web.com-main';
		insert newAccount;

		Test.startTest();
		Case newCase = new Case();
		newCase.AccountId = newAccount.Id;
		newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId();
		insert newCase;
		Test.stopTest();
	}

	@isTest static void test_OptimizationAssignment() {
		Segment_Optimization_Case_Assignment__c segAssign = new Segment_Optimization_Case_Assignment__c();
		segAssign.Name = 'Dentist';
		segAssign.OwnerId = [select Id from User where IsActive = true and Profile.Name = 'System Administrator' and Id != :UserInfo.getUserId() limit 1].Id;
		insert segAssign;

		Account acct = new Account();
		acct.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
		acct.Name = 'Test Account';
		acct.Client_Type__c = 'Local';
		acct.Secondary_Segments__c = 'Dentist';
		insert acct;

		Case cs = new Case();
		cs.AccountId = acct.Id;
		cs.Reason2__c = 'Client Requested';
		cs.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Optimization').getRecordTypeId();
		insert cs;
	}

	/*@isTest static void testCaseResolution(){
		Case cscCase = new Case();
		cscCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
		cscCase.Reason = 'CSC';
		insert cscCase;

		cscCase.Resolution_Attempt_Status_1__c = 'Completed';
		update cscCase;

		cscCase.Attempt_2_Result__c = 'Completed';
		update cscCase;

		cscCase.Attempt_3_Result__c = 'Completed';
		update cscCase;

		cscCase.Attempt_4_Result__c = 'Completed';
		update cscCase;
	}*/

	/*
	@isTest static void testTPSectionAutoEvaluateCriteriaCase1(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = 'today';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Field_Trigger_Value__c = 'Unscheduled - Reattempt';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Unscheduled - Reattempt';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase2(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = 'today';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Unscheduled - Reattempt';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase3(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = 'CreatedDate';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Unscheduled - Reattempt';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase4(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = '';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Unscheduled - Reattempt';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase5(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = 'CreatedDate';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Field_Trigger_Value__c = 'Unscheduled - Reattempt';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Unscheduled - Reattempt';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase6(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = '';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Field_Trigger_Value__c = 'Unscheduled - Reattempt';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Unscheduled - Reattempt';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase7(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = '';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Field_Trigger_Old_Value__c = 'New';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Unscheduled - Reattempt';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase8(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = 'today';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Field_Trigger_Old_Value__c = 'New';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Unscheduled - Reattempt';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase9(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = 'CreatedDate';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Field_Trigger_Old_Value__c = 'New';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Unscheduled - Reattempt';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase10(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = 'CreatedDate';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Field_Trigger_Old_Value__c = 'New';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Complete';
		caseRecord.Client_Satisfaction__c = 'Red';
		update caseRecord;

		Test.stopTest();
	}

	@isTest static void testTPSectionAutoEvaluateCriteriaCase11(){
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		Touchplan_Section__c tps = (Touchplan_Section__c)touchplanRecordMap.get('Touchplan_Section__c:CSC');
		tps.Set_Next_Section_Evaluation_Date__c = 10;
		update tps;

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC.Name = 'Test Criteria';
		newTPAEC.Base_Date_Field__c = 'CreatedDate';
		newTPAEC.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC.Days_Added_to_Base_Date__c = 10;
		newTPAEC.Field_Trigger__c = 'Status';
		newTPAEC.Field_Trigger_Old_Value__c = 'In Progress';
		newTPAEC.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:CSC').Id;
		insert newTPAEC;

		TP_Section_Auto_Evaluate_Criteria__c newTPAEC2 = new TP_Section_Auto_Evaluate_Criteria__c();
		newTPAEC2.Name = 'Test Criteria';
		newTPAEC2.Base_Date_Field__c = 'CreatedDate';
		newTPAEC2.Auto_Evaluate_Date_Field__c = 'Auto_Close_Date__c';
		newTPAEC2.Days_Added_to_Base_Date__c = 10;
		newTPAEC2.Field_Trigger__c = 'Status';
		newTPAEC2.Field_Trigger_Old_Value__c = 'In Progress';
		newTPAEC2.Touchplan_Section__c = touchplanRecordMap.get('Touchplan_Section__c:Touchplan').Id;
		insert newTPAEC2;

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status from Case where Reason = 'CSC' and AccountId = :newAccount.Id limit 1];

		Test.startTest();

		CaseTouchplanTriggerHandler.alreadyTriggered = false;

		caseRecord.Status = 'Complete';
		update caseRecord;

		Test.stopTest();
	}
	*/
}