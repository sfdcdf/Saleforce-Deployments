/**
 * Created by Francois Poirier on 2018-08-03.
 */
@isTest
public with sharing class icTestScheduleOptimizationCasesAutom {

    @isTest
    static void test_Execute(){

        String jobId = System.schedule('CaseOptimizationAutomation - test', '0 0 * * * ?',
                                        new icScheduleOptimizationCasesAutom());
        
        CronTrigger ct =  [SELECT Id, CronExpression, TimesTriggered, NextFireTime
        FROM CronTrigger WHERE id = :jobId];

        //Verify the expressions are the same
        System.assertEquals('0 0 * * * ?', ct.CronExpression);

        //Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);

    }

}