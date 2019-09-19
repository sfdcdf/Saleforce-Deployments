@isTest
private class SalesforceToQueueBatchTest {

    /*
        Created by: Rustan Valino on 03-11-2016
        Last Modfied by: Rustan Valino on 03-22-2016
        Coverage:
            - SalesforceToQueueBatch: 100%
    */
    
    /*@isTest static void testUpdateAccountAction() {
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
        
        String responseExample = '{ "success": true }';
        Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

        List<Account> accountList = new List<Account>();

        for (Integer i = 0; i < 55; i++) {
            Account newAccount = new Account();
            newAccount.Name = 'Test Account ' + i;
            accountList.add(newAccount);
        }
        insert accountList;

        for (Integer i = 0; i < 55; i++) {
            accountList[i].Google_Maps_URL__c = 'www.yodle.com';
        }
        update accountList;
    }*/

    /*@isTest static void testinsertLeadAction() {
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
        
        String responseExample = '{"id":0,"businesName":null,"contactId":0,"prospectId":0,"segment":null,"successful":false}';
        Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));
        
        Map<String,Schema.RecordTypeInfo> leadRTMapByName = Schema.SObjectType.Lead.getRecordTypeInfosByName();

        List<Lead> newLeadList = new List<Lead>();

        for(Integer i = 0; i < 55; i++){
            Lead newLead = new Lead();
            newLead.RecordTypeId = leadRTMapByName.get('Inbound Sales').getRecordTypeId();
            newLead.Company = 'Test Company' + i;
            newLead.FirstName = 'First Name' + i;
            newLead.LastName = 'Last Name' + i;
            newLead.Status = 'New';
            newLeadList.add(newLead);
        }

        insert newLeadList;
    }

    @isTest static void testUpdateLeadAction() {
        TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
        
        String responseExample = '{"id":0,"businesName":null,"contactId":0,"prospectId":0,"segment":null,"successful":false}';
        Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));
        
        Map<String,Schema.RecordTypeInfo> leadRTMapByName = Schema.SObjectType.Lead.getRecordTypeInfosByName();

        List<Lead> newLeadList = new List<Lead>();

        for(Integer i = 0; i < 55; i++){
            Lead newLead = new Lead();
            newLead.RecordTypeId = leadRTMapByName.get('Inbound Sales').getRecordTypeId();
            newLead.Company = 'Test Company' + i;
            newLead.FirstName = 'First Name' + i;
            newLead.LastName = 'Last Name' + i;
            newLead.Status = 'New';
            newLeadList.add(newLead);
        }

        insert newLeadList;

        for(Lead record : newLeadList){
            record.Company += record.Company + record.Company;
        }

        update newLeadList;
    }*/
    
}