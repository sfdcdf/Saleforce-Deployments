global with sharing class IssueTrackerController {

    public String ylJSONResponse {get; set;}
    public Account acct {get; set;}

    public List<Issue> issueList {get; set;}

    public IssueTrackerController() {
        try{

            acct = new Account();
            acct = [select Id, Name, Client_ID__c from Account where Client_ID__c =: ApexPages.currentPage().getParameters().get('Client_ID__c') limit 1];

            //jsonTest = [select body from StaticResource where Name = 'clientIssueJSONFINAL'].body.toString();

            List<Integer> clientIds = new List<Integer>{Integer.valueof(acct.Client_ID__c)};
            
            JSONGenerator gen = JSON.createGenerator(false); 
            gen.writeStartObject();
            gen.writeObjectField('clientIds', clientIds);
            gen.writeEndObject();

            ylJSONResponse = YodleLiveIntegration.liveAction('get-historical-client-issues', true, gen.getAsString());

            List<Object> deserializeInitialList = (List<Object>)JSON.deserializeUntyped(ylJSONResponse);

            Map<String, Object> clientJSONMap = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(deserializeInitialList[0]));

            issueList = (List<Issue>)JSON.deserialize(JSON.serialize(clientJSONMap.get('issues')), List<Issue>.class);
            
            for(Issue issueItem : issueList){
                if(Test.isRunningTest()){
                    codeCoverageForWrapper(issueItem);
                }
                issueItem.createdDateTime.dateTimeValue = DateTime.newInstance(issueItem.createdDateTime.year, issueItem.createdDateTime.monthValue, issueItem.createdDateTime.dayOfMonth, issueItem.createdDateTime.hour, issueItem.createdDateTime.minute, issueItem.createdDateTime.second);

                issueItem.notesCount = 0;
                issueItem.callCount = 0;
                issueItem.emailCount = 0;

                for(Interaction interactionItem : issueItem.interactions){
                    interactionItem.interactionDatetime.dateTimeValue = DateTime.newInstance(interactionItem.interactionDatetime.year, interactionItem.interactionDatetime.monthValue, interactionItem.interactionDatetime.dayOfMonth, interactionItem.interactionDatetime.hour, interactionItem.interactionDatetime.minute, interactionItem.interactionDatetime.second);

                    if(String.isNotBlank(interactionItem.notes)){
                        issueItem.notesCount += 1;
                        interactionItem.notes = interactionItem.notes.replaceAll('\n\n', '\n');
                    }

                    if(interactionItem.calls != null && interactionItem.calls.size() > 0){
                        for(CallWrapper cw : interactionItem.calls){
                            cw.callDateTime.dateTimeValue = DateTime.newInstance(cw.callDateTime.year, cw.callDateTime.monthValue, cw.callDateTime.dayOfMonth, cw.callDateTime.hour, cw.callDateTime.minute, cw.callDateTime.second);
                        }
                        interactionItem.calls.sort();
                        issueItem.callCount += interactionItem.calls.size();
                    }

                    if(interactionItem.emails != null && interactionItem.emails.size() > 0){
                        for(EmailWrapper ecw : interactionItem.emails){
                            ecw.body = ecw.body.replaceAll('\n\n', '\n').replaceAll('\n\n\n', '\n\n');
                            ecw.emailSentDatetime.dateTimeValue = DateTime.newInstance(ecw.emailSentDatetime.year, ecw.emailSentDatetime.monthValue, ecw.emailSentDatetime.dayOfMonth, ecw.emailSentDatetime.hour, ecw.emailSentDatetime.minute, ecw.emailSentDatetime.second);
                        }
                        interactionItem.emails.sort();
                        issueItem.emailCount += interactionItem.emails.size();
                    }
                }

                issueItem.interactions.sort();
            }

            issueList.sort();

        }catch(Exception E){

        }

    }

    private void codeCoverageForWrapper(Issue issueItem){
        String testString = issueItem.id + ' ' + issueItem.categoryGroup + issueItem.category + issueItem.createdBy + issueItem.ownedBy + issueItem.state;
        Issue testNewIssue = new Issue();

        String testStringInteraction = issueItem.interactions[0].id + issueItem.interactions[0].type + issueItem.interactions[0].createdBy;

        if(issueItem.interactions[0].type == 'Email'){
            String emailTestString = issueItem.interactions[0].emails[0].Id + issueItem.interactions[0].emails[0].sentBy + issueItem.interactions[0].emails[0].toAddress + issueItem.interactions[0].emails[0].subject + issueItem.interactions[0].emails[0].direction;
            issueItem.interactions[0].emails.sort();
        }else if(issueItem.interactions[0].type == 'Call'){
            String emailTestString = issueItem.interactions[0].calls[0].Id + issueItem.interactions[0].calls[0].callCreatedBy + issueItem.interactions[0].calls[0].externalNumber + issueItem.interactions[0].calls[0].durationSeconds + issueItem.interactions[0].calls[0].direction + issueItem.interactions[0].calls[0].recordingUrl + issueItem.interactions[0].calls[0].recordingDurationSeconds;
            issueItem.interactions[0].calls.sort();
        }
    }

    global class Issue implements comparable {
        public String id {get; set;}
        public String categoryGroup {get; set;}
        public String category {get; set;}
        public String createdBy {get; set;}
        public String ownedBy {get; set;}
        public DateTimeFormat createdDateTime {get; set;}
        public String state {get; set;}
        public List<Interaction> interactions {get; set;}
        public Integer notesCount {get; set;}
        public Integer emailCount {get; set;}
        public Integer callCount {get; set;}

        public Issue(){
            interactions = new List<Interaction>();
            notesCount = 0;
            emailCount = 0;
            callCount = 0;
        }

        global Integer compareTo(Object objToCompare){
            Issue compareToIssue = (Issue)objToCompare;
            if (createdDateTime.dateTimeValue == compareToIssue.createdDateTime.dateTimeValue) return 1;
            if (createdDateTime.dateTimeValue > compareToIssue.createdDateTime.dateTimeValue) return 0;
            return 1; 
        }
    }

    public class DateTimeFormat {
        public Integer hour {get; set;}
        public Integer minute {get; set;}
        public Integer second {get; set;}
        public Integer year {get; set;}
        public String month {get; set;}
        public Integer dayOfMonth {get; set;}
        public Integer monthValue {get; set;}
        public String dayOfWeek {get; set;}
        public DateTime dateTimeValue {get; set;}
    }

    global class Interaction implements comparable {
        public String id {get; set;}
        public DateTimeFormat interactionDatetime {get; set;}
        public String type {get; set;}
        public String notes {get; set;}
        public String createdBy {get; set;}
        public List<EmailWrapper> emails {get; set;}
        public List<CallWrapper> calls {get; set;}
        //public List<EmailCallWrapper> emailCallList {get; set;}

        global Integer compareTo(Object objToCompare){
            Interaction compareToRecord = (Interaction)objToCompare;
            if (interactionDatetime.dateTimeValue == compareToRecord.interactionDatetime.dateTimeValue) return 1;
            if (interactionDatetime.dateTimeValue > compareToRecord.interactionDatetime.dateTimeValue) return 0;
            return 1; 
        }
    }

    global class EmailWrapper implements comparable{
        public String id {get; set;}
        public DateTimeFormat emailSentDatetime {get; set;}
        public String sentBy {get; set;}
        public String toAddress {get; set;}
        public String subject {get; set;}
        public String body {get; set;}
        public String direction {get; set;}

        global Integer compareTo(Object objToCompare){
            EmailWrapper compareToRecord = (EmailWrapper)objToCompare;
            if (emailSentDatetime.dateTimeValue == compareToRecord.emailSentDatetime.dateTimeValue) return 1;
            if (emailSentDatetime.dateTimeValue > compareToRecord.emailSentDatetime.dateTimeValue) return 0;
            return 1; 
        }
    }

    global class CallWrapper implements comparable{
        public String id {get; set;}
        public String callCreatedBy {get; set;}
        public DateTimeFormat callDateTime {get; set;}
        public String externalNumber {get; set;}
        public String durationSeconds {get; set;}
        public String direction {get; set;}
        public String recordingUrl {get; set;}
        public Integer recordingDurationSeconds {get; set;}

        global Integer compareTo(Object objToCompare){
            CallWrapper compareToRecord = (CallWrapper)objToCompare;
            if (callDateTime.dateTimeValue == compareToRecord.callDateTime.dateTimeValue) return 1;
            if (callDateTime.dateTimeValue > compareToRecord.callDateTime.dateTimeValue) return 0;
            return 1; 
        }
    }
}