public class PC_Dialing_Controller {
	
	public String cID {public get;public set;}
	public Campaign campaign {public get;private set;}
	public List<String> activityVals {public get;private set;}
	
	public PC_Dialing_Controller() {
		activityVals = new List<String>();
		if (System.currentPageReference().getParameters().get('cId') != null) {
			cID =  System.currentPageReference().getParameters().get('cId');
			campaign = [Select Name, Description, EndDate FROM Campaign WHERE Id = :cId];
			Schema.DescribeFieldResult taskPhontResult = Task.Phone_Result__c.getDescribe();
			for (Schema.PicklistEntry plE : taskPhontResult.getPicklistValues()) {
				if (plE.isActive() && plE.getLabel() != null) {
					activityVals.add(plE.getLabel());
				}
			}
		}
	}
	
	static testMethod void testPC_Dialing_Controller() {
		Campaign crCampaign = new Campaign();
        crCampaign.Name = 'test campaign'; 
        insert crCampaign;
		
		PageReference thisPage = System.currentPageReference();
		thisPage.getParameters().put('cId', crCampaign.Id);
		
		PC_Dialing_Controller controller = new PC_Dialing_Controller();
		System.assertEquals(controller.campaign.Id,crCampaign.Id);
		System.assertNotEquals(null,controller.activityVals);
		
	} 
}