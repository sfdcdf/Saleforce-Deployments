@isTest
public with sharing class test_TextbrokerObjectCreator {

	static Account account;
	static Profile imsProfile;
	static User imsRep;
	static Profile textbrokerProfile;
	static User textbrokerUser;
	static RecordType organicSetupRecordType;

	public static Account getAccount() {
		if(account == null) {
			account = new Account(Name = 'Test Account', BillingCountry = 'United States');
			insert account;
		}
		return account;
	}

	public static User getImsUser() {
		imsProfile = [select id from profile where name='National IMS'];
		imsRep = [select id from user where profileId = :imsProfile.Id and isActive = true limit 1];
		if(imsRep == null) {
        	imsRep = new User(alias = 'Test', email='fake@gmail.com',
            	emailencodingkey='UTF-8', lastname='Testerson', languagelocalekey='en_US',
            	localesidkey='en_US', profileId = imsProfile.Id, country='United States',
            	timezonesidkey='America/Los_Angeles', username='fake@gmail.com');
			insert imsRep;
		}
		return imsRep;
	}

	@isTest(SeeAllData=true)
	public static User getTextbrokerUser() {
		textbrokerUser = [select id from user where profile.Name = 'Third Party Vendor' and Name = 'Textbroker Users' and isActive = true];
		if(textbrokerUser == null) {
			textbrokerUser = new User(alias = 'Textbroker', email='fake2@textbroker.com',
	            emailencodingkey='UTF-8', lastname='Textbroker', languagelocalekey='en_US',
	            localesidkey='en_US', profileId = textbrokerProfile.Id, country='United States',
	            timezonesidkey='America/Los_Angeles', username='fake2@textbroker.com');
			insert textbrokerUser;
		}
		return textbrokerUser;
	}

	@isTest(SeeAllData=true)
	public static RecordType getOrganicSetupRecordType() {
		if(organicSetupRecordType == null)
			organicSetupRecordType = [select Id from RecordType where sObjectType = 'Case' and name = 'Organic Setup' limit 1];
		return organicSetupRecordType;
	}

	public static Case getImsCase() {
		account = getAccount();
		imsRep = getImsUser();
		RecordType recordType = getOrganicSetupRecordType();
		Case testCase = new Case(RecordTypeId = recordType.Id,  Client_ID__c = 'Test', AccountId = account.Id,
							IMS_Rep__c = imsRep.Id, Status = 'New', OwnerId = imsRep.Id,
                            CopyStatus__c = 'New Order');
		insert testCase;
		return testCase;
	}

	public static List<Case> getTextbrokerCases(Integer num) {
		if(account == null) {
			account = getAccount();
		}
		if(textbrokerUser == null) {
			textbrokerUser = getTextbrokerUser();
		}
		if(imsRep == null) {
			imsRep = getImsUser(); //Do we need this?
		}
		RecordType recordType = getOrganicSetupRecordType();
		List<Case> cases = new List<Case>();
		for(Integer i = 0; i < num; i++) {
			cases.add(new Case(RecordTypeId = recordType.Id,  Client_ID__c = 'Test',
							AccountId = account.Id, Account = account, taskId__c = 'tk0001',
							IMS_Rep__c = imsRep.Id, Status = 'New', OwnerId = textbrokerUser.Id,
                            CopyStatus__c = 'New Order'));
		}
		insert cases;
		Map<Id, Case> casesMap = new Map<Id, Case>(cases);
		cases = [select Client_ID__c, Account.Name, CaseNumber, taskId__c,
			KeyWord_1_Service_Name__c, KeyWord_2_Service_Name__c, KeyWord_3_Service_Name__c,
			KeyWord_1_Unique_Proposition__c, KeyWord_2_Unique_Proposition__c, KeyWord_3_Unique_Proposition__c,
			Name_of_Business__c, Segment__c, Business_Address__c,
			Domain_Name_to_be_used_for_YO__c, Description_of_the_Business__c,
			Hours_of_Operation__c, Services_Offered__c, Geographic_Areas_To_Service__c,
			Unique_Selling_Points__c, Payment_Methods_Accepted__c, Country__c, Number_of_Pages__c,
            CopyStatus__c, CopyStatusError__c, Homepage__c
			from Case where Id in :casesMap.keySet()];
		return cases;
	}

	public static List<Case> getImsCases(Integer num) {
		if(account == null) {
			account = getAccount();
		}
		if(textbrokerUser == null) {
			textbrokerUser = getTextbrokerUser();
		}
		if(imsRep == null) {
			imsRep = getImsUser();
		}
		RecordType recordType = getOrganicSetupRecordType();
		List<Case> cases = new List<Case>();
		for(Integer i = 0; i < num; i++) {
			cases.add(new Case(RecordTypeId = recordType.Id,  Client_ID__c = 'Test', AccountId = account.Id,
							IMS_Rep__c = imsRep.Id, Status = 'New', OwnerId = imsRep.Id, taskId__c = '001',
                            CopyStatus__c = 'New Order'));
		}
		insert cases;
		return cases;
	}

	/* abrosius@soliantconsulting.com 2013Jul17
	 * constructs a Textbroker_Trigger_Switch__c custom setting record
	*/
	public static Textbroker_Trigger_Switch__c getTriggerSwitch() {
		Textbroker_Trigger_Switch__c ts = new Textbroker_Trigger_Switch__c();
		ts.Name = 'Trigger Switch';
		ts.Enable_Trigger__c = true;
		insert ts;
		return ts;
	}
}