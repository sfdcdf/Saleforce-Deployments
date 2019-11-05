/**
 * Created by Francois Poirier on 2019-08-20.
 */
@isTest
public with sharing class icCancelAppointmentControllerTest {

    @isTest
    static void testCancelAppointmentByIdNotFound(){

        PageReference currentPage = Page.CancelAppointment;
        Test.setCurrentPage(currentPage);
        ApexPages.currentPage().getParameters().put('caseId', 'ABC123');

        icCancelAppointmentController controller = new icCancelAppointmentController();
        controller.cancelCaseById();

    }

    @isTest
    static void testCancelAppointmentByIdFound(){

        Case testCase = new Case();
        testCase.Subject = 'Test Case';
        insert testCase;

        PageReference currentPage = Page.CancelAppointment;
        Test.setCurrentPage(currentPage);
        ApexPages.currentPage().getParameters().put('caseId', testCase.Id);

        icCancelAppointmentController controller = new icCancelAppointmentController();
        controller.cancelCaseById();

    }
}