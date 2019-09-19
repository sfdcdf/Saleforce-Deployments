@isTest
private class SegmentOptCaseAssignTriggerHandlerTest {
	
	@isTest static void test_beforeInsert() {
		Segment_Optimization_Case_Assignment__c segAssign = new Segment_Optimization_Case_Assignment__c();
		segAssign.Name = 'Dentist';
		segAssign.OwnerId = [select Id from User where IsActive = true and Profile.Name = 'System Administrator' and Id != :UserInfo.getUserId() limit 1].Id;
		insert segAssign;

		try{
			Segment_Optimization_Case_Assignment__c dupeAssign = new Segment_Optimization_Case_Assignment__c();
			dupeAssign.Name = 'Dentist';
			dupeAssign.OwnerId = [select Id from User where IsActive = true and Profile.Name = 'System Administrator' and Id != :UserInfo.getUserId() limit 1].Id;
			insert dupeAssign;
		}catch(Exception E){
			system.assert([select Id from Segment_Optimization_Case_Assignment__c where Name = 'Dentist'].size() == 1);
		}
	}
	
	@isTest static void test_afterInsert() {
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

		system.assert([select OwnerId from Case where Id =: cs.Id].OwnerId == segAssign.OwnerId);
	}

	@isTest static void test_afterUpdate() {
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

		Test.startTest();
		segAssign.Name = 'Dentist';
		segAssign.OwnerId = UserInfo.getUserId();
		update segAssign;
		Test.stopTest();

		system.assert([select OwnerId from Case where Id =: cs.Id].OwnerId == UserInfo.getUserId());
	}
	
}