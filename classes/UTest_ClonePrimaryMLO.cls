/***
@Name       : UTest_ClonePrimaryMLO
@Created    : Ron Gong, 12/27/2015
@Description: Testing: CaseCloneYBN(VF), CaseVFController(Apex), CaseBatch_ClonePrimaryMLO(Apex)
***/

@isTest
private class UTest_ClonePrimaryMLO {
    public static Id rtMasAcc = Utilities.GetRecTypeId('Account', 'YBN Master Account');
    public static Id rtStdAcc = Utilities.GetRecTypeId('Account', 'Standard');
    public static Id rtYbnCas = Utilities.GetRecTypeId('Case', 'YBN Outbound Touch Point');   
    public static Boolean runBulk = true;
    public static Integer numRecs = 50;    // Max can only be size of batch run, 50
    
    public static Account accPar;
    public static Account accChd1;
    public static Account accChd2;
    public static String strMLO = '2233445566';
    public static Map<Id, Account> mapAccs;
    
    static void init() {
        List<Account> lstAccs = new List<Account>();
               
        accPar = new Account(RecordTypeId=rtStdAcc, 
                             Name='UnitTest Std Parent', 
                             Primary_Multi_Location_Owner_For_TP__c=true,
                             Multi_Location_Owner_Primary_CID__c=strMLO,
                             Client_ID__c=strMLO,
                             Status__c='LIVE'
                             );
        lstAccs.add(accPar);
           
        accChd1 = new Account(RecordTypeId=rtStdAcc, 
                             Name='UnitTest Std Child1', 
                             Multi_Location_Owner_Primary_CID__c=strMLO,
                             Client_ID__c='00000001',
                             Status__c='LIVE'
                             );
        lstAccs.add(accChd1);
        
        accChd2 = new Account(RecordTypeId=rtStdAcc, 
                             Name='UnitTest Std Child2', 
                             Multi_Location_Owner_Primary_CID__c=strMLO,
                             Client_ID__c='00000002',
                             Status__c='LIVE'
                             );
        lstAccs.add(accChd2);

        insert lstAccs;
        mapAccs = new Map<Id, Account>(lstAccs);
        system.debug('$$$ lst inserted: ' + lstAccs);        
    }

    static void initBulk(){
        List<Account> lstAccs = new List<Account>();
        
        accPar = new Account(RecordTypeId=rtStdAcc, 
                             Name='UnitTest Std Parent', 
                             Primary_Multi_Location_Owner_For_TP__c=true,
                             Multi_Location_Owner_Primary_CID__c=strMLO,
                             Client_ID__c=strMLO,
                             Status__c='LIVE'
                             );
        lstAccs.add(accPar);
        
        for(Integer x=0; x<numRecs; x++){
            lstAccs.add(new Account(RecordTypeId=rtStdAcc, 
                            Name='UnitTest Std Child2', 
                            Multi_Location_Owner_Primary_CID__c=strMLO,
                            Client_ID__c='0000000' + x,
                            Status__c='LIVE'
                            ));
        }
        
        insert lstAccs;
        mapAccs = new Map<Id, Account>(lstAccs);
    }
  
    static testMethod void Test_NoId(){
        Case c = new Case();
        
        PageReference pr = new PageReference('/apex/CaseCloneYBN');
        Test.setCurrentPage(pr);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(c);
        CaseVFController con = new CaseVFController(sc); 
        con.cloneCase();
        
        for(ApexPages.Message msg: ApexPages.getMessages()){
            system.assertEquals(msg.getSummary(), con.MSG_MISSING_ID);
        }
    }
    
    static testMethod void Test_CaseClone(){
        init();
               
        Case primaryCase = new Case(RecordTypeId=rtYbnCas,
                          AccountId=accPar.Id,
                          Status='Completed',
                          Reason_Detail__c='Introduction Call/CSC',
                          X1st_Touch_Attempt_Made_By__c = UserInfo.getUserId(),
                          Attempt_1_Method__c = 'Phone',
                          Attempt_Date_1__c = System.now(),
                          Resolution_Attempt_Status_1__c = 'Completed',
                          Attempt_1_Contact_Made_With__c = 'UnitTest Contact',
                          Client_Satisfaction_Rating__c = '3 - Satisfied',
                          Time_To_Complete_Task_Minutes__c = 15,
                          Account_Updates_Changes__c = 'Covered - Client Initiated');
                          
        insert primaryCase;
        
        Test.startTest();
        PageReference pr = Page.CaseCloneYBN;
        pr.getParameters().put('Id', primaryCase.Id);
        Test.setCurrentPage(pr);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(primaryCase);
        CaseVFController con = new CaseVFController(sc); 
        con.cloneCase(); 
        Test.stopTest(); 
        
        List<Case> lstCases = [SELECT Id, CreatedDate, ClosedDate, Apex_Case_Cloned__c FROM Case WHERE AccountId IN :mapAccs.keySet()];               
        
        Integer numNewCases = 0;
        for(Case c: lstCases){
            if(c.Id != primaryCase.Id){
                numNewCases += 1;
                system.assert(c.CreatedDate<=c.ClosedDate);
            } else {
                system.assert(c.Apex_Case_Cloned__c==true);
            }
        }
        system.assertEquals(2, numNewCases);
        
        for(ApexPages.Message msg: ApexPages.getMessages()){
            system.assertEquals(msg.getSummary(), con.MSG_PROCESSED);
        }
    }
   
    static testMethod void Test_CaseClone_Bulk(){
        if(!runBulk)  return;
    
        initBulk();
               
        Case c = new Case(RecordTypeId=rtYbnCas,
                          AccountId=accPar.Id,
                          Status='Completed',
                          Reason_Detail__c='Introduction Call/CSC',
                          X1st_Touch_Attempt_Made_By__c = UserInfo.getUserId(),
                          Attempt_1_Method__c = 'Phone',
                          Attempt_Date_1__c = System.now(),
                          Resolution_Attempt_Status_1__c = 'Completed',
                          Attempt_1_Contact_Made_With__c = 'UnitTest Contact',
                          Client_Satisfaction_Rating__c = '3 - Satisfied',
                          Time_To_Complete_Task_Minutes__c = 15,
                          Account_Updates_Changes__c = 'Covered - Client Initiated');
                          
        insert c;
        
        Test.startTest();
        PageReference pr = Page.CaseCloneYBN;
        pr.getParameters().put('Id', c.Id);
        Test.setCurrentPage(pr);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(c);
        CaseVFController con = new CaseVFController(sc); 
        con.cloneCase(); 
        Test.stopTest(); 
        
        List<Case> lstCases = [SELECT Id, CreatedDate, ClosedDate FROM Case WHERE Id != :c.Id AND AccountId IN :mapAccs.keySet()];               
        system.assertEquals(numRecs, lstCases.size());
        for(Case ca: lstCases){
            system.assert(ca.CreatedDate<=ca.ClosedDate);
        }
        
        for(ApexPages.Message msg: ApexPages.getMessages()){
            system.assertEquals(msg.getSummary(), con.MSG_PROCESSED);
        }
    }
   
    static testMethod void Test_AlreadyCloned(){
        init();
               
        Case c = new Case(RecordTypeId=rtYbnCas,
                          AccountId=accPar.Id,
                          Status='Completed',
                          Reason_Detail__c='Introduction Call/CSC',
                          X1st_Touch_Attempt_Made_By__c = UserInfo.getUserId(),
                          Attempt_1_Method__c = 'Phone',
                          Attempt_Date_1__c = System.now(),
                          Resolution_Attempt_Status_1__c = 'Completed',
                          Attempt_1_Contact_Made_With__c = 'UnitTest Contact',
                          Client_Satisfaction_Rating__c = '3 - Satisfied',
                          Time_To_Complete_Task_Minutes__c = 15,
                          Account_Updates_Changes__c = 'Covered - Client Initiated',
                          Apex_Case_Cloned__c = true);
                          
        insert c;
        
        Test.startTest();
        PageReference pr = Page.CaseCloneYBN;
        pr.getParameters().put('Id', c.Id);
        Test.setCurrentPage(pr);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(c);
        CaseVFController con = new CaseVFController(sc); 
        con.cloneCase(); 
        Test.stopTest(); 
        
        for(ApexPages.Message msg: ApexPages.getMessages()){
            system.assertEquals(msg.getSummary(), con.MSG_ALREADY_CLONED);
        }
    }    
}