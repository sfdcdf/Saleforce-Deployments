@isTest
private class ybnTestTriggerActivityRelationshipStats {

    static testMethod void test() {
    	
    	Id TaskRelationshipRecordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipTaskRecordTypeId();
		
		Account a = new Account(Name = 'A');
		insert a;
		
		Task t = new Task(Subject = 'Test', WhatId = a.Id,
			Milestone__c = 'Internal Meeting',
			Description = 'test');
		t.RecordTypeId = TaskRelationshipRecordTypeId;
		t.Actual_PPL__c = 1;
		t.Actual_ROI__c = 1;
		t.Actual_Lead_Volume_Per_Month__c = 2;
		t.Actual_New_Customers_Per_Month__c = 3;
		insert t;
		
		//a = [
		//	SELECT Id, Actual_PPL__c, Actual_ROI__c, Actual_Lead_Volume_Per_Month__c, Actual_New_Customers_Per_Month__c 
		//	FROM Account WHERE Id = :a.Id];
		//System.assertEquals(1, a.Actual_PPL__c);
		//System.assertEquals(1, a.Actual_ROI__c);
		//System.assertEquals(2, a.Actual_Lead_Volume_Per_Month__c);
		//System.assertEquals(3, a.Actual_New_Customers_Per_Month__c);	

		t = new Task(Subject = 'Test', WhatId = a.Id,
			Milestone__c = 'Internal Meeting',
			Description = 'test');
		t.RecordTypeId = TaskRelationshipRecordTypeId;
		t.Actual_PPL__c = 2;
		t.Actual_Lead_Volume_Per_Month__c = 4;
		insert t;
		
		a = [
			SELECT Id, Actual_PPL__c, Actual_ROI__c, Actual_Lead_Volume_Per_Month__c, Actual_New_Customers_Per_Month__c 
			FROM Account WHERE Id = :a.Id];
		//System.assertEquals(2, a.Actual_PPL__c);
		//System.assertEquals(1, a.Actual_ROI__c);
		//System.assertEquals(4, a.Actual_Lead_Volume_Per_Month__c);
		//System.assertEquals(3, a.Actual_New_Customers_Per_Month__c);	
		
    }
    
    static testMethod void testLastDates() {
    	
    	Id TaskRelationshipRecordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipTaskRecordTypeId();
		List<Task> tasks = new List<Task>();
		
		Account a = new Account(Name = 'A');
		insert a;
		
		Task t = new Task(Subject = 'Test', WhatId = a.Id, Status = 'Completed', Description = 'test');
		t.Milestone__c = 'LM7 - Performance Review';
		tasks.add(t);
		
		t = new Task(Subject = 'Test', WhatId = a.Id, Status = 'Completed', Description = 'test');
		t.Milestone__c = 'LM8 - In Person Review Meeting';
		tasks.add(t);
		
		t = new Task(Subject = 'Test', WhatId = a.Id, Status = 'Completed', Description = 'test');
		t.Milestone__c = 'LM4 - Customer Status Call';
		tasks.add(t);
		
		t = new Task(Subject = 'Test', WhatId = a.Id, Status = 'Completed',	Description = 'test');
		t.Milestone__c = 'LM3 - Roundtable/CS account meeting';
		tasks.add(t);
		
		t = new Task(Subject = 'Test', WhatId = a.Id, Status = 'Completed', Description = 'test');
		t.Milestone__c = 'LM2 - Sales Account Meeting';
		tasks.add(t);
		
		t = new Task(Subject = 'Test', WhatId = a.Id, Status = 'Completed', Description = 'test');
		t.Milestone__c = 'LM6 - Internal Stakeholder Meeting';
		tasks.add(t);
		
		t = new Task(Subject = 'Test', WhatId = a.Id, Status = 'Completed', Description = 'test');
		t.Milestone__c = 'LM1 - ';
		tasks.add(t);
		
		insert tasks;
		
		//a = [
		//	SELECT Id, Date_of_Last_Customer_Performance_Review__c, Date_of_Last_Customer_Status_Call__c,
		//	Date_of_Last_Internal_Roundtable_Meeting__c, Date_of_Last_Internal_Sales_Meeting__c,
		//	Date_of_Last_Sales_AD_Meeting__c, Date_of_Last_Stakeholder_Meeting__c 
		//	FROM Account WHERE Id = :a.Id];
			
		//System.assertEquals(system.today(), a.Date_of_Last_Customer_Performance_Review__c);
		//System.assertEquals(system.today(), a.Date_of_Last_Customer_Status_Call__c);
		//System.assertEquals(system.today(), a.Date_of_Last_Internal_Roundtable_Meeting__c);
		//System.assertEquals(system.today(), a.Date_of_Last_Internal_Sales_Meeting__c);
		//System.assertEquals(system.today(), a.Date_of_Last_Sales_AD_Meeting__c);	
		//System.assertEquals(system.today(), a.Date_of_Last_Stakeholder_Meeting__c);
    }
}