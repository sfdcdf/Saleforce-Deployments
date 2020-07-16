/*****************
* LOG:
* Developer : Mahesh Bogila
* Date:07/10/2020
* Usage: Test Class for UpdateCustSurvey
* **************/
@istest
public class updatecustsurveyTest 
{ 
    
    
    static public account acc;
    static public contact con;
    static public Customer_Surveys__c eSur;
    
    public static testMethod void updatecsurveyTest() 
    {
        test.startTest();
        // create new test account .
        acc= new Account(Name = 'testAcc',BillingStreet='testStreet',BillingCity ='tectcity',Client_ID__c='100',BillingState='testState',BillingPostalCode='123',BillingCountry='testcountry',Description='testdesc');
        insert acc;
        
        // create new test Contact for Account.
        con= new contact(FirstName = 'test', LastName='Con',email='test@123.com',AccountId=acc.id);
        insert con;
        
        try 
        {
           eSur= new Customer_Surveys__c(Client_Email_from_Survey__c='test@123.com' );
           insert eSur;
           system.assert(eSur.Contact__c == null, 'Contact not Found');
        } catch (DMLException e) 
        {
            System.assert(e.getMessage().contains('expected message'), 'message=' + e.getMessage());
        }
        
        
        test.stopTest();
    }   
}