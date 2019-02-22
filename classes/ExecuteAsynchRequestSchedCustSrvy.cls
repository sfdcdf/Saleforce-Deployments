/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 03-Jan-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 03-Jan-2019
  Description ........: Schedulable class to create CTS Tickets using the SFDC Sync Service to CTS ESB Service (API).
  Customer Survey object records.
*****************************************************************************/
public class ExecuteAsynchRequestSchedCustSrvy implements Schedulable {

     CTS_Integration_Setting__mdt integrationSetting = CTSSyncService.GetCTSIntegrationSettings();

    public void execute(SchedulableContext sc) {
    
        ExecuteSFDCToCTSAsynchRequestBatch csb = new ExecuteSFDCToCTSAsynchRequestBatch('Customer_Surveys__c');
        database.executebatch(csb, Integer.valueOf(integrationSetting.BatchSize__c));
    }
}