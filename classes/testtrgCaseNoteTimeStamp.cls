@isTest
public class testtrgCaseNoteTimeStamp
  {
    /*
    *   Author:         Rehan Nayyer
    *   Create Date:    03/26/2015
    *   Description:    Test class for trgCaseNoteTimeStamp
    */

  static TestMethod void  myUnitTest()
  
     {
       Id REP_PROFILE_ID;    
       Id YBNAccountStandardRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Standard').getRecordTypeId();

       List<Profile> lsProfile = new List<Profile>();    
       lsProfile.addAll([SELECT Id, Name FROM Profile WHERE Name=:'System Administrator']);  
       if(lsProfile.size() == 1)
         {
            REP_PROFILE_ID = lsProfile[0].id;    
         }
       List<Case> lsCases = new List<Case>();
       List<User> newUserList = new List<User>();
       List<Account> newAccountList = new List<Account>();
       
       Test.startTest();
       
        User tUserAlpha = new User();
        tUserAlpha.LastName = 'tUserAlpha';
        tUserAlpha.Alias = 'talpha';
        tUserAlpha.TimeZoneSidKey = 'America/New_York';
        tUserAlpha.LocaleSidKey = 'en_US';
        tUserAlpha.EmailEncodingKey = 'ISO-8859-1';
        tUserAlpha.LanguageLocaleKey = 'en_US';
        tUserAlpha.ProfileId = REP_PROFILE_ID;
        tUserAlpha.Username = 'tUserAlpha@rogersoutrank.com';
        tUserAlpha.Email = 'tUserAlpha@rogersoutrank.com';
        newUserList.add(tUserAlpha);
        
        User tUserBeta = new User();
        tUserBeta.LastName = 'tUserBeta';
        tUserBeta.Alias = 'tbeta';
        tUserBeta.TimeZoneSidKey = 'America/New_York';
        tUserBeta.LocaleSidKey = 'en_US';
        tUserBeta.EmailEncodingKey = 'ISO-8859-1';
        tUserBeta.LanguageLocaleKey = 'en_US';
        tUserBeta.ProfileId = REP_PROFILE_ID;
        tUserBeta.Username = 'tUserBeta@rogersoutrank.com';
        tUserBeta.Email = 'tUserBeta@rogersoutrank.com';
        newUserList.add(tUserBeta);
        insert newUserList;
        
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        newAccountList.add(newAccount);
        insert newAccountList;
        
        System.runAs(tUserAlpha){
     
          // Create Case and assign to user 

           for(Integer icnt = 0; icnt<= 1; icnt++)
           {
               Case tmpCase = new Case();
               tmpCase.Priority = 'High';
               tmpCase.AccountId = newAccount.Id;
               tmpCase.Reason= 'Test';
               tmpCase.Subject= 'Test';
               tmpCase.Status= 'New';
               tmpCase.Notes_Escalation__c = 'Test Notes';
               tmpCase.OwnerId =  tUserAlpha.Id;
                      
               lsCases.add(tmpCase);
           }
     
           insert  lsCases; 
          }   
          
          
           System.runAs(tUserBeta) 
             {
          
               for(Case k  : lsCases)
                {
                   k.Notes_Escalation__c = 'Test Notes'; 
            
                }
               update lsCases;
          
             }       
                  
           Test.stopTest();           
        
           List<Case> insertedCases = [SELECT Notes_Escalation__c,Logged_Notes__c FROM Case WHERE Id IN :lsCases];
        
           for(Case c: insertedCases)
           {
              
              if(c.Logged_Notes__c <> null)
                {
                   Boolean result = c.Logged_Notes__c.contains('Test Notes');
                   System.assertEquals(result,true);
                   
                   Datetime thisDT = System.Now();
                   String myDate = thisDT.format('dd-MMM-yyyy'); 
                   Boolean result1 = c.Logged_Notes__c.contains(myDate);
                   System.assertEquals(result1,true);
              
                   Boolean result2 = c.Logged_Notes__c.contains(tUserAlpha.LastName);
                   System.assertEquals(result2,true);
                }
           }        
     }
  }