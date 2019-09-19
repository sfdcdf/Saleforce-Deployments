public without sharing class PartnerSalesFormController {
	public Boolean showLighthouseForm {get; set;}

	public PartnerSalesFormController() {
		showLighthouseForm = false;

		User userRecord = [select Id, IsPortalEnabled, Profile.Name from User where Id =: UserInfo.getUserId()];

		if(!userRecord.IsPortalEnabled || userRecord.Profile.Name == 'Partner Community Lighthouse Dental'){
			showLighthouseForm = true;
		}
	}
}