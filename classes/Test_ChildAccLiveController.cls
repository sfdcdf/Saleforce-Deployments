/************************************************************************************************
*Name: Mahesh Bogila
*Jira: https://jira.registeredsite.com/browse/TEAM-39179
*Purspose: Test class for ChildAccLiveController 
*/
@isTest(SeeAllData=true)
public class Test_ChildAccLiveController 
{
    


    static testMethod void testMethod1() 
    {
        
        Id ProfId =[Select Id from Profile where Name='Partner Community Lighthouse Dental'].Id;
       
        Id runuser=[Select Id,ContactId from user where Profileid=:ProfId And Contactid!=Null and IsActive=True Limit 1 ].ContactId;
        System.debug('***'+runuser);
        id RecordtypeId = [Select Id From RecordType Where SobjectType = 'Account' and Name = 'Partner Master Account'].Id;
        
        
        Id ParAccount=[Select Id,AccountId from Contact where Id =:runuser].AccountId;
        
        
        List<Account> lstChildAccount= new List<Account>();
        for(Integer i=0 ;i <200;i++)
        {
            Account acc = new Account();
            acc.Name ='Name'+i;
            acc.Status__c='LIVE';
            acc.ParentId=ParAccount;
            lstChildAccount.add(acc);
        }
        
        insert lstChildAccount;
        
        Test.startTest();

            ChildAccLiveController  obj = new ChildAccLiveController ();
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }


}