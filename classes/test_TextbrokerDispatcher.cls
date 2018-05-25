@isTest
public with sharing class test_TextbrokerDispatcher {

    @isTest
    public static void testNewOrders() {
        RecordType organicSetupRecordType = test_TextbrokerObjectCreator.getOrganicSetupRecordType();
        User imsUser = test_TextbrokerObjectCreator.getImsUser();
        User textBrokerUser = test_TextbrokerObjectCreator.getTextbrokerUser();

        Textbroker_Trigger_Switch__c triggerSwitch = new Textbroker_Trigger_Switch__c();
        triggerSwitch.Name = 'Trigger Switch';
        triggerSwitch.Enable_Trigger__c = true;
        insert triggerSwitch;

        Account a = new Account(Name = 'Test');
        insert a;

        Case c = new Case();
        c.RecordTypeId = organicSetupRecordType.Id;
        c.OwnerId = imsUser.Id;
        c.AccountId = a.Id;
        TextbrokerHelper.enforceTextbrokerTriggerAfter = false;
        insert c;

        Test.startTest();

        // this will cause the trgOrganicPostLaunchCaseClosed to fire after update,
        // which will cause the TextbrokerDispatcher.processTextbrokerTrigger() method to fire
        c.OwnerId = textBrokerUser.Id; // required to start validation
        c.CopyProviderId__c = '123456'; // error; should be null/empty
        c.CopyStatus__c = 'Invalid'; // error; should be "New Order"
        TextbrokerHelper.enforceTextbrokerTriggerAfter = true;

        try {
            update c;
        } catch (Exception e) {
            System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION, e.getDmlType(0));
        }

        Test.stopTest();

    }

    @isTest
    public static void testRevisionsOrders() {
        RecordType organicSetupRecordType = test_TextbrokerObjectCreator.getOrganicSetupRecordType();
        User textBrokerUser = test_TextbrokerObjectCreator.getTextbrokerUser();

        Textbroker_Trigger_Switch__c triggerSwitch = new Textbroker_Trigger_Switch__c();
        triggerSwitch.Name = 'Trigger Switch';
        triggerSwitch.Enable_Trigger__c = true;
        insert triggerSwitch;

        Account a = new Account(Name = 'Test');
        insert a;

        Case c = new Case();
        c.RecordTypeId = organicSetupRecordType.Id;
        c.OwnerId = textBrokerUser.Id;
        c.AccountId = a.Id;
        c.CopyStatus__c = 'Revisions Needed';
        TextbrokerHelper.enforceTextbrokerTriggerAfter = false;
        insert c;

        Test.startTest();

        // this will cause the trgOrganicPostLaunchCaseClosed to fire after update,
        // which will cause the TextbrokerDispatcher.processTextbrokerTrigger() method to fire
        c.Status = 'Revisions Needed'; // required to start validation
        c.CopyProviderId__c = '123456'; // error; should be null/empty
        c.CopyStatus__c = 'Revisions Needed'; // error; should be "New Order"
        TextbrokerHelper.enforceTextbrokerTriggerAfter = true;

        try {
            update c;
        } catch (Exception e) {
            System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION, e.getDmlType(0));
        }

        Test.stopTest();

    }

}