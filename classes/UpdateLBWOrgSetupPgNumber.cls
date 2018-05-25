/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 12-Jan-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 12-Jan-2018
  Description ........: Class contains invocable method to update LBW Content Organic Setup Case
  Page Numbering
*****************************************************************************/

public class UpdateLBWOrgSetupPgNumber
{
    @InvocableMethod
    public static void UpdatePageNumbering(List<Id> caseIds)
    {
        try{
        
             if(caseIds.size() > 0){
             
                 Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId();
                 List<Case> dmlCases = new List<Case>();
                 
                 // get Case data
                 for(Case c : 
                     [SELECT Id,
                             Services_Offered__c,
                             Number_of_Pages__c,
                             Number_of_Pages_Text__c
                        FROM Case
                       WHERE Id IN: caseIds]){
                     
                     // look at Services Offered Text Area and parse       
                     List<String> lstStr = c.Services_Offered__c.split('\r\n');
                     Integer count = 1;
                     for(String s : lstStr){
                         
                         count++;
                     }
                     
                     String currPageNumStr = String.valueOf(count);
                     
                     System.Debug('Actual number of Pages: ' + String.valueOf(count));
                     System.Debug('Displayed number of Pages: ' + c.Number_of_Pages__c);
                     
                     // check if the displayed page number field is diffrent than the actual Services Offered pages
                     if(currPageNumStr != c.Number_of_Pages__c){
                     
                         // update the page number to display correctly
                         c.Number_of_Pages_Text__c = Integer.valueOf(currPageNumStr.trim());
                         
                         // add to update list
                         dmlCases.add(c);
                     }
                 }
                 
                 // check for Case List Updates
                 if(dmlCases.size() > 0){
                     // Perform Updates
                     update dmlCases;
                 }
             }
        }
        catch(Exception e){
        
            System.Debug('An error occurred: ' + e.getMessage());
        
        }
    }
}