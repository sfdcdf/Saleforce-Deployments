/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 26-Sept-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 27-Sept-2017
  Description ........: Class contains invocable method to assign Case IMS Rep from Worksheet CSC Rep if criteria is met
*****************************************************************************/

public class IMSRepAssignment
{
    @InvocableMethod
    public static void assignIMSRepFromCSCRep(List<Id> caseIds)
    {
        try{
        
            if(caseIds.size() > 0){
            
                Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LH Master').getRecordTypeId();
                Map<Id, Lighthouse_Worksheets__c> worksheetsMap = new Map<Id, Lighthouse_Worksheets__c>();
                List<Case> dmlCases = new List<Case>();
                Set<Id> accountIdSet = new Set<Id>();
                DateTime todayDt = Datetime.Now();
                
                // populate Case Account Id Set
                for(Case c :
                        [SELECT AccountId
                           FROM Case
                          WHERE Id in: caseIds]){
                    
                    if(c.AccountId != NULL){
                        accountIdSet.add(c.AccountId);
                    }    
                }
                
                System.Debug('Account Id Set Size: ' + String.valueOf(accountIdSet.size()));
                
                // ensure there is an Account Id on Case to compare with worksheets
                if(accountIdSet.size() > 0){
                
                    // populate LH Worksheets Map
                    for(Lighthouse_Worksheets__c lm : 
                        [SELECT Id, 
                                CSC_Rep__c, 
                                MA_Date__c,
                                Date_Time_Case_IMS_Rep_Assigned__c,
                                Practice_Name__c
                           FROM Lighthouse_Worksheets__c
                          WHERE MA_Date__c != NULL AND
                                (MA_Date__c = LAST_N_DAYS:30 OR
                                MA_Date__c = NEXT_N_DAYS:30) AND
                                CSC_Rep__c != NULL AND
                                Practice_Name__c IN : accountIdSet
                       ORDER BY MA_Date__c DESC]){
                        
                        worksheetsMap.put(lm.Practice_Name__c, lm);
                    }
                }
                
                System.Debug('Worksheet List Size: ' + String.valueOf(worksheetsMap.size()));
                
                // check to see if there are worksheets that meet the criteria before proceeding further
                if(worksheetsMap.size() > 0){
                
                    // add to DML list if criteria is met for update
                    for(Case c :
                            [SELECT Id,
                                    IMS_Rep__c,
                                    AccountId,
                                    RecordTypeId
                               FROM Case
                              WHERE Id in: caseIds]){
                        
                        if(c.AccountId == worksheetsMap.get(c.AccountId).Practice_Name__c && c.IMS_Rep__c == null && c.RecordTypeId == caseRecordTypeId){
                            
                            System.Debug('Criteria met. Inside of assignment for update list');
                            
                            // assign Case IMS Rep from Worksheet
                            c.IMS_Rep__c = worksheetsMap.get(c.AccountId).CSC_Rep__c;
                            
                            // add to Case update list
                            dmlCases.add(c);
                        }    
                    }
                    
                    // check Case DML List for updates
                    if(dmlCases.size() > 0){
                        
                        // PERFORM UPDATE
                        update dmlCases;
                    }
                }
            }
        }
        catch(Exception e){
        
            System.Debug('An error occurred: ' + e.getMessage());
        }
    }
}