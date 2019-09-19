@isTest
private class WelcomePagePopUpControllerTest {
	
	@isTest static void test_WelcomePagePopUpController() {
		Partner_Pop_up_Ad__c newPPAd = new Partner_Pop_up_Ad__c();
		newPPAd.Name = 'Test Ad';
		newPPAd.Active__c = true;
		newPPAd.Pop_up_Content__c = 'Test Content';
		newPPAd.Show_Order__c = 0;
		insert newPPAd;

		Partner_Pop_up_Ad__c newPPAd2 = new Partner_Pop_up_Ad__c();
		newPPAd2.Name = 'Test Ad';
		newPPAd2.Active__c = true;
		newPPAd2.Pop_up_Content__c = 'Test Content';
		newPPAd2.Show_Order__c = 1;
		insert newPPAd2;

		WelcomePagePopUpController.dismissPopUpAd(WelcomePagePopUpController.getPopUpAd(''));
	}

	@isTest static void test_WelcomePagePopUpControllerError() {
		WelcomePagePopUpController.dismissPopUpAd(WelcomePagePopUpController.getPopUpAd(''));
	}
	
}