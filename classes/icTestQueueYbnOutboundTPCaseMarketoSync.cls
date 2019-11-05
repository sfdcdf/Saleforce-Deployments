/**
 * Created by Francois Poirier on 2019-10-23.
 */
@isTest
public with sharing class icTestQueueYbnOutboundTPCaseMarketoSync {

    @isTest
    public static void testQueue(){
        Account newAccount = new Account();
        newAccount.Name = 'Test Account';
        newAccount.Marketo_ID__c = String.valueof(DateTime.now().millisecondGMT());
        newAccount.Status__c = 'LIVE';
        newAccount.Email__c = String.valueof(DateTime.now().millisecondGMT()) + '@t3esf788778t.4co4fasm';
        newAccount.Client_Type__c = 'Local';
        newAccount.Product_Type__c = 'LBW';
        //newAccount.Budget_Ads__c = 700;
        newAccount.Live_Date__c = Date.today();
        newAccount.Sync_to_Marketo__c = true;
        newAccount.Next_Scheduled_Touchpoint__c = Date.today().addDays(40);
        insert newAccount;


        Case newCase = new Case();
        newCase.AccountId = newAccount.Id;
        newCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Outbound Touch Point').getRecordTypeId();
        newCase.Reason = 'CS Touch Plan';
        newCase.Status = 'New';
        newCase.OwnerId = UserInfo.getUserId();
        insert newCase;

        List<Case> myCases = new List<Case>();
        myCases.add(newCase);

        String responseExample = '{ "success": true }';
        Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

        Test.startTest();
        System.enqueueJob(new icQueueYbnOutbountTPCaseMaketoSync('', '', JSON.serialize(myCases) , false, ''));
        Test.stopTest();

    }
}