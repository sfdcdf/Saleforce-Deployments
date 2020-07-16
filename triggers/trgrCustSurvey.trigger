/*****************
 * LOG:
 * Developer : Mahesh Bogila
 * Date:07/10/2020
 * Usage: Forcustomer Survey which is submitted directly with email, then by email corresponding contact and account details are updated.
 * **************/

trigger trgrCustSurvey on Customer_Surveys__c (After insert,After Update) 
{
    if(checkRecursive.runAfterInsert() || checkRecursive.runAfterUpdate())
    {
        if(trigger.isInsert || trigger.isUpdate)
        {    
            set<id> cusSurId = new set<id>();
            for(Customer_Surveys__c tempCS:[select Id from Customer_Surveys__c Where Id in:trigger.newMap.keySet()])
            {
                cusSurId.add(tempCS.Id);
                system.debug('***'+cusSurId);
            }
            
            if(!cusSurId.isEmpty())
            {
                updateCustSurvey.UpdateConActMethod(cusSurId);
            }  
        }   
    }
}