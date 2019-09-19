public without sharing class CaseScriptAssignmentUtil {
	private static List<Outbound_Call_Case_Automation__c> occaList = [select Id, Name, Case_Reason__c, Channel_Type__c, Product_Type__c, Sales_Notes_Contains__c, Script_URL__c, Segment__c, Total_Account_Revenue__c, Validation_Order__c, Website_Type__c, Winback_CSC_Script__c from Outbound_Call_Case_Automation__c order by Validation_Order__c];

	public static Case setCallScript(Case newCaseValue){
		if(occaList.isEmpty()){
			return newCaseValue;
		}
		for(Outbound_Call_Case_Automation__c occa : occaList){
			if(newCaseValue.Reason != occa.Case_Reason__c){
				continue;
			}
			if(String.isNotBlank(occa.Channel_Type__c) && !occa.Channel_Type__c.contains(newCaseValue.Channel_Type__c)){
				continue;
			}
			if(String.isNotBlank(occa.Product_Type__c) && occa.Product_Type__c != newCaseValue.Product_Type__c){
				continue;
			}
			if(String.isNotBlank(occa.Sales_Notes_Contains__c) && (String.isBlank(newCaseValue.Sales_Notes__c) || (!newCaseValue.Sales_Notes__c.contains('LH') && !newCaseValue.Sales_Notes__c.contains('Lighthouse')))){
				continue;
			}
			if((String.isBlank(newCaseValue.Segment__c) && String.isNotBlank(occa.Segment__c)) || (String.isNotBlank(occa.Segment__c) && String.isNotBlank(newCaseValue.Segment__c) && !occa.Segment__c.contains(newCaseValue.Segment__c))){
				continue;
			}
			if(occa.Total_Account_Revenue__c != null && newCaseValue.Total_Acct_Revenue__c > occa.Total_Account_Revenue__c){
				continue;
			}
			if(String.isNotBlank(occa.Website_Type__c) && occa.Website_Type__c != newCaseValue.Website_Type2__c){
				continue;
			}
			if(occa.Winback_CSC_Script__c && !newCaseValue.Winback_CSC_Script__c){
				continue;
			}
			newCaseValue.Link_to_Script__c = occa.Script_URL__c;
			break;
			
		}

		return newCaseValue;
	}
	
}