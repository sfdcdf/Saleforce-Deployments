/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 16-Nov-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 16-Nov-2018
  Description ........: CTS Sync Service class provides the mapping and data elements to send data to CTS from Salesforce
  to create tickets and reference the ticket back to the SFDC object
*****************************************************************************/
public without sharing class CTSSyncService{

    // will return object triggered by scheduled job; not void
    public static void GetCTSTicket(string SFDCObjectName, string SFDCObjectInstance, string SFDCObjectId, string RoutingTableObjectInstance){
 
        Map<String, CTSObjectTriggerMap__mdt> routeObjMap = new Map<String, CTSObjectTriggerMap__mdt>();
        Map<Id, EmailTemplate> emailTemplatesMap = new Map<Id, EmailTemplate>();
        Id ctsEmailTemplateFolderId = [SELECT Id FROM Folder WHERE Name = 'CTS Templates'].Id;
        
        for(CTSObjectTriggerMap__mdt om :
            [SELECT Additional_Filter__c,
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
                    Object__r.Object_API_Name__c,
                    ProductType__c,
                    RecordTypeName__c,
                    MasterLabel
               FROM CTSObjectTriggerMap__mdt 
              WHERE MasterLabel = :RoutingTableObjectInstance LIMIT 1]){
        
            routeObjMap.put(om.MasterLabel, om);
        }
              
        if(routeObjMap.size() > 0){
        
            for(EmailTemplate et :
                [SELECT Id,
                        DeveloperName,
                        FolderId
                   FROM EmailTemplate
                  WHERE FolderId = :ctsEmailTemplateFolderId]){
            
                emailTemplatesMap.put(et.Id, et);
            }
        
            for(CTSObjectTriggerMap__mdt rom : routeObjMap.values()){
                for(EmailTemplate etm : emailTemplatesMap.values()){
                
                    if(routeObjMap.get(RoutingTableObjectInstance).IntegrationType__c == 'Email'){
                        
                        
                        
                    }
                    else{
                    
                        // API
                    }
                
                }
            }
        }
    }
    
    public static CTS_SFDC_Object_Base GetSFDCObject(string objectName, Id objectId, CTSObjectTriggerMap__mdt mappingInstance, string CTSIntegrationType)    
    {          
    
       CTS_SFDC_Object_Base baseObject;
       
       switch on objectName {
           when 'Case' {
               baseObject = new CTSSFDCCase(objectId, objectName, mappingInstance);               
           }
           when 'Organic_Analysis__c', 'Quality_Case__c', 'Best_Practice_Evaluation__c', 'Customer_Surveys__c', 'Lighthouse_Worksheets__c' {
               baseObject = new CTS_SFDC_Object_Base(objectId, objectName, mappingInstance);
           }                     
           when else {
               system.debug('Not a valid object name: ' + objectName);                
           }
       }
                     
       return baseObject;

    }          
}