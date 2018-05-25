public with sharing class TextbrokerHelper {

    public static boolean enforceTextbrokerTriggerAfter = true;

    public static final String ns = 'urn:textbroker:core:201305';
    public static final String tbmo = 'urn:textbroker:managedorder:201305';
    public static final String xsi = 'http://www.w3.org/2001/XMLSchema-instance';

    public static String getEndpoint(String name) {
        List<TextbrokerEndpoint__c> endpoints = TextbrokerEndpoint__c.getAll().values();
        for(TextbrokerEndpoint__c endpoint : endpoints) {
            if(endpoint.Name == name) return endpoint.URL__c;
        }
        return 'ERROR: endpoint does not exist.';
    }
    public static String getConfigValue(String name) {
        List<TextbrokerConfig__c> config = TextbrokerConfig__c.getAll().values();
        for(TextbrokerConfig__c entry : config) {
            if(entry.Name == name) return entry.Value__c;
        }
        return 'ERROR: entry does not exist.';
    }
    public static Boolean getTriggerSwitchValue(String name) {
        List<Textbroker_Trigger_Switch__c> theSwitch = Textbroker_Trigger_Switch__c.getAll().values();
        for(Textbroker_Trigger_Switch__c entry : theSwitch) {
            if(entry.Name == name) return entry.Enable_Trigger__c;
        }
        return false; // will disable trigger by default
    }
    public static List<TextbrokerOrder> casesToOrders(List<Case> cases) {
        List<TextbrokerOrder> orders = new List<TextbrokerOrder>();
        if(cases != null && cases.size() > 0) {
            for(Case c : cases) {
                orders.add(new TextbrokerOrder(c));
            }
        }
        return orders;
    }

    /**
     * Updates the CopyStatus field to "Error Occurred" and writes an error
     * to the CopyStatusError field for every Case passed in
     *
     * @author  Artie Brosius, abrosius@soliantconsulting.com
     * @date    2013-11-27
     *
     * @param   cases       List of cases to update
     * @param   errorString message to write to CopyStatusError field
    */
    public static void writeCopyStatusErrorToCase(List<Case> cases, String errorString) {
        if (cases.isEmpty()) return;
        for (Case c : cases) {
            c.CopyStatus__c = 'Error Occurred';
            c.CopyStatusError__c = errorString.left(255);
        }
        update cases;
    }

    public static List<Id> getorganicSetupRecordTypeId() {
        return new List<Id>{Case.sObjectType.getDescribe().getRecordTypeInfosByName().get('Organic Setup').getRecordTypeId(), Case.sObjectType.getDescribe().getRecordTypeInfosByName().get('LBW Content Organic Setup').getRecordTypeId(), Case.sObjectType.getDescribe().getRecordTypeInfosByName().get('LS ATV Organic Setup').getRecordTypeId()};
    }
    public static Id getTextbrokerUserId() {
        return [select id from user where profile.Name = 'Third Party Vendor' and Name = 'Textbroker Users' and isActive = true limit 1].Id;
    }
    public static Integer getActiveAndQueudedBatchJobs() {
        return [SELECT COUNT() FROM AsyncApexJob WHERE JobType = 'BatchApex' AND Status IN ('Queued', 'Processing', 'Preparing')];
    }
    public static Boolean getIsActiveOrQueuedForBatchClass(String className) {
        return [SELECT COUNT() FROM AsyncApexJob WHERE JobType = 'BatchApex' AND Status IN ('Queued', 'Processing', 'Preparing') AND ApexClass.Name = :className] > 0;
    }
}