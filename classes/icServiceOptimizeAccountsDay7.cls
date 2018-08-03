/**
 * Created by Francois Poirier on 2018-07-20.
 */

public with sharing class icServiceOptimizeAccountsDay7 {

    public static void optimizeAccountAtDay7(){

        Date sevenDaysAgo = Date.today().addDays(-7);

        List<Account> accountsLive7Days = new List<Account>();
        List<Case> casesToInsert = new List<Case>();

        List<RecordType> recordTypes = new List<RecordType>();
        Id optimizationRTId;

        List<Group> groups = new List<Group>();
        Id actPerfQueueId;

        recordTypes = [
                SELECT  Id
                FROM    RecordType
                WHERE   Name = 'Optimization'
                AND     SobjectType = 'Case'
        ];

        if(recordTypes.size()>0){
            optimizationRTId = recordTypes[0].Id;
        }

        groups = [
                SELECT  Id
                FROM    Group
                WHERE   Name = 'Account performance Queue'
        ];

        if(groups.size()>0){
            actPerfQueueId = groups[0].Id;
        }
        List<Case> cases7DaysOpt = [
                SELECT  Id,
                        AccountId
                FROM    Case
                WHERE   RecordTypeId =: optimizationRTId
                AND     Subject = '7 day New Launch QA'
                AND     Account.Live_Date__c =: sevenDaysAgo
        ];

        List<Id> accountWith7DayCase = new List<Id>();

        for(Case c : cases7DaysOpt){
            accountWith7DayCase.add(c.AccountId);
        }


        accountsLive7Days = [
                SELECT  Id,
                        Name
                FROM    Account
                WHERE   Live_Date__c =: sevenDaysAgo
                AND     Product_Type_Transactional__c like '%Lead%'
                AND     Id NOT IN : accountWith7DayCase
        ];


        for(Account a : accountsLive7Days){
            Case newCase = new Case();

            newCase.AccountId = a.Id;
            newCase.Subject = '7 day New Launch QA';
            newCase.Reason2__c = 'Proactive by Analyst';
            newCase.RecordTypeId = optimizationRTId;
            newCase.OwnerId = actPerfQueueId;


            casesToInsert.add(newCase);

        }

        if(casesToInsert.size()>0){
            insert casesToInsert;
        }
    }
}