@isTest
private class TaskTriggerTest {
	
	/*@isTest static void test_LiveOpsCallLogging() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

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
		Task tk = new Task();
		tk.WhatId = caseRecord.Id;
		tk.CallDurationInSeconds = 50;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;

		update tk;
		Test.stopTest();
	}

	@isTest static void test_LiveOpsCallLoggingAttempt2() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status, X1st_Attempt_By__c from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];
		caseRecord.X1st_Attempt_By__c = 'Testing Test';
		update caseRecord;

		Test.startTest();
		Task tk = new Task();
		tk.WhatId = caseRecord.Id;
		tk.CallDurationInSeconds = 50;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;

		update tk;
		Test.stopTest();
	}

	@isTest static void test_LiveOpsCallLoggingAttempt3() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status, X1st_Attempt_By__c from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];
		caseRecord.X1st_Attempt_By__c = 'Testing Test';
		caseRecord.X2nd_Attempt_By__c = 'Testing Test';
		update caseRecord;

		Test.startTest();
		Task tk = new Task();
		tk.WhatId = caseRecord.Id;
		tk.CallDurationInSeconds = 50;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;

		update tk;
		Test.stopTest();
	}

	@isTest static void test_LiveOpsCallLoggingAttempt4() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status, X1st_Attempt_By__c from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];
		caseRecord.X1st_Attempt_By__c = 'Testing Test';
		caseRecord.X2nd_Attempt_By__c = 'Testing Test';
		caseRecord.X3rd_Attempt_By__c = 'Testing Test';
		update caseRecord;

		Test.startTest();
		Task tk = new Task();
		tk.WhatId = caseRecord.Id;
		tk.CallDurationInSeconds = 50;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;

		update tk;
		Test.stopTest();
	}

	@isTest static void test_LiveOpsCallLoggingUpdate() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

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
		Task tk = new Task();
		tk.WhatId = caseRecord.Id;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;

		tk.CallDurationInSeconds = 50;
		update tk;
		Test.stopTest();
	}

	@isTest static void test_LiveOpsCallLoggingAttempt2Update() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status, X1st_Attempt_By__c from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];
		caseRecord.X1st_Attempt_By__c = 'Testing Test';
		update caseRecord;

		Test.startTest();
		Task tk = new Task();
		tk.WhatId = caseRecord.Id;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;

		tk.CallDurationInSeconds = 50;
		update tk;
		Test.stopTest();
	}

	@isTest static void test_LiveOpsCallLoggingAttempt3Update() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status, X1st_Attempt_By__c from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];
		caseRecord.X1st_Attempt_By__c = 'Testing Test';
		caseRecord.X2nd_Attempt_By__c = 'Testing Test';
		update caseRecord;

		Test.startTest();
		Task tk = new Task();
		tk.WhatId = caseRecord.Id;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;

		tk.CallDurationInSeconds = 50;
		update tk;
		Test.stopTest();
	}

	@isTest static void test_LiveOpsCallLoggingAttempt4Update() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		Map<String, SObject> touchplanRecordMap = TestCustomSettingInitializer.createTouchPlanTemplates();

		String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Account newAccount = new Account();
		newAccount.Name = 'Test Account';
		newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
		newAccount.Status__c = 'LIVE';
		//newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@test.com';
		newAccount.Client_Type__c = 'Local';
		newAccount.Budget_Ads__c = 700;
		newAccount.Live_Date__c = Date.today();
		insert newAccount;

		Case caseRecord = [select Id, Status, X1st_Attempt_By__c from Case where Reason = 'CS Touch Plan' and AccountId = :newAccount.Id limit 1];
		caseRecord.X1st_Attempt_By__c = 'Testing Test';
		caseRecord.X2nd_Attempt_By__c = 'Testing Test';
		caseRecord.X3rd_Attempt_By__c = 'Testing Test';
		update caseRecord;

		Test.startTest();
		Task tk = new Task();
		tk.WhatId = caseRecord.Id;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;

		tk.CallDurationInSeconds = 50;
		update tk;
		Test.stopTest();
	}*/

	@isTest static void test_SLACall(){
		Account newAccount = new Account();
		newAccount.Name = 'Tset Account';
		insert newAccount;

		Cancellation_Request__c newCancellationRequest = new Cancellation_Request__c();
		newCancellationRequest.Account_Name__c = newAccount.Id;
		insert newCancellationRequest;

		Task tk = new Task();
		tk.WhatId = newCancellationRequest.Id;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.CallType = 'Outbound';
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;
	}

	@isTest static void test_SLAEmail(){
		Account newAccount = new Account();
		newAccount.Name = 'Tset Account';
		insert newAccount;

		Cancellation_Request__c newCancellationRequest = new Cancellation_Request__c();
		newCancellationRequest.Account_Name__c = newAccount.Id;
		insert newCancellationRequest;

		Task tk = new Task();
		tk.WhatId = newCancellationRequest.Id;
		tk.Send_Email_Alert_to_SD_AD__c = false;
		tk.TaskSubtype = 'Email';
		tk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Interaction').getRecordTypeId();
		insert tk;
	}
	
}