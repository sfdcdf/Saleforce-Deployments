@isTest
public class EmailToCaseManager_Test {
    //Grab Catch all queue information
    static Group CatchAllQueue {
        get {
            return [
                SELECT  Id
                FROM    Group
                WHERE   Type = 'Queue' AND
                        DeveloperName = 'YBN_E2C_Catch_all'
                LIMIT 1
            ];
        }
    }

    //Grab Record Type info for Master and Standard Account record Types
    static Id YBNAccountMasterRecordTypeId {
        get {
            return Schema.SObjectType.Account.getRecordTypeInfosByName().get('YBN Master Account').getRecordTypeId();
        }
    }

    static Id YBNAccountStandardRecordTypeId {
        get {
            return Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
        }
    }

    //Methods for testing Right side of the flow 
    //One of the 5 emails and No Contact match
    testMethod
    static void YE_NoContactsFound_OneOfFive() {
        Test.startTest();
        
        // Create Test Account
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        newAccount.RecordTypeId = YBNAccountStandardRecordTypeId;
       
        INSERT newAccount;
        
        //Create a Case
        Case newCase = new Case();
        newCase.Origin = 'YBN Email';
        newCase.AccountId = newAccount.Id;
        newCase.Status = 'In Progress';

        INSERT newCase;

        List < Contact > lstRandomContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstRandomContacts.add(
                new Contact(
                    LastName = 'YE_NoContactsFound_OneOfFive',
                    Email = i + 'abc@gmail.com'
                )
            );
        }

        INSERT lstRandomContacts;

        EmailMessage emsg = new EmailMessage();
        emsg.ToAddress = 'dwyerbrandsupport@yodle.com';
        emsg.FromAddress = 'univ.mayank@gmail.com';
        emsg.ParentId = newCase.Id;
        emsg.Incoming = TRUE;

        INSERT emsg;

        Test.stopTest();
        
        // Query for the Case that was updated 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert all case attributes were appropriately set
        //System.assertEquals(CatchAllQueue.Id, newCaseList[0].OwnerId);
        //System.assertEquals(NULL, newCaseList[0].AccountId);
        //System.assertEquals(NULL, newCaseList[0].ContactId);
    }

    //  One of the 5 emails and One Contact match with TA and LC 
    testMethod
    static void YE_OneConFound_OneOfFive_TAWithLC() {
        Test.startTest();
         
        // Create Test Account
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        newAccount.RecordTypeId = YBNAccountStandardRecordTypeId;
        
        INSERT newAccount; 
                
        //Create a Case
        Case newCase = new Case();
        newCase.Origin = 'YBN Email';
        newCase.AccountId = newAccount.Id;
        newCase.Status = 'In Progress';

        INSERT newCase;

        User caseOwner = new User();
        caseOwner.Username = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Email = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Firstname = 'abc';
        caseOwner.Lastname = 'YE_OneConFound_OneOfFive';
        caseOwner.Alias = 'yutil';
        caseOwner.TimeZoneSidKey = 'GMT';
        caseOwner.LocaleSidKey = 'en_US';
        caseOwner.EmailEncodingKey = 'ISO-8859-1';
        caseOwner.LanguageLocaleKey = 'en_US';
        caseOwner.ProfileId = [
            SELECT  Id
            FROM    Profile
            WHERE   Name = 'System Administrator'
            LIMIT 1
        ].Id;

        INSERT caseOwner;

        //Create a Target Account with Master Record Type and Lead Consultant populated
        Account targetAccMasterLC = new Account();
        targetAccMasterLC.Name = 'Target Master Account';
        targetAccMasterLC.Lead_Consultant__c = caseOwner.Id;
        targetAccMasterLC.RecordTypeId = YBNAccountMasterRecordTypeId;

        INSERT targetAccMasterLC;

        //Query the above Target Account's Lead Consultant to be asserted later
        List < Account > targetAccMasterLC_Queried = [
            SELECT  Id, 
                    Lead_Consultant__c 
            FROM    Account 
            WHERE   Id = : targetAccMasterLC.Id 
            LIMIT   1
        ];

        List < Contact > lstRandomContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstRandomContacts.add(
                new Contact(
                    AccountId = targetAccMasterLC.Id,
                    LastName = 'YE_OneConFound_OneOfFive_TAWithLC',
                    Alternate_Email__c = i + 'abc@gmail.com'
                )
            );
        }

        INSERT lstRandomContacts;

        EmailMessage emsg = new EmailMessage();
        emsg.ToAddress = 'dwyerbrandsupport@yodle.com';
        emsg.FromAddress = '1abc@gmail.com';
        emsg.ParentId = newCase.Id;
        emsg.Incoming = TRUE;

        INSERT emsg;

        Test.stopTest();
        
        // Query for the Case that was updated 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert all Case attrbiutes
        System.AssertEquals(targetAccMasterLC_Queried[0].Lead_Consultant__c, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccMasterLC.Id, newCaseList[0].AccountId);
        System.AssertEquals(lstRandomContacts[0].Id, newCaseList[0].ContactId);
    }

    //  One of the 5 emails and One Contact match with TA and IMS 
    testMethod
    static void YE_OneConFound_OneOfFive_TAWithIMS() {
        Test.startTest();
                
        // Create Test Account
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        newAccount.RecordTypeId = YBNAccountStandardRecordTypeId;
        
        INSERT newAccount;
                
        //Create a Case
        Case newCase = new Case();
        newCase.Origin = 'YBN Email';
        newCase.AccountId = newAccount.Id;
        newCase.Status = 'In Progress';

        INSERT newCase;

        // Create a user to serve as the IMS Rep
        User caseOwner = new User();
        caseOwner.Username = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Email = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Firstname = 'ProcessYBNVoicemail_Test';
        caseOwner.Lastname = 'PYV_OneContactFound';
        caseOwner.Alias = 'yutil';
        caseOwner.TimeZoneSidKey = 'GMT';
        caseOwner.LocaleSidKey = 'en_US';
        caseOwner.EmailEncodingKey = 'ISO-8859-1';
        caseOwner.LanguageLocaleKey = 'en_US';
        caseOwner.ProfileId = [
            SELECT  Id
            FROM    Profile
            WHERE   Name = 'System Administrator'
            LIMIT   1
        ].Id;

        INSERT caseOwner;

        //Create a Target Account with Standard Record Type and IMS Rep populated
        Account targetAccStandardIMS = new Account();
        targetAccStandardIMS.Name = 'Target Standard Account';
        targetAccStandardIMS.IMS_Rep__c = caseOwner.Id;
        targetAccStandardIMS.RecordTypeId = YBNAccountStandardRecordTypeId;
        INSERT targetAccStandardIMS;

        //Query the above Target Account's IMS Rep to be asserted later
        List < Account > targetAccStandardIMS_Queried = [
            SELECT  Id, 
                    IMS_Rep__c 
            FROM    Account 
            WHERE   Id = : targetAccStandardIMS.Id 
            LIMIT   1
        ];

        List < Contact > lstRandomContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstRandomContacts.add(
                new Contact(
                    AccountId = targetAccStandardIMS.Id,
                    LastName = 'YE_OneConFound_OneOfFive_TAWithLC',
                    Alternate_Email__c = i + 'abc@gmail.com'
                )
            );
        }

        INSERT lstRandomContacts;

        EmailMessage emsg = new EmailMessage();
        emsg.ToAddress = 'jciwebsites@yodle.com';
        emsg.FromAddress = '1abc@gmail.com';
        emsg.ParentId = newCase.Id;
        emsg.Incoming = TRUE;

        INSERT emsg;
        
        Test.stopTest();
        
        // Query for the Case that was updated 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        System.AssertEquals(targetAccStandardIMS_Queried[0].IMS_Rep__c, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccStandardIMS.Id, newCaseList[0].AccountId);
        System.AssertEquals(lstRandomContacts[0].Id, newCaseList[0].ContactId);
    }

    //One of the 5 emails and multiple contact found with single or multiple Most eligible Contacts and Target Account is Master with Lead Consultant populated  
    
    testMethod
    static void YE_MulConFound_MEC_OneOfFive_TAWithLC() {
        
        Test.startTest();
        
        // Create Test Account
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        newAccount.RecordTypeId = YBNAccountStandardRecordTypeId;
        
        INSERT newAccount;
        
        //Create a Case
        Case newCase = new Case();
        newCase.Origin = 'YBN Email';
        newCase.AccountId = newAccount.Id;
        newCase.Status = 'In Progress';
         
        INSERT newCase;
           
        // Create a user to serve as the Lead Consultant
        User caseOwner = new User();
        caseOwner.Username = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Email = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Firstname = 'ProcessYBNVoicemail_Test';
        caseOwner.Lastname = 'PYV_OneContactFound';
        caseOwner.Alias = 'yutil';
        caseOwner.TimeZoneSidKey = 'GMT';
        caseOwner.LocaleSidKey = 'en_US';
        caseOwner.EmailEncodingKey = 'ISO-8859-1';
        caseOwner.LanguageLocaleKey = 'en_US';
        caseOwner.ProfileId = [
            SELECT  Id
            FROM    Profile
            WHERE   Name = 'System Administrator'
            LIMIT   1
        ].Id;

        INSERT caseOwner;

        //Create a Target Account with Master Record Type and Lead Consultant populated
        Account targetAccMasterLC = new Account();
        targetAccMasterLC.Name = 'Target Master Account';
        targetAccMasterLC.Lead_Consultant__c = caseOwner.Id;
        targetAccMasterLC.RecordTypeId = YBNAccountMasterRecordTypeId;
        
        INSERT targetAccMasterLC;

        //Query the above Target Account's Lead Consultant to be asserted later
        List < Account > targetAccMasterLC_Queried = [
            SELECT  Id, 
                    Lead_Consultant__c 
            FROM    Account 
            WHERE   Id = : targetAccMasterLC.Id 
            LIMIT   1
        ];


        //Insert multiple contacts with matching emails
        List < Contact > lstSimilarContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstSimilarContacts.add(
                new Contact(
                    AccountId = targetAccMasterLC.Id,
                    LastName = 'YE_MultipleContactsFound' + i,
                    Alternate_Email__c ='abc@gmail.com'
                )
            );
        }

        INSERT lstSimilarContacts;
        
        EmailMessage emsg = new EmailMessage();
        emsg.ToAddress = 'jciwebsites@yodle.com';
        emsg.FromAddress = 'abc@gmail.com';
        emsg.ParentId = newCase.Id;
        emsg.Incoming = TRUE;
        
        INSERT emsg;
        
        Test.stopTest();

        //Query for the Flagged Contact
        Contact mostEligibleCon = [
            SELECT  Id, 
                    Target_Account_E2C__c 
            FROM    Contact 
            WHERE   Id IN: lstSimilarContacts AND
                    Most_Eligible_E2C__c = TRUE
        ];
        
        // Query for the Case that was updated 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that the case had appropriate parameters assigned        
        System.AssertEquals(targetAccMasterLC_Queried[0].Lead_Consultant__c, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccMasterLC.Id, newCaseList[0].AccountId);
        System.AssertEquals(mostEligibleCon.Id, newCaseList[0].ContactId);
    }
    
    //None of the 5 Emails, To is found as a User and FROM is an MEC with Master Account and Lead Consultant
    
    testMethod
    static void YE_OneConFound_NoneOfFive_MEC_TAWithLC() {
        
        Test.startTest();
                
        // Create Test Account
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        newAccount.RecordTypeId = YBNAccountStandardRecordTypeId;
        
        INSERT newAccount;        
                
        //Create a Case
        Case newCase = new Case();
        newCase.Origin = 'YBN Email';
        newCase.AccountId = newAccount.Id;
        newCase.Status = 'In Progress';
        INSERT newCase;
        
        User caseOwner = new User();
        caseOwner.Username = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Email = 'YE_OneConFound_NoneOfFive@yodle.com';
        caseOwner.Firstname = 'abc';
        caseOwner.Lastname = 'YE_OneConFound_OneOfFive';
        caseOwner.Alias = 'yutil';
        caseOwner.TimeZoneSidKey = 'GMT';
        caseOwner.LocaleSidKey = 'en_US';
        caseOwner.EmailEncodingKey = 'ISO-8859-1';
        caseOwner.LanguageLocaleKey = 'en_US';
        caseOwner.ProfileId = [
            SELECT  Id
            FROM    Profile
            WHERE   Name = 'System Administrator'
            LIMIT 1
        ].Id;

        INSERT caseOwner;
        
        //Create an Account with Master Record Type and Lead Consultant populated
        Account targetAccMasterLC = new Account();
        targetAccMasterLC.Name = 'Target Master Account';
        targetAccMasterLC.Lead_Consultant__c = caseOwner.Id;
        targetAccMasterLC.RecordTypeId = YBNAccountMasterRecordTypeId;

        INSERT targetAccMasterLC;
        
        //Query the above Target Account's Lead Consultant to be asserted later
        List < Account > targetAccMasterLC_Queried = [
            SELECT  Id, 
                    Lead_Consultant__c 
            FROM    Account 
            WHERE   Id = : targetAccMasterLC.Id 
            LIMIT   1
        ];
        
        //Insert a matching Contact with account set to Master Account above
        Contact matchOneCon = new Contact();
        matchOneCon.LastName = 'YE_OneConFound_NoneOfFive';
        matchOneCon.AccountId = targetAccMasterLC.Id;
        matchOneCon.Alternate_Email__c = 'univ.mayank@gmail.com';
        
        INSERT matchOneCon;
        
        EmailMessage emsg = new EmailMessage();
        emsg.ToAddress = 'YE_OneConFound_NoneOfFive@yodle.com';
        emsg.FromAddress = 'univ.mayank@gmail.com';
        emsg.ParentId = newCase.Id;
        emsg.Incoming = TRUE;
        
        INSERT emsg;
        
        Test.stopTest();
        
        //Query for the Flagged Contact
        Contact mostEligibleCon = [
            SELECT  Id, 
                    Target_Account_E2C__c 
            FROM    Contact 
            WHERE   Most_Eligible_E2C__c = TRUE
        ];
        
        // Query for the Case that was updated 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];
        
        //Assert that the case had appropriate parameters assigned        
        System.AssertEquals(caseOwner.Id, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccMasterLC.Id, newCaseList[0].AccountId);
        System.AssertEquals(mostEligibleCon.Id, newCaseList[0].ContactId);
        
    }
    
    //None of the 5 Emails, To is not found as a user and FROM is also not found
    
    testMethod
    static void YE_NoConFound_NoneOfFive() {
        
        Test.startTest();
                
        // Create Test Account
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        newAccount.RecordTypeId = YBNAccountStandardRecordTypeId;
        
        INSERT newAccount;
                
        //Create a Case
        Case newCase = new Case();
        newCase.Origin = 'YBN Email';
        newCase.AccountId = newAccount.Id;
        newCase.Status = 'In Progress';
        INSERT newCase;
        
        User caseOwner = new User();
        caseOwner.Username = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Email = 'NoneOfFive@yodle.com';
        caseOwner.Firstname = 'abc';
        caseOwner.Lastname = 'YE_NoConFound_NoneOfFive';
        caseOwner.Alias = 'yutil';
        caseOwner.TimeZoneSidKey = 'GMT';
        caseOwner.LocaleSidKey = 'en_US';
        caseOwner.EmailEncodingKey = 'ISO-8859-1';
        caseOwner.LanguageLocaleKey = 'en_US';
        caseOwner.ProfileId = [
            SELECT  Id
            FROM    Profile
            WHERE   Name = 'System Administrator'
            LIMIT 1
        ].Id;

        INSERT caseOwner;
        
        //Create an Account with Master Record Type and Lead Consultant populated
        Account targetAccMasterLC = new Account();
        targetAccMasterLC.Name = 'Target Master Account';
        targetAccMasterLC.Lead_Consultant__c = caseOwner.Id;
        targetAccMasterLC.RecordTypeId = YBNAccountMasterRecordTypeId;

        INSERT targetAccMasterLC;
        
        //Query the above Target Account's Lead Consultant to be asserted later
        List < Account > targetAccMasterLC_Queried = [
            SELECT  Id, 
                    Lead_Consultant__c 
            FROM    Account 
            WHERE   Id = : targetAccMasterLC.Id 
            LIMIT   1
        ];
        
        //Insert a non matching Contact with account set to Master Account above
        Contact nonMatchOneCon = new Contact();
        nonMatchOneCon.LastName = 'YE_OneConFound_NoneOfFive';
        nonMatchOneCon.AccountId = targetAccMasterLC.Id;
        nonMatchOneCon.Alternate_Email__c = 'univ123.mayank@gmail.com';
        
        INSERT nonMatchOneCon;
        
        EmailMessage emsg = new EmailMessage();
        emsg.ToAddress = 'YE_OneConFound_NoneOfFive@yodle.com';
        emsg.FromAddress = 'univ.mayank@gmail.com';
        emsg.ParentId = newCase.Id;
        emsg.Incoming = TRUE;
        
        INSERT emsg;
        
        Test.stopTest();
        
        
        // Query for the Case that was updated 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];
        
        //Assert that the case had appropriate parameters assigned        
        //System.AssertEquals(CatchAllQueue.Id, newCaseList[0].OwnerId);
        //System.AssertEquals(NULL, newCaseList[0].AccountId);
        //System.AssertEquals(NULL, newCaseList[0].ContactId);
        
    }
    
    
    
}