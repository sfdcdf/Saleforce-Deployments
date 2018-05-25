@isTest
private class UTest_EmailTrigger_CaseThreadingLimit {
    private static final id rtAccStandard = Utilities.GetRecTypeId('Account', 'Standard');

    static testMethod void test_YesThread() {
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        DateTime dt = system.now().addYears(-1);
        String strDT = '"' + dt.year() + '-' + dt.month() + '-' + dt.day() + 'T' + dt.hour() + ':' + dt.minute() + ':' + '00"';
        String caseJSON = '{"Status":"Closed","ClosedDate":' + strDT + ',"CreatedDate":' + strDT + '}'; 
        //String caseJSON = '{"Status":"Closed","ClosedDate":"2012-11-04T17:54:26.000+0000","CreatedDate":"2012-10-04T17:54:26.000+0000"}'; 
        Case c = (Case) JSON.deserialize(caseJSON, Case.class ); 
        c.AccountId = a.Id;
        c.RecordTypeId = Utilities.GetRecTypeId('Case', 'YBN Inbound Inquiry');
        c.Spoke_To__c = 'UnitTest Person';
        c.Time_To_Complete_Task_Minutes__c = 10;
        c.Account_Updates_Changes__c = 'Covered - Client Initiated';
        insert c;
         
        System.debug('Test caseStatus1:' + c.ClosedDate); 
        system.assertEquals(1, [SELECT count() FROM Case WHERE AccountId = :a.Id]);
        
        EmailMessage em = new EmailMessage(FromAddress = 'test@abc.org', 
                                           Incoming = True, 
                                           ToAddress='unittestingsalesforce@unittestingsalesforce.com', 
                                           Subject = 'UnitTest Email', 
                                           TextBody = '23456 ', 
                                           ParentId = c.Id); 
        
        insert em; 
        
        // Assert that YBN cases continue to thread
        system.assertEquals(1, [SELECT count() FROM Case WHERE AccountId = :a.Id]);                                  
    }
    
    static testMethod void test_ThreadDisable() {
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        CaseThreadSettings__mdt objTS = [SELECT DeveloperName, CaseRecordType__c, ClosedHours__c, DisableThreading__c 
                                         FROM CaseThreadSettings__mdt WHERE DisableThreading__c = true LIMIT 1];

        DateTime dt = system.now().addMinutes(-2);
        String rtName;
        List<String> lstString = objTS.CaseRecordType__c.split(',');
        for(String s: lstString){
            rtName = s.trim();
            break;
        }
        Id rtId = [SELECT Id, Name FROM RecordType WHERE SobjectType='Case' AND IsActive=true AND Name=:rtName].Id;      
               
        String strDT = '"' + dt.year() + '-' + dt.month() + '-' + dt.day() + 'T' + dt.hour() + ':' + dt.minute() + ':' + '00"';
        String caseJSON = '{"Status":"New","ClosedDate":' + strDT + ',"CreatedDate":' + strDT + '}'; 
        //Case c = new Case(AccountId = a.Id, RecordTypeId = rtId, Status = 'New');
        Case c = (Case) JSON.deserialize(caseJSON, Case.class); 
        c.AccountId = a.Id;
        c.RecordTypeId = rtId;
        insert c;
         
        system.assertEquals(1, [SELECT count() FROM Case WHERE AccountId = :a.Id]);
        
        EmailMessage em = new EmailMessage(FromAddress = 'test@abc.org', 
                                           Incoming = True, 
                                           ToAddress='unittestingsalesforce@unittestingsalesforce.com', 
                                           Subject = 'UnitTest Email', 
                                           TextBody = '23456 ', 
                                           ParentId = c.Id); 
        
        insert em; 
        
        // Assert case types under prevent setting always create a new case
        system.assertEquals(2, [SELECT count() FROM Case WHERE AccountId = :a.Id]);                                  
    }

    static testMethod void test_ThreadLimit_NoThread() {
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        CaseThreadSettings__mdt objTS = [SELECT DeveloperName, CaseRecordType__c, ClosedHours__c, DisableThreading__c
                                         FROM CaseThreadSettings__mdt WHERE DisableThreading__c = false LIMIT 1];
        Integer i = Integer.valueOf(objTS.ClosedHours__c) + 1;
        
        DateTime dt = system.now().addHours(-i);
        String rtName;
        List<String> lstString = objTS.CaseRecordType__c.split(',');
        for(String s: lstString){
            rtName = s.trim();
            break;
        }    
        
        String strDT = '"' + dt.year() + '-' + dt.month() + '-' + dt.day() + 'T' + dt.hour() + ':' + dt.minute() + ':' + '00"';
        String caseJSON = '{"Status":"Closed","ClosedDate":' + strDT + ',"CreatedDate":' + strDT + '}'; 
        //String caseJSON = '{"Status":"Closed","ClosedDate":"2012-11-04T17:54:26.000+0000","CreatedDate":"2012-10-04T17:54:26.000+0000"}'; 
        Case c = (Case) JSON.deserialize(caseJSON, Case.class); 
        c.AccountId = a.Id;
        c.RecordTypeId = [SELECT Id FROM RecordType WHERE SobjectType='Case' AND IsActive=true AND Name=:rtName].Id;
        insert c;
         
        System.debug('Test caseStatus1:' + c.ClosedDate); 
        system.assertEquals(1, [SELECT count() FROM Case WHERE AccountId = :a.Id]);
        
        EmailMessage em = new EmailMessage(FromAddress = 'test@abc.org', 
                                           Incoming = True, 
                                           ToAddress='unittestingsalesforce@unittestingsalesforce.com', 
                                           Subject = 'UnitTest Email', 
                                           TextBody = '23456 ', 
                                           ParentId = c.Id); 
        
        insert em; 
        system.assertEquals(2, [SELECT count() FROM Case WHERE AccountId = :a.Id]);                                  
    }
    
    static testMethod void test_ThreadLimit_NoThread_CaseOrigin() {
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        CaseThreadSettings__mdt objTS = [SELECT DeveloperName, CaseRecordType__c, ClosedHours__c, DisableThreading__c
                                         FROM CaseThreadSettings__mdt WHERE DisableThreading__c = false LIMIT 1];
        Integer i = Integer.valueOf(objTS.ClosedHours__c) + 1;
        
        DateTime dt = system.now().addHours(-i);
        String rtName;
        List<String> lstString = objTS.CaseRecordType__c.split(',');
        for(String s: lstString){
            rtName = s.trim();
            break;
        }    
        
        CaseThreadOrigin__mdt objTO = [SELECT EmailAddress__c, CaseOrigin__c FROM CaseThreadOrigin__mdt LIMIT 1];
        String strEmail = objTO.EmailAddress__c;
        String strOrigin = objTO.CaseOrigin__c;
        
        String strDT = '"' + dt.year() + '-' + dt.month() + '-' + dt.day() + 'T' + dt.hour() + ':' + dt.minute() + ':' + '00"';
        String caseJSON = '{"Status":"Closed","ClosedDate":' + strDT + ',"CreatedDate":' + strDT + '}'; 
        //String caseJSON = '{"Status":"Closed","ClosedDate":"2012-11-04T17:54:26.000+0000","CreatedDate":"2012-10-04T17:54:26.000+0000"}'; 
        Case c = (Case) JSON.deserialize(caseJSON, Case.class); 
        c.AccountId = a.Id;
        c.Origin = 'Phone';
        c.RecordTypeId = [SELECT Id FROM RecordType WHERE SobjectType='Case' AND IsActive=true AND Name=:rtName].Id;
        insert c;
         
        System.debug('Test caseStatus1:' + c.ClosedDate); 
        system.assertEquals(1, [SELECT count() FROM Case WHERE AccountId = :a.Id]);
        
        EmailMessage em = new EmailMessage(FromAddress = 'test@abc.org', 
                                           Incoming = True, 
                                           ToAddress = strEmail, 
                                           Subject = 'UnitTest Email', 
                                           TextBody = '23456 ', 
                                           ParentId = c.Id); 
        
        insert em; 
        system.assertEquals(2, [SELECT count() FROM Case WHERE AccountId = :a.Id]); 
        system.assertEquals(strOrigin, [SELECT Id, Origin FROM Case WHERE AccountId = :a.Id ORDER BY CreatedDate DESC LIMIT 1].Origin);                                 
    }
 
    static testMethod void test_ThreadLimit_YesThread() {
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        CaseThreadSettings__mdt objTS = [SELECT DeveloperName, CaseRecordType__c, ClosedHours__c, DisableThreading__c
                                         FROM CaseThreadSettings__mdt WHERE DisableThreading__c = false LIMIT 1];
        Integer i = Integer.valueOf(objTS.ClosedHours__c/2);
        
        DateTime dt = system.now().addHours(-i);
        String rtName;
        List<String> lstString = objTS.CaseRecordType__c.split(',');
        for(String s: lstString){
            rtName = s.trim();
            break;
        }    
        
        String strDT = '"' + dt.year() + '-' + dt.month() + '-' + dt.day() + 'T' + dt.hour() + ':' + dt.minute() + ':' + '00"';
        String caseJSON = '{"Status":"Closed","ClosedDate":' + strDT + ',"CreatedDate":' + strDT + '}'; 
        
        Id rtId = [SELECT Id FROM RecordType WHERE SobjectType='Case' AND IsActive=true AND Name=:rtName].Id;
        Case c = new Case(AccountId = a.Id, RecordTypeId = rtId, Status = 'Closed');
        insert c;
         
        System.debug('Test caseStatus1:' + c.ClosedDate); 
        system.assertEquals(1, [SELECT count() FROM Case WHERE AccountId = :a.Id]);
        
        EmailMessage em = new EmailMessage(FromAddress = 'test@abc.org', 
                                           Incoming = True, 
                                           ToAddress='unittestingsalesforce@unittestingsalesforce.com', 
                                           Subject = 'UnitTest Email', 
                                           TextBody = '23456 ', 
                                           ParentId = c.Id); 
        
        insert em; 
        system.assertEquals(1, [SELECT count() FROM Case WHERE AccountId = :a.Id]);                                 
    }
}