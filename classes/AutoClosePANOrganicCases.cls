/****************************************************************************
  Company/ Author ....: R. Wang
  Date Created .......: 03-Oct-2018
  Last Modified By ...: R. Wang
  Last Modified Date .: 05-Oct-2018
  Description ........: Class contains invocable method to close PAN Organic Cases based on business criteria 
  and logic when met.
*****************************************************************************/

public class AutoClosePANOrganicCases
{
    @InvocableMethod
    public static void ClosePANOrganicCases(List<Id> micCaseIds)
    {
        try{
            
            system.debug('micCaseIds: ' + micCaseIds);
                
            Id panCaseRecordTypeId = Schema.SObjectType.Organic_Analysis__c.getRecordTypeInfosByName().get('PIN Action Needed').getRecordTypeId();
            Map<Id, Organic_Analysis__c> micCaseMap = new Map<Id, Organic_Analysis__c>();  
            List<Organic_Analysis__c> panCaseList = new List<Organic_Analysis__c>();
                               
            for(Organic_Analysis__c micCase : 
                    [SELECT Id,
                            Account_Name__c,
                            OwnerId
                      FROM Organic_Analysis__c
                      WHERE Id IN :micCaseIds 
                            ]){
                
                    // add data to Map
                    if(micCase.Id != NULL){                     
                        micCaseMap.put(micCase.Account_Name__c, micCase);
                    }                                     
             }
             
             System.Debug('*** MIC Case Map size ' + String.valueOf(micCaseMap.size()));
             
             if(micCaseMap.size() > 0){
                 for(Organic_Analysis__c panCase :
                    [SELECT Id,
                            Account_Name__c,
                            Attempts_to_Contact__c,
                            Pin_Action_Taken__c,
                            PIN_Action_Owner__c,
                            OwnerId,
                            IsClosed__c,
                            Status__c
                     FROM Organic_Analysis__c
                     WHERE Account_Name__c in :micCaseMap.keySet() AND
                           RecordTypeId = :panCaseRecordTypeId AND
                           IsClosed__c = false]){ 
                                                         
                            if(panCase.Id != NULL){
                                System.Debug('*** PAN Case Id: ' + panCase.Id);
                                panCase.Attempts_to_Contact__c = (String.IsBlank(panCase.Attempts_to_Contact__c) || Integer.valueOf(panCase.Attempts_to_Contact__c) < 1 ? '1' : panCase.Attempts_to_Contact__c);
                                panCase.Pin_Action_Taken__c = (String.IsBlank(panCase.Pin_Action_Taken__c) ? 'Not Actionable' : panCase.Pin_Action_Taken__c);
                                panCase.PIN_Action_Owner__c = (String.IsBlank(panCase.PIN_Action_Owner__c) ? micCaseMap.get(panCase.Account_Name__c).OwnerId : panCase.PIN_Action_Owner__c);
                                panCase.Status__c = 'Completed';
                                panCase.IsClosed__c = true;
                                panCase.OwnerId = micCaseMap.get(panCase.Account_Name__c).OwnerId;
                                panCaseList.add(panCase);
                            }                          
                     }
             }
             
             System.Debug('*** PAN Case List size ' + String.valueOf(panCaseList.size()));
             
             if(panCaseList.size() > 0){
                 update(panCaseList);
             }
            
        }
        catch(Exception e){
        
            System.Debug('An error occurred: ' + e.getMessage());
            Apex_Debug_Log__c dbLog = new Apex_Debug_Log__c();
            dbLog.Apex_Class__c = 'AutoClosePANOrganicCases';
            dbLog.Message__c = e.getMessage();
            dbLog.Method__c = 'ClosePANOrganicCases(Invocable)';
            dbLog.Record_Id__c = '';
            dbLog.Stack_Trace__c = e.getMessage();
            dbLog.Type__c = 'Error';
            
            insert dbLog;
        }
    }
}