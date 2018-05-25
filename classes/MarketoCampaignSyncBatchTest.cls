@isTest
private class MarketoCampaignSyncBatchTest {
	
	@isTest static void test_MarketoCampaignSyncBatch() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();

		Marketo_Campaign__c mCampaign = new Marketo_Campaign__c();
		mCampaign.Name = 'Test';
		mCampaign.Campaign_ID__c = '6052';
		insert mCampaign;

		String responseExample = [SELECT Id, Body FROM StaticResource WHERE Name = 'MarketoCampaignTestDataJSON' LIMIT 1].Body.toString();
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

		Test.startTest();
		Database.executeBatch(new MarketoCampaignSyncBatch());
		Test.stopTest();

		system.assert([select id, Name from Marketo_Campaign__c where id =: mCampaign.id].Name == 'Max Touchplans');
	}
	
}