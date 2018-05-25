@isTest
public with sharing class test_TextbrokerSchedConfirmExported {

    public static testmethod void testExecute() {
        RecordType organicSetupRecordType = test_TextbrokerObjectCreator.getOrganicSetupRecordType();
        List<Case> cases = test_TextbrokerObjectCreator.getTextbrokerCases(3);

        for(Case c : cases) {
            // TEXTBROKER-28
            c.CopyStatus__c = 'Document Retrieved';
            c.RecordTypeId = organicSetupRecordType.Id;
        }
        update cases;



        Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointConfirmExport());

        String jobId = System.schedule('Textbroker - Confirm Exported Orders Test', '0 0 * * * ?',
                                        new TextbrokerSchedulableConfirmExported());

        //Get the information from the CronTrigger API object
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
             FROM CronTrigger WHERE id = :jobId];

        //Verify the expressions are the same
        System.assertEquals('0 0 * * * ?', ct.CronExpression);

        //Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);

        //Verify the next time the job will run
        String hour = String.valueOf(System.now().addHours(1).hour());
        if(hour.startsWith('0')) {
            //hour = hour.substring(0);
        }
        String nextRun = System.now().format('yyyy-MM-dd') + ' ' + hour + ':00:00';
       // System.assertEquals(nextRun, String.valueOf(ct.NextFireTime));
    }
}