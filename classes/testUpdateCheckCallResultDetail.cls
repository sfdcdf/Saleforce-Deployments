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
private class testUpdateCheckCallResultDetail {

    static testMethod void testUpdateCheckCallResultDetail() {
        // TO DO: implement unit test
        Lead crLead = new Lead();
        crLead.FirstName = 'Bob';
        crLead.LastName = 'Test';
        crLead.Company = 'Test';
        crLead.Email = 'test@test.com';
        crLead.Phone = '(555) 555-5555';
        insert crLead;
        
        
        Campaign crCampaign = new Campaign();
        crCampaign.Name = 'test campaign'; 
        insert crCampaign;
        
        Call_Result_Detail__c cr = new Call_Result_Detail__c();
        cr.Lead__c = crLead.Id;
        cr.Campaign__c = crCampaign.Id;
        cr.Call_Status__c = 'NVM';
        cr.Comments__c = 'Yadda yadda';
        insert cr;
        
        System.Debug('Call Result: ' + cr);
        
        Task crTask = new Task();
        crTask.CallType = 'Outbound';
        crTask.WhatId = cr.Id;
        insert crTask;
        
        System.Debug('TASK ID: ' + crTask.Id);
        
        Task checkTask = [Select WhoId From Task Where Id = :crTask.Id];
        System.assertEquals(crLead.Id, checkTask.WhoId);
        
        Task checkTask2 = new Task();
        checkTask2.WhoId = crLead.Id;
        insert checkTask2;
        
        
        System.assert(checkTask2.Id != null);
        
        Contact testContact = new Contact();
        testContact.FirstName = 'John';
        testContact.LastName = 'TestContact';
        crLead.Email = 'test@test.com';
        crLead.Phone = '(555) 555-5555';
        insert testContact;
        
        cr = new Call_Result_Detail__c();
        cr.Contact__c = testContact.Id;
        cr.Campaign__c = crCampaign.Id;
        cr.Call_Status__c = 'NVM';
        cr.Comments__c = 'Yadda yadda';
        insert cr;
        
        crTask = new Task();
        crTask.CallType = 'Outbound';
        crTask.WhatId = cr.Id;
        insert crTask;
        
        checkTask = [Select WhoId From Task Where Id = :crTask.Id];
        System.assertEquals(testContact.Id, checkTask.WhoId);
        
        
    }
}