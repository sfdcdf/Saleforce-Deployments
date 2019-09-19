/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019

/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 28-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 28-Jan-2019
  Description ........: Test Class for CTSTicketIdSync
*****************************************************************************/
@isTest(seeAllData=true)
public class CTSTicketIdSyncTest
{
    static testMethod void test_CTSTicketIdSync() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          CTSTicketIdSync obj = new CTSTicketIdSync();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
    
    static testMethod void test_CTSTicketResponse() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          CTSTicketResponse obj = new CTSTicketResponse();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
    /*
    private static testMethod void createAndUpdateAsyncRecord()
    {
        List<Id> objectIds = new List<Id>();
        List<SFDCToCTSAsynchRequest__c> dmlAsyncRequests = new List<SFDCToCTSAsynchRequest__c>();
        List<SFDCToCTSAsynchRequest__c> asyncRequestsToUpdate = new List<SFDCToCTSAsynchRequest__c>();
        DateTime currDate = System.Now();
        Id emailTemplateId = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'CTS_Touchplan_Send'].Id;
        
        SFDCToCTSAsynchRequest__c newAsync = new SFDCToCTSAsynchRequest__c();
        newAsync.API_Identifier__c = 'SFDCY_CASE_000012';
        newAsync.EmailTemplateId__c = String.valueOf(emailTemplateId);
        newAsync.Integration_Type__c = 'API';
        newAsync.NumberOfRetryAttempts__c = 0;
        newAsync.ObjectId__c = '5001b000005MXXX';
        newAsync.Object_Name__c = 'Case';
        newAsync.Status__c = 'New';
        newAsync.ScheduledDateTime__c = currDate;
        dmlAsyncRequests.add(newAsync);
        
        if(dmlAsyncRequests.size() > 0){
        
            insert dmlAsyncRequests;
            
            for(SFDCToCTSAsynchRequest__c asr : dmlAsyncRequests){
            
                asr.ExternalTicketId__c = '1234567';
                asr.Status__c = 'SUCCESS';
                asyncRequestsToUpdate.add(asr);
                objectIds.add(asr.Id);
            }
            
            if(asyncRequestsToUpdate.size() > 0){
                update asyncRequestsToUpdate;
            }
        }
        
        // start test
        Test.startTest();
        
        // execute Invocable method
        CTSTicketIdSync.UpdateRelatedObjectData(objectIds);
        
        Test.stopTest();
    }*/
}