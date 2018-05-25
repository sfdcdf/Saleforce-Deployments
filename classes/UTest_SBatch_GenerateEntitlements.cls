@isTest
private class UTest_SBatch_GenerateEntitlements {
	public static Id rtYbnMasterAcc = Utilities.GetRecTypeId('Account', 'YBN Master Account');
    public static Id rtStandardAcc = Utilities.GetRecTypeId('Account', 'Standard');
    public static Id rtInboundCase = Utilities.GetRecTypeId('Case', 'YBN Inbound Inquiry');
    public static Id rtRequestCase = Utilities.GetRecTypeId('Case', 'YBN Request');
    
    public static Account accParent;
    public static Account accYbn0;
    public static Account accYbn1;
    public static Account accLocal;
    
    static void init(){
        List<Account> lstAccs = new List<Account>();
        accParent = new Account(RecordTypeId=rtYbnMasterAcc, 
                             Name='Miracle-Ear', 
                             Client_ID__c='00000010',
                             Status__c='LIVE'                             
                             );
        lstAccs.add(accParent);
        
        accYbn0 = new Account(RecordTypeId=rtStandardAcc, 
                          Name='UnitTest Std Child2', 
                          Client_ID__c='00000020',
                          Client_Type__c='YBN',
                          Individual_Location_Service_Level__c = 'Service Level A'
                          );
        lstAccs.add(accYbn0);
        
        accYbn1 = new Account(RecordTypeId=rtStandardAcc, 
                          Name='UnitTest Std Child2', 
                          Client_ID__c='00000021',
                          Client_Type__c='YBN',
                          Individual_Location_Service_Level__c = ''
                          );
        lstAccs.add(accYbn1);
        
        accLocal = new Account(RecordTypeId=rtStandardAcc, 
                          Name='UnitTest Std Child2', 
                          Client_ID__c='00000030',
                          Client_Type__c='Local'
                          );
        lstAccs.add(accLocal);
        insert lstAccs;                              
    }

    static testMethod void myUnitTest() {
    	init();
    	Set<Id> setAccIds = new Set<Id>();
    	List<Account> lstAccs = new List<Account>{accYbn0, accYbn1, accLocal};
    	for(Account acc: lstAccs){
    		setAccIds.add(acc.Id);
    	}
    	
    	System.assertEquals(0, [SELECT Count() FROM Entitlement WHERE AccountId IN :setAccIds]);
    	
    	Test.startTest();
    	Id batchJobId = Database.executeBatch(new SBatch_GenerateEntitlements(), 200);
    	Test.stopTest();
    	
    	system.assertEquals(1, [SELECT Count() FROM Entitlement WHERE AccountId = :accLocal.id]);						 
    	
    	List<Entitlement> lstEnts = [SELECT Id, Name, AccountId, SlaProcessId, BusinessHoursId FROM Entitlement 
    								 WHERE AccountId = :accYbn0.Id OR AccountId = :accYbn1.Id];
    	   	
    	system.assertEquals(4, lstEnts.size());						 
    }
}