/**
 * Created by Francois Poirier on 2018-07-27.
 */
@isTest
public with sharing class icTestServiceOptimizeAccountsDay7 {

    @isTest
    public static void test_optimizeAccountAtDay7(){

        Account myTestAccount = new Account();
        Date sevenDaysAgo = Date.today().addDays(-7);

        String responseExample = '{"requestId":"e42b#14272d07d78","success":true,"result":[{"id":50,"status":"created"}]}';
        Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));

        myTestAccount.Name = 'Test 7 Day Opt.';
        myTestAccount.Live_Date__c = sevenDaysAgo;
        myTestAccount.Product_Type__c = 'LBW';
        myTestAccount.Email__c = 'me@web.com';

        insert myTestAccount;

        icServiceOptimizeAccountsDay7.optimizeAccountAtDay7();

        List<Case> cases = new List<Case>();

        cases = [
                SELECT  Id
                FROM    Case
                WHERE   AccountId =: myTestAccount.Id
            ];

        System.assert(cases.size()>0);

        icServiceOptimizeAccountsDay7.optimizeAccountAtDay7();

        List<Case> cases2 = new List<Case>();

        cases2 = [
                SELECT Id
                FROM    Case
                WHERE AccountId =: myTestAccount.Id
        ];

        System.assertEquals(cases.size(), cases2.size());
    }
}