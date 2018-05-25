@isTest
public with sharing class test_TextbrokerOrder {

	/*From Dennis notes:	  
		  Data in salesforce:
			Page 1 is empty/null, Page 1 Unique proposition is filled (So page 1 does not contain valid data)
			Page 2 is filled with 'sample page 2', Page 2 Unique proposition is filled with 'Page 2 Unique
			proposition'
			Page 3 is filled with 'sample page 3', Page 3 Unique proposition is filled with 'Page 3 Unique
			proposition'
			
		  The briefing that is generated should look like:
			Page 1: 'sample page 2', (Page 1 Unique Proposition: Page 2 Unique proposition)
			Page 2: 'sample page 3', (Page 2 Unique Proposition: Page 3 Unique proposition)
	*/
	public static testmethod void testGetPageInfo() {
		
		Case c = test_TextbrokerObjectCreator.getTextbrokerCases(1)[0];
		
		c.KeyWord_1_Service_Name__c = null;
		c.KeyWord_1_Unique_Proposition__c = 'Page 1 Unique proposition';
		
		c.KeyWord_2_Service_Name__c = 'sample page 2';
		c.KeyWord_2_Unique_Proposition__c = 'Page 2 Unique proposition';
		
		c.KeyWord_3_Service_Name__c = 'sample page 3';
		c.KeyWord_3_Unique_Proposition__c = 'Page 3 Unique proposition';
		
		update c;
		
		TextbrokerOrder o = new TextbrokerOrder(c);
		
		Test.startTest();
		String pageInfo = o.getPageInfo();
		Test.stopTest();
		
		String expectedResult = 'Page 1: sample page 2 (Page 1 Unique Proposition: Page 2 Unique proposition)\n' +
								'Page 2: sample page 3 (Page 2 Unique Proposition: Page 3 Unique proposition)\n\n';
		
		System.assertEquals(expectedResult, pageInfo);
	}
}