/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 16-Nov-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 16-Nov-2018
  Description ........: CTS Sync Service class provides the mapping and data elements to send data to CTS from Salesforce
  to create tickets and reference the ticket back to the SFDC object
*****************************************************************************/
public without sharing class CTSSyncService{

    

    // returns dynamic SObject List for ticket data
    public static List<sObject> getTicketDataToSend(string SFDCObjectName, string RoutingTableObjectInstance){

        Schema.SObjectType sObj = Schema.getGlobalDescribe().get(SFDCObjectName);
        sObject sfdcObject = sObj.newSObject();
        List<sObject> tktData = new List<sObject>();
        
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
        
        Map<String, CTSObjecFieldsTriggerMap__mdt> routeObjFieldsMap = new Map<String, CTSObjecFieldsTriggerMap__mdt>
           ([SELECT Field_Names__c,
                    Object_Map_Reference__c
               FROM CTSObjecFieldsTriggerMap__mdt
              WHERE Object_Map_Reference__r.MasterLabel = :RoutingTableObjectInstance LIMIT 1]);
        
        
        System.Debug('*** List Returned: ' + tktData);
        
        return tktData;
    }
}