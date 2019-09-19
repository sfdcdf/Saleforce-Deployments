/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 19-Dec-2017
  Last Modified By ...: F. Poirier
  Last Modified Date .: 12-Sept-2018
  Description ........: Class contains invocable method to update status and work completed date of Parent Case 
  when all associated child Cases are closed.
*****************************************************************************/
public class CaseWorkCompleted
{
    @InvocableMethod
    public static void UpdateParentCaseWorkCompleted(List<Id> parentIds)
    {
        try{
        
            if(parentIds.size() > 0){
            
                Set<Id> parentCaseIdsSet = new Set<Id>();
                Set<String> parentRecordTypes = new Set<String>();
                Set<String> statusExceptions = new Set<String>{'Awaiting Customer Response','Bug Reported'};
                Boolean isParentCaseType = false;
                List<Case> dmlCases = new List<Case>();
                List<Case> allChildCases = new List<Case>();
                List<Organic_Analysis__c> allChildOrganicCases = new List<Organic_Analysis__c>();
                List<Call_Quality_Concern__c> allChildCallQualityConcerns = new List<Call_Quality_Concern__c>();
                List<Quality_Case__c> allChildQualityCases = new List<Quality_Case__c>();
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
                
               parentCaseIdsSet.addAll(parentIds);

                if(parentCaseIdsSet.size() > 0){
                
                    if(parentCaseIdsSet.size() > 0){

                        //Francois Poirier Refactor September 11 2018
                        // Get List of all child cases needed
                        allChildCases =
                        [
                                SELECT  Id,
                                        ParentId,
                                        Status,
                                        IsClosed
                                FROM    Case
                                WHERE   ParentId IN :parentCaseIdsSet
                        ];

                        for(Case c : allChildCases){

                            if(c.Status != 'Delete Case'){
                                allChildDefaultCasesCnt ++;
                                if(c.IsClosed){
                                    closedChildDefaultCasesCnt++;
                                }
                            }

                        }

                        system.debug('allChidlDefaultCasesCbt ===> ' + allChildDefaultCasesCnt);
                        system.debug('closedChildDefaultCasesCnt ===> ' + closedChildDefaultCasesCnt);

                        allChildOrganicCases =
                        [
                                SELECT  Id,
                                        IsClosed__c
                                FROM    Organic_Analysis__c
                                WHERE   Case_URL__c IN :parentCaseIdsSet
                        ];

                        allChildOrganicCasesCnt = allChildOrganicCases.size();

                        for(Organic_Analysis__c o : allChildOrganicCases){
                            if(o.IsClosed__c){
                                closedChildOrganicCasesCnt++;
                            }
                        }

                        system.debug('allChildOrganicCasesCnt ===> ' + allChildOrganicCasesCnt);
                        system.debug('closedChildOrganicCasesCnt ===> ' + closedChildOrganicCasesCnt);
                        allChildCallQualityConcerns =
                        [
                                SELECT  Id,
                                        Status__c
                                FROM Call_Quality_Concern__c
                                WHERE Case__c IN :parentCaseIdsSet

                        ];

                        allChildCallQltyConcernCnt = allChildCallQualityConcerns.size();

                        for(Call_Quality_Concern__c call : allChildCallQualityConcerns){
                            if(call.Status__c == 'Closed'){
                                closedChildCallQltyConcernCnt++;
                            }
                        }

                        allChildQualityCases = [
                                SELECT  Id,
                                        IsClosed__c
                                FROM Quality_Case__c
                                WHERE Parent_Case__c IN :parentCaseIdsSet

                        ];

                        allChildQualityCasesCnt = allChildQualityCases.size();

                        for(Quality_Case__c q : allChildQualityCases){
                            if(q.IsClosed__c){
                                closedChildQualityCasesCnt++;
                            }
                        }
                        
                        // total of all child Cases
                        allChildTotal = allChildDefaultCasesCnt + allChildOrganicCasesCnt + allChildCallQltyConcernCnt + allChildQualityCasesCnt;
                    
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
                                        Date_Work_Completed__c
                                   FROM Case
                                  WHERE Id IN :parentCaseIdsSet AND
                                        IsClosed = false AND
                                        RecordType.Name IN :parentRecordTypes]){
                            
                                if(cu.Id != null && !statusExceptions.contains(cu.Status)){
                                
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
        }
        catch(Exception e){
            System.Debug('An error occurred: ' + e.getMessage());
        }
    }
}