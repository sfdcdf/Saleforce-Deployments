global class SandboxPostCopyCleanUpClass implements SandboxPostCopy {
	global void runApexClass(SandboxContext context) {
		Integration_Settings__c is = Integration_Settings__c.getOrgDefaults();
		is.Salesforce_Incoming_Service_authToken__c = 'NeedToUpdate';
		is.Sync_Account_Data_With_Marketo__c = false;
		is.Sync_Organic_Case_Data_With_Marketo__c = false;
		// Can turn these on once the Named Credentials is updated
		update is;

		List<String> accountEmailFieldList = new List<String>();

		for(Schema.SObjectField field : Account.getSobjectType().getDescribe().fields.getMap().values())
		{
		    if(Schema.DisplayType.EMAIL == field.getDescribe().getType()){
		        accountEmailFieldList.add(field.getDescribe().getName());
		    }
		}

		Database.executeBatch(new InvalidateEmailPostDeploy('select Id, ' + String.join(accountEmailFieldList, ', ') + ' from Account', accountEmailFieldList), 2000);

		List<String> caseEmailFieldList = new List<String>();

		for(Schema.SObjectField field : Case.getSobjectType().getDescribe().fields.getMap().values())
		{
		    if(Schema.DisplayType.EMAIL == field.getDescribe().getType()){
		        caseEmailFieldList.add(field.getDescribe().getName());
		    }
		}

		Database.executeBatch(new InvalidateEmailPostDeploy('select Id, ' + String.join(caseEmailFieldList, ', ') + ' from Case', caseEmailFieldList), 2000);

		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

		// Strings to hold the email addresses to which you are sending the email.
		String[] toAddresses = new String[] {'rustan.valino@yodle.com'}; 
		  

		// Assign the addresses for the To and CC lists to the mail object.
		mail.setToAddresses(toAddresses);

		// Specify the address used when the recipients reply to the email. 
		mail.setReplyTo('rustan.valino@yodle.com');

		// Specify the name used as the display name.
		mail.setSenderDisplayName('Sandbox Refresh Support');

		// Specify the subject line for your email address.
		mail.setSubject('Sandbox was refreshed');

		// Set to True if you want to BCC yourself on the email.
		mail.setBccSender(false);

		// Optionally append the salesforce.com email signature to the email.
		// The email address of the user executing the Apex Code will be used.
		mail.setUseSignature(false);

		// Specify the text content of the email.
		mail.setPlainTextBody('New Sandbox has been created. Please updated Named Credentials');

		// Send the email you have created.
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}
}