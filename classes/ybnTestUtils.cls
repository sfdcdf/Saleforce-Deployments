public with sharing class ybnTestUtils {

	public static Account getAccountCorporateRelationship() {
		Account acct = new Account(Name = 'test');
        acct.RecordTypeId = ybnUtils.getInstance().getYbnCorporateRelationshipAccountRecordTypeId();
        insert acct;
        
        return acct;
	}
	
	public static Account getAccount() {
		Account acct = new Account(Name = 'test');
        insert acct;
        
        return acct;
	}
	
	public static Account getAccount(Id parentId) {
		Account acct = new Account(Name = 'test');
        acct.ParentId = parentId;
        insert acct;
        
        return acct;
	}
	
}