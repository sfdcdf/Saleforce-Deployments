/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 16-Oct-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 16-Oct-2019
  Description ........: Schedulable class to execute removal of LH Batch Failure Cases on a daily schedule.
*****************************************************************************/
global class lhDeleteBatchFailureCasesSchedule Implements Schedulable {

    global void execute(SchedulableContext sc) {
  
        deleteCases();
    }
    
    public void deleteCases(){
    
        // define list
        List<Case> dmlList = new List<Case>();
        
        // Get Cases that meet the criteria for deletion
        for(Case c :[SELECT Id 
                        FROM Case 
                       WHERE Subject LIKE '%Failed transferring batch resource%' AND
                             Reason ='Inbound Inquiry' AND
                             Origin = 'support@lighthousepmg.com' AND
                             RecordType.Name = 'Master' AND
                             IsClosed = false LIMIT 500]){
            dmlList.add(c);
        }
        
        // check to see if records meet criteria and were added to list and remove
        if(dmlList.size() > 0){
            delete dmlList;
        }
    }
}