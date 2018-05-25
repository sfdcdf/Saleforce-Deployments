public with sharing class TestCustomSettingInitializer {
	public TestCustomSettingInitializer() {
		Try{
			Integration_Settings__c integrationSetting = new Integration_Settings__c();
			integrationSetting.Salesforce_Incoming_Service_authToken__c = 'testada';
			integrationSetting.Sync_Account_Data_With_Marketo__c = true;
			integrationSetting.Sync_Organic_Case_Data_With_Marketo__c = true;
			integrationSetting.Sync_Case_Data_With_Marketo__c = true;
			insert integrationSetting;

			List<SF2YLFieldMapping__c> fieldMapList = new List<SF2YLFieldMapping__c>();

			SF2YLFieldMapping__c accountFieldMap = new SF2YLFieldMapping__c();
			accountFieldMap.Name = 'Account';
			accountFieldMap.Fields_to_Monitor_Changes__c = 'Google_Maps_URL__c';
			accountFieldMap.Fields_to_Return__c = 'Google_Maps_URL__c;Client_ID__c';
			fieldMapList.add(accountFieldMap);

			SF2YLFieldMapping__c leadFieldMap = new SF2YLFieldMapping__c();
			leadFieldMap.Name = 'Lead';
			leadFieldMap.Fields_to_Monitor_Changes__c = 'Company';
			leadFieldMap.Fields_to_Return__c = 'Company';
			fieldMapList.add(leadFieldMap);

			insert fieldMapList;


			List<SFDC_Account_to_Marketo_Field_Mappings__c> sfdcAcctToMktoFieldMappingList = new List<SFDC_Account_to_Marketo_Field_Mappings__c>();
			sfdcAcctToMktoFieldMappingList.add(new SFDC_Account_to_Marketo_Field_Mappings__c(Name='company', SFDC_Field_API_Name__c='Name', Sync_Field__c=true));
			sfdcAcctToMktoFieldMappingList.add(new SFDC_Account_to_Marketo_Field_Mappings__c(Name='Client_ID', SFDC_Field_API_Name__c='Client_ID__c', Sync_Field__c=true));
			sfdcAcctToMktoFieldMappingList.add(new SFDC_Account_to_Marketo_Field_Mappings__c(Name='Email', SFDC_Field_API_Name__c='Email__c', Sync_Field__c=true));
			sfdcAcctToMktoFieldMappingList.add(new SFDC_Account_to_Marketo_Field_Mappings__c(Name='id', SFDC_Field_API_Name__c='Marketo_ID__c', Sync_Field__c=true));
			insert sfdcAcctToMktoFieldMappingList;

			Integration_Settings__c testSetting = Integration_Settings__c.getOrgDefaults();
			testSetting.Marketo_Sync_Token__c = 'adfa3222';
			testSetting.Marketo_Token_Expiration__c = DateTime.now().addSeconds(50000);
			upsert testSetting;

			Outbound_Call_Case_Automation__c newOCCA = new Outbound_Call_Case_Automation__c();
			newOCCA.Name = 'Test Name';
			newOCCA.Case_Reason__c = 'CSC';
			newOCCA.Script_URL__c = 'www.yodle.com';
			insert newOCCA;
		}catch(Exception E){
			
		}
	}

	public static Map<String, SObject> createTouchPlanTemplates(){
		Map<String, SObject> touchplanRecordMap = new Map<String, SObject>();
		/*Touchplan__c newTouchplan = new Touchplan__c();
		newTouchplan.RecordTypeId = Schema.SObjectType.Touchplan__c.getRecordTypeInfosByName().get('Template').getRecordTypeId();
		newTouchplan.Active__c = true;
		newTouchplan.Name = 'Test Template';
		newTouchplan.Client_Type__c = 'Local';
		newTouchplan.Percent_Allocation__c = 100;
		newTouchplan.Budget_Ads_Minimum__c = 100;
		newTouchplan.Touchplan_Type__c = 'Control';
		newTouchplan.Monthly_Spend_Threshold__c = 1000;
		insert newTouchplan;


		Touchplan_Section__c newTPS = new Touchplan_Section__c();
		newTPS.Name = 'Test Section';
		newTPS.Touchplan__c = newTouchplan.Id;
		newTPS.Section_Order__c = 1;
		newTPS.Case_Record_Type_Name__c = 'Outbound Call';
		newTPS.Case_Reason__c = 'CSC';
		newTPS.Create_Case_Criteria__c = 'On Yodle Path Assignment';
		newTPS.Validate_If_Case_Already_Exist__c = true;
		insert newTPS;

		Touchplan_Section__c newTPS2 = new Touchplan_Section__c();
		newTPS2.Name = 'Test Section';
		newTPS2.Touchplan__c = newTouchplan.Id;
		newTPS2.Section_Order__c = 2;
		newTPS2.Case_Record_Type_Name__c = 'Outbound Call';
		newTPS2.Case_Reason__c = 'CS Touch Plan';
		newTPS2.Create_Case_Criteria__c = 'On Yodle Path Assignment';
		insert newTPS2;

		Touchplan_Section_Campaign_Automation__c newTPSCA = new Touchplan_Section_Campaign_Automation__c();
		newTPSCA.Name = 'Test Automation';
		newTPSCA.Touchplan_Section__c = newTPS2.Id;
		newTPSCA.Campaign_ID__c = '45';
		newTPSCA.Trigger_Automation_Event__c = 'On Case Complete';
		insert newTPSCA;

		touchplanRecordMap.put('Touchplan__c', newTouchplan);
		touchplanRecordMap.put('Touchplan_Section__c:CSC', newTPS);
		touchplanRecordMap.put('Touchplan_Section__c:Touchplan', newTPS2);
		touchplanRecordMap.put('Touchplan_Section_Campaign_Automation__c', newTPSCA);*/

		return touchplanRecordMap;
	}
}