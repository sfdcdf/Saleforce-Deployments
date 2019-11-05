@isTest
public class lhDeleteBatchFailureCasesScheduleTest{

    public static testMethod void testschedule() {
    
        createBatchFailureCase();
    
        Test.StartTest();
        
        lhDeleteBatchFailureCasesSchedule sh1 = new lhDeleteBatchFailureCasesSchedule();
        
        String sch = '0 0 23 * * ?'; system.schedule('Test Batch Failure Delete', sch, sh1); 
        
        Test.stopTest(); 
    }
    
    public static void createBatchFailureCase(){
    
        Case newCase = new Case();
        newCase.Subject = 'Failed transferring batch resource 123456';
        newCase.Reason ='Inbound Inquiry';
        newCase.Origin = 'support@lighthousepmg.com';
        newCase.Status = 'New';
        //newCase.RecordTypeId = '012600000009N9mAAE'; // WEBDC
        newCase.RecordTypeId = '0122E000000lP1OQAU'; // HS1
        
        insert newCase;
    
    }
}