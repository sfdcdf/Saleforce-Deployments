public without sharing class WelcomePagePopUpController {
	@AuraEnabled
    public static Partner_Pop_up_Ad__c getPopUpAd(String popUpId) {
        // Perform isAccessible() check here 
        try{
            if(String.isNotBlank(popUpId)){
                Partner_Pop_up_Ad__c popupAd = [select Id, Name, Pop_up_Content__c from Partner_Pop_up_Ad__c where Id =: popUpId];
                return popupAd;
            }else{
                Partner_Pop_up_Ad__c popupAd = [select Id, Name, Pop_up_Content__c from Partner_Pop_up_Ad__c where Active__c = true and Id not in (select Partner_Pop_up_Ad__c from Partner_Pop_up_Ad_User_Dismissed__c where User__c =: UserInfo.getUserId()) order by Show_Order__c limit 1];
                return popupAd;
            }
		}catch(Exception E){
			return new Partner_Pop_up_Ad__c();
		}
    }

    @AuraEnabled
    public static Partner_Pop_up_Ad__c dismissPopUpAd(Partner_Pop_up_Ad__c dismissedAd) {
    	Partner_Pop_up_Ad_User_Dismissed__c dismissThis = new Partner_Pop_up_Ad_User_Dismissed__c();
    	dismissThis.Partner_Pop_up_Ad__c = dismissedAd.Id;
    	dismissThis.User__c = UserInfo.getUserId();
    	insert dismissThis;
        // Perform isAccessible() check here 
        try{
        	Partner_Pop_up_Ad__c popupAd = [select Id, Name, Pop_up_Content__c from Partner_Pop_up_Ad__c where Active__c = true and Id not in (select Partner_Pop_up_Ad__c from Partner_Pop_up_Ad_User_Dismissed__c where User__c =: UserInfo.getUserId()) order by Show_Order__c limit 1];
    		return popupAd;
    	}catch(Exception E){
    		return new Partner_Pop_up_Ad__c();
    	}
    }
}