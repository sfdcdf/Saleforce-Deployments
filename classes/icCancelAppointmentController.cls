/**
 * Created by Francois Poirier on 2019-08-19.
 */

public with sharing class icCancelAppointmentController {

    private final Case caseToCancel;

    public icCancelAppointmentController() {
        try {
            List<Case> cases = new List<Case>();
            String caseId = ApexPages.currentPage().getParameters().get('caseId');
            system.debug('caseId ===> ' + caseId);
            casetoCancel = [SELECT Id FROM Case WHERE Id = :caseId];
            /*cases = [SELECT Id FROM Case WHERE Id = :caseId];
            if(cases.size()>0){
                caseToCancel = cases[0];
            }
            else {
                system.debug('case not found');
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'test message when not found'); //System.Label.Cancel_Appointment_Error);
                ApexPages.addMessage(myMsg);
            }
            system.debug('cases ===> ' + cases);*/
        }
        catch (Exception ex){

            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, System.Label.Cancel_appointment_not_found);
            ApexPages.addMessage(myMsg);
            system.debug('an error occured: ' + ex.getMessage());
        }
    }

    public void cancelCaseById(){

        Try {

            caseToCancel.Status = 'Completed - Client Declined';
            caseToCancel.Scheduled_Call__c = null;
            update caseToCancel;
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, System.Label.Cancel_Appointment_Success);
            ApexPages.addMessage(myMsg);

        }
        catch (Exception ex){

            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, System.Label.Cancel_Appointment_Error);
            ApexPages.addMessage(myMsg);

        }
    }
}