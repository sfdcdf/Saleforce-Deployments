/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 03-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 03-Jan-2019
  Description ........: Schedulable class to create CTS Tickets using the SFDC Sync Service to CTS ESB Service (API).
  Case object records Errored.
*****************************************************************************/
public class ExecuteAsynchRequestSchedCasesErr implements Schedulable {

     CTS_Integration_Setting__mdt integrationSetting = CTSSyncService.GetCTSIntegrationSettings();

    public void execute(SchedulableContext sc) {
    
        ExecuteErrSFDCToCTSAsynchRequestBatch cbe = new ExecuteErrSFDCToCTSAsynchRequestBatch('Case');
        database.executebatch(cbe, Integer.valueOf(integrationSetting.BatchSize__c));
    }
}