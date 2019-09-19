/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
*/
@isTest
private class CaseAutomateCSCBatchTest {
  /*
  @isTest static void testAutomateCSCCaseCreationAndUpdate() {
    Account newAccount = new Account();
    newAccount.Name = 'Test Account';
    newAccount.Product_Type__c = 'FIELD_SERVICE_TEAM';
    insert newAccount;

    Case ncsCase = new Case();
    ncsCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('NCS - AutoLaunch').getRecordTypeId();
    ncsCase.GCC1_Date_Time__c = DateTime.now().addDays(5);
    ncsCase.AccountId = newAccount.Id;
    insert ncsCase;

    Test.startTest();
      Database.executeBatch(new CaseAutomateCSCBatch());
    Test.stopTest();
  }

  @isTest static void testAutomateCSCCasUpdate() {
    Account newAccount = new Account();
    newAccount.Name = 'Test Account';
    newAccount.Product_Type__c = 'FIELD_SERVICE_TEAM';
    insert newAccount;

    Case ncsCase = new Case();
    ncsCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('NCS - AutoLaunch').getRecordTypeId();
    ncsCase.GCC1_Date_Time__c = DateTime.now().addDays(5);
    ncsCase.AccountId = newAccount.Id;
    insert ncsCase;

    Case cscCase = new Case();
    cscCase.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
    cscCase.Reason = 'CSC';
    cscCase.AccountId = newAccount.Id;
    insert cscCase;

    Test.startTest();
      Database.executeBatch(new CaseAutomateCSCBatch());
    Test.stopTest();
  }*/
    static testMethod void test_CaseAutomateCSCSchedule() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          CaseAutomateCSCSchedule obj = new CaseAutomateCSCSchedule();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        } 
    static testMethod void test_CaseAutomateCSCBatch() 
        {
          Test.StartTest();
          //The object name below has to match up with your trigger/class
          CaseAutomateCSCBatch obj = new CaseAutomateCSCBatch();
          //This one link is asserting that you successfully created it
          system.assertNotEquals(null,obj);   
          Test.StopTest();
        }  
  
}