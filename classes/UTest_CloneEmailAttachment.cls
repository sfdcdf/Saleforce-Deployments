@isTest
private class UTest_CloneEmailAttachment {
    private static final id rtAccStandard = Utilities.GetRecTypeId('Account', 'Standard');
    private static final id rtCasLHmaster = Utilities.GetRecTypeId('Case', 'LH Master');
    
    static testMethod void test_cloneEmailAttach(){
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        Case c = new Case(Status = 'New', AccountId = a.Id, RecordTypeId = rtCasLHmaster);
        insert c;
        
        EmailMessage em = new EmailMessage(FromAddress = 'test@abc.org', 
                                           Incoming = True, 
                                           ToAddress='unittestingsalesforce@unittestingsalesforce.com', 
                                           Subject = 'UnitTest Email', 
                                           TextBody = '23456 ', 
                                           ParentId = c.Id); 
        
        insert em; 
        
        EmailMessage emClone = new EmailMessage(FromAddress = 'test@abc.org', 
                                           Incoming = True, 
                                           ToAddress='unittestingsalesforce@unittestingsalesforce.com', 
                                           Subject = 'UnitTest Email', 
                                           TextBody = '23456 ', 
                                           ParentId = c.Id,
                                           ClonedEmail__c = true,
                                           OriginalEmailId__c = em.Id); 
        
        insert emClone; 
        
        system.assertEquals(0, [SELECT count() FROM Attachment WHERE ParentId = :emClone.Id]);
        
        Attachment att = new Attachment();
        att.Name = 'UnitTest Attachment';
        att.Body = Blob.valueOf('UnitTest Body Blob');
        att.ParentId = em.Id;
        insert att;
        
        system.assertEquals(1, [SELECT count() FROM Attachment WHERE ParentId = :emClone.Id]);
    }
}