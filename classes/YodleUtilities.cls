public class YodleUtilities{
    /*Global Variables, Properties and Classes*/
    private static Map<Id, Contact> mapContactsToUpdate;
    private static Map<Id, Contact> mapContactsToUpdateByEmail;

    private static String memoryDump;

    private static String YBNCorporateRelationship{
        get{
            return 'YBN_Corporate_Relationship';
        }
    }

    private static String Standard{
        get{
            return 'Standard';
        }
    }

    /*Support Setting Keys*/
    private static String SSK_RestrictedE2CDomains{
        get{
            return 'Restricted_E2C_Domains';
        }
    }

    public static void flagEligibleContact(List<Contact> lstContacts){
        try{
            Set<String> setContactPhoneNumbers = new Set<String>();
            for(Contact con : lstContacts){
                if(con.Phone != NULL && !String.isEmpty(con.Phone)){
                    setContactPhoneNumbers.add(con.Phone);
                }
                
                else if(con.MobilePhone != NULL && !String.isEmpty(con.MobilePhone)){
                    setContactPhoneNumbers.add(con.MobilePhone);
                }
                
                else if(con.OtherPhone != NULL && !String.isEmpty(con.OtherPhone)){
                    setContactPhoneNumbers.add(con.OtherPhone);
                }            
            }

            System.debug(setContactPhoneNumbers);
            
            List<Contact> lstSimilarContacts = [
                SELECT  Id,
                        Phone,
                        MobilePhone,
                        OtherPhone,
                        AccountId,
                        Most_Eligible__c
                FROM    Contact 
                WHERE   (
                            Phone IN :setContactPhoneNumbers AND
                            Phone != NULL
                        ) OR
                        (
                            MobilePhone IN :setContactPhoneNumbers AND
                            MobilePhone != NULL
                        ) OR
                        (
                            OtherPhone IN :setContactPhoneNumbers AND
                            OtherPhone != NULL
                        )
            ];

            System.debug(lstSimilarContacts);
            

            Map<String, List<Contact>> mapSimilarContacts = new Map<String, List<Contact>>();
            for(Contact similarCon : lstSimilarContacts){
                String phoneFound;
                if(setContactPhoneNumbers.contains(similarCon.Phone))
                    phoneFound = similarCon.Phone;
                else if(setContactPhoneNumbers.contains(similarCon.MobilePhone))
                    phoneFound = similarCon.MobilePhone;
                else if(setContactPhoneNumbers.contains(similarCon.OtherPhone))
                    phoneFound = similarCon.OtherPhone;

                if(phoneFound != NULL){
                    if(mapSimilarContacts.containsKey(phoneFound))
                        mapSimilarContacts.get(phoneFound).add(similarCon);
                    else
                        mapSimilarContacts.put(phoneFound, new List<Contact> { similarCon });
                }
            }

            System.debug(mapSimilarContacts);
            
            Set<Id> setAccountIds = new Set<Id>();
            for(Contact similarCon : lstSimilarContacts){
                if(similarCon.AccountId != NULL){
                    setAccountIds.add(similarCon.AccountId);
                }
            }

            System.debug(setAccountIds);
            
            Map<Id, Account> mapRelatedAccounts = new Map<Id, Account>([
                SELECT  Id,
                        IMS_Rep__c,
                        Client_ID__c,
                        Lead_Consultant__c,
                        RecordType.DeveloperName, 
                        Primary_Multi_Location_Owner_For_TP__c,
                        Multi_Location_Owner_Primary_CID__c
                FROM    Account 
                WHERE   Id IN :setAccountIds
            ]);

            System.debug(mapRelatedAccounts);
            
            Set<String> setMLOCIDs = new Set<String>();
            for(Account relatedAcc : mapRelatedAccounts.values()){
                if(
                    relatedAcc.Multi_Location_Owner_Primary_CID__c != NULL && 
                    !String.isBlank(relatedAcc.Multi_Location_Owner_Primary_CID__c)
                ){
                    setMLOCIDs.add(relatedAcc.Multi_Location_Owner_Primary_CID__c);
                }
            }

            Map<String, Account> mapClientIDToAccount = new Map<String, Account>();
            for(
                Account relatedAcc :
                [
                    SELECT  Id,
                            IMS_Rep__c,
                            Client_ID__c,
                            Lead_Consultant__c,
                            RecordType.DeveloperName, 
                            Primary_Multi_Location_Owner_For_TP__c,
                            Multi_Location_Owner_Primary_CID__c
                    FROM    Account 
                    WHERE   Client_ID__c IN :setMLOCIDs
                ]
            ){
                mapClientIDToAccount.put(relatedAcc.Client_ID__c, relatedAcc);
            }
            
            System.debug(mapClientIDToAccount);
            memoryDump += '[mapClientIDToAccount=' + String.join(mapClientIDToAccount.values(), ',') + ']';

            Map<Id, Map<Contact, Account>> mapContactsToProcess = 
                new Map<Id, Map<Contact, Account>>();
            for(Contact con : lstContacts){
                mapContactsToProcess.put(con.Id, new Map<Contact, Account>());

                String key;
                if(mapSimilarContacts.containsKey(con.Phone))
                    key = con.Phone;
                else if(mapSimilarContacts.containsKey(con.MobilePhone))
                    key = con.MobilePhone;
                else if(mapSimilarContacts.containsKey(con.OtherPhone))
                    key = con.OtherPhone;

                if(key != NULL){
                    for(Contact similarCon : mapSimilarContacts.get(key)){
                        if(mapRelatedAccounts.containsKey(similarCon.AccountId)){
                            mapContactsToProcess.get(con.Id).put(
                                similarCon, 
                                mapRelatedAccounts.get(similarCon.AccountId)
                            );
                        }
                        else{
                            mapContactsToProcess.get(con.Id).put(
                                similarCon, 
                                NULL
                            );
                        }
                    }
                }
            }
            
            System.debug(mapContactsToProcess);
            memoryDump += '[mapContactsToProcess:key=' + mapContactsToProcess.keySet() + ']';
            memoryDump += '[mapContactsToProcess:values=' + String.join(mapContactsToProcess.values(), ',') + ']';

            mapContactsToUpdate = new Map<Id, Contact>();
            for(Id contactId : mapContactsToProcess.keySet()){
                if(!isContactFlagged(contactId)){
                    Boolean hasAnyAccount = FALSE;
                    List<Account> lstRelatedAccounts = mapContactsToProcess.get(contactId).values();
                    lstSimilarContacts = new List<Contact>();
                    lstSimilarContacts.addAll(mapContactsToProcess.get(contactId).keySet());
                    
                    memoryDump += '[lstSimilarContacts=' + String.join(lstSimilarContacts, ',') + ']';
                    memoryDump += '[lstRelatedAccounts=' + String.join(lstRelatedAccounts, ',') + ']';

                    //Clause 1
                    if(isEmpty(lstRelatedAccounts)){
                        if(!anyContactFlagged(lstSimilarContacts)){
                            Contact randomContact = lstSimilarContacts.get(getRandomIndex(lstSimilarContacts.size()));

                            mapContactsToUpdate.put(
                                randomContact.Id,
                                new Contact(
                                    Id = randomContact.Id,
                                    Most_Eligible__c = TRUE,
                                    Target_Account__c = NULL,
                                    Executed_Clause_For_Flagging__c = '[Number of Accounts = 0]'
                                )
                            );

                            randomContact.Most_Eligible__c = TRUE;
                        }
                    }
                    else{
                        String allAccountIds = '';
                        for(Account relatedAcc : lstRelatedAccounts){
                            if(relatedAcc != NULL){
                                allAccountIds += relatedAcc.Id;
                            }
                            else{
                                allAccountIds += NULL;
                            }
                        }

                        String firstAccountIdReplicated = '';
                        for(Integer i = 0; i < lstRelatedAccounts.size(); i++){
                            if(lstRelatedAccounts.get(0) != NULL){
                                firstAccountIdReplicated += lstRelatedAccounts.get(0).Id;
                            }
                        }
                        
                        System.debug(allAccountIds + '<>' + firstAccountIdReplicated);

                        //Clause 2
                        if(allAccountIds == firstAccountIdReplicated){
                            if(!anyContactFlagged(lstSimilarContacts)){
                                Account randomAccount = lstRelatedAccounts.get(getRandomIndex(lstRelatedAccounts.size()));
                                Contact randomContact = lstSimilarContacts.get(getRandomIndex(lstSimilarContacts.size()));
                                
                                Account accWithSameMLOCID = mapClientIDToAccount.get(randomAccount.Multi_Location_Owner_Primary_CID__c);

                                memoryDump += '[lstRelatedAccounts=' + String.join(lstRelatedAccounts, ',') + ']';
                                memoryDump += '[lstSimilarContacts=' + String.join(lstSimilarContacts, ',') + ']';

                                memoryDump += '[randomAccount=' + randomAccount + ']';
                                memoryDump += '[randomContact=' + randomContact + ']';
                                memoryDump += '[accWithSameMLOCID=' + accWithSameMLOCID + ']';

                                if(
                                    randomAccount.RecordType.DeveloperName == YBNCorporateRelationship && 
                                    !anyContactFlagged(lstSimilarContacts)
                                ){
                                    randomContact.Most_Eligible__c = TRUE;

                                    mapContactsToUpdate.put(
                                        randomContact.Id,
                                        new Contact(
                                            Id = randomContact.Id,
                                            Most_Eligible__c = TRUE,
                                            Target_Account__c = randomAccount.Id,
                                            Executed_Clause_For_Flagging__c = 
                                                '[All Accounts Same] AND ' +
                                                '[Account Record Type = YBNCorporateRelationship]'
                                        )
                                    );
                                }
                                else if(
                                    randomAccount.RecordType.DeveloperName == Standard &&
                                    randomAccount.Primary_Multi_Location_Owner_For_TP__c == TRUE && 
                                    !isContactFlagged(randomContact)
                                ){
                                    randomContact.Most_Eligible__c = TRUE;
                                
                                    mapContactsToUpdate.put(
                                        randomContact.Id,
                                        new Contact(
                                            Id = randomContact.Id,
                                            Most_Eligible__c = TRUE,
                                            Target_Account__c = randomAccount.Id,
                                            Executed_Clause_For_Flagging__c = 
                                                '[All Accounts Same] AND ' +
                                                '[Account Record Type = "Standard"] AND ' + 
                                                '[Primary MLOTP = TRUE]'
                                        )
                                    );
                                }
                                else if(
                                    randomAccount.RecordType.DeveloperName == Standard &&
                                    randomAccount.Primary_Multi_Location_Owner_For_TP__c == FALSE &&
                                    randomAccount.Multi_Location_Owner_Primary_CID__c != NULL && 
                                    !isContactFlagged(randomContact) &&
                                    accWithSameMLOCID != NULL
                                ){
                                    randomContact.Most_Eligible__c = TRUE;

                                    mapContactsToUpdate.put(
                                        randomContact.Id,
                                        new Contact(
                                            Id = randomContact.Id,
                                            Most_Eligible__c = TRUE,
                                            Target_Account__c = accWithSameMLOCID.Id,
                                            Executed_Clause_For_Flagging__c = 
                                                '[All Accounts Same] AND ' +
                                                '[Account Record Type = "Standard"] AND ' + 
                                                '[Primary MLOTP = FALSE] AND ' +
                                                '[MLO CID != EMPTY] AND ' +
                                                '[ClientID = MLO CID]'
                                        )
                                    );
                                }
                                else if(!isContactFlagged(randomContact)){
                                    randomContact.Most_Eligible__c = TRUE;

                                    mapContactsToUpdate.put(
                                        randomContact.Id,
                                        new Contact(
                                            Id = randomContact.Id,
                                            Most_Eligible__c = TRUE,
                                            Target_Account__c = randomAccount.Id,
                                            Executed_Clause_For_Flagging__c = 
                                                '[All Accounts Same] AND ' +
                                                '[Account Record Type = "Standard"] AND ' + 
                                                '[Primary MLOTP = FALSE] AND ' +
                                                '[MLO CID = EMPTY]'
                                        )
                                    );
                                }
                            }
                        }
                        //Clause 3
                        else{
                            Account accountFound;
                            Contact randomContact;
                            List<Contact> lstAllAssociatedContacts;
                            Set<Id> setAccountsProcessed = new Set<Id>();

                            Boolean foundYBNCorporateRelationshipAccount = FALSE;
                            Boolean foundLeadConsultant = FALSE;

                            Boolean foundPrimaryMLTOPAccount = FALSE;
                            Boolean foundIMSRep = FALSE;

                            Boolean foundMLOCIDAccount = FALSE;

                            for(Account relatedAcc : lstRelatedAccounts){
                                if(relatedAcc != NULL && relatedAcc.RecordType.DeveloperName == YBNCorporateRelationship){
                                    accountFound = relatedAcc;
                                    foundYBNCorporateRelationshipAccount = TRUE;
                                    break;
                                }
                            }

                            if(foundYBNCorporateRelationshipAccount){
                                lstAllAssociatedContacts = getAssociatedContacts(lstSimilarContacts, accountFound.Id);

                                memoryDump += '[lstAllAssociatedContacts=' + String.join(lstAllAssociatedContacts, ',') + ']';

                                if(
                                    accountFound.Lead_Consultant__c != NULL && 
                                    !anyContactFlagged(lstAllAssociatedContacts)
                                ){
                                    randomContact = lstAllAssociatedContacts.get(getRandomIndex(lstAllAssociatedContacts.size()));

                                    if(!isContactFlagged(randomContact)){
                                        foundLeadConsultant = TRUE;

                                        randomContact.Most_Eligible__c = TRUE;
                                        
                                        mapContactsToUpdate.put(
                                            randomContact.Id,
                                            new Contact(
                                                Id = randomContact.Id,
                                                Most_Eligible__c = TRUE,
                                                Target_Account__c = accountFound.Id,
                                                Executed_Clause_For_Flagging__c = 
                                                    '[Found Multiple Accounts that are Different] AND ' +
                                                    '[Found one YBNCorporateRelationship Account] AND ' + 
                                                    '[Lead Consultant != EMPTY]'
                                            )
                                        );
                                    }
                                }
                            }
                            
                            if(
                                !foundYBNCorporateRelationshipAccount ||
                                (
                                    foundYBNCorporateRelationshipAccount &&
                                    !foundLeadConsultant
                                )
                            ){
                                for(Account relatedAcc : lstRelatedAccounts){
                                    if(relatedAcc != NULL && relatedAcc.Primary_Multi_Location_Owner_For_TP__c){
                                        accountFound = relatedAcc;
                                        foundPrimaryMLTOPAccount = TRUE;
                                        break;
                                    }
                                }

                                if(foundPrimaryMLTOPAccount){
                                    lstAllAssociatedContacts = getAssociatedContacts(lstSimilarContacts, accountFound.Id);

                                    randomContact = lstAllAssociatedContacts.get(getRandomIndex(lstAllAssociatedContacts.size()));

                                    if(!anyContactFlagged(lstAllAssociatedContacts)){
                                        if(accountFound.IMS_Rep__c != NULL){
                                            if(!isContactFlagged(randomContact)){
                                                foundIMSRep = TRUE;

                                                randomContact.Most_Eligible__c = TRUE;

                                                mapContactsToUpdate.put(
                                                    randomContact.Id,
                                                    new Contact(
                                                        Id = randomContact.Id,
                                                        Most_Eligible__c = TRUE,
                                                        Target_Account__c = accountFound.Id,
                                                        Executed_Clause_For_Flagging__c = 
                                                            '[Found Multiple Accounts that are Different] AND ' +
                                                            (
                                                                !foundYBNCorporateRelationshipAccount ? 
                                                                '[Found NO YBNCorporateRelationship Account] AND ' :
                                                                '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND '
                                                            ) +
                                                            '[Found one Primary MLOTP Account] AND ' +
                                                            '[IMS Rep != EMPTY]'
                                                    )
                                                );
                                            }
                                        }
                                        else if(!isContactFlagged(randomContact)){
                                            foundIMSRep = FALSE;

                                            randomContact.Most_Eligible__c = TRUE;

                                            mapContactsToUpdate.put(
                                                randomContact.Id,
                                                new Contact(
                                                    Id = randomContact.Id,
                                                    Most_Eligible__c = TRUE,
                                                    Target_Account__c = NULL,
                                                    Executed_Clause_For_Flagging__c = 
                                                        '[Found Multiple Accounts that are Different] AND ' +
                                                        (
                                                            !foundYBNCorporateRelationshipAccount ? 
                                                            '[Found NO YBNCorporateRelationship Account] AND ' :
                                                            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND '
                                                        ) +
                                                        '[Found one Primary MLOTP Account] AND ' +
                                                        '[IMS Rep = EMPTY]'
                                                )
                                            );
                                        }
                                    }
                                }
                            }

                            if(
                                (
                                    !foundYBNCorporateRelationshipAccount &&
                                    !foundPrimaryMLTOPAccount
                                ) ||
                                (
                                    foundYBNCorporateRelationshipAccount &&
                                    !foundLeadConsultant &&
                                    !foundPrimaryMLTOPAccount
                                )
                            ){
                                for(Account relatedAcc : lstRelatedAccounts){
                                    if(relatedAcc != NULL && relatedAcc.Multi_Location_Owner_Primary_CID__c != NULL){
                                        accountFound = relatedAcc;
                                        foundMLOCIDAccount = TRUE;
                                        break;
                                    }
                                }

                                Account matchingAccount;
                                if(foundMLOCIDAccount){
                                    matchingAccount = mapClientIDToAccount.get(accountFound.Multi_Location_Owner_Primary_CID__c);

                                    memoryDump += '[matchingAccount=' + matchingAccount + ']';
                                }
                                
                                if(foundMLOCIDAccount && matchingAccount != NULL){                                
                                    lstAllAssociatedContacts = getAssociatedContacts(lstSimilarContacts, accountFound.Id);

                                    if(!anyContactFlagged(lstAllAssociatedContacts)){
                                        randomContact = lstAllAssociatedContacts.get(getRandomIndex(lstAllAssociatedContacts.size()));

                                        if(!isContactFlagged(randomContact)){
                                            randomContact.Most_Eligible__c = TRUE;
                                            
                                            mapContactsToUpdate.put(
                                                randomContact.Id,
                                                new Contact(
                                                    Id = randomContact.Id,
                                                    Most_Eligible__c = TRUE,
                                                    Target_Account__c = matchingAccount.Id,
                                                    Executed_Clause_For_Flagging__c = 
                                                        '[Found Multiple Accounts that are Different] AND ' +
                                                        (
                                                            !foundYBNCorporateRelationshipAccount ? 
                                                            '[Found NO YBNCorporateRelationship Account] AND ' :
                                                            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND '
                                                        ) +
                                                        '[Found NO Primary MLOTP Account] AND ' +
                                                        '[Found Account with Valid MLO CID] AND ' +
                                                        '[Found Account Where ClientID = MLO CID]'
                                                )
                                            );
                                        }
                                    }
                                }
                                else{
                                    randomContact = lstSimilarContacts.get(getRandomIndex(lstSimilarContacts.size()));

                                    if(
                                        !anyContactFlagged(lstSimilarContacts) &&
                                        !isContactFlagged(randomContact)
                                    ){
                                        randomContact.Most_Eligible__c = TRUE;
                                    
                                        mapContactsToUpdate.put(
                                            randomContact.Id,
                                            new Contact(
                                                Id = randomContact.Id,
                                                Most_Eligible__c = TRUE,
                                                Target_Account__c = NULL,
                                                Executed_Clause_For_Flagging__c = 
                                                    '[Found Multiple Accounts that are Different] AND ' +
                                                    (
                                                        !foundYBNCorporateRelationshipAccount ? 
                                                        '[Found NO YBNCorporateRelationship Account] AND ' :
                                                        '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND '
                                                    ) +
                                                    '[Found NO Primary MLOTP Account] AND ' +
                                                    '[Found NO Account with Valid MLO CID]'
                                            )
                                        );
                                    }
                                }
                            }
                        }
                    }
                }
            }

            memoryDump += '[mapContactsToUpdate=' + String.join(mapContactsToUpdate.values(), ',') + ']';

            if(!mapContactsToUpdate.isEmpty()){
                Database.update(mapContactsToUpdate.values(), FALSE);
            }
        }
        catch(Exception ex){
            new ApexDebugLog().createLog(
                new ApexDebugLog.Error(
                    'YodleUtilities',
                    'flagEligibleContact',
                    memoryDump,
                    ex
                )
            );
        }
    }

    public static void flagEligibleContactByEmail(List<Contact> lstContacts){
        try{
            Set<String> setContactEmails = new Set<String>();
            for(Contact con : lstContacts){
                if(con.Email != NULL && !String.isEmpty(con.Email)){
                    setContactEmails.add(con.Email);
                }

                else if(con.Alternate_Email__c != NULL && !String.isEmpty(con.Alternate_Email__c)){
                    setContactEmails.add(con.Alternate_Email__c);
                }
            }

            System.debug(setContactEmails);
            
            List<Contact> lstSimilarContacts = [
                SELECT  Id,
                        Email,
                        AccountId,
                        Alternate_Email__c,
                        Most_Eligible_E2C__c,
                        Target_Account_E2C__c,
                        Executed_Clause_For_Flagging_E2C__c
                FROM    Contact 
                WHERE   (
                            Email IN :setContactEmails OR
                            Alternate_Email__c IN :setContactEmails
                        )
            ];

            System.debug(lstSimilarContacts);

            Map<String, List<Contact>> mapSimilarContacts = new Map<String, List<Contact>>();
            for(Contact similarCon : lstSimilarContacts){
                String emailFound;
                if(setContactEmails.contains(similarCon.Email))
                    emailFound = similarCon.Email;
                else if(setContactEmails.contains(similarCon.Alternate_Email__c))
                    emailFound = similarCon.Alternate_Email__c;

                if(emailFound != NULL){
                    if(mapSimilarContacts.containsKey(emailFound))
                        mapSimilarContacts.get(emailFound).add(similarCon);
                    else
                        mapSimilarContacts.put(emailFound, new List<Contact> { similarCon });
                }
            }

            System.debug(mapSimilarContacts);
            
            Set<Id> setAccountIds = new Set<Id>();
            for(Contact similarCon : lstSimilarContacts){
                if(similarCon.AccountId != NULL){
                    setAccountIds.add(similarCon.AccountId);
                }
            }

            System.debug(setAccountIds);
            
            Map<Id, Account> mapRelatedAccounts = new Map<Id, Account>([
                SELECT  Id,
                        IMS_Rep__c,
                        Client_ID__c,
                        Lead_Consultant__c,
                        RecordType.DeveloperName, 
                        Primary_Multi_Location_Owner_For_TP__c,
                        Multi_Location_Owner_Primary_CID__c
                FROM    Account 
                WHERE   Id IN :setAccountIds
            ]);

            System.debug(mapRelatedAccounts);
            
            Set<String> setMLOCIDs = new Set<String>();
            for(Account relatedAcc : mapRelatedAccounts.values()){
                if(
                    relatedAcc.Multi_Location_Owner_Primary_CID__c != NULL && 
                    !String.isBlank(relatedAcc.Multi_Location_Owner_Primary_CID__c)
                ){
                    setMLOCIDs.add(relatedAcc.Multi_Location_Owner_Primary_CID__c);
                }
            }

            Map<String, Account> mapClientIDToAccount = new Map<String, Account>();
            for(
                Account relatedAcc :
                [
                    SELECT  Id,
                            IMS_Rep__c,
                            Client_ID__c,
                            Lead_Consultant__c,
                            RecordType.DeveloperName, 
                            Primary_Multi_Location_Owner_For_TP__c,
                            Multi_Location_Owner_Primary_CID__c
                    FROM    Account 
                    WHERE   Client_ID__c IN :setMLOCIDs
                ]
            ){
                mapClientIDToAccount.put(relatedAcc.Client_ID__c, relatedAcc);
            }
            
            System.debug(mapClientIDToAccount); 

            Map<Id, Map<Contact, Account>> mapContactsToProcess = 
                new Map<Id, Map<Contact, Account>>();
            for(Contact con : lstContacts){
                mapContactsToProcess.put(con.Id, new Map<Contact, Account>());

                String key;
                if(mapSimilarContacts.containsKey(con.Email))
                    key = con.Email;
                else if(mapSimilarContacts.containsKey(con.Alternate_Email__c))
                    key = con.Alternate_Email__c;

                if(key != NULL){
                    for(Contact similarCon : mapSimilarContacts.get(key)){
                        if(mapRelatedAccounts.containsKey(similarCon.AccountId)){
                            mapContactsToProcess.get(con.Id).put(
                                similarCon, 
                                mapRelatedAccounts.get(similarCon.AccountId)
                            );
                        }
                        else{
                            mapContactsToProcess.get(con.Id).put(
                                similarCon, 
                                NULL
                            );
                        }
                    }
                }
            }
            
            System.debug(mapContactsToProcess); 

            mapContactsToUpdateByEmail = new Map<Id, Contact>();
            for(Id contactId : mapContactsToProcess.keySet()){
                if(!isContactFlaggedByEmail(contactId)){
                    Boolean hasAnyAccount = FALSE;
                    List<Account> lstRelatedAccounts = mapContactsToProcess.get(contactId).values();
                    lstSimilarContacts = new List<Contact>();
                    lstSimilarContacts.addAll(mapContactsToProcess.get(contactId).keySet());
                    
                    //Clause 1
                    if(isEmpty(lstRelatedAccounts)){
                        if(!anyContactFlaggedByEmail(lstSimilarContacts)){
                            Contact randomContact = lstSimilarContacts.get(getRandomIndex(lstSimilarContacts.size()));

                            mapContactsToUpdateByEmail.put(
                                randomContact.Id,
                                new Contact(
                                    Id = randomContact.Id,
                                    Most_Eligible_E2C__c = TRUE,
                                    Target_Account_E2C__c = NULL,
                                    Executed_Clause_For_Flagging_E2C__c = '[Number of Accounts = 0]'
                                )
                            );

                            randomContact.Most_Eligible_E2C__c = TRUE;
                        }
                    }
                    else{
                        String allAccountIds = '';
                        for(Account relatedAcc : lstRelatedAccounts){
                            if(relatedAcc != NULL){
                                allAccountIds += relatedAcc.Id;
                            }
                            else{
                                allAccountIds += NULL;
                            }
                        }

                        String firstAccountIdReplicated = '';
                        for(Integer i = 0; i < lstRelatedAccounts.size(); i++){
                            if(lstRelatedAccounts.get(0) != NULL){
                                firstAccountIdReplicated += lstRelatedAccounts.get(0).Id;
                            }
                        }
                        
                        System.debug(allAccountIds + '<>' + firstAccountIdReplicated);

                        //Clause 2
                        if(allAccountIds == firstAccountIdReplicated){
                            if(!anyContactFlaggedByEmail(lstSimilarContacts)){
                                Account randomAccount = lstRelatedAccounts.get(getRandomIndex(lstRelatedAccounts.size()));
                                Contact randomContact = lstSimilarContacts.get(getRandomIndex(lstSimilarContacts.size()));
                                
                                Account accWithSameMLOCID = mapClientIDToAccount.get(randomAccount.Multi_Location_Owner_Primary_CID__c);
                                
                                if(
                                    randomAccount.RecordType.DeveloperName == YBNCorporateRelationship && 
                                    !anyContactFlaggedByEmail(lstSimilarContacts)
                                ){
                                    randomContact.Most_Eligible_E2C__c = TRUE;

                                    mapContactsToUpdateByEmail.put(
                                        randomContact.Id,
                                        new Contact(
                                            Id = randomContact.Id,
                                            Most_Eligible_E2C__c = TRUE,
                                            Target_Account_E2C__c = randomAccount.Id,
                                            Executed_Clause_For_Flagging_E2C__c = 
                                                '[All Accounts Same] AND ' +
                                                '[Account Record Type = YBNCorporateRelationship]'
                                        )
                                    );
                                }
                                else if(
                                    randomAccount.RecordType.DeveloperName == Standard &&
                                    randomAccount.Primary_Multi_Location_Owner_For_TP__c == TRUE && 
                                    !isContactFlaggedByEmail(randomContact)
                                ){
                                    randomContact.Most_Eligible_E2C__c = TRUE;

                                    mapContactsToUpdateByEmail.put(
                                        randomContact.Id,
                                        new Contact(
                                            Id = randomContact.Id,
                                            Most_Eligible_E2C__c = TRUE,
                                            Target_Account_E2C__c = randomAccount.Id,
                                            Executed_Clause_For_Flagging_E2C__c = 
                                                '[All Accounts Same] AND ' +
                                                '[Account Record Type = "Standard"] AND ' + 
                                                '[Primary MLOTP = TRUE]'
                                        )
                                    );
                                }
                                else if(
                                    randomAccount.RecordType.DeveloperName == Standard &&
                                    randomAccount.Primary_Multi_Location_Owner_For_TP__c == FALSE &&
                                    randomAccount.Multi_Location_Owner_Primary_CID__c != NULL && 
                                    !isContactFlaggedByEmail(randomContact) &&
                                    accWithSameMLOCID != NULL
                                ){
                                    randomContact.Most_Eligible_E2C__c = TRUE;

                                    mapContactsToUpdateByEmail.put(
                                        randomContact.Id,
                                        new Contact(
                                            Id = randomContact.Id,
                                            Most_Eligible_E2C__c = TRUE,
                                            Target_Account_E2C__c = accWithSameMLOCID.Id,
                                            Executed_Clause_For_Flagging_E2C__c = 
                                                '[All Accounts Same] AND ' +
                                                '[Account Record Type = "Standard"] AND ' + 
                                                '[Primary MLOTP = FALSE] AND ' +
                                                '[MLO CID != EMPTY] AND ' +
                                                '[ClientID = MLO CID]'
                                        )
                                    );
                                }
                                else if(!isContactFlaggedByEmail(randomContact)){
                                    randomContact.Most_Eligible_E2C__c = TRUE;

                                    mapContactsToUpdateByEmail.put(
                                        randomContact.Id,
                                        new Contact(
                                            Id = randomContact.Id,
                                            Most_Eligible_E2C__c = TRUE,
                                            Target_Account_E2C__c = randomAccount.Id,
                                            Executed_Clause_For_Flagging_E2C__c = 
                                                '[All Accounts Same] AND ' +
                                                '[Account Record Type = "Standard"] AND ' + 
                                                '[Primary MLOTP = FALSE] AND ' +
                                                '[MLO CID = EMPTY]'
                                        )
                                    );
                                }
                            }
                        }
                        //Clause 3
                        else{
                            Account accountFound;
                            Contact randomContact;
                            List<Contact> lstAllAssociatedContacts;
                            Set<Id> setAccountsProcessed = new Set<Id>();

                            Boolean foundYBNCorporateRelationshipAccount = FALSE;
                            Boolean foundLeadConsultant = FALSE;

                            Boolean foundPrimaryMLTOPAccount = FALSE;
                            Boolean foundIMSRep = FALSE;

                            Boolean foundMLOCIDAccount = FALSE;

                            for(Account relatedAcc : lstRelatedAccounts){
                                if(relatedAcc != NULL && relatedAcc.RecordType.DeveloperName == YBNCorporateRelationship){
                                    accountFound = relatedAcc;
                                    foundYBNCorporateRelationshipAccount = TRUE;
                                    break;
                                }
                            }

                            if(foundYBNCorporateRelationshipAccount){
                                lstAllAssociatedContacts = getAssociatedContacts(lstSimilarContacts, accountFound.Id);

                                if(
                                    accountFound.Lead_Consultant__c != NULL && 
                                    !anyContactFlaggedByEmail(lstAllAssociatedContacts)
                                ){
                                    randomContact = lstAllAssociatedContacts.get(getRandomIndex(lstAllAssociatedContacts.size()));

                                    if(!isContactFlaggedByEmail(randomContact)){
                                        foundLeadConsultant = TRUE;

                                        randomContact.Most_Eligible_E2C__c = TRUE;
                                        
                                        mapContactsToUpdateByEmail.put(
                                            randomContact.Id,
                                            new Contact(
                                                Id = randomContact.Id,
                                                Most_Eligible_E2C__c = TRUE,
                                                Target_Account_E2C__c = accountFound.Id,
                                                Executed_Clause_For_Flagging_E2C__c = 
                                                    '[Found Multiple Accounts that are Different] AND ' +
                                                    '[Found one YBNCorporateRelationship Account] AND ' + 
                                                    '[Lead Consultant != EMPTY]'
                                            )
                                        );
                                    }
                                }
                            }
                            
                            if(
                                !foundYBNCorporateRelationshipAccount ||
                                (
                                    foundYBNCorporateRelationshipAccount &&
                                    !foundLeadConsultant
                                )
                            ){
                                for(Account relatedAcc : lstRelatedAccounts){
                                    if(relatedAcc != NULL && relatedAcc.Primary_Multi_Location_Owner_For_TP__c){
                                        accountFound = relatedAcc;
                                        foundPrimaryMLTOPAccount = TRUE;
                                        break;
                                    }
                                }

                                if(foundPrimaryMLTOPAccount){
                                    lstAllAssociatedContacts = getAssociatedContacts(lstSimilarContacts, accountFound.Id);

                                    randomContact = lstAllAssociatedContacts.get(getRandomIndex(lstAllAssociatedContacts.size()));

                                    if(!anyContactFlaggedByEmail(lstAllAssociatedContacts)){
                                        if(accountFound.IMS_Rep__c != NULL){
                                            if(!isContactFlaggedByEmail(randomContact)){
                                                foundIMSRep = TRUE;

                                                randomContact.Most_Eligible_E2C__c = TRUE;

                                                mapContactsToUpdateByEmail.put(
                                                    randomContact.Id,
                                                    new Contact(
                                                        Id = randomContact.Id,
                                                        Most_Eligible_E2C__c = TRUE,
                                                        Target_Account_E2C__c = accountFound.Id,
                                                        Executed_Clause_For_Flagging_E2C__c = 
                                                            '[Found Multiple Accounts that are Different] AND ' +
                                                            (
                                                                !foundYBNCorporateRelationshipAccount ? 
                                                                '[Found NO YBNCorporateRelationship Account] AND ' :
                                                                '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND '
                                                            ) +
                                                            '[Found one Primary MLOTP Account] AND ' +
                                                            '[IMS Rep != EMPTY]'
                                                    )
                                                );
                                            }
                                        }
                                        else if(!isContactFlaggedByEmail(randomContact)){
                                            foundIMSRep = FALSE;

                                            randomContact.Most_Eligible_E2C__c = TRUE;

                                            mapContactsToUpdateByEmail.put(
                                                randomContact.Id,
                                                new Contact(
                                                    Id = randomContact.Id,
                                                    Most_Eligible_E2C__c = TRUE,
                                                    Target_Account_E2C__c = NULL,
                                                    Executed_Clause_For_Flagging_E2C__c = 
                                                        '[Found Multiple Accounts that are Different] AND ' +
                                                        (
                                                            !foundYBNCorporateRelationshipAccount ? 
                                                            '[Found NO YBNCorporateRelationship Account] AND ' :
                                                            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND '
                                                        ) +
                                                        '[Found one Primary MLOTP Account] AND ' +
                                                        '[IMS Rep = EMPTY]'
                                                )
                                            );
                                        }
                                    }
                                }
                            }

                            if(
                                (
                                    !foundYBNCorporateRelationshipAccount &&
                                    !foundPrimaryMLTOPAccount
                                ) ||
                                (
                                    foundYBNCorporateRelationshipAccount &&
                                    !foundLeadConsultant &&
                                    !foundPrimaryMLTOPAccount
                                )
                            ){
                                for(Account relatedAcc : lstRelatedAccounts){
                                    if(relatedAcc != NULL && relatedAcc.Multi_Location_Owner_Primary_CID__c != NULL){
                                        accountFound = relatedAcc;
                                        foundMLOCIDAccount = TRUE;
                                        break;
                                    }
                                }

                                Account matchingAccount;
                                if(foundMLOCIDAccount){
                                    matchingAccount = mapClientIDToAccount.get(accountFound.Multi_Location_Owner_Primary_CID__c);
                                }
                                
                                if(foundMLOCIDAccount && matchingAccount != NULL){                                
                                    lstAllAssociatedContacts = getAssociatedContacts(lstSimilarContacts, accountFound.Id);

                                    if(!anyContactFlaggedByEmail(lstAllAssociatedContacts)){
                                        randomContact = lstAllAssociatedContacts.get(getRandomIndex(lstAllAssociatedContacts.size()));

                                        if(!isContactFlaggedByEmail(randomContact)){
                                            randomContact.Most_Eligible_E2C__c = TRUE;
                                            
                                            mapContactsToUpdateByEmail.put(
                                                randomContact.Id,
                                                new Contact(
                                                    Id = randomContact.Id,
                                                    Most_Eligible_E2C__c = TRUE,
                                                    Target_Account_E2C__c = matchingAccount.Id,
                                                    Executed_Clause_For_Flagging_E2C__c = 
                                                        '[Found Multiple Accounts that are Different] AND ' +
                                                        (
                                                            !foundYBNCorporateRelationshipAccount ? 
                                                            '[Found NO YBNCorporateRelationship Account] AND ' :
                                                            '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND '
                                                        ) +
                                                        '[Found NO Primary MLOTP Account] AND ' +
                                                        '[Found Account with Valid MLO CID] AND ' +
                                                        '[Found Account Where ClientID = MLO CID]'
                                                )
                                            );
                                        }
                                    }
                                }
                                else{
                                    randomContact = lstSimilarContacts.get(getRandomIndex(lstSimilarContacts.size()));

                                    if(
                                        !anyContactFlaggedByEmail(lstSimilarContacts) &&
                                        !isContactFlaggedByEmail(randomContact)
                                    ){
                                        randomContact.Most_Eligible_E2C__c = TRUE;
                                    
                                        mapContactsToUpdateByEmail.put(
                                            randomContact.Id,
                                            new Contact(
                                                Id = randomContact.Id,
                                                Most_Eligible_E2C__c = TRUE,
                                                Target_Account_E2C__c = NULL,
                                                Executed_Clause_For_Flagging_E2C__c = 
                                                    '[Found Multiple Accounts that are Different] AND ' +
                                                    (
                                                        !foundYBNCorporateRelationshipAccount ? 
                                                        '[Found NO YBNCorporateRelationship Account] AND ' :
                                                        '[Found NO Lead Consultant on YBNCorporateRelationship Account] AND '
                                                    ) +
                                                    '[Found NO Primary MLOTP Account] AND ' +
                                                    '[Found NO Account with Valid MLO CID]'
                                            )
                                        );
                                    }
                                }
                            }
                        }
                    }
                }
            }

            System.debug(mapContactsToUpdateByEmail.values());

            if(!mapContactsToUpdateByEmail.isEmpty()){
                UPDATE mapContactsToUpdateByEmail.values();
            }
        }
        catch(Exception ex){
            new ApexDebugLog().createLog(
                new ApexDebugLog.Error(
                    'YodleUtilities',
                    'flagEligibleContactByEmail',
                    String.join(mapContactsToUpdateByEmail.values(), ','),
                    ex
                )
            );
        }
    }

    public static void killEmailToCase (List<Case> lstCases){
        System.debug('killEmailToCase method successfully called');
        for(Case newCase: lstCases){
            System.debug('Case ID: ' + newCase.Id);
            System.debug('Case Origin: ' + newCase.Origin);
            System.debug('Case From/Supplied/Web Email: ' + newCase.SuppliedEmail);
            System.debug('Record Type name is: ' + newCase.RecordType.DeveloperName);

            //Read the "Restricted_E2C_Domains" from the Custom Metadata Types labelled "Support Settings"
            Set<String> restrictedE2CDomains = getSupportSetting(SSK_RestrictedE2CDomains);
            
            if(newCase.SuppliedEmail != NULL){
                if(newCase.Origin == 'YBN Email' && newCase.SuppliedEmail != NULL && newCase.SuppliedEmail.contains('@')) {
                    //Split the Email with Delimiter as '@'
                    //So john.doe@yodle.com returns a list - ['john.doe', 'yodle.com']
                    //Here the second index will point to the Domain Name which is [1]
                    List<String> emailParts = newCase.SuppliedEmail.split('@');                    
                    if(restrictedE2CDomains.contains(emailParts[1])){
                        System.debug('Problematic case found and shouldnt be created');
                        newCase.addError('Creation of cases with these domains are not allowed');
                    }
                }
            }
        } 
    }
    
    /*Internal Helper Methods*/
    public static Integer getRandomIndex(Integer cap){
        return Math.round(Math.random() * (cap - 1));
    }

    private static Set<String> getSupportSetting(String settingName){
        Support_Setting__mdt supportSetting = [
            SELECT Value__c, Additional_Values__c 
            FROM   Support_Setting__mdt 
            WHERE  DeveloperName = :settingName
        ];
        
        Set<String> settingValues = new Set<String>();
        
        //Split the text in the Value__c field with comma as the Delmiter
        settingValues.addAll(supportSetting.Value__c.split(','));
        if(String.isNotBlank(supportSetting.Additional_Values__c)){
            settingValues.addAll(supportSetting.Additional_Values__c.split(','));
        }
        
        return settingValues;
    }
    
    private static Boolean isEmpty(List<SObject> lstObjects){
        Integer counter = 0;

        for(SObject obj : lstObjects){
            if(obj == NULL){
                counter++;
            }
        }

        return counter == lstObjects.size();
    }

    private static List<Contact> getAssociatedContacts(List<Contact> lstContacts, Id accountId){
        List<Contact> lstAssociatedContacts = new List<Contact>();

        for(Contact similarCon : lstContacts){
            if(similarCon.AccountId == accountId){
                lstAssociatedContacts.add(similarCon);
            }
        }

        return lstAssociatedContacts;
    }

    private static Boolean anyContactFlagged(List<Contact> lstContacts){
        for(Contact conToCheck : lstContacts){
            if(conToCheck.Most_Eligible__c == TRUE){
                return TRUE;
            }
        }

        return FALSE;
    }

    private static Boolean isContactFlagged(Contact conToCheck){
        return 
            (
                conToCheck.Most_Eligible__c == NULL ||
                conToCheck.Most_Eligible__c ||
                (
                    mapContactsToUpdate != NULL &&
                    !mapContactsToUpdate.isEmpty() &&
                    mapContactsToUpdate.containsKey(conToCheck.Id)
                )
            );
    }

    private static Boolean isContactFlagged(Id contactId){
        return 
            (
                mapContactsToUpdate != NULL &&
                !mapContactsToUpdate.isEmpty() &&
                mapContactsToUpdate.containsKey(contactId)
            );
    }

    private static Boolean anyContactFlaggedByEmail(List<Contact> lstContacts){
        for(Contact conToCheck : lstContacts){
            if(conToCheck.Most_Eligible_E2C__c == TRUE){
                return TRUE;
            }
        }

        return FALSE;
    }

    private static Boolean isContactFlaggedByEmail(Contact conToCheck){
        return 
            (
                conToCheck.Most_Eligible_E2C__c == NULL ||
                conToCheck.Most_Eligible_E2C__c ||
                (
                    mapContactsToUpdateByEmail != NULL &&
                    !mapContactsToUpdateByEmail.isEmpty() &&
                    mapContactsToUpdateByEmail.containsKey(conToCheck.Id)
                )
            );
    }

    private static Boolean isContactFlaggedByEmail(Id contactId){
        return 
            (
                mapContactsToUpdateByEmail != NULL &&
                !mapContactsToUpdateByEmail.isEmpty() &&
                mapContactsToUpdateByEmail.containsKey(contactId)
            );
    }
}