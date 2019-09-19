@isTest
private class ybnTestTriggerEventRelationshipStats {

    static testMethod void test() {
    	
		Account a = ybnTestUtils.getAccount();
		
		Event e = new Event(Subject = 'Test', WhatId = a.Id);
		e.Actual_PPL__c = 1;
		e.Actual_ROI__c = 1;
		e.Actual_Lead_Volume_Per_Month__c = 2;
		e.Actual_New_Customers_Per_Month__c = 3;
		e.DurationInMinutes = 1;
		e.ActivityDateTime = System.today();
		insert e;
		
		//a = [
		//	SELECT Id, Actual_PPL__c, Actual_ROI__c, Actual_Lead_Volume_Per_Month__c, Actual_New_Customers_Per_Month__c 
		//	FROM Account WHERE Id = :a.Id];
		//System.assertEquals(1, a.Actual_PPL__c);
		//System.assertEquals(1, a.Actual_ROI__c);
		//System.assertEquals(2, a.Actual_Lead_Volume_Per_Month__c);
		//System.assertEquals(3, a.Actual_New_Customers_Per_Month__c);	

		e = new Event(Subject = 'Test', WhatId = a.Id);
		e.Actual_PPL__c = 2;
		e.Actual_Lead_Volume_Per_Month__c = 4;
		e.DurationInMinutes = 1;
		e.ActivityDateTime = System.today();
		insert e;
		
		//a = [
		//	SELECT Id, Actual_PPL__c, Actual_ROI__c, Actual_Lead_Volume_Per_Month__c, Actual_New_Customers_Per_Month__c 
		//	FROM Account WHERE Id = :a.Id];
		//System.assertEquals(2, a.Actual_PPL__c);
		//System.assertEquals(1, a.Actual_ROI__c);
		//System.assertEquals(4, a.Actual_Lead_Volume_Per_Month__c);
		//System.assertEquals(3, a.Actual_New_Customers_Per_Month__c);	
		
    }
}