public class PerfectCall_CampaignController {
	
	public PerfectCall_CampaignController(){
		
	}

	public String sortBy { get; public set; }
	
	public List<SelectOption> sortByOptions {
        get {
        	sortByOptions = new List<SelectOption>();
       		sortByOptions.add(new SelectOption('Name','Name'));
       		sortByOptions.add(new SelectOption('StartDate','Start Date'));
       		sortByOptions.add(new SelectOption('EndDate','End Date'));
       		sortByOptions.add(new SelectOption('Type','Type'));
       		sortByOptions.add(new SelectOption('Status','Status'));
            return sortByOptions;
        }
        set;
    }
    
    
    
/*   public void sortMethod() {
    	
    } */

	public List<Campaign> campaigns {
        get {
        	if (sortBy == null) {
        		sortBy = 'Name';
        	}
        	String queryString = 'SELECT Id, Name, StartDate, Type, Status, EndDate, NumberOfResponses, NumberOfLeads, NumberOfContacts, Description ' +
        						 'FROM Campaign WHERE Type = \'Telemarketing\' AND (NumberOfLeads > 0 OR NumberOfContacts > 0)  ORDER BY ' + sortBy;
        	List<Campaign> campResults = Database.query(queryString);
        	if (campResults.size() > 0) {
        		return campResults;
        	}
        	else {
        		return new List<Campaign>();
        	}
           
        }
       
    }
    
    public void setCampaigns() {
    }
    
    public String cID {
		get {
			//GET CAMPAIGN ID FROM QUERY STRING
			if (System.currentPageReference().getParameters().get('cId') != null) {
				return System.currentPageReference().getParameters().get('cId');
			}
			else {
				return null;
			}
		}
		set;
	}
	
	public Campaign campaign {
		get {
			
			if (System.currentPageReference().getParameters().get('cId') != null) {
				return [Select Id, Name, EndDate, NumberOfResponses, NumberOfLeads, NumberOfContacts, Description FROM Campaign WHERE id=:System.currentPageReference().getParameters().get('cId')];
			}
			else {
				return null;
			}	
		}
		public set;
	}
	
	public String getEndDate() {
		if (campaign != null) {
			return campaign.EndDate.format();
			//return campaign.EndDate.month() + '/' + campaign.EndDate.day() + '/' + campaign.EndDate.year();
		}
		
		return null;
	}
	
	public static testMethod void testGetEndDate() {
		PageReference pageRef = Page.PerfectCall_Dialer;
        Test.setCurrentPage(pageRef);
        PerfectCall_CampaignController controller = new PerfectCall_CampaignController();
        try {
        	System.AssertEquals(null,controller.getEndDate());
        }
        catch (Exception e) {
        	System.debug(e);
        }
		Campaign campaign = new Campaign();
        campaign.Name = 'Test';
        campaign.EndDate = Date.today();
        insert campaign;
       
        ApexPages.currentPage().getParameters().put('cId', campaign.Id);
        //System.Debug('**********\n' + controller.campaign);
        controller = new PerfectCall_CampaignController();
        System.Debug('********************CAMPAIGN\n' + controller.campaign + '**********\n' + controller.getEndDate());
        
        System.AssertEquals(campaign.EndDate.format(),controller.getEndDate());
        
	}
	
	public static testMethod void testGetCID() {
		PageReference pageRef = Page.PerfectCall_Campaigns;
        Test.setCurrentPage(pageRef);
        PerfectCall_CampaignController controller = new PerfectCall_CampaignController();
       
     	try {
			System.AssertEquals(null,controller.cId);
     	}
     	catch (Exception e) {
        	System.Debug('cId is null');
        }
        Campaign campaign = new Campaign();
        campaign.Name = 'Test';
        insert campaign;
        
        
        ApexPages.currentPage().getParameters().put('cId', campaign.Id);
        try {
        	System.AssertNotEquals(null,controller.cId);
        	System.AssertEquals(controller.campaign.Id,controller.cId);
        }
        catch (Exception e) {
        	System.Debug('cId is null');
        }
 
	}
	public static testMethod void testSetCampaign() {
		
        PerfectCall_CampaignController controller = new PerfectCall_CampaignController();
        controller.setCampaigns();
        
	}
	
	public static testMethod void testGetCampaign() {
		PageReference pageRef = Page.PerfectCall_Dialer;
        Test.setCurrentPage(pageRef);
        
        Campaign campaign = new Campaign();
        
        PerfectCall_CampaignController controller = new PerfectCall_CampaignController();
        try {
        	System.assertEquals(null,controller.campaign.Id);
        }
        catch (Exception e) {
        	System.Debug('cId is null');
        }
        
        campaign.Name = 'Test Campaign';
        insert campaign;
        ApexPages.currentPage().getParameters().put('cId', campaign.Id);
        
        controller = new PerfectCall_CampaignController();
        try {
        	System.AssertNotEquals(null,controller.campaign.Id);
        }
        catch (Exception e) {
        	System.Debug('cId is null');
        }
	}
	public static testMethod void testPerfectCall_CampaignController() {
		PageReference pageRef = Page.PerfectCall_Campaigns;
        Test.setCurrentPage(pageRef);
        PerfectCall_CampaignController controller = new PerfectCall_CampaignController();
	}
	
	public static testMethod void testGetCampaigns() {
		String sortBy;
		List<Campaign> cList = new List<Campaign>();
		
		PageReference pageRef = Page.PerfectCall_Campaigns;
        Test.setCurrentPage(pageRef);
        PerfectCall_CampaignController controller = new PerfectCall_CampaignController();
        
        
        
       // System.assertEquals(new List<Campaign>(),controller.campaigns);
        
        for (Integer i=0;i < 4; i++) {
        	
        	Campaign campaignAdd = new Campaign(Name='Test' + i);
	      //  campaignAdd.Name = 'Test ' + i;
	        insert campaignAdd;
	      	cList.add(campaignAdd);
        }
        
        if (sortBy == null) {
    		sortBy = 'Name';
    	}
        
        String queryString = 'SELECT Id, Name, StartDate, Type, Status, EndDate, NumberOfResponses, NumberOfLeads, NumberOfContacts, Description ' +
        						 'FROM Campaign WHERE Type = \'Telemarketing\' AND (NumberOfLeads > 0 OR NumberOfContacts > 0)  ORDER BY ' + sortBy;
       	cList = Database.query(queryString);
        
        System.assertEquals(cList,controller.campaigns);
	}
	
	public static testMethod void testGetSortyByOptions() {
		PerfectCall_CampaignController controller = new PerfectCall_CampaignController();
		
    	List<SelectOption> sortOpts = new List<SelectOption>();
    	sortOpts = new List<SelectOption>();
   		sortOpts.add(new SelectOption('Name','Name'));
   		sortOpts.add(new SelectOption('StartDate','Start Date'));
   		sortOpts.add(new SelectOption('EndDate','End Date'));
   		sortOpts.add(new SelectOption('Type','Type'));
   		sortOpts.add(new SelectOption('Status','Status'));
   		
   		System.assertNotEquals(null,controller.sortByOptions);
    }


}