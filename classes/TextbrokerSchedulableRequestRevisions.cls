/**
 * Checks for orders for which there are requested revisions. In case the request from the trigger failed.
 * To run it every hour execute the following as Anonymous:
 *      System.schedule('Textbroker - Request Revisions', '0 0 * * * ?', new TextbrokerSchedulableRequestRevisions());
 *
 * @author  Artie Brosius, abrosius@soliantconsulting.com
 * @date    2013-11-27
 *
*/
global with sharing class TextbrokerSchedulableRequestRevisions implements Schedulable {

    global void execute(SchedulableContext sc) {
        List<Id> organicSetupRecordTypeId = TextbrokerHelper.getorganicSetupRecordTypeId();

        List<Id> casesThatNeedRevisionsIds = new List<Id>();
        List<String> revisionsMessages = new List<String>();
        List<Case> errorCases = new List<Case>();

        for (List<Case> cases : [   SELECT  Id,
                                            CopyStatus__c,
                                            CopyStatusError__c
                                    FROM    Case
                                    WHERE   RecordTypeId in :organicSetupRecordTypeId
                                    AND     Status = 'Revisions Needed'
                                    AND     CopyStatus__c = 'Revisions Needed'                 // TEXTBROKER-28
                                ]) {

            for (Case c : cases) {
                if (! String.isBlank(c.CopyStatusError__c)) {
                    casesThatNeedRevisionsIds.add(c.Id);
                    revisionsMessages.add(c.CopyStatusError__c);
                } else {
                    System.debug('****Case with no Status Notes.  Cannot request revision: ' + c.Id);
                    errorCases.add(c);
                }
            }
        }

        // TEXTBROKER-28: change status to error if trying to request revision when there are no Status Notes
        if (! errorCases.isEmpty()) TextbrokerHelper.writeCopyStatusErrorToCase(errorCases, 'Attempt to request revisions, but no Status Notes provided.');

        if (! casesThatNeedRevisionsIds.isEmpty()) {
            TextbrokerDispatcher.requestRevisionsFuture(casesThatNeedRevisionsIds, revisionsMessages);
        }
    }

}