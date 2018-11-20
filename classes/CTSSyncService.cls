/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 16-Nov-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 16-Nov-2018
  Description ........: CTS Sync Service class provides the mapping and data elements to send data to CTS from Salesforce
  to create tickets and reference the ticket back to the SFDC object
*****************************************************************************/
public without sharing class CTSSyncService{

    public static void getCTSTicket(string SFDCObjectName, string SFDCObjectInstance, string SFDCObjectId, string RoutingTableObjectInstance){
 
        Map<String, CTSObjectTriggerMap__mdt> routeObjMap = new Map<String, CTSObjectTriggerMap__mdt>
           ([SELECT Additional_Filter__c,
                    CaseOrigin__c,
                    CaseReason__c,
                    CTSAPIIdentifier__c,
                    CTSAssignedToLoginName__c,
                    CTSEmailAddress__c,
                    CTSNoteType__c,
                    Description__c,
                    DetailsTemplateName__c,
                    IntegrationType__c,
                    IsActive__c,
                    IsAutoClose__c,
                    IsCreateCTSNote__c,
                    IsExcludeWBN__c,
                    NoteDetailsTemplateName__c,
                    Object__c,
                    ProductType__c,
                    RecordTypeName__c,
                    MasterLabel
               FROM CTSObjectTriggerMap__mdt 
              WHERE MasterLabel = :RoutingTableObjectInstance LIMIT 1]);
              
        for(CTSObjectTriggerMap__mdt objMap : routeObjMap.values()){
            
            
        }
    }
}