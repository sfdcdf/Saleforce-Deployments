/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 20-Jul-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 20-Jul-2018
  Description ........: Launched Sales Wizard URL with proper URL tokens and parameters to auto-populate
                        the Sales Wizard form with data from Salesforce
*****************************************************************************/
public with sharing class LaunchSalesWizardController {

    public LaunchSalesWizardController(ApexPages.StandardController controller) {

    }

    // https://live.qa2.yodle.com/sales/wizard/packages/WBN/orders/SOME_CONSUMER_NAME/SOME_UNIQUE_KEY_FOR_THE_CONSUMER?corporate.id=1700000000

    Id recordId = ApexPages.currentPage().getParameters().get('id');
    String acctCorpId {get; set;}
    String consumerName = [SELECT Id, Consumer_Name__c FROM Sales_Wizard_API_Setting__mdt WHERE MasterLabel = 'WBN Sale' LIMIT 1].Consumer_Name__c;
    String salesWizardBaseURL = 'https://live.qa2.yodle.com/sales/wizard/packages/WBN/orders/';
    
    // method to build URL for Sales Wizard properly and redirect to that URL
    public PageReference validateAndRedirect(){
    
        System.Debug('** Opportunity Id** ' + recordId);
    
        // call string method
        getCorpId(recordId);
    
        System.Debug('** Account Corporate Id **' + acctCorpId);
        System.Debug('** Built URL **' + salesWizardBaseURL + consumerName + '/' + recordId + '?corporate.id=' + acctCorpId);
        
        // build URL from base and retrieved data
        PageReference retURL = new PageReference(salesWizardBaseURL + consumerName + '/' + recordId + '?corporate.id=' + acctCorpId);
        retURL.setRedirect(true);
        
        return retURL;
    }
    
    // method used to get Account Corporate Id based on the Opportunity Id
    public String getCorpId(Id opportunityId){
    
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
            }
        }
    
        // Get Corp Id from Account related to Opportunity
        for(Account a :
            [SELECT Id,
                    Corp_Acct_in_YL_Parent_Account__c
               FROM Account
              WHERE Id IN :acctIds LIMIT 1]){
              
              // field data type is an Integer/ Number
              if(a.Corp_Acct_in_YL_Parent_Account__c != null){
                  
                  // get string value of number
                  acctCorpId = String.valueOf(a.Corp_Acct_in_YL_Parent_Account__c);
              }
        }
    
        return acctCorpId;
    }
}