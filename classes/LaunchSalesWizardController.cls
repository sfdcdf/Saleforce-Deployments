/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 20-Jul-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 05-Feb-2019
  Description ........: Launched Sales Wizard URL with proper URL tokens and parameters to auto-populate
                        the Sales Wizard form with data from Salesforce
                        
  Modifications:
  
  E. Ross Feb 05: 
  Updated salesWizardBaseURL to pull from dynamic config value rather than static/ hard-coded so that it 
  can be changed without updating and re-deploying code.
*****************************************************************************/
public with sharing class LaunchSalesWizardController {

    public LaunchSalesWizardController(ApexPages.StandardController controller) {

    }

    Id recordId = ApexPages.currentPage().getParameters().get('id');
    String oppId = recordId;
    String acctId {get; set;}
    String parentAcctName {get; set;}
    String acctName {get; set;}
    String acctSegment {get; set;}
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
    String salesWizardBaseURL = [SELECT Configuration_Value__c FROM Integration_Configuration__mdt WHERE Configuration_Label__c = 'SW3URL' AND External_System_Name__c = 'Yodle Live'].Configuration_Value__c;
    String urlParams {get; set;}
    String finalURL {get; set;}
    
    // method to build URL for Sales Wizard properly and redirect to that URL
    public PageReference validateAndRedirect(){
    
        System.Debug('** Opportunity Id: ' + oppId);
    
        // call method to assign Sales Wizard data
        getSalesWizardData(oppId);
        
        urlParams = '?corporate.id=' + acctCorpId + '&corporate.accountName=' + parentAcctName + '&clientSalesforceId=' + acctId + '&business.name=' 
                    + acctName + '&business.contact.firstName=' + contactFirstNm + '&business.contact.lastName=' + contactLastNm + '&business.contact.phoneNumber=' 
                    + contactPhone + '&business.contact.email=' + contactEmail + '&business.address.line1=' + acctAddressLn1 + '&business.address.line2='
                    + acctAddressLn2 + '&business.address.city=' + acctCity + '&business.address.state=' + acctState + '&business.address.postalCode='
                    + acctZipCode + '&business.address.country=' + acctCountry + '&contractLength=' + contractLength;
    
        finalURL = salesWizardBaseURL + consumerName + '/' + oppId + urlParams;
        System.Debug('** Built URL: ' + finalURL);
        
        // build URL from base and retrieved data
        PageReference retURL = new PageReference(finalURL);
        retURL.setRedirect(true);
        
        return retURL;
    }
    
    // method used to get Sales Wizard parameters to populate form
    public void getSalesWizardData(Id opportunityId){
    
        Set<Id> acctIds = new Set<Id>();
    
        // get AccountId from the Opportunity passed in URL
        for(Opportunity opp :
            [SELECT Id,
                    AccountId,
                    Client_Phone__c,
                    Client_Email__c,
                    Client_Full_Name__c,
                    Client_First_Name__c,
                    Client_Last_Name__c,
                    Contract_Term_in_months__c
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
            contactFirstNm = opp.Client_First_Name__c;
            contactLastNm = opp.Client_Last_Name__c;
            contractLength = ((opp.Contract_Term_in_months__c != null && opp.Contract_Term_in_months__c > 0) ? String.valueOf(opp.Contract_Term_in_months__c) : String.valueOf(6));
            
            System.Debug('*** Full Name: ' + contactFullNm);
            System.Debug('*** First Name: ' + contactFirstNm);
            System.Debug('*** Last Name: ' + contactLastNm);
            System.Debug('** Contract Length: ' + contractLength);
            
            // parse out first and last name from Full Name
            //if(contactFullNm.trim().length() > 0 && contactFullNm.Contains(' ')){
            
                //contactFirstNm = contactFullNm.Substring(0, contactFullNm.indexOf(' '));
                //contactLastNm = contactFullNm.Substring(contactFullNm.indexOf(' '), contactFullNm.length());
            //}
        }
    
        if(acctIds.size() > 0){
            // Get Account related data
            for(Account a :
                [SELECT Id,
                        Corp_Acct_in_YL_Parent_Account__c,
                        Parent.Name,
                        Name, 
                        BillingStreet, 
                        BillingCity, 
                        BillingState, 
                        BillingPostalCode,
                        BillingCountry,
                        Secondary_Segments__c
                   FROM Account
                  WHERE Id IN :acctIds LIMIT 1]){
                  
                  // Corporate Id; field data type is an Integer/ Number
                  if(a.Corp_Acct_in_YL_Parent_Account__c != null){
                      // get string value of number
                      acctCorpId = String.valueOf(a.Corp_Acct_in_YL_Parent_Account__c);
                  }
                  
                  // Account information
                  parentAcctName = (!String.IsBlank(a.Parent.Name) ? a.Parent.Name : a.Name);
                  acctId = a.Id;
                  acctName = a.Name;
                  acctAddressLn1 = a.BillingStreet;
                  acctCity = a.BillingCity;
                  acctState = a.BillingState;
                  acctZipCode = a.BillingPostalCode;
                  acctCountry = a.BillingCountry;
                  acctSegment = a.Secondary_Segments__c;
                  
                  System.Debug('*** Account Corporate Id: ' + acctCorpId);
                  System.Debug('*** Parent Account: ' + parentAcctName);
                  System.Debug('*** Account Segment: ' + acctSegment);
                  System.Debug('*** Ind Location Account: ' + acctName);
                  System.Debug('*** Client Address: ' + a.BillingStreet + ' ' + a.BillingCity + ', ' + a.BillingState + '  ' + a.BillingPostalCode + '  ' + a.BillingCountry);
            }
        }
    }
}