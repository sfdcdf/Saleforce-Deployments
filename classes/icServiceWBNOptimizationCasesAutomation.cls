/**
 * Created by Francois Poirier on 2018-08-03.
 */

public with sharing class icServiceWBNOptimizationCasesAutomation {

    public static void wbnOptimizationCasesAutomation(){

        Date sevenDaysAgo = Date.today().addDays(-7);
        Date threeDaysAgo = Date.today().addDays(-3);


        List<Account> accountsLive3Days = new List<Account>();
        List<Account> accountsLive7Days = new List<Account>();
        List<Case> casesToInsert = new List<Case>();

        List<RecordType> recordTypes = new List<RecordType>();
        Id optimizationRTId;

        List<Group> groups = new List<Group>();
        Id actPerfQueueId;

        recordTypes = [
                SELECT  Id
                FROM    RecordType
                WHERE   Name = 'YBN Request'
                AND     SobjectType = 'Case'
        ];

        if(recordTypes.size()>0){
            optimizationRTId = recordTypes[0].Id;
        }

        groups = [
                SELECT  Id
                FROM    Group
                WHERE   Name = 'National Performance Queue'
        ];

        if(groups.size()>0){
            actPerfQueueId = groups[0].Id;
        }

        List<Case> cases3DaysOpt = [
                SELECT  Id,
                        AccountId
                FROM    Case
                WHERE   RecordTypeId =: optimizationRTId
                AND     Subject = '3 Day Error Check'
                AND     YBNRequestReason__c = 'Performance Team'
                AND     YBNRequestDetail__c = 'PPC Optimzation'
                AND     Account.Live_Date__c =: threeDaysAgo
        ];

        List<Id> accountsWith3DayCase = new List<Id>();

        for(Case c : cases3DaysOpt){
            accountsWith3DayCase.add(c.AccountId);
        }

        List<Case> cases7DaysOpt = [
                SELECT  Id,
                        AccountId
                FROM    Case
                WHERE   RecordTypeId =: optimizationRTId
                AND     Subject = '7 Day Opt'
                AND     YBNRequestReason__c = 'Performance Team'
                AND     YBNRequestDetail__c = 'PPC Optimzation'
                AND     Account.Live_Date__c =: sevenDaysAgo
        ];

        List<Id> accountWith7DayCase = new List<Id>();

        for(Case c : cases7DaysOpt){
            accountWith7DayCase.add(c.AccountId);
        }


        accountsLive3Days = [
                SELECT  Id,
                        Name
                FROM    Account
                WHERE   Live_Date__c =: threeDaysAgo
                AND     Client_Type__c = 'YBN'
                AND     Id NOT IN : accountsWith3DayCase
        ];


        for(Account a : accountsLive3Days){
            Case newCase = new Case();

            newCase.AccountId = a.Id;
            newCase.Subject = '3 Day Error Check';
            newCase.YBNRequestReason__c = 'Performance Team';
            newCase.YBNRequestDetail__c = 'PPC Optimzation';
            newCase.RecordTypeId = optimizationRTId;
            newCase.OwnerId = actPerfQueueId;


            casesToInsert.add(newCase);

        }

        accountsLive7Days = [
                SELECT  Id,
                        Name
                FROM    Account
                WHERE   Live_Date__c =: sevenDaysAgo
                AND     Client_Type__c = 'YBN'
                AND     Id NOT IN : accountWith7DayCase
        ];


        for(Account a : accountsLive7Days){
            Case newCase = new Case();

            newCase.AccountId = a.Id;
            newCase.Subject = '7 Day Opt';
            newCase.YBNRequestReason__c = 'Performance Team';
            newCase.YBNRequestDetail__c = 'PPC Optimzation';
            newCase.RecordTypeId = optimizationRTId;
            newCase.OwnerId = actPerfQueueId;


            casesToInsert.add(newCase);

        }

        if(casesToInsert.size()>0){
            insert casesToInsert;
        }
    }
}