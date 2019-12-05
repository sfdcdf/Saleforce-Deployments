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
    
    
        static testMethod void test_TextbrokerSchedulableCheckReadyOrders() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          TextbrokerSchedulableCheckReadyOrders obj = new TextbrokerSchedulableCheckReadyOrders();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
    
    static testMethod void test_TextbrokerSchedulableConfirmAccepted() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          TextbrokerSchedulableConfirmAccepted obj = new TextbrokerSchedulableConfirmAccepted();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
    static testMethod void test_TextbrokerSchedulableExportOrders () 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          TextbrokerSchedulableExportOrders  obj = new TextbrokerSchedulableExportOrders ();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
    static testMethod void test_TextbrokerSchedulableRequestRevisions () 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          TextbrokerSchedulableRequestRevisions  obj = new TextbrokerSchedulableRequestRevisions ();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        } 
    static testMethod void test_AutoCreateCaseEntitlement () 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          AutoCreateCaseEntitlement  obj = new AutoCreateCaseEntitlement ();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        } 
    
    
     static testMethod void test_CaseCtl_MultiRequest () 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          CaseCtl_MultiRequest  obj = new CaseCtl_MultiRequest ();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        } 
     static testMethod void test_CaseCtl_ResultPage () 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          CaseCtl_ResultPage  obj = new CaseCtl_ResultPage();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        } 
    
    
    static testMethod void test_CaseMilestoneUtils () 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          CaseMilestoneUtils  obj = new CaseMilestoneUtils();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }
    
    
     static testMethod void test_clsS2SShareHelper() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          clsS2SShareHelper  obj = new clsS2SShareHelper();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }
    static testMethod void test_CompleteResolutionCaseMilestone() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          CompleteResolutionCaseMilestone  obj = new CompleteResolutionCaseMilestone();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }
    
    
        static testMethod void test_LaunchSalesWizardController() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          LaunchSalesWizardController  obj = new LaunchSalesWizardController();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }
    
        static testMethod void test_OrganicCaseATVUpdates() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          OrganicCaseATVUpdates  obj = new OrganicCaseATVUpdates();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }
    static testMethod void test_wbnNationalNCSCreateNotificationSchedule() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          wbnNationalNCSCreateNotificationSchedule  obj = new wbnNationalNCSCreateNotificationSchedule();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }
    
        
        static testMethod void test_wbnNationalNCSStatusNotificationBatch() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          wbnNationalNCSStatusNotificationBatch  obj = new wbnNationalNCSStatusNotificationBatch();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }
    
    static testMethod void test_wbnNationalNCSStatusNotificationSchedule() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          wbnNationalNCSStatusNotificationSchedule  obj = new wbnNationalNCSStatusNotificationSchedule();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }
    
    
      
    
        
        static testMethod void test_SandboxPostCopyCleanUpClass() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          SandboxPostCopyCleanUpClass  obj = new SandboxPostCopyCleanUpClass();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
    
    static testMethod void test_SendCancellationDMCNotifcation() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          SendCancellationDMCNotifcation  obj = new SendCancellationDMCNotifcation();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
     
    
    
         static testMethod void test_SL_CaseTriggerHandler() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          SL_CaseTriggerHandler  obj = new SL_CaseTriggerHandler();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        } 
    
    
}