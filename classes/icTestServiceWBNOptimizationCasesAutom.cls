/**
 * Created by Francois Poirier on 2018-08-03.
 */
@isTest
public with sharing class icTestServiceWBNOptimizationCasesAutom {

    @isTest
    public static void test_wbnOptimizationCasesAutomation(){

        Account myTestAccount3 = new Account();
        Account myTestAccount7 = new Account();
        Date threeDaysAgo = Date.today().addDays(-3);
        Date sevenDaysAgo = Date.today().addDays(-7);

        String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
        Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

        myTestAccount7.Name = 'Test 7 Day Opt.';
        myTestAccount7.Live_Date__c = sevenDaysAgo;
        myTestAccount7.Client_Type__c = 'YBN';
        myTestAccount7.Email__c = 'me@web.com';

        insert myTestAccount7;

        myTestAccount3.Name = 'Test 3 Day Opt.';
        myTestAccount3.Live_Date__c = threeDaysAgo;
        myTestAccount3.Client_Type__c = 'YBN';
        myTestAccount3.Email__c = 'me2@web.com';

        insert myTestAccount3;

        icServiceWBNOptimizationCasesAutomation.wbnOptimizationCasesAutomation();

        List<Case> cases3Days = new List<Case>();

        cases3Days = [
                SELECT  Id
                FROM    Case
                WHERE   AccountId =: myTestAccount3.Id
        ];

        List<Case> cases7Days = new List<Case>();
        cases7Days = [
                SELECT  Id
                FROM    Case
                WHERE   AccountId =: myTestAccount7.Id
        ];


        System.assert(cases3Days.size()>0);
        System.assert(cases7Days.size()>0);

        icServiceWBNOptimizationCasesAutomation.wbnOptimizationCasesAutomation();

        List<Case> cases3Days2 = new List<Case>();

        cases3Days2 = [
                SELECT Id
                FROM    Case
                WHERE AccountId =: myTestAccount3.Id
        ];

        List<Case> cases7Days2 = new List<Case>();

        cases7Days2 = [
                SELECT Id
                FROM    Case
                WHERE AccountId =: myTestAccount7.Id
        ];

        System.assertEquals(cases3Days.size(), cases3Days2.size());
        System.assertEquals(cases7Days.size(), cases7Days2.size());
    }
}