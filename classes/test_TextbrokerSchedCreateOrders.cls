@isTest
public with sharing class test_TextbrokerSchedCreateOrders {

    public static testmethod void testExecute() {
        //We pass null because we don't really care about the response. We are just testing
        //that the job gets scheduled.
        Test.setMock(HttpCallOutMock.class, new test_TextbrokerMockEndpointCreateOrders());

        String jobId = System.schedule('Textbroker - Create Orders Test', '0 0 * * * ?',
                                        new TextbrokerSchedulableCreateOrders());

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