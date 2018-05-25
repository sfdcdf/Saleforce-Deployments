@isTest
public class ResetContactLiveOpsAttributesBatch_Test{
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
    static void CreateYBNContact_FieldNullfied(){
        Account relatedAccount = new Account(
            Name = 'CreateYBNContact_FieldNullfied_Account',
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;
        
        Test.startTest();

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'CreateYBNContact_FieldNullfied_Contact',
                    AccountId = relatedAccount.Id,
                    Phone = '1234567890'                    
                )
            );
        }

        INSERT lstSimilarContacts;

        Database.executeBatch(new ResetContactLiveOpsAttributesBatch());
        
        Test.stopTest(); 
        
        lstSimilarContacts = [
            SELECT Id 
            FROM   Contact
            WHERE  Target_Account__c = NULL  AND
                   Most_Eligible__c  = FALSE AND
                   Executed_Clause_For_Flagging__c = NULL AND
                   
                   Target_Account_E2C__c = NULL  AND
                   Most_Eligible_E2C__c = FALSE AND
                   Executed_Clause_For_Flagging_E2C__c = NULL
                   
        ];
        
        System.assertEquals(3, lstSimilarContacts.size());
    }
}