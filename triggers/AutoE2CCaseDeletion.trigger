//This trigger will be used to Kill emails coming via E2C and with certain domain names
trigger AutoE2CCaseDeletion on Case (before insert) {
    System.debug('Entered Kill Case trigger');
    YodleUtilities.killEmailToCase(Trigger.New);
}