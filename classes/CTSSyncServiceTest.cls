@isTest
private class CTSSyncServiceTest {
    
    @isTest static void test_GetSFDCObject() {
        Account newAccount = new Account();
        newAccount.Name = 'Testing CTS API integration';
        newAccount.Client_First_Name__c = 'Test';
        newAccount.Client_Last_Name__c = 'CTS';
        newAccount.Client_ID__c = '1234';        
        insert newAccount;

        Case newCase = new Case();        
        newCase.Status = 'Open';
        newCase.AccountId = newAccount.Id;
        insert newCase;
        
        CTSObjectTriggerMap__mdt mapping = [SELECT Additional_Filter__c,
                    CaseOrigin__c,
                    CaseReason__c,
                    CTSAPIIdentifier__c,
                    CTSAssignedToLoginName__c,
                    CTSEmailAddress__c,
                    CTSNoteType__c,
                    Description__c,
                    DetailsTemplateName__c,
                    IntegrationType__c,
                    IsActive__c,
                    IsAutoClose__c,
                    IsCreateCTSNote__c,
                    IsExcludeWBN__c,
                    NoteDetailsTemplateName__c,
                    Object__c,
                    Object__r.Object_API_Name__c,
                    ProductType__c,
                    RecordTypeName__c,
                    MasterLabel
               FROM CTSObjectTriggerMap__mdt 
              WHERE MasterLabel = 'LBW Charge Failures' LIMIT 1];
              
        system.debug('Mapping instance: ' + mapping);
        
        Test.startTest();
        CTSSFDCCase obj = (CTSSFDCCase)CTSSyncService.GetSFDCObject('Case', newCase.Id, mapping, 'API');       
        Test.stopTest();
                 
        system.assert(obj.Id == newCase.Id);
        system.assert(obj.ObjectName == 'Case');
        system.assert(obj.ContactFirstName == 'Test');
        system.assert(obj.ContactLastName == 'CTS');
        system.assert(obj.Status == 'Open');        
        system.assert(obj.Detail != null);
        
    }
    
}