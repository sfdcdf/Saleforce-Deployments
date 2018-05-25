/***
@Name    : SBatch_GenerateEntitlements
@Desc    : Batch class to generate the Entitlement records for each new account
@Created : Ron Gong, 04/21/2016
@Execute : Scheduled Job
***/
global class SBatch_GenerateEntitlements implements Database.Batchable<sObject>, Schedulable{
    private Id rtAccMaster = Utilities.GetRecTypeId('Account', 'YBN Master Account'); 
    private Id rtAccStandard = Utilities.GetRecTypeId('Account', 'Standard');    
    private Set<String> setClientTypes = new Set<String>{'Local', 'Lighthouse', 'Partner', 'YBN'};
    private Set<String> setLocalTypes = new Set<String>{'Local', 'Lighthouse'};
    private Set<String> setYbnTypes = new Set<String>{'YBN'};
    private Set<String> setPartnerTypes = new Set<String>{'Partner'};
    
    global void execute(SchedulableContext sc){
        Database.executeBatch(this);
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){       
        String qry = 'SELECT Id, Name, Parent.Name, Client_Type__c, Individual_Location_Service_Level__c';
        qry += ', (Select Id, Name, SlaProcessId, BusinessHoursId, StartDate, EndDate From Entitlements)';
        qry += ' FROM Account';
        qry += ' WHERE CreatedDate = LAST_N_DAYS:20';
        qry += ' AND (RecordTypeId = :rtAccMaster ';
        qry += ' OR (RecordTypeId = :rtAccStandard AND Client_Type__c IN :setClientTypes))';
        qry += ' LIMIT 10000';
        return Database.getQueryLocator(qry);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope){
        if(scope.size()<1)  return;
        
        Map<String, BusinessHours> mapBHs = new Map<String, BusinessHours>();
        for(BusinessHours bh: [SELECT Id, Name FROM BusinessHours]){
            mapBHs.put(bh.Name, bh);
        }
        
        Map<String, SlaProcess> mapSlas = new Map<String, SlaProcess>();
        for(SlaProcess sla: [SELECT Id, Name, IsVersionDefault, BusinessHoursId From SlaProcess WHERE IsVersionDefault = true]){
            mapSlas.put(sla.Name, sla);
        }

        Set<String> setParNames = new Set<String>{'Aire Serv Heating & Air Conditioning Master', 'Mr. Appliance',
                                                     'Mr. Electric', 'Glass Doctor', 'Miracle-Ear'};
        Set<String> setTier2 = new Set<String>{'Service Level A', 'Service Level B'};                                        
        List<Entitlement> lstInsertEnts = new List<Entitlement>();
        
        system.debug('$$$ scope: ' + scope);
        for(Account acc: scope){
            if(acc.Entitlements.size()>0)  continue;    // skip account if entitlement already exists
            
            Id slaId;
            Id busId;
            String preFix = '';
            
            if(setLocalTypes.contains(acc.Client_Type__c)){
                slaId = mapSlas.get('Local Entitlement Process').Id;
                busId = mapBHs.get('Local Business').Id;
                preFix = acc.Client_Type__c + ' - ';
                
                lstInsertEnts.add(new Entitlement(Name=preFix + acc.Name, AccountId=acc.Id, SlaProcessId=slaId, BusinessHoursId=busId, 
                                                  StartDate=system.today(), EndDate=system.today().addYears(20)));
                                              
            } else if(setYbnTypes.contains(acc.Client_Type__c)){ 
                slaId = mapSlas.get('YBN Custom SLA').Id;
                busId = mapBHs.get('Business 9-5 EST').Id;
                preFix = 'YBNCus - ';
                
                lstInsertEnts.add(new Entitlement(Name=preFix + acc.Name, AccountId=acc.Id, SlaProcessId=slaId, BusinessHoursId=busId, 
                                                  StartDate=system.today(), EndDate=system.today().addYears(20)));
                                                  
                if(setParNames.contains(acc.Parent.Name))  slaId = mapSlas.get('YBN Tier 1').Id;
                else if(setTier2.contains(acc.Individual_Location_Service_Level__c))  slaId = mapSlas.get('YBN Tier 2').Id;
                else  slaId = mapSlas.get('YBN Tier 3').Id;
                preFix = 'YBNStd - ';
                
                lstInsertEnts.add(new Entitlement(Name=preFix + acc.Name, AccountId=acc.Id, SlaProcessId=slaId, BusinessHoursId=busId, 
                                                  StartDate=system.today(), EndDate=system.today().addYears(20)));                                           
            
            } else if(setPartnerTypes.contains(acc.Client_Type__c)){ 
                slaId = mapSlas.get('YBN Tier 2').Id;
                busId = mapBHs.get('Business 9-5 EST').Id;
                
                preFix = 'YBNStd - ';
                
                lstInsertEnts.add(new Entitlement(Name=preFix + acc.Name, AccountId=acc.Id, SlaProcessId=slaId, BusinessHoursId=busId, 
                                                  StartDate=system.today(), EndDate=system.today().addYears(20))); 
            }        
        }
        
        if(lstInsertEnts.size()>0)  Database.insert(lstInsertEnts);
    }
    
    global void finish(Database.BatchableContext info){
        
    }
}