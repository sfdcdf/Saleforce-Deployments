@isTest
public class OppHLPanelControllerTest {
    
    public static testMethod void loadOppHLPanelTest() {
    
        // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> oppList = Test.LoadData(Opportunity.sObjectType, 'testOpportunities');
        Id userId = [SELECT Id FROM User WHERE IsActive = true LIMIT 1].Id;
        Date nextBillDt = Date.Today().addDays(30);
        Date tpLastCompleted = Date.Today().addDays(-10);
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        acct.Client_First_Name__c = 'John';
        acct.Client_Last_Name__c = 'Doe';
        acct.Email__c = 'johnd@testcompany.com';
        acct.Phone = '5552134567';
        acct.Status__c = 'LIVE';
        acct.IMS_Rep__c = userId;
        acct.Product_Type__c = 'TORCHX';
        acct.Next_Billing_Date__c = nextBillDt;
        acct.Client_ID__c = '909999';
        acct.Website = 'www.testcompany.com';
        acct.Test_Management__c = 'Testing...';
        acct.Individual_Location_Service_Level__c = 'Service Level B';
        acct.Primary_Multi_Location_Owner_For_TP__c = false;
        acct.Multi_Location_Owner_Primary_CID__c = '99887766';
        acct.Last_Completed_YBN_TP__c = tpLastCompleted;
        acct.wrenBilling__c = false;
        acct.BillingCountry = 'USA';
        acct.Franchise_Influencer__c = 'No';
        acct.Important_Account_Notes__c = 'Test Notes...';
        update acct;
        
        Opportunity opp = (Opportunity)oppList[0];
        Id oppId = opp.Id;
        opp.AccountId = acctId;
        update opp;
        
        ApexPages.currentPage().getParameters().put('id', String.valueOf(oppId));
    
        OppHLPanelController controller = new OppHLPanelController();
        controller.onPageLoad();
    }
}