trigger CalloutToCTSForAPITrigger on SFDCToCTSAsynchRequest__c (after insert) {

    List<SFDCToCTSAsynchRequest__c> asyncList = new List<SFDCToCTSAsynchRequest__c>();
    String objName;


    for(SFDCToCTSAsynchRequest__c record : trigger.New){ 
     
         asyncList.add(record);
         objName = record.Object_Name__c;
     
        /*if(record.Status__c != trigger.oldMap.get(record.Id).Status__c && record.Status__c == 'INPROCESS'){
            
            System.Debug('*** CalloutToCTSForAPITrigger Object: ' + record);
            
            asyncList.add(record);
            objName = record.Object_Name__c;
        }*/
    }
    
    if(asyncList.size() > 0){
    
        System.Debug('Call Before Process Method List Size: ' + String.valueOf(asyncList.size()));
        CTSSyncService.ProcessSFDCToCTSAsynchRequest(objName, asyncList);
        System.Debug('End Process Method');
    
    }

}