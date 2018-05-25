public with sharing class ConsolidatedCaseViewController {

	public Integer size {get;set;} 
    public Integer noOfRecords {get; set;} 
    public Account acct {get; set;}

	public ConsolidatedCaseViewController() {
		size = 25;
		acct = new Account();

		try{
			acct = [select Id, Name, Client_ID__c from Account where Id =: ApexPages.currentPage().getParameters().get('id')];
		}catch(Exception E){

		}
	}

	public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator([select Id, CaseNumber, RecordType.Name, Reason, Reason_Detail__c, Subject, Status, Owner.Name, CreatedDate, ClosedDate from Case where AccountId =: ApexPages.currentPage().getParameters().get('id') order by CreatedDate DESC]));
                setCon.setPageSize(size);  
                noOfRecords = setCon.getResultSize();
            }            
            return setCon;
        }
        set;
    }

    public List<Case> getCaseList(){
		return (List<Case>) setCon.getRecords();
	}

}