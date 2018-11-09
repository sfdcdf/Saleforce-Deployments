@isTest(seeAllData=true)
private class ATVCustRefIdAPIInvokeSchedTest
{
    private static testMethod void invokeSchedTest()
    {
        Test.StartTest();
        
        ATVCustomerRefIdAPIInvokeSchedule sh1 = new ATVCustomerRefIdAPIInvokeSchedule();

        String sch = '0 0 23 * * ?'; 
        System.schedule('ATV Customer Ref Id Update Check', sch, sh1);
        
        Test.stopTest(); 
    }
}