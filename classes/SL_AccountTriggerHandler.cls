public with sharing class SL_AccountTriggerHandler {
    public SL_AccountTriggerHandler() {
        
    }

    public static void setSalesDirectorFields(List<Account> triggerNew){
        Map<Id, User> userMap = new Map<Id, User>([SELECT Id, UserRole.Name 
                                                   FROM User 
                                                   WHERE isActive = true]);
        Set<String> roleNames = new Set<String>{'YBN: Sales/Account Director C'};


        for(Account a :triggerNew){
            user acctOwner = userMap.get(a.OwnerId);
            if(acctOwner != null && acctOwner.UserRole != null ){
                if(acctOwner.UserRole.Name == 'YBN: Relationship Development Director'){
                    a.Force_Field_Sales_Director__c = a.OwnerId;
                }else if(roleNames.contains(acctOwner.UserRole.Name)){
                    a.Sales_Director__c = a.OwnerId;
                }
            }
        }
    }
}