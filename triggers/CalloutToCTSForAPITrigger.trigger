/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 08-Jan-2019
  Description ........: Sends Http Request to CTS ESB Service for creating tickets when record
  is created/ inserted into Async Request object.
*****************************************************************************/
trigger CalloutToCTSForAPITrigger on SFDCToCTSAsynchRequest__c (after insert, after update) {

    
        System.Debug('*** Entered CalloutToCTSForAPITrigger ***');
        
        if (Test.isRunningTest())
        {
            System.Debug('In Test Mode, nothing was done');
            return; 
        }

        List<SFDCToCTSAsynchRequest__c> asyncList = new List<SFDCToCTSAsynchRequest__c>();
        String objName;

        if (trigger.isInsert)
        {
            for(SFDCToCTSAsynchRequest__c record : trigger.New){ 
             
                 asyncList.add(record);
                 objName = record.Object_Name__c;
             
                 System.Debug('*** CalloutToCTSForAPITrigger Object: ' + record);
             
                /*if(record.Status__c != trigger.oldMap.get(record.Id).Status__c && record.Status__c == 'INPROCESS'){
                    
                    System.Debug('*** CalloutToCTSForAPITrigger Object: ' + record);
                    
                    asyncList.add(record);
                    objName = record.Object_Name__c;
                }*/
            }
        }
        else if (Trigger.isUpdate)
        {
            for (Integer i=0; i<Trigger.new.size(); i++)
            {
                if (Trigger.New[i].Status__c == 'REPROCESS' && Trigger.Old[i].Status__c == 'ERROR')
                {
                    asyncList.add(Trigger.New[i]);
                    objName = Trigger.New[i].Object_Name__c;
                }
                
            }
        }
        
        
    
        if(asyncList.size() > 0){
        
            System.Debug('Call Before Process Method List Size: ' + String.valueOf(asyncList.size()));
            System.Debug('Object Name: ' + objName);
            CTSSyncService.ProcessSFDCToCTSAsynchRequest(objName, asyncList);
            System.Debug('End Process Method');
        
        }
       

}