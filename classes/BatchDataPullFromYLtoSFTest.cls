@isTest
private class BatchDataPullFromYLtoSFTest {
	
	@isTest static void test_BatchDataPullFromYLtoSF() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
        String responseExample = '[{"Engagement_Has_Active_Offer__c":"false","Engagement_Num_Contacts__c":null,"Engagement_Num_Emails_Sent__c":null,"Engagement_Num_Offers__c":null,"Engagement_Date_Last_Review_Requested__c":null,"Engagement_Has_Completed_Bulk_Import__c":"false","Engagement_Num_Automated_Email_Activated__c":null,"Engagement_Date_Last_Email_Sent__c":null,"Engagement_Date_Last_Offer_Created__c":null,"Client_ID__c":"1000092","Engagement_Date_Last_Triggered_Email__c":null,"Engagement_Num_Review_Request_Last_7_Day__c":null},{"Engagement_Has_Active_Offer__c":"false","Engagement_Num_Contacts__c":null,"Engagement_Num_Emails_Sent__c":null,"Engagement_Num_Offers__c":null,"Engagement_Date_Last_Review_Requested__c":null,"Engagement_Has_Completed_Bulk_Import__c":"false","Engagement_Num_Automated_Email_Activated__c":null,"Engagement_Date_Last_Email_Sent__c":null,"Engagement_Date_Last_Offer_Created__c":null,"Client_ID__c":"1000549","Engagement_Date_Last_Triggered_Email__c":null,"Engagement_Num_Review_Request_Last_7_Day__c":null}]';
        Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));
        
        Scheduled_Data_Pull_from_YL_to_SF__c newDataPull = new Scheduled_Data_Pull_from_YL_to_SF__c();
        newDataPull.Name = 'Engagement Data';
        newDataPull.Active__c = true;
        newDataPull.Class_to_Invoke__c = 'YodleLiveSyncClientEngagementDataHelper';
        newDataPull.SOQL_Criteria__c = 'select Id, Client_ID__c from Account where Product_Type_Transactional__c = \'Essentials\' and Status__c= \'LIVE\' and Days_Since_Live__c in (7, 14, 21, 38) and Client_ID__c != \'\'';
        newDataPull.Batch_Size__c = 50;
        insert newDataPull;

        Account testAccount = new Account();
        testAccount.Name = 'Test Name';
        testAccount.Client_ID__c = '322322';
        testAccount.Status__c = 'LIVE';
        testAccount.Live_Date__c = Date.today().addDays(-7);
        testAccount.Product_Type__c = 'ORGANIC, ESSENTIALS';
        insert testAccount;

        Test.startTest();
        ScheduleDataPullFromYLtoSF newSchedule = new ScheduleDataPullFromYLtoSF();
        newSchedule.execute(null);
        Test.stopTest();
	}
	
}