trigger trgrCustSurvey on Customer_Surveys__c (After insert,After Update) 
{
    if(checkRecursive.runBeforeInsert())
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
                updateCustSurvey.updateConAct(cusSurId);
            }  
        }   
    }
}