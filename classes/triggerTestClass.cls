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
private class triggerTestClass {
/**
    static testMethod void testPartnerQATrigger()
    {
   
        string accountName = 'Partner QA Trigger test account';
        Account testAccount = new Account();
        
        testAccount.Name = accountName;
        testAccount.Client_ID__c = 'abc';
        
        List<Account> accounts = new List<Account>();
        accounts.add(testAccount);
        
        Test.startTest();
        insert accounts;

        

        accounts = [ select Account.Id from Account where Account.Name = :accountName ];
        testAccount = accounts.get(0);

        Case ncsCase = new Case();
        ncsCase.OwnerId = UserInfo.getUserId();
        ncsCase.IMS_Rep__c = UserInfo.getUserId();
        ncsCase.AccountId = testAccount.Id;
        ncsCase.Status = '1-GCC';
        ncsCase.Client_ID__c = 'abc';
        List<Case> cases = new List<Case>();
        cases.add(ncsCase);
        insert cases;

        List<RecordType> recordTypes = [ Select rt.id from RecordType rt  where rt.name = :'Partner QA' ];
        RecordType rt = recordTypes.get(0);
        List<Case> existingCases = [ select c.id from Case c where c.RecordTypeId = :rt.Id and c.AccountId = :testAccount.Id and c.Subject = :'Partner QA Case' ];
        System.assert(existingCases.isEmpty());

        

        ncsCase.Status = '4a. MPA Campaign Setup';
        update cases;
        
        existingCases = [ select c.id from Case c where c.RecordTypeId = :rt.Id and c.AccountId = :testAccount.Id and c.Subject = :'Partner QA Case' ];
        System.assert(existingCases.size() == 1);

        ncsCase.Status = 'LIVE';
        update cases;

        existingCases = [ select c.id from Case c where c.RecordTypeId = :rt.Id and c.AccountId = :testAccount.Id and c.Subject = :'Partner QA Case' ];
        System.assert(existingCases.size() == 1);

        Test.stopTest();
    }

    static testMethod void testDaysLiveTrigger() {
        string accountName = 'unit test account';
        string contactName = 'unit test contact';
        
        Account testAccount = new Account();
        Contact testContact = new Contact();
        PostLaunchSurvey__c testPostLaunchSurvey = new PostLaunchSurvey__c();
        Survey__c test45DaySurvey = new Survey__c();

        testAccount.Days_Live__c = 1;
        testAccount.Name = accountName;

        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        List<User> ims = new List<User>();
        List<PostLaunchSurvey__c> postLaunchSurveys = new List<PostLaunchSurvey__c>();
        List<Survey__c> surveys = new List<Survey__c>();
        List<Case> cases = new List<Case>();
        accounts.add(testAccount);
        contacts.add(testContact);
        postLaunchSurveys.add(testPostLaunchSurvey);
        surveys.add( test45DaySurvey );

        Test.startTest();
        insert accounts;

        accounts = [ select Account.Id from Account where Account.Name = :accountName ];

        contacts.get(0).AccountId = accounts.get(0).Id;
        contacts.get(0).LastName = contactName;
        insert contacts;

        contacts = [ Select Contact.Send_Post_Launch_Survey__c, Contact.send_45_day_survey__c From Contact where Contact.Name = :contactName ];
        System.assert(contacts.get(0).Send_Post_Launch_Survey__c == false);
        System.assert(contacts.get(0).send_45_day_survey__c == false);

        accounts.get(0).Days_Live__c = 3;
        update accounts;
        
        contacts = [ Select Contact.Send_Post_Launch_Survey__c, Contact.send_45_day_survey__c From Contact where Contact.Name = :contactName ];
        System.assert(contacts.get(0).Send_Post_Launch_Survey__c == true);
        System.assert(contacts.get(0).send_45_day_survey__c == false);

        accounts = [ select Account.Id from Account where Account.Name = :accountName ];
        accounts.get(0).Days_Live__c = 45;
        update accounts;

        contacts = [ Select Contact.Send_Post_Launch_Survey__c, Contact.send_45_day_survey__c From Contact where Contact.Name = :contactName ];
        System.assert(contacts.get(0).Send_Post_Launch_Survey__c == true);
        System.assert(contacts.get(0).send_45_day_survey__c == true);

        Test.stopTest();
    }
    
    static testMethod void AccountProvisioningTestTrigger ()
    {
        string accountName = 'Account Provisioning Trigger test account';
        Account testAccount = new Account();
        testAccount.Name = accountName;
        testAccount.Sales_Person__c = UserInfo.getUserId();
        testAccount.Status__c = 'SALES';
        testAccount.Order_Date__c = date.parse('1/1/2010');
        testAccount.Design_Fee__c = 100;
        testAccount.Management_Fee__c = 100;
        testAccount.SetUp_Fee__c = 100;
        testAccount.Monthly_Budget__c = 1000;
        testAccount.Organic_Recurring_Fees__c = 100;
        testAccount.Second_Rep__c = UserInfo.getUserId();
        testAccount.Contract_Length__c = '12';
                

        List<Account> accounts = new List<Account>();
        accounts.add(testAccount);

        Test.startTest();
        insert accounts;

        Opportunity testOpp = new Opportunity();
        testOpp.AccountId = accounts.get(0).Id;
        testOpp.OwnerId = UserInfo.getUserId();
        testOpp.StageName = 'Booked Appointment';
        testOpp.CloseDate = date.today();
        testOpp.LeadSource = 'Client Site';
        //testOpp.ForecastCategory = 'Pipeline';
        testOpp.Name = 'test opporuntity';
        List<Opportunity> opps = new List<Opportunity>();
        opps.add(testOpp);
        insert opps;

        System.assert( opps.get(0).CloseDate != testAccount.Order_Date__c );

        testAccount.Status__c = 'PROVISIONING';
        update accounts;
        
        opps = [ Select o.Website_Redesign_Fee__c,
                                             o.StageName,
                                             o.Setup_Fees__c,
                                             o.Second_Rep__c,
                                             o.OwnerId,
                                             o.Organic_fees__c,
                                             o.Monthly_Management_Fees__c,
                                             o.Monthly_Advertising_Charges__c,
                                             o.Contract_Lengths__c,
                                             o.CloseDate
                                        From Opportunity o
                                       where o.OwnerId = :testAccount.Sales_Person__c and
                                             o.AccountId = :testAccount.Id ];

        System.assert( opps.get(0).CloseDate == testAccount.Order_Date__c );


        test.stopTest();
        
    }
    */
/*
    static testMethod void surveyTestTrigger ()
    {

        // Add IMS to Account
        accounts.get(0).IMS_Rep__c = UserInfo.getUserId();
        update accounts;

        // Create Post Launch Survey
        postLaunchSurveys.get(0).Contact__c = contacts.get(0).Id;
        postLaunchSurveys.get(0).Customer_Survey_Name__c = 'Post Launch';
        postLaunchSurveys.get(0).Requested_Contact__c = true;
        insert postLaunchSurveys;

        cases = [ Select c.ContactId, c.Account_Owner__c From Case c Where c.ContactId = :contacts.get(0).Id and c.Subject = :'Post Launch Survey Response' ];
        System.assert( cases.size() == 1 );
        
        // Create 45-day Survey
        surveys.get(0).Contact__c = contacts.get(0).Id;
        surveys.get(0).Customer_Survey_Name__c = '45 Day';
        surveys.get(0).Requested_Contact__c = true;
        insert surveys;

        cases = [ Select c.ContactId, c.Account_Owner__c From Case c Where c.ContactId = :contacts.get(0).Id and c.Subject = :'45 Day Survey Response' ];
        System.assert( cases.size() == 1 ); }
    }
*/
}