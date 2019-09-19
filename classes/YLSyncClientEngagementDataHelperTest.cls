@isTest
private class YLSyncClientEngagementDataHelperTest {
	
	@isTest static void reqClientEngagementDataTest() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		String responseExample = '[{"Engagement_Has_Active_Offer__c":"false","Engagement_Num_Contacts__c":null,"Engagement_Num_Emails_Sent__c":null,"Engagement_Num_Offers__c":null,"Engagement_Date_Last_Review_Requested__c":null,"Engagement_Has_Completed_Bulk_Import__c":"false","Engagement_Num_Automated_Email_Activated__c":null,"Engagement_Date_Last_Email_Sent__c":null,"Engagement_Date_Last_Offer_Created__c":null,"Client_ID__c":"1000092","Engagement_Date_Last_Triggered_Email__c":null,"Engagement_Num_Review_Request_Last_7_Day__c":null},{"Engagement_Has_Active_Offer__c":"false","Engagement_Num_Contacts__c":null,"Engagement_Num_Emails_Sent__c":null,"Engagement_Num_Offers__c":null,"Engagement_Date_Last_Review_Requested__c":null,"Engagement_Has_Completed_Bulk_Import__c":"false","Engagement_Num_Automated_Email_Activated__c":null,"Engagement_Date_Last_Email_Sent__c":null,"Engagement_Date_Last_Offer_Created__c":null,"Client_ID__c":"1000549","Engagement_Date_Last_Triggered_Email__c":null,"Engagement_Num_Review_Request_Last_7_Day__c":null}]';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));
		Test.startTest();
			YodleLiveSyncClientEngagementDataHelper.reqClientEngagementData(new List<Integer>{121332});
		Test.stopTest();
	}
	
}

//YodleLiveSyncClientEngagementDataHelper.updateClientEngagementData('[{"Engagement_Has_Active_Offer__c":"true","Engagement_Num_Contacts__c":"5","Engagement_Num_Emails_Sent__c":"10","Engagement_Num_Offers__c":null,"Engagement_Date_Last_Review_Requested__c": "' + DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSSZ') + '","Engagement_Has_Completed_Bulk_Import__c":"false","Engagement_Num_Automated_Email_Activated__c":null,"Engagement_Date_Last_Email_Sent__c": ' + DateTime.now().format('yyyy-MM-dd\'T\'HH:mm:ss.SSSZ') + ',"Engagement_Date_Last_Offer_Created__c":null,"Client_ID__c":"test2","Engagement_Date_Last_Triggered_Email__c":null,"Engagement_Num_Review_Request_Last_7_Day__c":null},{"Engagement_Has_Active_Offer__c":"true","Engagement_Num_Contacts__c":"5","Engagement_Num_Emails_Sent__c":"10","Engagement_Num_Offers__c":null,"Engagement_Date_Last_Review_Requested__c":null,"Engagement_Has_Completed_Bulk_Import__c":"false","Engagement_Num_Automated_Email_Activated__c":null,"Engagement_Date_Last_Email_Sent__c":null,"Engagement_Date_Last_Offer_Created__c":null,"Client_ID__c":"test1","Engagement_Date_Last_Triggered_Email__c":null,"Engagement_Num_Review_Request_Last_7_Day__c":null}]');