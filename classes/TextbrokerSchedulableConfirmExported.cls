/*
 * Confirms to Textbroker that an order that was ready has been exported. After the confirmation
 * they can change the status from ready to retrieved.
 *
 * To run it every hour execute the following as Anonymous:
		System.schedule('Textbroker - Confirm Exported Orders', '0 0 * * * ?', new TextbrokerSchedulableConfirmExported());
 */
global with sharing class TextbrokerSchedulableConfirmExported implements Schedulable {

	global void execute(SchedulableContext sc) {
		List<Id> organicSetupRecordTypeId = TextbrokerHelper.getorganicSetupRecordTypeId();

		List<Id> casesToConfirmIds = new List<Id>();
        List<Case> errorCases = new List<Case>();

        for (List<Case> cases : [ SELECT    Id,
                                            CopyStatus__c,
                                            CopyStatusError__c,
                                            (SELECT Id from Attachments LIMIT 1)
                                  FROM      Case
                                  WHERE     RecordTypeId in :organicSetupRecordTypeId
                                  AND       CopyStatus__c = 'Document Retrieved']) {

            for (Case c : cases) {
                if (c.attachments.size() > 0) {
                    System.debug('****ID to Export: ' + c.Id);
                    casesToConfirmIds.add(c.Id);
                } else {
                    System.debug('****Case with no attachment.  Cannot confirm export: ' + c.Id);
                    errorCases.add(c);
                }
            }
        }

        // TEXTBROKER-28: change status to error if trying to confirm export when there are no related attachments
        // this won't catch cases when there should be more than one attachment (e.g. for a revision) and yet there is only one
        if (! errorCases.isEmpty()) TextbrokerHelper.writeCopyStatusErrorToCase(errorCases, 'Attempt to confirm copy export, but no attachment found');

        // abrosius@soliantconsulting.com 2013Jul16: added check for empty list
        if (! casesToConfirmIds.isEmpty()) TextbrokerDispatcher.confirmOrdersExported(casesToConfirmIds);
    }
}