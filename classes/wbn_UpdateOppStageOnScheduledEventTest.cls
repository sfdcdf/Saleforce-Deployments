@isTest
private class wbn_UpdateOppStageOnScheduledEventTest 
{
    private static testMethod void upsertEventTest()
    {
        // load test data from static resources
        List<SObject> acctList = Test.LoadData(Account.sObjectType, 'testAccounts');
        List<SObject> oppList = Test.LoadData(Opportunity.sObjectType, 'testOpportunities');
        Set<Id> oppIds = new Set<Id>();
        List<Event> evtsToUpdate = new List<Event>();
        Date todayDt = Date.Today();
        
        Account acct = (Account)acctList[0];
        Id acctId = acct.Id;
        
        Opportunity opp = (Opportunity)oppList[0];
        Id oppId = opp.Id;
        
        opp.AccountId = acctId;
        opp.StageName = 'New Opportunity';
        opp.CloseDate = todayDt;
        update opp;
        
        oppIds.add(oppId);
        
        Test.startTest();
        
        Event evt = new Event();
        evt.ActivityDate = todayDt;
        evt.ActivityDateTime = DateTime.Now();
        evt.EndDateTime = DateTime.Now().addHours(7);
        evt.EventSubtype = 'Event';
        evt.Status__c = 'Scheduled';
        evt.Milestone__c = 'IL Demo Scheduled';
        evt.Subject = 'IL Demo';
        evt.WhatId = oppId;
        evt.IsRecurrence = false;
        evt.IsAllDayEvent = false;
        insert evt;
        
        evtsToUpdate.add(evt);
        
        for(Opportunity o : [SELECT Id, StageName FROM Opportunity WHERE Id IN :oppIds]){
            System.assertEquals(o.StageName, 'M001 - Set Local Demo');
        }
        
        for(Event e : evtsToUpdate){
            e.Status__c = 'Completed';
        }
        
        update evtsToUpdate;
        
        for(Opportunity o : [SELECT Id, StageName FROM Opportunity WHERE Id IN :oppIds]){
            System.assertEquals(o.StageName, 'M002 - Complete local demo (IL)');
        }
        
        Test.stoptest();
    }
}