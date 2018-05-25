public with sharing class EngagementDataViewController {

	public Account acct {get; set;}

    private ApexPages.StandardController sContr;

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public EngagementDataViewController(ApexPages.StandardController stdController) {
        //acct = (Account)stdController.getRecord();
        sContr = stdController;
        retrieveAcctData();
    }

    private void retrieveAcctData(){
        acct = [select Id, Client_ID__c, Engagement_Has_Active_Offer__c, Engagement_Num_Contacts__c, Engagement_Num_Emails_Sent__c, Engagement_Num_Offers__c, Engagement_Date_Last_Review_Requested__c, Engagement_Has_Completed_Bulk_Import__c, Engagement_Num_Automated_Email_Activated__c, Engagement_Date_Last_Email_Sent__c, Engagement_Date_Last_Offer_Created__c, Engagement_Date_Last_Triggered_Email__c, Engagement_Num_Review_Request_Last_7_Day__c, Engagement_Data_Last_Update__c from Account where Id =: sContr.getId()];
    }

    public void updateEngagementData(){
        if(String.isNotBlank(acct.Client_ID__c)){
            YodleLiveSyncClientEngagementDataHelper.reqClientEngagementData(new List<Integer>{Integer.valueof(acct.Client_ID__c)});
            sContr.getRecord();
        }
        retrieveAcctData();
    }

}