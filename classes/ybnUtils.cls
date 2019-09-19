global class ybnUtils {

    private static ybnUtils self;
    private static Id ybnCorporateRelationshipAccountRecordTypeId;
    private static Id ybnCorporateRelationshipTaskRecordTypeId;
    private static Id ybnCorporateRelationshipEventRecordTypeId;
    private static Id ybnindividuallocationTaskRecordTypeId;

    private ybnUtils() {
    }
    
    public static ybnUtils getInstance() {
        if (self != null) return self;
        self = new ybnUtils();
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
    
    public Id getYbnIndividualLocationTaskRecordTypeId() {
        if (ybnIndividualLocationTaskRecordTypeId != null) {
            return YBNIndividualLocationTaskRecordTypeId;
        }
        ybnIndividualLocationTaskRecordTypeId =  [SELECT Id 
            FROM RecordType 
            WHERE SobjectType = 'Task' AND Name = 'YBN Individual Location' LIMIT 1].Id;
        return ybnIndividualLocationTaskRecordTypeId;
    }
    
    public Id getYbnCorporateRelationshipEventRecordTypeId() {
        if (ybnCorporateRelationshipEventRecordTypeId != null) {
            return ybnCorporateRelationshipEventRecordTypeId;
        }
        ybnCorporateRelationshipEventRecordTypeId =  [SELECT Id 
            FROM RecordType 
            WHERE SobjectType = 'Event' AND Name = 'YBN Corporate Relationship' LIMIT 1].Id;
        return ybnCorporateRelationshipEventRecordTypeId;
    }
    
    public static Task getServiceTask(String subject) {
        Task t = new Task();
        t.Activity_Type__c = 'Client Services Activity';
        t.Subject = subject;
        t.Milestone__c = subject;
        t.Status = 'Not Started';
        t.internal_external_activity__c = 'External';
        t.ActivityDate = System.today().addDays(7);
        return t;
    }
}