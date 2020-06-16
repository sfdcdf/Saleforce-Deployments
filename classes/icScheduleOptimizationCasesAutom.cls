/**
 * Created by Francois Poirier on 2018-08-03.
 * Modilfied by Mahesh Bogila- 06/15/2020.
 */

public with sharing class icScheduleOptimizationCasesAutom implements Schedulable {

    public void execute(SchedulableContext sc){

        icServiceOptimizeAccountsDay7.optimizeAccountAtDay7();
        icServiceWBNOptimizationCasesAutomation.wbnOptimizationCasesAutomation();

    }
}