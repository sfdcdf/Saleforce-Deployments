/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 19-Dec-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 3-Mar-2018
  Description ........: Class contains invocable method to update status and work completed date of Parent Case 
  when all associated child Cases are closed.
*****************************************************************************/
public class CaseWorkCompletedQuality
{
    @InvocableMethod
    public static void UpdateQltyParentCaseWorkCompleted(List<Id> caseIds)
    {
        try{
        
            if(caseIds.size() > 0){
            
                Set<Id> parentCaseIdsSet = new Set<Id>();
                Set<String> parentRecordTypes = new Set<String>();
                Set<String> statusExceptions = new Set<String>{'Awaiting Customer Response','Bug Reported'};
                List<Case> dmlCases = new List<Case>();
                Integer allChildOrganicCasesCnt = 0;
                Integer allChildCallQltyConcernCnt = 0;
                Integer allChildQualityCasesCnt = 0;
                Integer allChildDefaultCasesCnt = 0;
                Integer allChildTotal = 0;
                Integer closedChildOrganicCasesCnt = 0;
                Integer closedChildCallQltyConcernCnt = 0;
                Integer closedChildQualityCasesCnt = 0;
                Integer closedChildDefaultCasesCnt = 0;
                Integer allClosedChildTotal = 0;
                
                // get list of Case Master Record Type Names
                for(Case_Master_Record_Type__mdt rt :
                    [SELECT Record_Type_Name__c
                       FROM Case_Master_Record_Type__mdt
                      WHERE Is_Active__c = true]){
                
                    if(rt.Record_Type_Name__c != null){
                        parentRecordTypes.add(rt.Record_Type_Name__c);
                    }
                }
                
                for(Case c :
                    [SELECT Id,
                            ParentId
                       FROM Case
                      WHERE Id IN :caseIds]){
                    
                    // Case is Parent
                    if(c.Id != null){
                        parentCaseIdsSet.add(c.Id);
                    }
                }
                
                if(parentCaseIdsSet.size() > 0){
                
                    // TOTAL CHILD CASE COUNTS //
                    
                    // get total Default Case Counts regardless of any valid Status
                    allChildDefaultCasesCnt =
                        [SELECT COUNT()
                           FROM Case
                          WHERE ParentId IN :parentCaseIdsSet AND
                                Status != 'Delete Case'];
                          
                    // get total Organic Case Counts regardless of Status
                    allChildOrganicCasesCnt =
                        [SELECT COUNT()
                           FROM Organic_Analysis__c
                          WHERE Case_URL__c IN :parentCaseIdsSet];
                          
                    // get total Call Quality Concern Counts regardless of Status
                    allChildCallQltyConcernCnt =
                        [SELECT COUNT()
                           FROM Call_Quality_Concern__c
                          WHERE Case__c IN :parentCaseIdsSet];
                          
                    // get total Quality Case Counts regardless of Status
                    allChildQualityCasesCnt =
                        [SELECT COUNT()
                           FROM Quality_Case__c
                          WHERE Parent_Case__c IN :parentCaseIdsSet];
                    
                    // total of all child Cases
                    allChildTotal = allChildDefaultCasesCnt + allChildOrganicCasesCnt + allChildCallQltyConcernCnt + allChildQualityCasesCnt;
                          
                    
                    // TOTAL CHILD CASES CLOSED COUNTS //
                    
                    // get total Default Case Counts Closed
                    closedChildDefaultCasesCnt =
                        [SELECT COUNT()
                           FROM Case
                          WHERE ParentId IN :parentCaseIdsSet AND
                                IsClosed = true AND
                                Status != 'Delete Case'];
                          
                    // get total Organic Case Counts Closed
                    closedChildOrganicCasesCnt =
                        [SELECT COUNT()
                           FROM Organic_Analysis__c
                          WHERE Case_URL__c IN :parentCaseIdsSet AND
                                IsClosed__c = true];
                          
                    // get total Call Quality Concern Counts Closed
                    closedChildCallQltyConcernCnt =
                        [SELECT COUNT()
                           FROM Call_Quality_Concern__c
                          WHERE Case__c IN :parentCaseIdsSet AND
                                Status__c = 'Closed'];
                          
                    // get total Quality Case Counts Closed
                    closedChildQualityCasesCnt =
                        [SELECT COUNT()
                           FROM Quality_Case__c
                          WHERE Parent_Case__c IN :parentCaseIdsSet AND
                                IsClosed__c = true];
                
                    // total of all child Cases Closed
                    allClosedChildTotal = closedChildDefaultCasesCnt + closedChildOrganicCasesCnt + closedChildCallQltyConcernCnt + closedChildQualityCasesCnt;
                    
                    System.Debug('Total Child Cases: ' + String.valueOf(allChildTotal));
                    System.Debug('Total Child Cases Closed: ' + String.valueOf(allClosedChildTotal));
                    
                    // Check totals for match
                    if(allChildTotal == allClosedChildTotal && allClosedChildTotal > 0){
                        
                        // Update Parent Cases
                        for(Case cu :
                            [SELECT Id,
                                    Status,
                                    Date_Work_Completed__c,
                                    RecordType.Name
                               FROM Case
                              WHERE Id IN :parentCaseIdsSet AND
                                    IsClosed = false AND
                                    Status NOT IN :statusExceptions]){
                        
                            if(cu.Id != null && parentRecordTypes.contains(cu.RecordType.Name)){
                            
                                cu.Status = 'All Work Completed – Contact Client';
                                cu.Date_Work_Completed__c = System.Now();
                                
                                // add Case to update List
                                dmlCases.add(cu);
                            }
                        }
                        
                        if(dmlCases.size() > 0){
                            update dmlCases;
                        }
                    }
                }
            }
        }
        catch(Exception e){
            System.Debug('An error occurred: ' + e.getMessage());
        }
    }
}