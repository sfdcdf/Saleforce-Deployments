public with sharing class AccountFeesController {

	private sObject so;

    public Boolean showNoFeesMessage {get; set;}

    public AccountFeesController(ApexPages.StandardController stdController) {
        so = stdController.getRecord();
        showNoFeesMessage = false;
        //getFeesMap();
    }

    public Map<String, Double> getFeesMap(){
        Map<String, Double> feeMap = new Map<String, Double>();

        String clientId;

        if(so.getSObjectType() == Account.sObjectType){
            Account acct = [select Id, Client_ID__c, wrenBilling__c from Account where Id =: so.Id];
            clientId = acct.Client_ID__c;
        }else if(so.getSObjectType() == Case.sObjectType){
            Case cs = [select Id, Account.Client_ID__c from Case where Id =: so.Id];
            clientId = cs.Account.Client_ID__c;
        }
        

        try{

            List<Integer> clientIds = new List<Integer>{Integer.valueof(clientId)};
            JSONGenerator combinedJSON = JSON.createGenerator(false); 
            combinedJSON.writeStartObject();
            combinedJSON.writeObjectField('clientIds', clientIds);
            combinedJSON.writeEndObject();

        
            String feesJSON = YodleLiveIntegration.liveAction('get-client-fees', true, combinedJSON.getAsString());

            //String feesJSON = '[{"fees": [{"brandedProductName": "Website","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "","productKey": "WEBSITE","itemType": "WEBSITE_DESIGN","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "AdverSite","productKey": "WEBSITE","itemType": "PRODUCT_SETUP_FEE","cents": 4900},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "PRODUCT_SETUP_FEE","cents": 0},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "PROMOTIONAL_DISCOUNT","cents": -10000},{"brandedProductName": "Marketing Essentials Lite","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials Lite","productKey": "ESSENTIALS_LITE","itemType": "MONTHLY_TAXABLE_COMPONENT_FEE","cents": 0},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "MONTHLY_TAXABLE_COMPONENT_FEE","cents": 750},{"brandedProductName": "Marketing Essentials Lite","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "Marketing Essentials Lite","productKey": "ESSENTIALS_LITE","itemType": "PRODUCT_SETUP_FEE","cents": 0},{"brandedProductName": "Sponsored","pricingPackageFeeType": "BUDGET","pricingPackageDisplayName": "","productKey": "SEM","itemType": "BALANCE_REFILL","cents": 0},{"brandedProductName": "Marketing Essentials","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials","productKey": "ESSENTIALS","itemType": "MONTHLY_NONTAXABLE_COMPONENT_FEE","cents": 29150},{"brandedProductName": "Marketing Essentials Lite","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "Marketing Essentials Lite","productKey": "ESSENTIALS_LITE","itemType": "MONTHLY_NONTAXABLE_COMPONENT_FEE","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "AdverSite","productKey": "WEBSITE","itemType": "MONTHLY_PRODUCT_FEE","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "UPFRONT","pricingPackageDisplayName": "","productKey": "WEBSITE","itemType": "ADSTATION_SETUP","cents": 0},{"brandedProductName": "Website","pricingPackageFeeType": "RECURRING","pricingPackageDisplayName": "","productKey": "WEBSITE","itemType": "MONTHLY_MANAGEMENT_FEE","cents": 0}],"clientId": "315265"}]';
            List<Object> deserializeInitialList = (List<Object>)JSON.deserializeUntyped(feesJSON);

            Map<String, Object> clientJSONMap = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(deserializeInitialList[0]));

            List<FeeWrapper> feeWrapperList = (List<FeeWrapper>)JSON.deserialize(JSON.serialize(clientJSONMap.get('fees')), List<FeeWrapper>.class);

            for(FeeWrapper fee : feeWrapperList){
                if(fee.cents != 0){
                    String labelString = fee.brandedProductName + ' - ' + fee.pricingPackageFeeType;
                    if(feeMap.containsKey(labelString)){
                        Double addFee = feeMap.get(labelString) + fee.cents;
                        feeMap.put(labelString, addFee);
                    }else{
                        feeMap.put(labelString, fee.cents);
                    }
                }
            }

            if(feeMap.size() == 0){
                showNoFeesMessage = true;
            }
        }catch(Exception E){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, System.Label.UnableToFindFeesInYodleLive);
            ApexPages.addMessage(myMsg);
        }

        return feeMap;
    }

    public class FeeWrapper {
        public String brandedProductName {get; set;}
        public String pricingPackageFeeType {get; set;}
        public String pricingPackageDisplayName {get; set;}
        public String productKey {get; set;}
        public String itemType {get; set;}
        public Double cents {get; set;}
    }

}