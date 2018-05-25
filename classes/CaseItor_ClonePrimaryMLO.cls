/***
@Name       : CaseItor_ClonePrimaryMLO
@Created    : Ron Gong, 01/03/2016
@Description: Custom Iterator to generate the clones of the primary MLO case.
***/
public class CaseItor_ClonePrimaryMLO implements Iterator<Case>{
    List<Case> lstCases {get;set;}
    Integer i {get;set;}
    
    public CaseItor_ClonePrimaryMLO(Set<Id> setCaseIds){
        Map<String, Schema.SObjectField> mapCaseFlds = Schema.SObjectType.Case.fields.getMap();
        Map<String, List<Case>> mapCid_Cases = new Map<String, List<Case>>();      
        Set<String> setCidAccKeys = new Set<String>();
        lstCases = new List<Case>();
        i=0;
              
        String qry = 'SELECT Account.Multi_Location_Owner_Primary_CID__c';
        
        for(String fld: mapCaseFlds.keySet()){
            Schema.DescribeFieldResult dfr = mapCaseFlds.get(fld).getDescribe();

            if(fld!='ClosedDate' && fld!='CreatedBy' && fld!='CreatedDate' && fld!='CaseNumber' 
               && fld!='LastModifiedBy' && dfr.isAutoNumber()==false && dfr.isCalculated()==false)
            {
                system.debug('$$$ mapCaseFlds: ' + mapCaseFlds.get(fld));
                qry += ',' + fld;
            }
        }
        
        qry += ' FROM Case WHERE Id IN :setCaseIds';
        qry += ' AND Apex_Case_Cloned__c = False';
        system.debug('$$$ case qry: ' + qry);
        for(Case c: Database.query(qry)){
            system.debug('$$$ case: ' + c);
            String cid = c.Account.Multi_Location_Owner_Primary_CID__c;
            // Capture cases and related Cid
            if(mapCid_Cases.get(cid)==null){
                mapCid_Cases.put(cid, new List<Case>{c});
            } else {
                mapCid_Cases.get(cid).add(c);
            }
            // Capture cid/acc combo to exclude
            setCidAccKeys.add(cid + c.AccountId);
            
            //c.Apex_Case_Cloned__c = True;
            //lstOldCases.add(c);
        }
        
        // Retrieve ALL accounts related to CIDs
        for(Account acc: [SELECT Id, Name, Multi_Location_Owner_Primary_CID__c, Status__c FROM Account 
                          WHERE Multi_Location_Owner_Primary_CID__c IN :mapCid_Cases.keySet()
                         ])
        {
            system.debug('$$$ acc: ' + acc);
            if(mapCid_Cases.get(acc.Multi_Location_Owner_Primary_CID__c)==null
               || setCidAccKeys.contains(acc.Multi_Location_Owner_Primary_CID__c + acc.Id))
            {
                continue;
            }
            // Generate clone of cases
            for(Case c: mapCid_Cases.get(acc.Multi_Location_Owner_Primary_CID__c))
            {
                // Intro cases do not have to have LIVE accounts
                if(c.Reason_Detail__c != 'Introduction Call/CSC' && acc.Status__c != 'LIVE'){
                    continue;
                }
                
                Case newCase = c.clone(false, true);
                newCase.AccountId = acc.id;
                newCase.Status = 'Closed - Multi Location Owner';
                lstCases.add(newCase);
            }                       
        }
    }
    
    public boolean hasNext(){
        if(i >= lstCases.size()){
            return false;
        } else {
            return true;
        }
    }
    
    public Case next(){
        i++;
        return lstCases[i-1];
    }
}