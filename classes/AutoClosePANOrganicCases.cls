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
             
             if(micCaseMap.size() > 0){
             	 for(Organic_Analysis__c panCase :
             		[SELECT Id,
             		        Account_Name__c,
             		        OwnerId,
             		        IsClosed__c,
             		        Status__c
             		 FROM Organic_Analysis__c
             		 WHERE Account_Name__c in :micCaseMap.keySet() AND
             		 	   RecordTypeId = :panCaseRecordTypeId AND
                           IsClosed__c = false]){             		        	
		                    if(panCase.Id != NULL){
		                    	panCase.IsClosed__c = true;
		                    	//panCase.Status__c = 'Completed';
		                    	panCase.OwnerId = micCaseMap.get(panCase.Account_Name__c).OwnerId;
		                        panCaseList.add(panCase);
                    		}                          
             		 }
             }
             
             update(panCaseList);
            
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