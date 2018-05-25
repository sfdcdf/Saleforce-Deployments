@isTest
private class SL_AccountTriggerHandlerTest {
    @isTest static void testSetSalesDirectorFields() {
        User repA = [SELECT Id FROM User WHERE isActive = true AND UserRole.Name != 'YBN: Relationship Development Director' LIMIT 1];
        

        Test.startTest();
            Account a = new Account(Name='testing', OwnerId = repA.Id);
            
            insert a;
            
            List<Account> accts = new List<Account>{a};
            SL_AccountTriggerHandler.setSalesDirectorFields(accts);
        Test.stopTest();

        a = [SELECT Id, Force_Field_Sales_Director__c, Sales_Director__c FROM Account WHERE ID = :a.Id];
        
        System.assertNotEquals(repA.Id, a.Force_Field_Sales_Director__c);
        
    }
    
}