public with sharing class LocalHLPanelController {

    private final sObject mysObject;

    public Boolean lightHouseCancelStatus {get; set;}
    public Organic_Analysis__c organicCase {get; set;}

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public LocalHLPanelController(ApexPages.StandardController stdController) {
        this.mysObject = (sObject)stdController.getRecord();
        lightHouseCancelStatus = false;
        organicCase = new Organic_Analysis__c();

        Id acctId = mysObject.Id;

        List<Case> lhCancelStatusList = [select Id, Status from Case where RecordType.Name = 'LH Cancel Request' and Status in ('New', 'Free Time Period') and AccountId =: mysObject.Id limit 100];
        if(!lhCancelStatusList.isEmpty()){
            lightHouseCancelStatus = true;
        }

        for(Organic_Analysis__c record : Database.query(Label.LocalHLPanelOrganicCaseQuery)){
            organicCase = record;
        }
    }
}