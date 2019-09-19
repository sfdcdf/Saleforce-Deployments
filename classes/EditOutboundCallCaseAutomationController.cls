public without sharing class EditOutboundCallCaseAutomationController {
	public List<OCCAWrapper> outboundCallCaseRecords {get; set;}
	public Boolean editMode {get; set;}

	public EditOutboundCallCaseAutomationController() {
		editMode = false;
		fillData();
	}

	public void fillData(){
		/*outboundCallCaseRecords = Outbound_Call_Case_Automation__c.getAll().values();
		for(Outbound_Call_Case_Automation__c occa : Outbound_Call_Case_Automation__c.getAll().values()){
			outboundCallCaseRecords.set(Integer.valueof(occa.Name) - 1, occa);
		}*/

		outboundCallCaseRecords = new List<OCCAWrapper>();

		for(Outbound_Call_Case_Automation__c oc:  [select Id, Name, Case_Reason__c, Channel_Type__c, Product_Type__c, Sales_Notes_Contains__c, Script_URL__c, Segment__c, Total_Account_Revenue__c, Validation_Order__c, Website_Type__c, Winback_CSC_Script__c from Outbound_Call_Case_Automation__c order by Validation_Order__c]){
			OCCAWrapper occaWrap = new OCCAWrapper();
			occaWrap.selected = false;
			occaWrap.occa = oc;
			outboundCallCaseRecords.add(occaWrap);
		}
	}

	public void editChanges(){
		editMode = true;
	}

	public void cancelChanges(){
		editMode = false;
		fillData();
	}

	public void addCustomSetting(){
		OCCAWrapper occaWrap = new OCCAWrapper();
		occaWrap.selected = false;
		Outbound_Call_Case_Automation__c newOCCA = new Outbound_Call_Case_Automation__c(Validation_Order__c = outboundCallCaseRecords.size() + 1, Name = String.valueof(outboundCallCaseRecords.size() + 1));
		occaWrap.occa = newOCCA;
		outboundCallCaseRecords.add(occaWrap);
	}

	public void deleteSelected(){
		try{
			List<Outbound_Call_Case_Automation__c> deleteList = new List<Outbound_Call_Case_Automation__c>();

			List<OCCAWrapper> unsavedList = new List<OCCAWrapper>();

			for(OCCAWrapper oc : outboundCallCaseRecords){
				if(oc.selected && String.isNotBlank(oc.occa.Id)){
					deleteList.add(oc.occa);
				}else if(!oc.selected && String.isBlank(oc.occa.Id)){
					unsavedList.add(oc);
				}
			}
			delete deleteList;
			fillData();
			outboundCallCaseRecords.addAll(unsavedList);
		}catch(Exception E){

		}
	}

	public void saveChanges(){
		try{
			List<Outbound_Call_Case_Automation__c> updateList = new List<Outbound_Call_Case_Automation__c>();
			for(OCCAWrapper oc : outboundCallCaseRecords){
				updateList.add(oc.occa);
			}
			upsert updateList;
			fillData();
			editMode = false;
		}catch(Exception E){

		}
	}

	public class OCCAWrapper{
		public Boolean selected {get; set;}
		public Outbound_Call_Case_Automation__c occa {get; set;}
	}
}