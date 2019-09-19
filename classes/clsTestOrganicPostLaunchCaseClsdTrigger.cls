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
private class clsTestOrganicPostLaunchCaseClsdTrigger {


    static testmethod void testOrganicPostLaunchCaseClosed ()
    {
        /*List<Case> dmlCases = new List<Case>();
    
        Test.startTest();

        Account a = new Account();
        List<Account> accounts = new List<Account>();
        a.Name = 'test account';
        a.Client_ID__c = 'abcde';
        a.Sales_Rep_Name_YL__c = 'Eugene Ross';
        accounts.add(a);
        insert accounts;

        List<RecordType> rt = [ select Id from RecordType where Name = 'Organic Setup' ];
        String organicSetup = rt.get(0).Id;

        Case c = new Case();
        List<Case> cases = new List<Case>();
        c.AccountId = a.Id;
        c.RecordTypeId = organicSetup;
        c.Subject = 'NCS Organic Post-Launch';
        c.Client_ID__c = a.Client_ID__c;
        c.Origin = 'SEO Product';
        c.Status = 'New';
        c.Priority = 'SEO Priority';
        c.Reason = 'SEO Task';
        c.Type = 'SEO Task';
        c.SEO_Product__c = 'PPC + Organic';
        c.YO_Website_Type__c = 'Yodle Built Site';
        c.IMS_Rep__c = UserInfo.getUserId();
        c.Sales_Person__c = UserInfo.getUserId();
        c.CMS_2_0__c = 'CMS 2.0';
        insert c;

        System.assert( a.Post_Launch_Case_closed__c == false );
        
        for(Case cu : cases){
            cu.Status = 'Closed';
            dmlCases.add(cu);
        }
        
        update dmlCases;

        accounts = [ Select Post_Launch_Case_closed__c from Account where id = :a.Id];
        a = accounts.get(0);

        System.assert( a.Post_Launch_Case_closed__c == true );


        Test.stopTest();*/
        
    }
}