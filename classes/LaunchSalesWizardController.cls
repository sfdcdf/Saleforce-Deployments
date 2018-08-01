/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 20-Jul-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 01-Aug-2018
  Description ........: Launched Sales Wizard URL with proper URL tokens and parameters to auto-populate
                        the Sales Wizard form with data from Salesforce
*****************************************************************************/
public with sharing class LaunchSalesWizardController {

    public LaunchSalesWizardController(ApexPages.StandardController controller) {

    }

    // https://live.qa2.yodle.com/sales/wizard/packages/WBN/orders/SOME_CONSUMER_NAME/SOME_UNIQUE_KEY_FOR_THE_CONSUMER?corporate.id=1700000000

    Id recordId = ApexPages.currentPage().getParameters().get('id');
    String oppId = recordId;
    String acctId {get; set;}
    String acctName {get; set;}
    String contactPhone {get; set;}
    String contactFullNm {get; set;}
    String contactFirstNm {get; set;}
    String contactLastNm {get; set;}
    String contactEmail {get; set;}
    String acctAddressLn1 {get; set;}
    String acctAddressLn2 = '';
    String acctCity {get; set;}
    String acctState {get; set;}
    String acctZipCode {get; set;}
    String acctCountry {get; set;}
    String contractLength {get; set;}
    String acctCorpId {get; set;}
    String consumerName = [SELECT Id, Consumer_Name__c FROM Sales_Wizard_API_Setting__mdt WHERE MasterLabel = 'WBN Sale' LIMIT 1].Consumer_Name__c;
    String salesWizardBaseURL = 'http://live.qa2.yodle.com/sales/wizard/packages/WBN/orders/';
    
    // method to build URL for Sales Wizard properly and redirect to that URL
    public PageReference validateAndRedirect(){
    
        System.Debug('** Opportunity Id: ' + oppId);
    
        // call method to assign Sales Wizard data
        getSalesWizardData(oppId);
    
        System.Debug('** Built URL: ' + salesWizardBaseURL + consumerName + '/' + oppId + '?corporate.id=' + acctCorpId);
        
        // build URL from base and retrieved data
        PageReference retURL = new PageReference(salesWizardBaseURL + consumerName + '/' + oppId + '?corporate.id=' + acctCorpId);
        retURL.setRedirect(true);
        
        return retURL;
    }
    
    // method used to get Sales Wizard parameters to populate form
    public void getSalesWizardData(Id opportunityId){
    
        Set<Id> acctIds = new Set<Id>();
    
        // get AccountId from the Opportunity passed in URL
        for(Opportunity opp :
            [SELECT Id,
                    AccountId
               FROM Opportunity
              WHERE Id = :opportunityId]){
            
            // ensure Account Id is not null on the Opportunity record and then add to Set list
            if(!String.IsBlank(opp.AccountId)){
                acctIds.add(opp.AccountId);
                acctId = opp.AccountId;
            }
            
            // assign data from Opportunity
            contactPhone = opp.Client_Phone__c;
            contactEmail = opp.Client_Email__c;
            contactFullNm = opp.Client_Full_Name__c;
            contractLength = ((opp.Contract_Term_in_months__c != null && opp.Contract_Term_in_months__c > 0) ? String.valueOf(opp.Contract_Term_in_months__c) : String.valueOf(6));
            
            System.Debug('** Contract Length: ' + contractLength);
            
            // parse out first and last name from Full Name
            if(contactFullNm.trim().length() > 0 && contactFullNm.Contains(' ')){
            
                contactFirstNm = contactFullNm.Substring(0, contactFullNm.indexOf(' '));
                contactLastNm = contactFullNm.Substring(contactFullNm.indexOf(' '), contactFullNm.length());
            
                System.Debug('*** Full Name: ' + contactFullNm);
                System.Debug('*** First Name: ' + contactFirstNm);
                System.Debug('*** Last Name: ' + contactLastNm);
            }
        }
    
        if(acctIds.size() > 0){
            // Get Account related data
            for(Account a :
                [SELECT Id,
                        Corp_Acct_in_YL_Parent_Account__c,
                        Name, 
                        BillingStreet, 
                        BillingCity, 
                        BillingState, 
                        BillingPostalCode,
                        BillingCountry
                   FROM Account
                  WHERE Id IN :acctIds LIMIT 1]){
                  
                  // Corporate Id; field data type is an Integer/ Number
                  if(a.Corp_Acct_in_YL_Parent_Account__c != null){
                      // get string value of number
                      acctCorpId = String.valueOf(a.Corp_Acct_in_YL_Parent_Account__c);
                  }
                  
                  // Account address information
                  acctId = a.Id;
                  acctName = a.Name;
                  acctAddressLn1 = a.BillingStreet;
                  acctCity = a.BillingCity;
                  acctState = a.BillingState;
                  acctZipCode = a.BillingPostalCode;
                  acctCountry = a.BillingCountry;
                  
                  System.Debug('*** Account Corporate Id: ' + acctCorpId);
                  System.Debug('*** Client Address: ' + a.BillingStreet + ' ' + a.BillingCity + ', ' + a.BillingState + '  ' + a.BillingPostalCode + '  ' + a.BillingCountry);
            }
        }
    }
}