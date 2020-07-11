public class updateCustSurvey 
{
    public static void updateConAct(set<id> custSurId)
    {
        map<string,id>map4CId = new map<string,id>();
        map<string,id>map4AId = new map<string,id>();
        set<string> emailSet = new set<string>();
        list<Customer_Surveys__c> lst2itterate = new list<Customer_Surveys__c>();
        
        for(Customer_Surveys__c temp: [Select Id,Account__c,Contact__c,Client_Email_from_Survey__c from Customer_Surveys__c Where Id in: custSurId and Client_Email_from_Survey__c!=null])
        {
           
            emailSet.add(temp.Client_Email_from_Survey__c);
            system.debug('******emailSet'+emailSet);
        } 
        
        for(contact tempCon:[Select Id,AccountId,email From contact where email =:emailSet ])
        {
            map4CId.put(tempCon.email,tempCon.Id);
            system.debug('******map4CId'+map4CId);
            map4AId.put(tempCon.email,tempCon.AccountId);
            system.debug('******map4AId'+map4AId);

        } 
        
        for(Customer_Surveys__c temp: [Select Id,Account__c,Contact__c,Client_Email_from_Survey__c from Customer_Surveys__c Where Client_Email_from_Survey__c=:emailSet])
        {
           
            temp.Id= temp.Id;
            temp.Contact__c=map4CId.get(temp.Contact__c);
            temp.Account__c=map4AId.get(temp.Account__c);
            lst2itterate.add(temp);
            system.debug('***lst2itterate'+lst2itterate);
        }
        
        try
        {
            if(lst2itterate.size()>0)
            {
                update lst2itterate;
            } 
        }
        catch(exception e)
            {
                System.debug('exception****'+e);
            } 
    }  
}