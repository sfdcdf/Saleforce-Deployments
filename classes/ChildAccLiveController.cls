/************************************************************************************************
*Name: Mahesh Bogila
*Jira: https://jira.registeredsite.com/browse/TEAM-39179
*Purspose: Create daily sync job to ensure the LIVE Child Account reference displayed on the My Account Summary page of the Partner Portal (Partner facing)
*/
global class ChildAccLiveController implements Database.Batchable<SObject>{
    
    //Set for Account Id to be Update
    public set<Id> masterAccId = new set<Id>();
    
    //String to hold Query
    Public String query;
    
       
    global Database.querylocator start(Database.BatchableContext bc)
    { 
      //Set for Contact Id
      set<id> conId = new set<id>();
      
      //Set for Account Id  
      Set<id> aCCId = New Set<id>();
      
      // List to handle the User with Profile of Partner Community Lighthouse Dental and With Contact linked where User is active
      list<user> userList=[SELECT Id,Name,ContactId FROM User where Profile.Name='Partner Community Lighthouse Dental' and ContactId!=null and IsActive=True];
      
      //Loop to get contact Id Which is linked to User
      If(UserList.size()!=0)
      {
        for(user tempUsr:userList)
          {
            conId.Add(tempUsr.ContactId);
          } 
      }
      
      // List of the Contact along with the Account Id from The contact Id  
      list<Contact> conList =[Select Id, AccountId  From Contact where Id IN: conId ]; 
        
      //Loop to get Account Id from linked contact 
      If(conList.size()!=0)
      {   
        for(Contact tempCon:conList)
          {
                aCCid.Add(tempCon.AccountId);
          } 
      } 
      
      //Loop to get Master account Id where Record Type is Partner Master Account
      //
      If(aCCid.size()!=0)
      {   
        List<account> accountList = [Select Id from Account where Id IN: Accid and RecordType.Name = 'Partner Master Account'];  
        for(Account tempAcc:accountList)
          {
                masterAccId.Add(tempAcc.Id);
          } 
      }
      
       //To hold Master account Id along with necessary feilds.
       
       query =  'Select Id,ParentId, Children_Accounts_Live__c  from Account where id IN: MasterAccId';
       // system.debug('****Query****'+query);
       return Database.getQueryLocator(query);
       
    }

    global void execute(Database.BatchableContext bc,List<Account> FinAcc)
    {
        //Map to get Query of Result Map
        Map<Account,Integer> countResultMap = new Map<Account,Integer>();
        
       //To get Count of the Child records 
       if(finAcc.size()>0)
       {    
        for(Account a:FinAcc)
        {
            String Status='\'LIVE\'';
            Integer count = (Integer)Database.query('select count(Id)cnt from Account Where ParentId =\''
                                                    + A.Id+'\'AND Status__c='
                                                    + Status ).get(0).get('cnt');
            countResultMap.put(A, count);
        }
       }
        
        //list to get final Updation
        List<account> updateAcc = new list <Account>();
        
        for(account acc: finAcc)
        {
            acc.Children_Accounts_Live__c =countResultMap.get(Acc);
            UpdateAcc.Add(acc);
            
            
        }  
        system.debug('final List*******'+UpdateAcc);
         if(updateAcc.size()>0)
         {
             
             Update updateAcc;
             
         }    
           
    }

    global void finish(Database.BatchableContext bc)
    {
      /*  AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
                          FROM AsyncApexJob 
                          WHERE Id = :BC.getJobId()];

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Job Status: ' + a.Status);
        mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });*/
    }

}