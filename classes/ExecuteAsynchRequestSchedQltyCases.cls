/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 03-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 03-Jan-2019
  Description ........: Schedulable class to create CTS Tickets using the SFDC Sync Service to CTS ESB Service (API).
  Quality Case object records.
*****************************************************************************/
public class ExecuteAsynchRequestSchedQltyCases implements Schedulable {

     CTS_Integration_Setting__mdt integrationSetting = CTSSyncService.GetCTSIntegrationSettings();

    public void execute(SchedulableContext sc) {
    
        ExecuteSFDCToCTSAsynchRequestBatch qcb = new ExecuteSFDCToCTSAsynchRequestBatch('Quality_Case__c');
        database.executebatch(qcb, Integer.valueOf(integrationSetting.BatchSize__c));
    }
}