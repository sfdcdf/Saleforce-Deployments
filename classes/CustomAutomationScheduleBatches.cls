public class CustomAutomationScheduleBatches implements Schedulable {

	public void execute(SchedulableContext sc) {
		// Subba Gadhamsetty, on 8/24/2017, Commented Daily_Scheduled_Record_Auto_Create__mdt as the corresponding Daily Schedule Job Inactivated Ref:https://webdc--dreamforce.cs54.my.salesforce.com/m0532000000Gmai , to avoid Test Execution Fail due to lack of Active Record from below SOQl
		//Daily_Scheduled_Record_Auto_Create__mdt lbwMonthlyPerformanceMetadataId = [select Id, DeveloperName, Additional_Default_Values__c, Additional_SOQL_Criteria__c, Default_Values__c, Lookup_Relationships__c, SOQL__c, Supported_Objects_for_Record_Auto_Create__c, Push_New_Record_Data_To_Marketo__c from Daily_Scheduled_Record_Auto_Create__mdt where Active__c = true and DeveloperName = 'Create_Monthly_LBW_Account_Performance' limit 1];
		Id marketoEmailCampaignTorchxTemplateId = [select Id from Marketo_Email_Campaign__c where RecordType.Name = 'Template' and Active__c = true and Custom_Automation_API_Reference__c != '' and Custom_Automation_API_Reference__c = 'TORCHX_MONTHLY_REVIEW_EVERY_30'][0].Id;  /// throwing an internal salesforce.com error so trying this way

		Database.executeBatch(new MarketoEmailCampaignBatch(Label.TORCHXMonthlyReviewAutomationBatchQuery, marketoEmailCampaignTorchxTemplateId), 100);
		//Database.executeBatch(new DailyScheduledRecordAutoCreateBatch(lbwMonthlyPerformanceMetadataId, Label.LBWMonthlyPerformanceAutomationBatchQuery));
	}

}