@isTest
private class UTest_EmailTrigger_CombineEmailToCase {
    
    static testMethod void newEmail(){
        Id rtAccStandard = Utilities.GetRecTypeId('Account', 'Standard');
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        Id rtId = Utilities.GetRecTypeId('Case', 'YBN Inbound Inquiry');
        Case c = new Case(AccountId = a.Id, RecordTypeId = rtId);
        insert c;
        
        c = [SELECT Id, CaseNumber FROM Case WHERE Id = :c.Id];
        
        EmailMessage em = new EmailMessage(FromAddress = 'sharepoint@ccaglobal.com', 
                                           Incoming = True, 
                                           ToAddress='unittestingsalesforce@unittestingsalesforce.com', 
                                           Subject = 'UnitTest Email', 
                                           TextBody = 'Vendor Ticket ID: ' + c.CaseNumber
                                           );
        insert em;
        
        system.debug('$$$ em: ' + em);
        system.assertEquals(c.Id, [SELECT Id, ParentId FROM EmailMessage WHERE Id =: em.Id].ParentId);                                 
    }
}