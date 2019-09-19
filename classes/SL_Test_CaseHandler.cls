/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class SL_Test_CaseHandler {

   // test method for trigger on Case
    static testMethod void CaseTrigger() {
        SL_CaseHandler obj = new SL_CaseHandler();
        List<Account> LstAccnt  = new List<Account>{new Account(Name = 'TestAccount1'), new Account(Name = 'TestAccount2')};
        insert LstAccnt;
        
        Test.startTest();
        List<Case> lstParCases = new List<Case>();
        Case objCase = new Case(AccountId = LstAccnt[0].Id,Status='In Progress',Reason = 'Quality Team');
        lstParCases.add(objCase);
        
        Case objCase2 = new Case(AccountId = LstAccnt[1].Id,Status='In Progress',Reason = 'Quality Team');
        lstParCases.add(objCase2);
        insert lstParCases;
        
        List<Case> lstCase = new List<Case>{ new Case(AccountId = LstAccnt[0].Id,ParentId= objCase.Id, Status='Closed',Reason = 'Quality Team'),
                                             new Case(AccountId = LstAccnt[0].Id,ParentId= objCase.Id, Status='Closed',Reason = 'Quality Team'),
                                             new Case(AccountId = LstAccnt[0].Id,ParentId= objCase2.Id,Status='Closed',Reason = 'Quality Team'),
                                             new Case(AccountId = LstAccnt[0].Id,ParentId= objCase2.Id,Status='In Progress',Reason = 'Quality Team')};
        insert lstCase;
        //system.assertEquals([Select Id, Status FROM Case Where Id=: objCase.Id ].Status,'All Work Completed – Contact Client');
        Test.StopTest();
        // For Coverage 
        delete lstCase;
        undelete lstCase;
    
    }
    // Test method for trigger on Organic_Analysis__c Trigger
     static testMethod void OrganicCase()
     {
        List<Account> LstAccnt  = new List<Account>{new Account(Name = 'TestAccount1'), new Account(Name = 'TestAccount2')};
                                                                            
        insert LstAccnt;
        
        Test.startTest();
        List<Case> lstCase = new List<Case>{ new Case(AccountId = LstAccnt[0].Id,Status='Closed',Reason = 'Quality Team'),
                                             new Case(AccountId = LstAccnt[0].Id,Status='In Progress',Reason = 'Quality Team')};
        insert lstCase;
        
        List<Organic_Analysis__c>lstOrganicCase = new List<Organic_Analysis__c>{new Organic_Analysis__c (Account_Name__c =LstAccnt[0].Id,Channel_Type__c='Local', Reason_for_Submission__c = 'Client Request Tasks', Status__c = 'InProgress',Case_URL__c = lstCase[0].Id),
                                                                                new Organic_Analysis__c (Account_Name__c =LstAccnt[0].Id,Channel_Type__c='Local', Reason_for_Submission__c = 'Client Request Tasks', Status__c = 'InProgress',Case_URL__c = lstCase[1].Id),
                                                                                new Organic_Analysis__c (Account_Name__c =LstAccnt[0].Id,Channel_Type__c='Local', Reason_for_Submission__c = 'Client Request Tasks', Status__c = 'Closed',Case_URL__c = lstCase[1].Id)};
        insert  lstOrganicCase;                                                             
        Test.StopTest();
        //system.assertEquals([Select Id, Status FROM Case Where Id=: lstCase[1].Id ].Status,'All Work Completed – Contact Client');
        //For Coverage
        delete lstOrganicCase;
        undelete lstOrganicCase;
     }
     // Test method for trigger on Lighthouse_Worksheets__c
     static testMethod void LightHouse()
     {
        List<Account> LstAccnt  = new List<Account>{new Account(Name = 'TestAccount1'), new Account(Name = 'TestAccount2')};
                                                                            
        insert LstAccnt;
        
        Test.startTest();
        List<Case> lstCase = new List<Case>{ new Case(AccountId = LstAccnt[0].Id,Status='Closed',Reason = 'Quality Team'),
                                             new Case(AccountId = LstAccnt[0].Id,Status='In Progress',Reason = 'Quality Team')};
        insert lstCase;
        
        RecordType lhRT = [SELECT Id FROM RecordType WHERE DeveloperName = 'AR_Request_Form' LIMIT 1];
        List<Lighthouse_Worksheets__c>lstLightHouse = new List<Lighthouse_Worksheets__c>{new Lighthouse_Worksheets__c(Practice_Name__c =LstAccnt[0].Id,PMS__c = 'BRS',Status__c = 'RFC',Case__c = lstCase[0].Id, RecordTypeId = lhRT.Id ),
                                                                                         new Lighthouse_Worksheets__c(Practice_Name__c =LstAccnt[0].Id,PMS__c = 'BRS',Status__c = 'RFC',Case__c = lstCase[1].Id, RecordTypeId = lhRT.Id),
                                                                                         new Lighthouse_Worksheets__c(Practice_Name__c =LstAccnt[0].Id,PMS__c = 'BRS',Status__c = 'Complete',Case__c = lstCase[1].Id, RecordTypeId = lhRT.Id)};
        insert lstLightHouse;
        Test.StopTest();
        //system.assertEquals([Select Id, Status FROM Case Where Id=: lstCase[1].Id ].Status,'All Work Completed – Contact Client'); 
        //For Coverage
        delete lstLightHouse;
        undelete lstLightHouse;
     }
  
    
}