//This trigger will be used to Kill emails coming via E2C and with certain domain names
trigger AutoE2CCaseDeletion on Case (before insert) {
    
    User u = [SELECT Id, Name FROM User WHERE Name = 'DB Amp' LIMIT 1];

    // only execute if user is not DB Amp User
    if(UserInfo.getUserId() != u.Id){
        System.debug('Entered Kill Case trigger');
        System.debug('** User Executing: ' + u.Name);
        
        YodleUtilities.killEmailToCase(Trigger.New);
    }
}