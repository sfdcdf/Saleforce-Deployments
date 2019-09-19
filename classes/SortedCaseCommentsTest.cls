@istest

private class SortedCaseCommentsTest {

    static testmethod void validateSortedCaseComments() {
        
        Id YBNAccountStandardRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();
        
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        newAccount.RecordTypeId = YBNAccountStandardRecordTypeId;
        insert newAccount;
    
        Case newCase = new Case();
        newCase.Origin = 'YBN Email';
        newCase.AccountId = newAccount.Id;
        newCase.Status = 'In Progress';
        insert newCase;

        caseComment cc = new CaseComment(CommentBody = 'abc', parentid = newCase.id);
        insert cc;

        SortedCaseCommentsController sc = new SortedCaseCommentsController();
        sc.AttributeCaseId = newCase.Id;
        sc.getCaseComments();
    }

}