/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 27-Mar-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 3-Nov-2018
  Description ........: Class contains invocable method to update Case record type, add services offered and verticals to related list
  if the Case Account has an Account Product Type of LS ATV.
  
  Modification 11-Oct-2018: Removed other Organic Case record types from logic; updated Page numbering
  Modification 3-Nov-2018: Updated Case description; auto-populate Case website/ domain from Account
*****************************************************************************/
public without sharing class OrganicCaseATVUpdates
{
    @InvocableMethod
    public static void lsATVUpdates(List<Id> caseIds)
    {
        try{
        
             Id lsATVCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('LS ATV Organic Setup').getRecordTypeId();
             List<Services_Offered_Vertical__c> dmlServicesOffered = new List<Services_Offered_Vertical__c>();
             List<Case> dmlCases = new List<Case>();
             List<String> caseServicesOfferedList = new List<String>();
             Map<String, Offering_to_Vertical_Map__c> offeringMasterMap = new Map<String, Offering_to_Vertical_Map__c>();
             String acctProductType = 'Lead Stream ATV';
             String verticalsDescrText = '';
             String caseDescrText = 'Please write custom content for the listed service pages and the homepage based on these Vertical(s):';
             Set<String> verticalsSet = new Set<String>();
             
             Id contentPilotOwner = [SELECT Id FROM Group WHERE DeveloperName = 'Content_Pilot' LIMIT 1].Id;
             //Id textbrokerUsrs = [SELECT Id FROM User WHERE Name = 'Textbroker Users' LIMIT 1].Id;
             
             // add current Services Offered to Verticals Master records to map
             for(Offering_to_Vertical_Map__c ovm :
                 [SELECT Offering_Name__c, 
                         Vertical_Name__c 
                    FROM Offering_to_Vertical_Map__c 
                   WHERE Is_Active__c = true]){
                 
                 offeringMasterMap.put(ovm.Offering_Name__c, ovm);
             }
             
             // get count of current Service Offerings/ Verticals (related list) on Case
             Integer relatedListCounts = 
                 [SELECT COUNT()
                    FROM Services_Offered_Vertical__c 
                   WHERE Case__c in :caseIds];
             
             System.Debug('Current related list count: ' + String.valueOf(relatedListCounts));
             
             if(relatedListCounts == 0){
             
                 // determine if the Case should be updated for LS ATV
                 for(Case c :
                     [SELECT Id,
                             RecordTypeId,
                             RecordType.Name,
                             AccountId,
                             Account.Product_Type_Transactional__c,
                             Account.Website,
                             Domain_Name_to_be_used_for_YO__c,
                             Services_Offered__c,
                             Number_of_Pages_Text__c,
                             IsClosed,
                             taskId__c,
                             Account.Client_ID__c,
                             Subject,
                             Description
                        FROM Case
                       WHERE Id IN: caseIds AND
                             RecordTypeId = :lsATVCaseRecordTypeId AND
                             Account.Product_Type_Transactional__c = :acctProductType AND
                             IsClosed = false]){
                     
                     // always update Task Id and owner for CTS pre launch
                     c.taskId__c = c.Account.Client_ID__c + '-002'; // 002 for LS ATV Accounts
                     c.OwnerId = contentPilotOwner;
                     c.Subject = 'LS ATV Content Setup';
                     c.Domain_Name_to_be_used_for_YO__c = c.Account.Website;
                     
                     if(!String.IsEmpty(c.Services_Offered__c)){
                     
                         System.Debug('*** Parsing Services Offered Text area field ***');
                     
                         // parse services offered text area and add to list
                         caseServicesOfferedList = c.Services_Offered__c.split('\r\n');
                         
                         System.Debug(caseServicesOfferedList);
                         
                         Integer count = 1;
                         
                         // loop through string list and begin adding lines to created list for Services Offered/ Vertical relationship
                         for(String s : caseServicesOfferedList){
                         
                             System.Debug('Offering to Vertical Mapping: ' + s);
                             Services_Offered_Vertical__c newSOV = new Services_Offered_Vertical__c();
                             count++;
                         
                             newSOV.Case__c = c.Id;
                             newSOV.Service_Offered__c = s;
                         
                             // has Mapped vertical; Offering is in master list
                             if(offeringMasterMap.containsKey(s) && offeringMasterMap.get(s).Vertical_Name__c != null){
                                 newSOV.Vertical__c = offeringMasterMap.get(s.trim()).Vertical_Name__c;
                             }
                             else{
                                 // No mapped Vertical; Offering is not in master list
                                 newSOV.Vertical__c = 'No Vertical Mapped';
                             }
                             
                             // add to update list
                             dmlServicesOffered.add(newSOV);
                             
                             verticalsSet.add(newSOV.Vertical__c);
                             
                         }
                         
                         for(String v : verticalsSet){
                             verticalsDescrText += v + ', ';
                         }
                         
                         System.Debug('*** vertical(s) Description: ' + verticalsDescrText.removeEnd(', '));
                         System.Debug('*** Updating Number of Pages to : ' + String.valueOf(count) + ' ***');
                         
                         String currPageNumStr = String.valueOf(count);
                         
                         c.Number_of_Pages_Text__c = Integer.valueOf(currPageNumStr.trim()); // number data type
                         verticalsDescrText = verticalsDescrText.removeEnd(', ');
                         verticalsDescrText = verticalsDescrText.replace('No Vertical Mapped, ', '');
                         c.Homepage__c = verticalsDescrText.replace('No Vertical Mapped', '');
                         c.Description = caseDescrText  + ' ' + c.Homepage__c;
                     }
                     
                     // add case to update list
                     dmlCases.add(c);
                 }
             }
             
             // CASE ATTRIBUTES
             if(dmlCases.size() > 0){
                 update dmlCases;
             }
             // SERVICES OFFERED/ VERTICALS
             if(dmlServicesOffered.size() > 0){
                 insert dmlServicesOffered;
             }
             
        }
        catch(Exception ex){
            System.Debug('An error occurred: ' + ex.getMessage());
        }
    }
}