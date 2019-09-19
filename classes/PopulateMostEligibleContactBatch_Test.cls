@isTest
public class PopulateMostEligibleContactBatch_Test{
    static Id YBNAccountMasterRecordTypeId{
        get{
            return Schema.SObjectType.Account.getRecordTypeInfosByName().get('YBN Master Account').getRecordTypeId();
        }
    }
    
    static Id YBNCaseInboundRecordTypeId{
        get{
            return Schema.SObjectType.Case.getRecordTypeInfosByName().get('YBN Inbound Inquiry').getRecordTypeId();
        }
    }

    static Id YBNAccountStandardRecordTypeId{
        get{
            return Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
        }
    }
    
    testMethod
    static void MECPopulatedOnContact(){
        Account relatedAccount = new Account(
            Name = 'MECPopulatedOnContact_Account',
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;
        
        Test.startTest();

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'MECPopulatedOnContact_Contact',
                    AccountId = relatedAccount.Id,
                    Phone = '1234567890'                    
                )
            );
        }

        INSERT lstSimilarContacts;

        Database.executeBatch(new PopulateMostEligibleContactBatch());
        
        Test.stopTest(); 
        
        lstSimilarContacts = [
            SELECT Id 
            FROM   Contact
            WHERE  Target_Account__c != NULL  AND
                   Most_Eligible__c  != FALSE AND
                   Executed_Clause_For_Flagging__c != NULL
        ];
        
        System.assertEquals(1, lstSimilarContacts.size());
    }
}