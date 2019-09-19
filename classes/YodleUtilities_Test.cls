@isTest
public class YodleUtilities_Test{
    /*
        Acronyms:

        Methods
        ------------------------------
        FEC  = flagEligibleContact
        ME2C = manageEmailToCase

        Entities
        ------------------------------
        Acc = Account
        Ir  = IMS Rep
        Lc  = Lead Consultant
        Rt  = Record Type
        Std = Standard
        Cid = Client ID
        E2C = Email to Case

        Operators
        ------------------------------
        EQ  = Equals
        NEQ = Not Equals
    */

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

    static Group CatchAllQueue{
        get{
            return [
                SELECT  Id 
                FROM    Group 
                WHERE   Type = 'Queue' AND 
                        DeveloperName = 'YBN_E2C_Catch_all' 
                LIMIT 1
            ];
        }
    }

    static String generatePhoneNumber(){
        return String.valueOf(Math.round(Math.random() * Math.pow(10, 9))) + '0';
    }

    testMethod
    static void FEC_numberOfAccEQZero(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_numberOfAccEQZero',
                    Phone = phoneNumber
                )
            );
        }

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_numberOfAccEQZero'
        ];

        System.assertEquals(0, lstFlaggedContacts.size());
    }

    testMethod
    static void FEC_allAccSame_AccRtEQMaster(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        Account relatedAccount = new Account(
            Name = 'FEC_allAccSame_AccRtEQMaster',
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccSame_AccRtEQMaster',
                    AccountId = relatedAccount.Id,
                    MobilePhone = phoneNumber
                )
            );
        }

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccSame_AccRtEQMaster'
        ];

        System.debug(lstFlaggedContacts);

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(relatedAccount.Id, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[All Accounts Same] AND ' +
            '[Account Record Type = YBNCorporateRelationship]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccSame_AccRtEQStd_MlotpEQTrue(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        Account relatedAccount = new Account(
            Name = 'FEC_allAccSame_AccRtEQStd_MlotpEQTrue',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccSame_AccRtEQStd_MlotpEQTrue',
                    AccountId = relatedAccount.Id,
                    OtherPhone = phoneNumber
                )
            );
        }

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccSame_AccRtEQStd_MlotpEQTrue'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(relatedAccount.Id, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[All Accounts Same] AND ' +
            '[Account Record Type = "Standard"] AND ' + 
            '[Primary MLOTP = TRUE]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        Account relatedAccount = new Account(
            Name = 'FEC_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            Multi_Location_Owner_Primary_CID__c = phoneNumber,
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;

        Account clientIdMatchingAcc = new Account(
            Name = 'FEC_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            Client_ID__c = phoneNumber,
            Client_Type__c = 'YBN'
        );

        INSERT clientIdMatchingAcc;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
                    AccountId = relatedAccount.Id,
                    Phone = phoneNumber
                )
            );
        }

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(clientIdMatchingAcc.Id, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[All Accounts Same] AND ' +
            '[Account Record Type = "Standard"] AND ' + 
            '[Primary MLOTP = FALSE] AND ' +
            '[MLO CID != EMPTY] AND ' +
            '[ClientID = MLO CID]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        Account relatedAccount = new Account(
            Name = 'FEC_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = NULL,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
                    AccountId = relatedAccount.Id,
                    MobilePhone = phoneNumber
                )
            );
        }

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    Name = 'FEC_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(relatedAccount.Id, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[All Accounts Same] AND ' +
            '[Account Record Type = "Standard"] AND ' + 
            '[Primary MLOTP = FALSE] AND ' +
            '[MLO CID = EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccDiff_AccRtEQMaster_LcNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FEC_allAccDiff_AccRtEQMaster_LcNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account masterAccount = new Account(
            Name = 'FEC_allAccDiff_AccRtEQMaster_LcNEQNull',
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = UserInfo.getUserId()
        );

        lstRelatedAccounts.add(masterAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    OtherPhone = phoneNumber
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FEC_allAccDiff_AccRtEQMaster_LcNEQNull',
            AccountId = masterAccount.Id,
            OtherPhone = phoneNumber
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(masterAccount.Id, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found one YBNCorporateRelationship Account] AND ' + 
            '[Lead Consultant != EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account irNEQNullAccount = new Account(
            Name = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = UserInfo.getUserId()
        );

        lstRelatedAccounts.add(irNEQNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Phone = phoneNumber
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull',
            AccountId = irNEQNullAccount.Id,
            Phone = phoneNumber
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(irNEQNullAccount.Id, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND ' +
            '[Found one Primary MLOTP Account] AND ' +
            '[IMS Rep != EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account irNullAccount = new Account(
            Name = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(irNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    MobilePhone = phoneNumber
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull',
            AccountId = irNullAccount.Id,
            MobilePhone = phoneNumber
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(NULL, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND ' +
            '[Found one Primary MLOTP Account] AND ' +
            '[IMS Rep = EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account mlocidAccount = new Account(
            Name = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = phoneNumber,
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(mlocidAccount);

        Account clientIdMatchingAcc = new Account(
            Name = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
            Client_ID__c = phoneNumber,
            Client_Type__c = 'YBN'
        );

        lstRelatedAccounts.add(clientIdMatchingAcc);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    OtherPhone = phoneNumber
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
            AccountId = mlocidAccount.Id,
            OtherPhone = phoneNumber
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(clientIdMatchingAcc.Id, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND ' +
            '[Found NO Primary MLOTP Account] AND ' +
            '[Found Account with Valid MLO CID] AND ' +
            '[Found Account Where ClientID = MLO CID]',
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account mlocidNullAccount = new Account(
            Name = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = NULL,
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(mlocidNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Phone = phoneNumber
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull',
            AccountId = mlocidNullAccount.Id,
            Phone = phoneNumber
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(NULL, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND ' +
            '[Found NO Primary MLOTP Account] AND ' +
            '[Found NO Account with Valid MLO CID]',
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN'
                )
            );
        }

        Account irNEQNullAccount = new Account(
            Name = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN',
            IMS_Rep__c = UserInfo.getUserId()
        );

        lstRelatedAccounts.add(irNEQNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    MobilePhone = phoneNumber
                )
            );
        }

        Contact associatedContact = new Contact(
            LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull',
            AccountId = irNEQNullAccount.Id,
            MobilePhone = phoneNumber
        );

        lstSimilarContacts.add(associatedContact);

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(irNEQNullAccount.Id, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO YBNCorporateRelationship Account] AND ' +
            '[Found one Primary MLOTP Account] AND ' +
            '[IMS Rep != EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN'
                )
            );
        }

        Account irNullAccount = new Account(
            Name = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN',
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(irNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Phone = phoneNumber
                )
            );
        }

        Contact associatedContact = new Contact(
            LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull',
            AccountId = irNullAccount.Id,
            OtherPhone = phoneNumber
        );

        lstSimilarContacts.add(associatedContact);

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(NULL, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO YBNCorporateRelationship Account] AND ' +
            '[Found one Primary MLOTP Account] AND ' +
            '[IMS Rep = EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account mlocidAccount = new Account(
            Name = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = phoneNumber,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(mlocidAccount);

        Account clientIdMatchingAcc = new Account(
            Name = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            Client_ID__c = phoneNumber,
            Client_Type__c = 'YBN'
        );

        lstRelatedAccounts.add(clientIdMatchingAcc);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Phone = phoneNumber
                )
            );
        }

        Contact associatedContact = new Contact(
            LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            AccountId = mlocidAccount.Id,
            Phone = phoneNumber
        );

        lstSimilarContacts.add(associatedContact);

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(clientIdMatchingAcc.Id, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO YBNCorporateRelationship Account] AND ' +
            '[Found NO Primary MLOTP Account] AND ' +
            '[Found Account with Valid MLO CID] AND ' +
            '[Found Account Where ClientID = MLO CID]',
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }

    testMethod
    static void FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN'
                )
            );
        }

        Account mlocidNullAccount = new Account(
            Name = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = NULL,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN'
        );

        lstRelatedAccounts.add(mlocidNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    MobilePhone = phoneNumber
                )
            );
        }

        Contact associatedContact = new Contact(
            LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
            AccountId = mlocidNullAccount.Id,
            MobilePhone = phoneNumber
        );

        lstSimilarContacts.add(associatedContact);

        INSERT lstSimilarContacts;

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account__c, 
                    Executed_Clause_For_Flagging__c  
            FROM    Contact 
            WHERE   Most_Eligible__c = TRUE AND
                    LastName = 'FEC_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(NULL, lstFlaggedContacts.get(0).Target_Account__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO YBNCorporateRelationship Account] AND ' +
            '[Found NO Primary MLOTP Account] AND ' +
            '[Found NO Account with Valid MLO CID]',
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging__c
        );
    }
    
    testMethod
    static void FECBE_numberOfAccEQZero(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_numberOfAccEQZero',
                    Email = 'john.doe@example.com'
                )
            );
        }

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id,
                    Target_Account_E2C__c,
                    Executed_Clause_For_Flagging_E2C__c  
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_numberOfAccEQZero'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(NULL, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals('[Number of Accounts = 0]', lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c  );
        
    }

    testMethod
    static void FECBE_allAccSame_AccRtEQMaster(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        Account relatedAccount = new Account(
            Name = 'FECBE_allAccSame_AccRtEQMaster',
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccSame_AccRtEQMaster',
                    AccountId = relatedAccount.Id,
                    Alternate_Email__c = 'john.doe@example.com'                    
                )
            );
        }

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c  
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccSame_AccRtEQMaster'
        ];

        System.debug(lstFlaggedContacts);

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(relatedAccount.Id, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[All Accounts Same] AND ' +
            '[Account Record Type = YBNCorporateRelationship]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccSame_AccRtEQStd_MlotpEQTrue(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        Account relatedAccount = new Account(
            Name = 'FECBE_allAccSame_AccRtEQStd_MlotpEQTrue',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccSame_AccRtEQStd_MlotpEQTrue',
                    AccountId = relatedAccount.Id,
                    Email = 'john.doe@example.com'                    
                )
            );
        }

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccSame_AccRtEQStd_MlotpEQTrue'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(relatedAccount.Id, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[All Accounts Same] AND ' +
            '[Account Record Type = "Standard"] AND ' + 
            '[Primary MLOTP = TRUE]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        Account relatedAccount = new Account(
            Name = 'FECBE_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            Multi_Location_Owner_Primary_CID__c = phoneNumber,
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;

        Account clientIdMatchingAcc = new Account(
            Name = 'FECBE_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            Client_ID__c = phoneNumber,
            Client_Type__c = 'YBN'
        );

        INSERT clientIdMatchingAcc;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
                    AccountId = relatedAccount.Id,
                    Alternate_Email__c = 'john.doe@example.com'
                )
            );
        }

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(clientIdMatchingAcc.Id, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[All Accounts Same] AND ' +
            '[Account Record Type = "Standard"] AND ' + 
            '[Primary MLOTP = FALSE] AND ' +
            '[MLO CID != EMPTY] AND ' +
            '[ClientID = MLO CID]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        Account relatedAccount = new Account(
            Name = 'FECBE_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = NULL,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN'
        );

        INSERT relatedAccount;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 1; i <= 3; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
                    AccountId = relatedAccount.Id,
                    Email = 'john.doe@example.com'                    
                )
            );
        }

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    Name = 'FECBE_allAccSame_AccRtEQStd_MlotpEQFalse_MlocidEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(relatedAccount.Id, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[All Accounts Same] AND ' +
            '[Account Record Type = "Standard"] AND ' + 
            '[Primary MLOTP = FALSE] AND ' +
            '[MLO CID = EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccDiff_AccRtEQMaster_LcNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FECBE_allAccDiff_AccRtEQMaster_LcNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account masterAccount = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQMaster_LcNEQNull',
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = UserInfo.getUserId()
        );

        lstRelatedAccounts.add(masterAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Alternate_Email__c = 'john.doe@example.com'
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcNEQNull',
            AccountId = masterAccount.Id,
            Alternate_Email__c = 'john.doe@example.com'
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(masterAccount.Id, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found one YBNCorporateRelationship Account] AND ' + 
            '[Lead Consultant != EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account irNEQNullAccount = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = UserInfo.getUserId()
        );

        lstRelatedAccounts.add(irNEQNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Email = 'john.doe@example.com'
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull',
            AccountId = irNEQNullAccount.Id,
            Email = 'john.doe@example.com'
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(irNEQNullAccount.Id, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND ' +
            '[Found one Primary MLOTP Account] AND ' +
            '[IMS Rep != EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account irNullAccount = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(irNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Alternate_Email__c = 'john.doe@example.com'
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull',
            AccountId = irNullAccount.Id,
            Alternate_Email__c = 'john.doe@example.com'
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c  
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQTrue_IrEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(NULL, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND ' +
            '[Found one Primary MLOTP Account] AND ' +
            '[IMS Rep = EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account mlocidAccount = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = phoneNumber,
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(mlocidAccount);

        Account clientIdMatchingAcc = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
            Client_ID__c = phoneNumber,
            Client_Type__c = 'YBN'
        );

        lstRelatedAccounts.add(clientIdMatchingAcc);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Email = 'john.doe@example.com'
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull',
            AccountId = mlocidAccount.Id,
            Email = 'john.doe@example.com'
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(clientIdMatchingAcc.Id, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND ' +
            '[Found NO Primary MLOTP Account] AND ' +
            '[Found Account with Valid MLO CID] AND ' +
            '[Found Account Where ClientID = MLO CID]',
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account mlocidNullAccount = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = NULL,
            RecordTypeId = YBNAccountMasterRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(mlocidNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Alternate_Email__c = 'john.doe@example.com'
                )
            );
        }

        Contact contactAssociatedWithMaster = new Contact(
            LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull',
            AccountId = mlocidNullAccount.Id,
            Alternate_Email__c = 'john.doe@example.com'
        );

        lstSimilarContacts.add(contactAssociatedWithMaster);

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c  
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccDiff_AccRtEQMaster_LcEQNull_MlotpEQFalse_MlocidEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(NULL, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND ' +
            '[Found NO Primary MLOTP Account] AND ' +
            '[Found NO Account with Valid MLO CID]',
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN'
                )
            );
        }

        Account irNEQNullAccount = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN',
            IMS_Rep__c = UserInfo.getUserId()
        );

        lstRelatedAccounts.add(irNEQNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Email = 'john.doe@example.com'
                )
            );
        }

        Contact associatedContact = new Contact(
            LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull',
            AccountId = irNEQNullAccount.Id,
            Email = 'john.doe@example.com'
        );

        lstSimilarContacts.add(associatedContact);

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(irNEQNullAccount.Id, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO YBNCorporateRelationship Account] AND ' +
            '[Found one Primary MLOTP Account] AND ' +
            '[IMS Rep != EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN'
                )
            );
        }

        Account irNullAccount = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull',
            Primary_Multi_Location_Owner_For_TP__c = TRUE,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN',
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(irNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Alternate_Email__c = 'john.doe@example.com'
                )
            );
        }

        Contact associatedContact = new Contact(
            LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull',
            AccountId = irNullAccount.Id,
            Alternate_Email__c = 'john.doe@example.com'
        );

        lstSimilarContacts.add(associatedContact);

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c 
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQTrue_IrEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(NULL, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO YBNCorporateRelationship Account] AND ' +
            '[Found one Primary MLOTP Account] AND ' +
            '[IMS Rep = EMPTY]', 
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN',
                    Lead_Consultant__c = NULL
                )
            );
        }

        Account mlocidAccount = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = phoneNumber,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN',
            Lead_Consultant__c = NULL,
            IMS_Rep__c = NULL
        );

        lstRelatedAccounts.add(mlocidAccount);

        Account clientIdMatchingAcc = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            Client_ID__c = phoneNumber,
            Client_Type__c = 'YBN'
        );

        lstRelatedAccounts.add(clientIdMatchingAcc);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Email = 'john.doe@example.com'
                )
            );
        }

        Contact associatedContact = new Contact(
            LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull',
            AccountId = mlocidAccount.Id,
            Email = 'john.doe@example.com'
        );

        lstSimilarContacts.add(associatedContact);

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c 
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidNEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(clientIdMatchingAcc.Id, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO YBNCorporateRelationship Account] AND ' +
            '[Found NO Primary MLOTP Account] AND ' +
            '[Found Account with Valid MLO CID] AND ' +
            '[Found Account Where ClientID = MLO CID]',
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }

    testMethod
    static void FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull(){
        Test.startTest();

        String phoneNumber = generatePhoneNumber();

        List<Account> lstRelatedAccounts = new List<Account>();
        for(Integer i = 0; i <= 2; i++){
            lstRelatedAccounts.add(
                new Account(
                    Name = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
                    RecordTypeId = YBNAccountStandardRecordTypeId,
                    Client_Type__c = 'YBN'
                )
            );
        }

        Account mlocidNullAccount = new Account(
            Name = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
            Primary_Multi_Location_Owner_For_TP__c = FALSE,
            Multi_Location_Owner_Primary_CID__c = NULL,
            RecordTypeId = YBNAccountStandardRecordTypeId,
            Client_Type__c = 'YBN'
        );

        lstRelatedAccounts.add(mlocidNullAccount);

        INSERT lstRelatedAccounts;

        List<Contact> lstSimilarContacts = new List<Contact>();
        for(Integer i = 0; i < 2; i++){
            lstSimilarContacts.add(
                new Contact(
                    LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
                    AccountId = lstRelatedAccounts.get(i).Id,
                    Alternate_Email__c = 'john.doe@example.com'
                )
            );
        }

        Contact associatedContact = new Contact(
            LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull',
            AccountId = mlocidNullAccount.Id,
            Alternate_Email__c = 'john.doe@example.com'
        );

        lstSimilarContacts.add(associatedContact);

        INSERT lstSimilarContacts;

        YodleUtilities.flagEligibleContactByEmail(new List<Contact> { lstSimilarContacts[0] });

        Test.stopTest();

        List<Contact> lstFlaggedContacts = [
            SELECT  Id, 
                    Target_Account_E2C__c, 
                    Executed_Clause_For_Flagging_E2C__c
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE AND
                    LastName = 'FECBE_allAccDiff_AccRtEQStd_MlotpEQFalse_MlocidEQNull'
        ];

        System.assertEquals(1, lstFlaggedContacts.size());
        System.assertEquals(NULL, lstFlaggedContacts.get(0).Target_Account_E2C__c);
        System.assertEquals(
            '[Found Multiple Accounts that are Different] AND ' +
            '[Found NO YBNCorporateRelationship Account] AND ' +
            '[Found NO Primary MLOTP Account] AND ' +
            '[Found NO Account with Valid MLO CID]',
            lstFlaggedContacts.get(0).Executed_Clause_For_Flagging_E2C__c
        );
    }    
    
    testMethod
    static void NotKillCaseE2C_Salesforce_Local(){
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        INSERT newAcc;
        
        Case newCase = new Case();
        newCase.AccountId = newAcc.Id;
        newCase.SuppliedEmail = 'mangu@salesforce.com';
        newCase.Origin = 'Email';
        INSERT newCase;
        
        System.assertNotEquals(NULL, newCase.Id);
    }
        
    testMethod
    static void KillCaseE2C_Salesforce_YBN(){
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        INSERT newAcc;
    
        try{
            Case newCase = new Case();
            newCase.AccountId = newAcc.Id;
            newCase.SuppliedEmail = 'mangu@salesforce.com';
            newCase.Origin = 'YBN Email';
            
            INSERT newCase;
        } catch(DmlException e){
            List<Case> lstCases = [
                SELECT  Id 
                FROM    Case 
            ];
            
            System.assertEquals(0, lstCases.size());
            System.debug('Following exception has occured' + e.getMessage());
        }
    }
        
    testMethod
    static void KillCaseE2C_Jobvite_YBN(){
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        INSERT newAcc;
        
        try{
            Case newCase = new Case();
            newCase.AccountId = newAcc.Id;
            newCase.SuppliedEmail = 'mangu@jobvite.com';
            newCase.Origin = 'YBN Email';
            
            INSERT newCase;
        } catch(DmlException e){
            List<Case> lstCases = [
                SELECT  Id 
                FROM    Case 
            ];
            
            System.assertEquals(0, lstCases.size());
            System.debug('Following exception has occured' + e.getMessage());
        }
    }
        
    testMethod
    static void KillCaseE2C_Yodle_YBN(){
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        INSERT newAcc;
        
        try{
            Case newCase = new Case();
            newCase.AccountId = newAcc.Id;
            newCase.SuppliedEmail = 'mangu@yodle.com';
            newCase.Origin = 'YBN Email';
            
            INSERT newCase;
        } catch(DmlException e){
            List<Case> lstCases = [
                SELECT  Id 
                FROM    Case 
            ];
            
            System.assertEquals(0, lstCases.size());
            System.debug('Following exception has occured' + e.getMessage());
        }
    }

    testMethod
    static void KillCaseE2C_Chatter_YBN(){
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        INSERT newAcc;
        
        try{
            Case newCase = new Case();
            newCase.AccountId = newAcc.Id;
            newCase.SuppliedEmail = '@chatter.salesforce.com';
            newCase.Origin = 'YBN Email';
            INSERT newCase;
        } catch(DmlException e){
            List<Case> lstCases = [
                SELECT  Id 
                FROM    Case 
            ];

            System.assertEquals(0, lstCases.size());
            System.debug('Following exception has occured' + e.getMessage());
        }
    }        
        
    testMethod
    static void NotKillCaseE2C_Chatter_Local(){
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        INSERT newAcc;
        
        Case newCase = new Case();
        newCase.AccountId = newAcc.Id;
        newCase.SuppliedEmail = 'manky@chatter.salesforce.com';
        newCase.Origin = 'Email';
        INSERT newCase;
        
        System.assertNotEquals(NULL, newCase.Id);
    }       
       
    testMethod
    static void NotKillCaseE2C_TwoMen(){
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        INSERT newAcc;
        
        Case newCase = new Case();
        newCase.AccountId = newAcc.Id;
        newCase.SuppliedEmail = 'mangu@twomen.com';
        newCase.Origin = 'YBN Email';
        INSERT newCase;
        
        System.assertNotEquals(NULL, newCase.Id);
    }  
}