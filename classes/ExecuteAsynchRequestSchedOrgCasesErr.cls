/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 03-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 03-Jan-2019
  Description ........: Schedulable class to create CTS Tickets using the SFDC Sync Service to CTS ESB Service (API).
  Organic Case object records Errored.
*****************************************************************************/
public class ExecuteAsynchRequestSchedOrgCasesErr implements Schedulable {

     CTS_Integration_Setting__mdt integrationSetting = CTSSyncService.GetCTSIntegrationSettings();

    public void execute(SchedulableContext sc) {
    
        ExecuteErrSFDCToCTSAsynchRequestBatch ocbe = new ExecuteErrSFDCToCTSAsynchRequestBatch('Organic_Analysis__c');
        database.executebatch(ocbe, Integer.valueOf(integrationSetting.BatchSize__c));
    }
}