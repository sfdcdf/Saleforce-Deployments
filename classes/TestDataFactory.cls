@isTest
public class TestDataFactory {
	
	public static Cancellation_Request__c setOutcomeToSavedWithNoConcessions(Cancellation_Request__c cancelRequest){
		cancelRequest.Outcome__c = 'Saved with No Concessions';
		cancelRequest.Web_Only2__c = 'Did Not Offer';
		cancelRequest.Refund2__c = 'Did Not Offer';
		cancelRequest.Account_in_Save_Mode__c = 'Web Only';
		cancelRequest.Additional_Notes__c = 'TestNotes';
		cancelRequest.After_Call_Work_Complete__c = 'Yes';
		cancelRequest.Agent_Confirmation__c = 'sadf';
		cancelRequest.Send_Confirmation_to_Client__c = 'Yes';
		cancelRequest.Attempts_to_Contact__c = '1';
		cancelRequest.Cancel_Code__c = 'Customer Service Issue';
		cancelRequest.First_Cancel_Code_Details__c = 'St. Lucia concerns';
		cancelRequest.First_Cancel_Code_Notes__c = 'Tadsf dsfa';
		cancelRequest.Got_client_into_dashboard__c = 'Yes reviewed dashboard';
		cancelRequest.Escalation_Potential__c = 'Yes';
		cancelRequest.Current_Monthly_Revenue__c = 234232;
		cancelRequest.Initial_Product__c = 'Leads By Web';
		cancelRequest.Future_Product__c = 'Leads By Web';
		cancelRequest.Retention_Consultant__c = UserInfo.getUserId();
		cancelRequest.Verify_Product_Changes_Status_in_YL__c = 'Yes';
		cancelRequest.Hit_Lead_Range__c = 'Yes';
		cancelRequest.Last_TP_Completed__c = 'Churned in first month';

		return cancelRequest;
	}
	
}