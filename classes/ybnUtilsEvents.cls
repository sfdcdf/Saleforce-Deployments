global class ybnUtilsEvents {

    private static ybnUtilsEvents self;
    private static Id ybnCorporateRelationshipAccountRecordTypeId;
    private static Id ybnCorporateRelationshipTaskRecordTypeId;
    private static Id ybnCorporateRelationshipEventRecordTypeId;
    
    private ybnUtilsEvents() {
    }
    
    public static ybnUtilsEvents getInstance() {
        if (self != null) return self;
        self = new ybnUtilsEvents();
        return self;
    }
    
    public Id getYbnCorporateRelationshipAccountRecordTypeId() {
        if (ybnCorporateRelationshipAccountRecordTypeId != null) {
            return ybnCorporateRelationshipAccountRecordTypeId;
        }
        ybnCorporateRelationshipAccountRecordTypeId = [SELECT Id 
            FROM RecordType 
            WHERE SobjectType = 'Account' AND Name = 'YBN Master Account' LIMIT 1].Id;
        return ybnCorporateRelationshipAccountRecordTypeId;
    }
    
    public Id getYbnCorporateRelationshipTaskRecordTypeId() {
        if (ybnCorporateRelationshipTaskRecordTypeId != null) {
            return ybnCorporateRelationshipTaskRecordTypeId;
        }
        ybnCorporateRelationshipTaskRecordTypeId =  [SELECT Id 
            FROM RecordType 
            WHERE SobjectType = 'Task' AND Name = 'YBN Corporate Relationship' LIMIT 1].Id;
        return ybnCorporateRelationshipTaskRecordTypeId;
    }
    
    public Id getYbnCorporateRelationshipEventRecordTypeId() {
        if (ybnCorporateRelationshipEventRecordTypeId != null) {
            return ybnCorporateRelationshipEventRecordTypeId;
        }
        ybnCorporateRelationshipEventRecordTypeId =  [SELECT Id 
            FROM RecordType 
            WHERE SobjectType = 'Event' AND Name = 'YBN: Corporate Location' LIMIT 1].Id;
        return ybnCorporateRelationshipEventRecordTypeId;
    }
    
    public static Event getServiceEvent(String subject) {
        Event e = new Event();
        e.Activity_Type__c = 'Client Services Activity';
        e.Subject = subject;
        e.Milestone__c = subject;
        e.Status__c = 'Not Started';
        e.internal_external_activity__c = 'External';
        e.ActivityDate = System.today().addDays(7);
        return e;
    }
}