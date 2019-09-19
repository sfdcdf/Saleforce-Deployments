@isTest
private class IMSRepAssignmentTest 
{

    private static testMethod void assignmentTest()
    {
        List<Id> caseIds = new List<Id>();
        List<Case> updateCaseList = new List<Case>();
        List<Lighthouse_Worksheets__c> updateWkshtList = new List<Lighthouse_Worksheets__c>();
        Date todayDt = Date.Today();
        Date liveDate = todayDt.addDays(-10);
        Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LH Master').getRecordTypeId();
        Id wkshtRecordTypeId = Schema.SObjectType.Lighthouse_Worksheets__c.getRecordTypeInfosByName().get('CSC Worksheet - Dental').getRecordTypeId();
        Id acctCSCRep = [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'System Administrator' LIMIT 1].Id;
        
        Account acct = new Account();
        acct.Name = 'Test Class Account 1';
        //acct.Product_Type__c = 'LBW';
        acct.Secondary_Segments__c = 'Dentist';
        acct.Status__c = 'LIVE';
        acct.Email__c = 'fake@faketest.com';
        acct.Initial_Live_Date__c = liveDate;
        acct.Live_Date__c = liveDate;                                       
        insert acct;                       
        
        Id acctId = acct.Id;
        
        Case caseData = new Case();
        caseData.RecordTypeId = caseRecordTypeId;
        caseData.AccountId = acct.Id;
        caseData.Status = 'New';
        caseData.IMS_Rep__c = null;
        caseData.Subject = 'Test Case';
        insert caseData;
        
        Id caseId = caseData.Id;
        
        caseIds.add(caseId);
        
        Lighthouse_Worksheets__c lhWksht = new Lighthouse_Worksheets__c();
        lhWksht.MA_Date__c = todayDt.addDays(-1);
        lhWksht.Practice_Name__c = acctId;
        lhwksht.RecordTypeId = wkshtRecordTypeId;
        lhwksht.Type_Of_Office__c = 'General';
        lhwksht.PMS__c = 'Ace';
        lhwksht.Remote_GUI_Items_to_Check__c = 'Update Sync Version; Verify Sync Hours; Eaglesoft Honor/Ignore; Verify PreMed Flags; Cell Phone Finder Set; Verify Recalls (if applicable); Verify Auto Confirm Values; Verify Spanish PreMed (Dentrix); Verify Cancellation Values';
        lhwksht.CSC_Rep__c = acctCSCRep;
        lhwksht.QA_Rep__c = acctCSCRep;
        lhwksht.QA_Date__c = todayDt.addDays(-10);
        lhwksht.Portal_Verifications__c = 'Verify Appt Book Height; Verify Appt Book Hours; Verify Birthday Options; Verify Recalls Schedule; Verify Message Schedule; Cancel Link in Reactivation; Verify Custom Templates (if applicable)';
        lhwksht.Initial_Event_Execution__c = 'Run IEE (WATCH FOR STALE)';
        lhwksht.Config_Prep__c = 'Verify Newsletter Date; Portal Addresses Present; Verify STC Days; Verify Pre-Processors Present; Update feedback CTA Fragment';
        lhwksht.Billing__c = 'Verify Billing Install (Yodle Live); Verify Billing Invoiced (Yodle Live); Verify NEXT Billing Info (Sugar)';
        lhwksht.Final_Transports__c = 'IEE Finished; E-Mail; Text; PC Amazing Mail; Letters (always turn on); OBC';
        lhwksht.What_Appt_Reminders_were_Activated__c = 'Emails';
        lhwksht.What_Treatment_Plans_were_Activated__c = 'Emails';
        lhwksht.What_Recall_Follow_Up_were_Activated__c = 'Emails';
        lhwksht.What_Birthday_Greetings_were_Activated__c = 'Emails';
        lhwksht.Activated_Reactivation_Letters__c = 'No';
        lhwksht.Activated_Newsletters__c = 'No';
        lhwksht.Communication_Notes__c = 'Test';
        lhwksht.CW_Quality__c = 'Satisfactory: No Issues';
        lhwksht.CW_Quality_Notes__c = 'Test';
        lhwksht.Config_Difficulty__c = 'Basic';
        lhwksht.MA_Email_Sent__c = true;
        lhwksht.Admin_Portal_Verifications__c = 'Verify RAB NAP Info; Verify Survey MGR Settings; Verify Task MGR Settings';
        lhwksht.Status__c = 'Messages Activated';
        
        insert lhWksht;
        
        // start test
        Test.startTest();
        
        
        // execute Invocable method
        IMSRepAssignment.assignIMSRepFromCSCRep(caseIds);
        
        // assert what is expected from test data
        for(Case cs : [SELECT Id FROM Case WHERE Id in: caseIds]){
            System.assertEquals(cs.Id, caseId);
        }
        
        Test.stopTest();
    }

}