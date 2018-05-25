/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 20-Nov-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 20-Nov-2017
  Description ........: Class contains invocable method to create CSC Cases based on business criteria 
  and logic when met.
*****************************************************************************/

public class AutoCreateCaseCSC
{
    @InvocableMethod
    public static void CreateCasesCSC(List<Id> caseIds)
    {
        try{
        
            if(caseIds.size() > 0){
            
                Id ncsCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('NCS - AutoLaunch').getRecordTypeId();    
                Id cscCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Outbound Call').getRecordTypeId();
                Id cscQueueId = [SELECT Id FROM Group WHERE DeveloperName = 'Outbound_Touch' LIMIT 1].Id;
                String[] prodExcludeSet = new String[]{'%Lighthouse%', '%YBN%'};
                String[] clientExcludeSet = new String[]{'%Lighthouse%', '%YBN%'};
                Map<Id, Case> ncsCaseMap = new Map<Id, Case>();
                Map<Id, Integer> cscCaseCntMap = new Map<Id, Integer>();
                List<Case> dmlCasesCSC = new List<Case>();
                
                // Check for valid Open NCS Cases by Account Id key
                for(Case ncs : 
                    [SELECT Id,
                            AccountId,
                            CaseNumber,
                            Created_Outbound_Call_Case__c,
                            Next_Scheduled_Call__c,
                            Sales_Notes__c,
                            Winback_CSC_Script__c,
                            X3_Day_Approval__c,
                            Channel_Type__c,
                            MA_Notes__c,
                            Budget__c, 
                            Website_Type2__c,
                            Account.Product_Type_Transactional__c
                       FROM Case
                      WHERE Id IN :caseIds AND
                            RecordTypeId = :ncsCaseRecordTypeId AND
                            IsClosed = false AND
                            (NOT Product_Type__c LIKE :prodExcludeSet) AND
                            (NOT Client_Type__c LIKE :clientExcludeSet) AND
                            Next_Scheduled_Call__c != NULL AND
                            Next_Scheduled_Call__c >= TODAY AND
                            Created_Outbound_Call_Case__c = false]){
                
                    // add data to Map
                    if(ncs.Id != NULL){
                        ncsCaseMap.put(ncs.AccountId, ncs);
                    }
                    
                    //System.Debug('Case Number added: ' + ncs.CaseNumber);
                    //System.Debug('NCS Map Size: ' + ncsCaseMap.size());
                }
                
                if(ncsCaseMap.size() > 0){
                
                    // check for existing Open CSC Cases
                    for(AggregateResult cscCnt :
                        [SELECT AccountId,
                                COUNT(Id) cscCount
                           FROM Case
                          WHERE RecordTypeId = :cscCaseRecordTypeId AND
                                IsClosed = false AND
                                AccountId IN :ncsCaseMap.keySet()
                       GROUP BY AccountId]){
                    
                        // add aggregate results to Map
                        cscCaseCntMap.put((Id) cscCnt.get('AccountId'), Integer.valueOf(cscCnt.get('cscCount'))); 
                    }
                    
                    // Create CSC Cases for Accounts meeting logic
                    for(Case c : ncsCaseMap.values()){
                    
                        //System.Debug('CSC Open Case Count: ' + String.valueOf(cscCaseCntMap.get(c.AccountId)));
                    
                        // if no existing CSC Case, create one
                        if(cscCaseCntMap.get(c.AccountId) == 0 || cscCaseCntMap.get(c.AccountId) == null){
                        
                            Case newCaseCSC = new Case();
                            newCaseCSC.RecordTypeId = cscCaseRecordTypeId;
                            newCaseCSC.AccountId = c.AccountId;
                            newCaseCSC.Reason = 'CSC';
                            newCaseCSC.OwnerId = cscQueueId; // Outbound Touch queue
                            newCaseCSC.Scheduled_Call__c = c.Next_Scheduled_Call__c;
                            newCaseCSC.ParentId = c.Id;
                            newCaseCSC.X3_Day_Approval__c = c.X3_Day_Approval__c;
                            newCaseCSC.Sales_Notes__c = c.Sales_Notes__c;
                            newCaseCSC.Winback_CSC_Script__c = c.Winback_CSC_Script__c;
                            newCaseCSC.Channel_Type__c = (c.Channel_Type__c == 'Transactional' ? 'Local' : c.Channel_Type__c);
                            newCaseCSC.MA_Notes__c = c.MA_Notes__c;
                            newCaseCSC.Budget__c = c.Budget__c;
                            newCaseCSC.Website_Type2__c = c.Website_Type2__c;
                            
                            // update boolean value on NCS Case
                            c.Created_Outbound_Call_Case__c = true;
                            
                            // add new CSC case to DML list
                            dmlCasesCSC.add(newCaseCSC);
                        }
                    }
                    
                    // check if there are CSC Cases to create
                    if(dmlCasesCSC.size() > 0){
                    
                        // INSERT CSC CASES
                        insert dmlCasesCSC;
                        
                        // UPDATE NCS CASE Created Outbound Case field on Parent Case
                        update ncsCaseMap.values();
                    }
                }
            }
        }
        catch(Exception e){
        
            System.Debug('An error occurred: ' + e.getMessage());
            Apex_Debug_Log__c dbLog = new Apex_Debug_Log__c();
            dbLog.Apex_Class__c = 'CreateCasesCSC';
            dbLog.Message__c = e.getMessage();
            dbLog.Method__c = 'CreateCasesCSC(Invocable)';
            dbLog.Record_Id__c = '';
            dbLog.Stack_Trace__c = e.getMessage();
            dbLog.Type__c = 'Error';
            
            insert dbLog;
        }
    }
}