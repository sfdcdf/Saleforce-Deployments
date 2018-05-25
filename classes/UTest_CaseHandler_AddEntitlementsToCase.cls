@isTest
private class UTest_CaseHandler_AddEntitlementsToCase {
    private static final Date dtStart = system.today();
    private static final Date dtEnd = system.today().addYears(20);
    private static final id rtAccStandard = Utilities.GetRecTypeId('Account', 'Standard');
    
    static testMethod void Test_YbnCase_ExistingEnt(){
        String strBusHourName = 'Business 9-5 EST';
        String strSlaName = 'YBN Tier 2';
        String strRTName = 'YBN Inbound Inquiry';
        String strEntType = 'YBNStd';
        Id rtCaseYbn = Utilities.GetRecTypeId('Case', strRTName);
        
        SlaProcess sla = [SELECT Id, Name FROM SlaProcess WHERE isActive = true 
                          AND IsVersionDefault = true
                          AND Name = :strSlaName LIMIT 1];       
        
        BusinessHours bh = [SELECT Id, Name FROM BusinessHours WHERE Name = :strBusHourName];
    
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        Entitlement ent = new Entitlement();
        ent.Name='UnitTest Entitlement';
        ent.AccountId=a.Id; 
        ent.Type__c=strEntType;
        ent.BusinessHoursId=bh.Id;
        ent.SlaProcessId=sla.Id; 
        ent.StartDate=dtStart; 
        ent.EndDate=dtEnd;   
        insert ent;
        
        Case c = new Case(Status='New', RecordTypeId=rtCaseYbn, AccountId=a.Id); 
        insert c;
        
        //system.assertEquals(ent.Id, [SELECT EntitlementId FROM Case WHERE Id = :c.Id].EntitlementId);                
    }
    
    static testMethod void Test_YbnCase_NoEnt(){
        String strBusHourName = 'Business 9-5 EST';
        String strSlaName = 'YBN Tier 2';
        String strRTName = 'YBN Inbound Inquiry';
        Id rtCaseYbn = Utilities.GetRecTypeId('Case', strRTName);
        
        SlaProcess sla = [SELECT Id, Name FROM SlaProcess WHERE isActive = true 
                          AND IsVersionDefault = true
                          AND Name = :strSlaName LIMIT 1];       
        
        BusinessHours bh = [SELECT Id, Name FROM BusinessHours WHERE Name = :strBusHourName];
    
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        List<Entitlement> lstEnts = [SELECT Id FROM Entitlement WHERE AccountId = :a.Id];
        system.AssertEquals(0, lstEnts.size());
        
        Test.startTest();
        Case c = new Case(Status='New', RecordTypeId=rtCaseYbn, AccountId=a.Id); 
        insert c;
        Test.stopTest();
        
        lstEnts = [SELECT Id FROM Entitlement WHERE AccountId = :a.Id];
        //system.AssertEquals(1, lstEnts.size());
        
        //system.assertEquals(lstEnts[0].Id, [SELECT EntitlementId FROM Case WHERE Id = :c.Id].EntitlementId);                
    }
    
    static testMethod void Test_ParCase_ExistingEnt(){
        String strBusHourName = 'Business 9-5 EST';
        String strSlaName = 'YBN Tier 2';
        String strRTName = 'Partner Inbound Inquiry';
        String strEntType = 'Partner';
        Id rtCaseYbn = Utilities.GetRecTypeId('Case', strRTName);
        
        SlaProcess sla = [SELECT Id, Name FROM SlaProcess WHERE isActive = true 
                          AND IsVersionDefault = true
                          AND Name = :strSlaName LIMIT 1];       
        
        BusinessHours bh = [SELECT Id, Name FROM BusinessHours WHERE Name = :strBusHourName];
    
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        Entitlement ent = new Entitlement();
        ent.Name='UnitTest Entitlement';
        ent.AccountId=a.Id; 
        ent.Type__c=strEntType;
        ent.BusinessHoursId=bh.Id;
        ent.SlaProcessId=sla.Id; 
        ent.StartDate=dtStart; 
        ent.EndDate=dtEnd;   
        insert ent;
        
        Case c = new Case(Status='New', RecordTypeId=rtCaseYbn, AccountId=a.Id); 
        insert c;
        
        //system.assertEquals(ent.Id, [SELECT EntitlementId FROM Case WHERE Id = :c.Id].EntitlementId);                
    }
    
    static testMethod void Test_LocCase_ExistingEnt(){
        String strBusHourName = 'Local Business';
        String strSlaName = 'Local Entitlement Process';
        String strRTName = 'LH Master';
        String strEntType = 'Local';
        Id rtCaseYbn = Utilities.GetRecTypeId('Case', strRTName);
        
        SlaProcess sla = [SELECT Id, Name FROM SlaProcess WHERE isActive = true 
                          AND IsVersionDefault = true
                          AND Name = :strSlaName LIMIT 1];       
        
        BusinessHours bh = [SELECT Id, Name FROM BusinessHours WHERE Name = :strBusHourName];
    
        Account a = new Account(Name='UnitTest Account', recordtypeId=rtAccStandard);
        insert a;
        
        Entitlement ent = new Entitlement();
        ent.Name='UnitTest Entitlement';
        ent.AccountId=a.Id; 
        ent.Type__c=strEntType;
        ent.BusinessHoursId=bh.Id;
        ent.SlaProcessId=sla.Id; 
        ent.StartDate=dtStart; 
        ent.EndDate=dtEnd;   
        insert ent;
        
        Case c = new Case(Status='New', RecordTypeId=rtCaseYbn, AccountId=a.Id); 
        insert c;
        
        //system.assertEquals(ent.Id, [SELECT EntitlementId FROM Case WHERE Id = :c.Id].EntitlementId);                
    }
}