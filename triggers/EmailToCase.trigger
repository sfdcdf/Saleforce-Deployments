trigger EmailToCase on EmailMessage (after Insert) {
    Set<Id> setEmails = new Set<Id>();
    Set<Id> setCaseIds = new Set<Id>();
       
    for(EmailMessage email : Trigger.New){
        if(email.incoming == true && email.ParentId != null)  setCaseIds.add(email.ParentId);        
    }

    if(setCaseIds.size()>0){
        // Capture only recently created cases
        DateTime dt = system.now().addMinutes(-5);
        Map<Id, Case> mapCases = new Map<Id, Case>([SELECT Id FROM Case WHERE Id IN :setCaseIds AND CreatedDate > :dt]);

        if(mapCases.size()>0){
            for(EmailMessage email : Trigger.new){
                if(mapCases.get(email.ParentId)!=null)  setEmails.add(email.Id);
            }
        }
    }

    if(!setEmails.isEmpty()){
        EmailToCaseManager.manageEmail2CaseAsync(setEmails);
    }
}