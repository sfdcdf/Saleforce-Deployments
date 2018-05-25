/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
@IsTest
private class dlrs_ObjectHistoryTest
{
    private static testmethod void testTrigger()
    {
        // Force the dlrs_ObjectHistoryTrigger to be invoked, fails the test if org config or other Apex code prevents this.
        dlrs.RollupService.testHandler(new ObjectHistory__c());
    }
}