@isTest
private class AccountFeesControllerTest {
	
	@isTest static void test_AccountTest() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		String responseExample = '[{"fees": [{"brandedProductName": "Website","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "","productKey": "WEBSITE","itemType": "WEBSITE_DESIGN","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "AdverSite","productKey": "WEBSITE","itemType": "PRODUCT_SETUP_FEE","cents": 4900},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "PRODUCT_SETUP_FEE","cents": 0},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "PROMOTIONAL_DISCOUNT","cents": -10000},{"brandedProductName": "Marketing Essentials Lite","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials Lite","productKey": "ESSENTIALS_LITE","itemType": "MONTHLY_TAXABLE_COMPONENT_FEE","cents": 0},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "MONTHLY_TAXABLE_COMPONENT_FEE","cents": 750},{"brandedProductName": "Marketing Essentials Lite","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "Marketing Essentials Lite","productKey": "ESSENTIALS_LITE","itemType": "PRODUCT_SETUP_FEE","cents": 0},{"brandedProductName": "Sponsored","pricingPackageFeeType": "BUDGET","pricingPackageDisplayName": "","productKey": "SEM","itemType": "BALANCE_REFILL","cents": 0},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "MONTHLY_NONTAXABLE_COMPONENT_FEE","cents": 29150},{"brandedProductName": "Marketing Essentials Lite","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials Lite","productKey": "ESSENTIALS_LITE","itemType": "MONTHLY_NONTAXABLE_COMPONENT_FEE","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "AdverSite","productKey": "WEBSITE","itemType": "MONTHLY_PRODUCT_FEE","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "","productKey": "WEBSITE","itemType": "ADSTATION_SETUP","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "","productKey": "WEBSITE","itemType": "MONTHLY_MANAGEMENT_FEE","cents": 0}],"clientId": "315265"}]';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));
		
		Account acct = new Account();
		acct.Name = 'Test Account';
		acct.Client_ID__c = '32322';
		insert acct;
		
		Test.startTest();

		PageReference currentPage = Page.AccountFees;
		Test.setCurrentPage(currentPage);

		ApexPages.StandardController sc = new ApexPages.standardController(acct);
		AccountFeesController contrExt = new AccountFeesController(sc);
		contrExt.getFeesMap();

		Test.stopTest();
	}

	@isTest static void test_CaseTest() {
		TestCustomSettingInitializer testInit = new TestCustomSettingInitializer();
		String responseExample = '[{"fees": [{"brandedProductName": "Website","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "","productKey": "WEBSITE","itemType": "WEBSITE_DESIGN","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "AdverSite","productKey": "WEBSITE","itemType": "PRODUCT_SETUP_FEE","cents": 4900},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "PRODUCT_SETUP_FEE","cents": 0},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "PROMOTIONAL_DISCOUNT","cents": -10000},{"brandedProductName": "Marketing Essentials Lite","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials Lite","productKey": "ESSENTIALS_LITE","itemType": "MONTHLY_TAXABLE_COMPONENT_FEE","cents": 0},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "MONTHLY_TAXABLE_COMPONENT_FEE","cents": 750},{"brandedProductName": "Marketing Essentials Lite","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "Marketing Essentials Lite","productKey": "ESSENTIALS_LITE","itemType": "PRODUCT_SETUP_FEE","cents": 0},{"brandedProductName": "Sponsored","pricingPackageFeeType": "BUDGET","pricingPackageDisplayName": "","productKey": "SEM","itemType": "BALANCE_REFILL","cents": 0},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "MONTHLY_NONTAXABLE_COMPONENT_FEE","cents": 29150},{"brandedProductName": "Marketing Essentials Lite","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials Lite","productKey": "ESSENTIALS_LITE","itemType": "MONTHLY_NONTAXABLE_COMPONENT_FEE","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "AdverSite","productKey": "WEBSITE","itemType": "MONTHLY_PRODUCT_FEE","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "","productKey": "WEBSITE","itemType": "ADSTATION_SETUP","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "","productKey": "WEBSITE","itemType": "MONTHLY_MANAGEMENT_FEE","cents": 0}],"clientId": "315265"}]';
		Test.setMock(HttpCalloutMock.class, new YodleLiveIntegrationCalloutMock(200, 'OK', responseExample, new Map<String, String>{'Content-Type' => 'application/json'}));
		
		Account acct = new Account();
		acct.Name = 'Test Account';
		acct.Client_ID__c = '32322';
		insert acct;

		Case cs = new Case();
		cs.AccountId = acct.Id;
		insert cs;
		
		Test.startTest();

		PageReference currentPage = Page.AccountFees;
		Test.setCurrentPage(currentPage);

		ApexPages.StandardController sc = new ApexPages.standardController(cs);
		AccountFeesController contrExt = new AccountFeesController(sc);
		contrExt.getFeesMap();

		Test.stopTest();
	}
	
}