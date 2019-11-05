/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 15-Aug-2019
  Last Modified By ...: E. Ross
  Last Modified Date .: 20-Aug-2019
  Description ........: Class contains invocable method to validate and update YBN Inbound Inquiry Case attributes submitted by 
                        Hand & Stone clients
*****************************************************************************/
public class WBNHandandStoneCaseUpdates
{
    @InvocableMethod
    public static void UpdateHandandStoneCaseAttributes(List<Id> caseIds)
    {
        System.Debug('**YBN Inb Inq Hand and Stone** Entering Invocable UpdateHandandStoneCaseAttributes ***');
        System.Debug('**YBN Inb Inq Hand and Stone** Case Ids List Size: ' + String.valueOf(caseIds.size()));
        System.Debug('**YBN Inb Inq Hand and Stone** Case Ids List Values: ' + caseIds);
        
        Map<String, EmailMessage> emailMessageToCaseMap = new Map<String, EmailMessage>();
        Map<Id, Case> caseMap = new Map<Id, Case>();
        Map<String, Contact> contactMap = new Map<String, Contact>();
        Map<Id, Account> accountMap = new Map<Id, Account>();
        Set<String> emailAddrSet = new Set<String>();
        Set<Id> acctIdsSet = new Set<Id>();
        
        try
        {
            if(caseIds.size() > 0){
            
                // Get Case Data into Map
                for(Case c :
                    [SELECT Id,
                            CaseNumber,
                            AccountId,
                            OwnerId,
                            YBNRequestReason__c,
                            YBNRequestDetail__c,
                            SuppliedEmail
                       FROM Case
                      WHERE Id IN: caseIds]){
                    caseMap.put(c.Id, c);
                    acctIdsSet.add(c.AccountId);
                }
                
                System.Debug('**YBN Inb Inq Hand and Stone** Account Id Set Size: ' + String.valueOf(acctIdsSet.size()));
                
                if(acctIdsSet.size() > 0){
                
                    // Get Related Accounts into Map
                    for(Account a :
                        [SELECT Id,
                                Name,
                                IMS_Rep__c
                           FROM Account
                          WHERE Id IN: acctIdsSet]){
                        accountMap.put(a.Id, a);
                    }
                }
                
                if(accountMap.size() > 0){
                
                    // Loop through Case Map and update Owner
                    for(Case c : caseMap.values()){
                    
                        System.Debug('**YBN Inb Inq Hand and Stone** Case Id: ' + c.Id);
                        System.Debug('**YBN Inb Inq Hand and Stone** Account Id: ' + c.AccountId);
                        
                        if(!String.IsBlank(accountMap.get(c.AccountId).IMS_Rep__c)){
                            c.OwnerId = accountMap.get(c.AccountId).IMS_Rep__c;
                        }
                        
                        c.YBNRequestReason__c = 'Web Dev';
                        c.YBNRequestDetail__c = 'Website Change/Update';
                    }
                    
                    update caseMap.values();
                }
            }
        }
        catch(Exception e)
        {
            System.Debug('**YBN Inb Inq Hand and Stone** An error occurred: ' + e);
        }
    }
}