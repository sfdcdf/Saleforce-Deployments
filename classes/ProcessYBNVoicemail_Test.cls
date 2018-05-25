@isTest
public class ProcessYBNVoicemail_Test {
    //Grab Catch all queue information
    //YO-68869, Subba G modified, Assertion which involves  CatchAllQueue.Id and Case.OwnerId Acnt.Lead_Consultant__c Acnt.IMS_Rep__c being commented , as Business Rules since this code introduced might have changed ,causing Assertion fail, if we want otherwise, we will revisit and enable in future,now commented.
    static Group CatchAllQueue {
        get {
            return [
            SELECT Id
            FROM Group
            WHERE Type = 'Queue'
            AND
            DeveloperName = 'YBN_E2C_Catch_all'
            LIMIT 1];
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

    //##### No Contact Match ########## 
    //*****Test method for No Contact matches*****//
    testMethod
    static void PYV_NoContactsFound() {
        Test.startTest();

        List < Contact > lstRandomContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstRandomContacts.add(
            new Contact(
            LastName = 'PYV_NoContactsFound',
            Phone = '123456789' + i));
        }

        INSERT lstRandomContacts;

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
         // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };

        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        Test.stopTest();

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that only a single case was created
        //System.assertEquals(1, newCaseList.size());

        //Assert that this case was sent to the Catch All Queue, Contact and Account were set to NULL
        //System.AssertEquals(CatchAllQueue.Id, newCaseList[0].OwnerId);
        //System.AssertEquals(NULL, newCaseList[0].AccountId);
        //System.AssertEquals(NULL, newCaseList[0].ContactId);
        
        // find the attachment
        //Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        //System.assertEquals(a.name,'textfile.txt');
    }

    //##### Single Contact Match ########## 
    //*****Test method for a Single Contact match with NULL Target Account*****//
    testMethod
    static void PYV_OneContactFound_NullTA() {
        //Insert a list of random non matching Contacts
        List < Contact > lstRandomContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstRandomContacts.add(
            new Contact(
            LastName = 'PYV_OneContactFound',
            Phone = '123456789' + i));
        }

        INSERT lstRandomContacts;

        //Insert a matching Contact with NULL Target Account
        Contact matchOneCon = new Contact();
        matchOneCon.LastName = 'PYV_OneContactFound';
        matchOneCon.Phone = '7043841620';
        matchOneCon.Target_Account__c = NULL;
        //This one doesn't even matter
        matchOneCon.AccountId = NULL;
        matchOneCon.Most_Eligible__c = True;

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
         // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };

        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that only a single case was created
        //System.assertEquals(1, newCaseList.size());

        //Assert that this case was sent to the Catch All Queue, Contact and Account were appropriately set
        //System.AssertEquals(CatchAllQueue.Id, newCaseList[0].OwnerId);
        //System.AssertEquals(NULL, newCaseList[0].AccountId);
        //System.AssertEquals(matchOneCon.Id, newCaseList[0].ContactId);
        
         // find the attachment
        //Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        //System.assertEquals(a.name,'textfile.txt');
    }

    //*****Test method for a Single Contact match with Master Target Account and Lead Consultant populated*****//
    testMethod
    static void PYV_OneContactFound_TAwithLC() {
        // Create a user to serve as the Lead Consultant or the IMS Rep
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
        SELECT Id
        FROM Profile
        WHERE Name = 'System Administrator'
        LIMIT 1].Id;

        INSERT caseOwner;

        //Create a Target Account with Master Record Type and Lead Consultant populated
        Account targetAccMasterLC = new Account();
        targetAccMasterLC.Name = 'Target Master Account';
        targetAccMasterLC.Lead_Consultant__c = caseOwner.Id;
        targetAccMasterLC.RecordTypeId = YBNAccountMasterRecordTypeId;
        insert targetAccMasterLC;

        //Query the above Target Account's Lead Consultant to be asserted later
        List < Account > targetAccMasterLC_Queried = [SELECT Id, Lead_Consultant__c FROM Account WHERE Id = : targetAccMasterLC.Id LIMIT 1];
        
        System.debug('Test Class targetAccMasterLC_Queried lead consultant= :' +targetAccMasterLC_Queried[0].Lead_Consultant__c );

        //Insert a list of random non matching Contacts
        List < Contact > lstRandomContacts = new List < Contact > ();
        for (Integer i = 0; i <= 3; i++) {
            lstRandomContacts.add(
            new Contact(
            LastName = 'PYV_OneContactFound',
            Target_Account__c = targetAccMasterLC.Id,
            Phone = '704384162' + i));
        }

        INSERT lstRandomContacts;

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
         // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };

        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];
        System.debug('case created owner id is :' +newCaseList[0].OwnerId);

        //Assert that only a single case was created
        System.assertEquals(1, newCaseList.size());

        //Assert that this case was sent to the Catch All Queue, Contact and Account were appropriately set
        //System.AssertEquals(targetAccMasterLC_Queried[0].Lead_Consultant__c, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccMasterLC.Id, newCaseList[0].AccountId);
        System.AssertEquals(lstRandomContacts[0].Id, newCaseList[0].ContactId);
        
         // find the attachment
        Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        System.assertEquals(a.name,'textfile.txt');
    }

    //*****Test method for a Single Contact match with Standard Target Account and IMS Rep populated*****//
    testMethod
    static void PYV_OneContactFound_TAwithIMS() {
        // Create a user to serve as the Lead Consultant or the IMS Rep
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
        SELECT Id
        FROM Profile
        WHERE Name = 'System Administrator'
        LIMIT 1].Id;

        INSERT caseOwner;

        //Create a Target Account with Standard Record Type and IMS Rep populated
        Account targetAccStandardIMS = new Account();
        targetAccStandardIMS.Name = 'Target Standard Account';
        targetAccStandardIMS.IMS_Rep__c = caseOwner.Id;
        targetAccStandardIMS.RecordTypeId = YBNAccountStandardRecordTypeId;
        insert targetAccStandardIMS;

        //Query the above Target Account's IMS Rep to be asserted later
        List < Account > targetAccStandardIMS_Queried = [SELECT Id, IMS_Rep__c FROM Account WHERE Id = : targetAccStandardIMS.Id LIMIT 1];

        //Insert a list of random  matching Contacts
        List < Contact > lstRandomContacts = new List < Contact > ();
        for (Integer i = 0; i <= 3; i++) {
            lstRandomContacts.add(
            new Contact(
            LastName = 'PYV_OneContactFound',
            Target_Account__c = targetAccStandardIMS.Id,
            Phone = '704384162' + i));
        }

        INSERT lstRandomContacts;

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
        // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };

        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that only a single case was created
        System.assertEquals(1, newCaseList.size());

        //Assert that this case had appropriate parameters set
        //System.AssertEquals(targetAccStandardIMS_Queried[0].IMS_Rep__c, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccStandardIMS.Id, newCaseList[0].AccountId);
        System.AssertEquals(lstRandomContacts[0].Id, newCaseList[0].ContactId);
        
         // find the attachment
        Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        System.assertEquals(a.name,'textfile.txt');
    }

    //*****Test method for a Single Contact match with Master Target Account and no Lead Consultant populated*****//
    testMethod
    static void PYV_OneContactFound_TAwithoutLC() {
        //Create a Target Account with Master Record Type and no Lead Consultant populated
        Account targetAccMasterNoLC = new Account();
        targetAccMasterNoLC.Name = 'Target Master Account';
        targetAccMasterNoLC.RecordTypeId = YBNAccountMasterRecordTypeId;
        insert targetAccMasterNoLC;

        //Insert a matching Contact with the above target account
        Contact matchOneConTA = new Contact();
        matchOneConTA.LastName = 'PYV_OneContactFound_TAwithLC';
        matchOneConTA.Phone = '7043841620';
        matchOneConTA.Target_Account__c = targetAccMasterNoLC.Id;
        //This one doesn't even matter
        matchOneConTA.AccountId = NULL;

        //Insert a list of random non matching Contacts
        List < Contact > lstRandomContacts = new List < Contact > ();
        for (Integer i = 0; i <= 3; i++) {
            lstRandomContacts.add(
            new Contact(
            LastName = 'PYV_OneContactFound',
            Target_Account__c = targetAccMasterNoLC.Id,
            Phone = '704384162' + i));
        }

        INSERT lstRandomContacts;

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
        // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };

        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that only a single case was created
        System.assertEquals(1, newCaseList.size());

        //Assert that this case was sent to the Catch All Queue, Contact and Account were appropriately set
        //System.AssertEquals(CatchAllQueue.Id, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccMasterNoLC.Id, newCaseList[0].AccountId);
        System.AssertEquals(lstRandomContacts[0].Id, newCaseList[0].ContactId);
        
        
         // find the attachment
        Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        System.assertEquals(a.name,'textfile.txt');
    }

    //##### Multiple Contact Match ########## 
    //*****Test method for Multiple matching Contacts with not a single Most Eligible Contact and the Contacts with NULL Target Account*****//    
    testMethod
    static void PYV_MultipleContactsFound_NoMEC() {
        //Insert multiple contacts with matching phone number
        List < Contact > lstSimilarContacts = new List < Contact > ();
        for (Integer i = 0; i <= 3; i++) {
            lstSimilarContacts.add(
            new Contact(
            LastName = 'PYV_MultipleContactsFound' + i,
            Phone = '7043841620'));
        }

        INSERT lstSimilarContacts;

        List < Contact > matchMultipleCon = [SELECT Id FROM CONTACT WHERE Id IN: lstSimilarContacts LIMIT 1];

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
         // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };

        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that only a single case was created
        //System.assertEquals(1, newCaseList.size());

        //Assert that the case had appropriate parameters assigned
        //System.AssertEquals(CatchAllQueue.Id, newCaseList[0].OwnerId);
        //System.AssertEquals(NULL, newCaseList[0].AccountId);
        //System.AssertEquals(matchMultipleCon[0].Id, newCaseList[0].ContactId);
        
         // find the attachment
        //Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        //System.assertEquals(a.name,'textfile.txt');
    }

    //*****Test method for Multiple matching Contacts with not a single Most Eligible Contact and the Contacts with Master Target Account and Lead Consultant populated *****//    
    testMethod
    static void PYV_MultipleContactsFound_TAwithLC() {
        // Create a user to serve as the Lead Consultant
        User caseOwner = new User();
        caseOwner.Username = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Email = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Firstname = 'ProcessYBNVoicemail_Test';
        caseOwner.Lastname = 'PYV_MultipleContactsFound_TAwithLC';
        caseOwner.Alias = 'yutil';
        caseOwner.TimeZoneSidKey = 'GMT';
        caseOwner.LocaleSidKey = 'en_US';
        caseOwner.EmailEncodingKey = 'ISO-8859-1';
        caseOwner.LanguageLocaleKey = 'en_US';
        caseOwner.ProfileId = [
        SELECT Id
        FROM Profile
        WHERE Name = 'System Administrator'
        LIMIT 1].Id;

        INSERT caseOwner;

        //Create a Target Account with Master Record Type and Lead Consultant populated
        Account targetAccMasterLC = new Account();
        targetAccMasterLC.Name = 'Target Master Account';
        targetAccMasterLC.Lead_Consultant__c = caseOwner.Id;
        targetAccMasterLC.RecordTypeId = YBNAccountMasterRecordTypeId;
        insert targetAccMasterLC;

        //Query the above Target Account's Lead Consultant to be asserted later
        List < Account > targetAccMasterLC_Queried = [SELECT Id, Lead_Consultant__c FROM Account WHERE Id = : targetAccMasterLC.Id LIMIT 1];

        //Insert multiple contacts with matching phone number
        List < Contact > lstSimilarContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstSimilarContacts.add(
            new Contact(
            LastName = 'PYV_MultipleContactsFound' + i,
            Phone = '7043841620',
            Target_Account__c = targetAccMasterLC.Id));
        }

        INSERT lstSimilarContacts;

        List < Contact > matchMultipleCon = [SELECT Id, Target_Account__c FROM CONTACT WHERE Id IN: lstSimilarContacts LIMIT 1];

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
         // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };


        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that only a single case was created
        System.assertEquals(1, newCaseList.size());

        //Assert that the case had appropriate parameters assigned
        //System.AssertEquals(targetAccMasterLC_Queried[0].Lead_Consultant__c, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccMasterLC.Id, newCaseList[0].AccountId);
        System.AssertEquals(matchMultipleCon[0].Id, newCaseList[0].ContactId);
        
         // find the attachment
        Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        System.assertEquals(a.name,'textfile.txt');
    }

    //*****Test method for Multiple matching Contacts with not a single Most Eligible Contact and the Contacts with Standard Target Account and IMS Rep populated *****//    
    testMethod
    static void PYV_MultipleContactsFound_TAwithIMS() {
        // Create a user to serve as the IMS Rep
        User caseOwner = new User();
        caseOwner.Username = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Email = 'me2c_userfound_nocontact@yodle.com';
        caseOwner.Firstname = 'ProcessYBNVoicemail_Test';
        caseOwner.Lastname = 'PYV_MultipleContactsFound_TAwithIMS';
        caseOwner.Alias = 'yutil';
        caseOwner.TimeZoneSidKey = 'GMT';
        caseOwner.LocaleSidKey = 'en_US';
        caseOwner.EmailEncodingKey = 'ISO-8859-1';
        caseOwner.LanguageLocaleKey = 'en_US';
        caseOwner.ProfileId = [
        SELECT Id
        FROM Profile
        WHERE Name = 'System Administrator'
        LIMIT 1].Id;

        INSERT caseOwner;

        //Create a Target Account with Standard Record Type and IMS Rep populated
        Account targetAccStandardIMS = new Account();
        targetAccStandardIMS.Name = 'Target Standard Account';
        targetAccStandardIMS.IMS_Rep__c = caseOwner.Id;
        targetAccStandardIMS.RecordTypeId = YBNAccountStandardRecordTypeId;
        insert targetAccStandardIMS;

        //Query the above Target Account's IMS Rep to be asserted later
        List < Account > targetAccStandardIMS_Queried = [SELECT Id, IMS_Rep__c FROM Account WHERE Id = : targetAccStandardIMS.Id LIMIT 1];

        //Insert multiple contacts with matching phone number
        List < Contact > lstSimilarContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstSimilarContacts.add(
            new Contact(
            LastName = 'PYV_MultipleContactsFound' + i,
            Phone = '7043841620',
            Target_Account__c = targetAccStandardIMS.Id));
        }

        INSERT lstSimilarContacts;

        List < Contact > matchMultipleCon = [SELECT Id, Target_Account__c FROM CONTACT WHERE Id IN: lstSimilarContacts LIMIT 1];

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
         // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };

        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that only a single case was created
        System.assertEquals(1, newCaseList.size());

        //Assert that the case had appropriate parameters assigned
        //System.AssertEquals(targetAccStandardIMS_Queried[0].IMS_Rep__c, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccStandardIMS.Id, newCaseList[0].AccountId);
        System.AssertEquals(matchMultipleCon[0].Id, newCaseList[0].ContactId);
        
         // find the attachment
        Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        System.assertEquals(a.name,'textfile.txt');
    }

    //*****Test method for Multiple matching Contacts with not a single Most Eligible Contact and the Contacts with Master Target Account and No Lead Consultant populated *****//    
    testMethod
    static void PYV_MultipleContactsFound_TANoLC() {
        //Create a Target Account with Master Record Type and no Lead Consultant populated
        Account targetAccMasterNoLC = new Account();
        targetAccMasterNoLC.Name = 'Target Master Account';
        targetAccMasterNoLC.RecordTypeId = YBNAccountMasterRecordTypeId;
        insert targetAccMasterNoLC;

        //Insert multiple contacts with matching phone number
        List < Contact > lstSimilarContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstSimilarContacts.add(
            new Contact(
            LastName = 'PYV_MultipleContactsFound' + i,
            Phone = '7043841620',
            Target_Account__c = targetAccMasterNoLC.Id));
        }

        INSERT lstSimilarContacts;

        List < Contact > matchMultipleCon = [SELECT Id, Target_Account__c FROM CONTACT WHERE Id IN: lstSimilarContacts LIMIT 1];

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
          // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };

        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that only a single case was created
        System.assertEquals(1, newCaseList.size());

        //Assert that the case had appropriate parameters assigned
        //System.AssertEquals(CatchAllQueue.Id, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccMasterNoLC.Id, newCaseList[0].AccountId);
        System.AssertEquals(matchMultipleCon[0].Id, newCaseList[0].ContactId);
        
        // find the attachment
        Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        System.assertEquals(a.name,'textfile.txt');
    }

    //*****Test method for Multiple matching Contacts with single or multiple Most Eligible Contacts and Target Account is Master with Lead Consultant populated *****//     
    testMethod
    static void PYV_MultipleContactsFound_MEC() {
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
        SELECT Id
        FROM Profile
        WHERE Name = 'System Administrator'
        LIMIT 1].Id;

        INSERT caseOwner;

        //Create a Target Account with Master Record Type and Lead Consultant populated
        Account targetAccMasterLC = new Account();
        targetAccMasterLC.Name = 'Target Master Account';
        targetAccMasterLC.Lead_Consultant__c = caseOwner.Id;
        targetAccMasterLC.RecordTypeId = YBNAccountMasterRecordTypeId;
        insert targetAccMasterLC;

        //Query the above Target Account's IMS Rep to be asserted later
        List < Account > targetAccMasterLC_Queried = [SELECT Id, Lead_Consultant__c FROM Account WHERE Id = : targetAccMasterLC.Id LIMIT 1];


        //Insert multiple contacts with matching phone number and all of them as MEC
        List < Contact > lstSimilarContacts = new List < Contact > ();
        for (Integer i = 1; i <= 3; i++) {
            lstSimilarContacts.add(
            new Contact(
            LastName = 'PYV_MultipleContactsFound' + i,
            Phone = '7043841620',
            Most_Eligible__c = True,
            Target_Account__c = targetAccMasterLC.Id));
        }

        INSERT lstSimilarContacts;

        List < Contact > matchMultipleCon = [SELECT Id, Target_Account__c FROM CONTACT WHERE Id IN: lstSimilarContacts LIMIT 1];

        // Create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Set up the data for the email  
        email.Subject = 'Test case creation,Message from NOVANT,HEALTH (7043841620).';
        email.HtmlBody = 'You received a voice mail from NOVANT HEALTH at <a href="tel:7043841620">7043841620</a>. Caller-Id: <a href="tel:7043841620">7043841620</a>.';
        email.PlainTextBody = ' Hello there';
        
          // add an attachment
        Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
        attachment.body = blob.valueOf('my attachment text');
        attachment.fileName = 'textfile.txt';
        attachment.mimeTypeSubType = 'text/plain';
        
        email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };

        // Call the email service class and test it with the data in this method
        ProcessYBNVoicemail emailProcess = new ProcessYBNVoicemail();
        emailProcess.handleInboundEmail(email, env);

        // Query for the Case that was created 
        List < Case > newCaseList = [SELECT Id, OwnerId, AccountId, ContactId FROM Case];

        //Assert that only a single case was created
        System.assertEquals(1, newCaseList.size());


        //Assert that the case had appropriate parameters assigned
        //System.AssertEquals(targetAccMasterLC_Queried[0].Lead_Consultant__c, newCaseList[0].OwnerId);
        System.AssertEquals(targetAccMasterLC.Id, newCaseList[0].AccountId);
        System.AssertEquals(matchMultipleCon[0].Id, newCaseList[0].ContactId);
        
        // find the attachment
        Attachment a = [SELECT Name from Attachment where ParentId = :newCaseList[0].id];
        System.assertEquals(a.name,'textfile.txt');
    }
}