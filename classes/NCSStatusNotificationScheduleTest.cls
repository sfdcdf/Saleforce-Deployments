@isTest(seeAllData=true)
private class NCSStatusNotificationScheduleTest
{
    private static testMethod void statusNotificationSchedTest()
    {
        Test.StartTest();
        
        Id wbnLogId = Schema.SObjectType.Notification_Log__c.getRecordTypeInfosByName().get('WBN Log').getRecordTypeId();
        List<Notification_Log__c> dmlLog = new List<Notification_Log__c>();
        Date todayDt = System.TODAY();
        
        Notification_Log__c newLog = new Notification_Log__c();
        newLog.RecordTypeId = wbnLogId;
        newLog.SObject_Name__c = 'Case';
        newLog.Record_Type_Name__c = 'National - New Client Setup';
        newLog.Trigger_Field_Name__c = 'Status';
        newLog.Notification_Sent_Date__c = todayDt;
        newLog.Trigger_Value__c = '1 - New';
        newLog.Record_Id__c = '5001b000004ej7uAAA';
        dmlLog.add(newLog);
        
        if(dmlLog.size() > 0){
            insert dmlLog;
        }
        
        wbnNationalNCSStatusNotificationSchedule sched1 = new wbnNationalNCSStatusNotificationSchedule(); 
        String sch = '0 0 23 * * ?'; 
        system.schedule('Test WBN Status Notification', sch, sched1);
        
        Test.stopTest(); 
    }
}