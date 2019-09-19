public with sharing class OppHLPanelController{

    public Id opportunityId {get; set;}
    public Id accountId {get; set;}
    public String acctName {get; set;}
    public String clientFullName {get; set;}
    public String acctBillingCtry {get; set;}
    public String acctEmail {get; set;}
    public String acctPhone {get; set;}
    public String acctLocalTmShrt {get; set;}
    public String acctStatus {get; set;}
    public String acctManager {get; set;}
    public String acctProductType {get; set;}
    public String acctClientId {get; set;}
    public String acctWebSite {get; set;}
    public String acctTestMgmt {get; set;}
    public String acctImportantNotes {get; set;}
    public String acctIndLocationSrvcLvl {get; set;}
    public String primaryMLOId {get; set;} 
    public String franchiseInfluencer {get; set;}
    public Date nextBillingDt {get; set;}
    public Date lastComplWBNtpDt {get; set;}
    public Date nextNeededTPDt {get; set;}
    public Boolean hasWrenBilling {get; set;}
    public Boolean hasPrimaryMLOForTP {get; set;}
    
    public OppHLPanelController(){
    
        opportunityId = ApexPages.currentPage().getParameters().get('id');
        acctName = '';
        clientFullName = '';
        acctBillingCtry = '';
        acctEmail = '';
        acctPhone = '';
        acctLocalTmShrt = '';
        acctStatus = '';
        acctManager = '';
        acctProductType = '';
        acctClientId = '';
        acctWebSite = '';
        acctTestMgmt = '';
        acctImportantNotes = '';
        acctIndLocationSrvcLvl = '';
        primaryMLOId = '';
        hasWrenBilling = false;
        hasPrimaryMLOForTP = false;
        franchiseInfluencer = '';
    }
    
    public PageReference onPageLoad(){
    
        if(opportunityId != null){
        
            for(Opportunity o :
                [SELECT Id,
                        AccountId
                   FROM Opportunity
                  WHERE Id =: opportunityId
                  LIMIT 1]){
            
                // set AccountId value    
                if(o.Id != null){
                    accountId = o.AccountId;
                }
            }
            
            if(accountId != null){
                
                for(Account a : 
                    [SELECT Id,
                            Name,
                            Client_First_Name__c,
                            Client_Last_Name__c,
                            Email__c,
                            Phone,
                            tz__Local_Time_Short__c,
                            Status__c,
                            Rogers_IMS_Rep_text__c,
                            Product_Type_Transactional__c,
                            Next_Billing_Date__c,
                            Client_ID__c,
                            Website,
                            Test_Management__c,
                            Individual_Location_Service_Level__c,
                            Primary_Multi_Location_Owner_For_TP__c,
                            Multi_Location_Owner_Primary_CID__c,
                            Last_Completed_YBN_TP__c,
                            Next_TP_Needed_By__c,
                            wrenBilling__c,
                            BillingCountry,
                            Franchise_Influencer__c,
                            Important_Account_Notes__c
                       FROM Account
                      WHERE Id = :accountId
                      LIMIT 1]){
                      
                    if(a.Id != null){
                    
                        acctName = a.Name;
                        clientFullName = a.Client_First_Name__c + ' ' + a.Client_Last_Name__c;
                        acctBillingCtry = a.BillingCountry;
                        acctEmail = a.Email__c;
                        acctPhone = a.Phone;
                        acctLocalTmShrt = a.tz__Local_Time_Short__c;
                        acctStatus = a.Status__c;
                        acctManager = a.Rogers_IMS_Rep_text__c;
                        acctProductType = a.Product_Type_Transactional__c;
                        nextBillingDt = a.Next_Billing_Date__c;
                        acctClientId = a.Client_ID__c;
                        acctWebSite = a.Website;
                        acctTestMgmt = a.Test_Management__c;
                        acctImportantNotes = a.Important_Account_Notes__c;
                        acctIndLocationSrvcLvl = a.Individual_Location_Service_Level__c;
                        primaryMLOId = a.Multi_Location_Owner_Primary_CID__c;
                        lastComplWBNtpDt = a.Last_Completed_YBN_TP__c;
                        nextNeededTPDt = a.Next_TP_Needed_By__c;
                        hasWrenBilling = a.wrenBilling__c;
                        hasPrimaryMLOForTP = a.Primary_Multi_Location_Owner_For_TP__c;
                        franchiseInfluencer = a.Franchise_Influencer__c;
                    }
                }
            }
        }
        
        return null;
    }
}