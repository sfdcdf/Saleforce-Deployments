/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 03-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 03-Jan-2019
  Description ........: Schedulable class to create CTS Tickets using the SFDC Sync Service to CTS ESB Service (API).
  Case object records.
*****************************************************************************/
public class ExecuteAsynchRequestSchedCases implements Schedulable {

     CTS_Integration_Setting__mdt integrationSetting = CTSSyncService.GetCTSIntegrationSettings();

    public void execute(SchedulableContext sc) {
    
        ExecuteSFDCToCTSAsynchRequestBatch cb = new ExecuteSFDCToCTSAsynchRequestBatch('Case');
        database.executebatch(cb, Integer.valueOf(integrationSetting.BatchSize__c));
    }
}