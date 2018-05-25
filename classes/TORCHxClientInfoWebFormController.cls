public without sharing class TORCHxClientInfoWebFormController {

	public WebFormInfo webForm {get; set;}

	public Attachment attachedLogo1 {get; set;}
	public Attachment attachedLogo2 {get; set;}
	public Attachment attachedLogo3 {get; set;}
	public Attachment attachedLogo4 {get; set;}
	public Attachment attachedLogo5 {get; set;}

	public Case ncsCase {get; set;}

	private CaseComment csComment = new CaseComment();

	public TORCHxClientInfoWebFormController() {
		webForm = new WebFormInfo();
		ncsCase = new Case();

		attachedLogo1 = new Attachment();
		attachedLogo2 = new Attachment();
		attachedLogo3 = new Attachment();
		attachedLogo4 = new Attachment();
		attachedLogo5 = new Attachment();

		String saveParam = ApexPages.currentPage().getParameters().get('submitted');

		if(String.isNotBlank(saveParam) && saveParam.equalsIgnoreCase('true')){
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, Label.NCSCaseFormSubmitted);
        	ApexPages.addMessage(myMsg);
        	return;
		}

		try{
			ncsCase = [select Id, Account.Name from Case where Id =: ApexPages.currentPage().getParameters().get('ncsCaseID')];
		}catch(Exception E){
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, Label.NCSCaseNotFoundError);
        	ApexPages.addMessage(myMsg);
		}
	}

	public PageReference saveFormData(){
		system.debug(JSON.serializePretty(webForm));

		if(String.isNotBlank(webForm.primaryUserEmail) && webForm.primaryUserEmail.containsIgnoreCase('@yahoo')){
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'We cannot accept Yahoo email addresses.'));
			return null;
		}

		csComment.CommentBody = 'MLS ID:\r\n';
		csComment.CommentBody += webForm.mlsId + '\r\n\r\n';

		csComment.CommentBody += 'Primary User:\r\n';
		csComment.CommentBody += webForm.primaryUser + '\r\n\r\n';

		csComment.CommentBody += 'Primary User Email:\r\n';
		csComment.CommentBody += webForm.primaryUserEmail + '\r\n\r\n';

		csComment.CommentBody += 'Top 5 Target Areas:\r\n';
		csComment.CommentBody += webForm.top5TargetAreas + '\r\n\r\n';

		csComment.CommentBody += 'Filter List:\r\n';
		csComment.CommentBody += webForm.filterList + '\r\n\r\n';

		csComment.CommentBody += 'Domain Name:\r\n';
		csComment.CommentBody += webForm.domainName + '\r\n\r\n';

		csComment.CommentBody += 'Login Username:\r\n';
		csComment.CommentBody += webForm.loginUsername + '\r\n\r\n';

		csComment.CommentBody += 'Login Password:\r\n';
		csComment.CommentBody += webForm.loginPW + '\r\n\r\n';


		csComment.ParentId = ncsCase.Id;
		insert csComment;

		if(String.isNotBlank(attachedLogo1.name) && attachedLogo1.body != null){
			attachedLogo1.ParentId = ncsCase.Id;
			insert attachedLogo1;
		}

		if(String.isNotBlank(attachedLogo2.name) && attachedLogo2.body != null){
			attachedLogo2.ParentId = ncsCase.Id;
			insert attachedLogo2;
		}

		if(String.isNotBlank(attachedLogo3.name) && attachedLogo3.body != null){
			attachedLogo3.ParentId = ncsCase.Id;
			insert attachedLogo3;
		}

		if(String.isNotBlank(attachedLogo4.name) && attachedLogo4.body != null){
			attachedLogo4.ParentId = ncsCase.Id;
			insert attachedLogo4;
		}

		if(String.isNotBlank(attachedLogo5.name) && attachedLogo5.body != null){
			attachedLogo5.ParentId = ncsCase.Id;
			insert attachedLogo5;
		}

		PageReference pageRef = new PageReference('/apex/TORCHxClientInfoWebForm?ncsCaseID='+ncsCase.Id+'&submitted=true'); //Page.TORCHxClientInfoWebForm;
		pageRef.setRedirect(true);

		return pageRef;
	}

	public class WebFormInfo {
		public String mlsId {get; set;}
		public String primaryUser {get; set;}
		public String primaryUserEmail {get; set;}
		public String top5TargetAreas {get; set;}
		public String filterList {get; set;}
		public String domainName {get; set;}
		public String loginUsername {get; set;}
		public String loginPW {get; set;}
	}

}