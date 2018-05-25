@isTest
 private class testParentAccountFields{
 static testMethod void testParentAccountFields(){
 User u = [select name, Id from User where Name = 'Chris Cormier'];
      
Account a = new Account(
            Name = 'Testerson Corp.'
            );
            
       insert a;
    

Account b = new Account(
            Name = 'Child 1',
           ParentId = a.Id                    
            );
            insert b;
            
Contact c = new Contact(
        FirstName = 'Dave',
        LastName = 'Thomas',
        AccountId = a.Id
);           
insert c;
a.Account_Director__c = u.Id;
a.Bulk_Google_Account__c = TRUE;


       Test.startTest(); 
  update a;         
    test.stopTest();  
 }
 }