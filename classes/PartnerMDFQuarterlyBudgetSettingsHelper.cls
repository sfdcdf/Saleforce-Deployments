public class PartnerMDFQuarterlyBudgetSettingsHelper
{
    public static List<Partner_MDF_Quarterly_Budget_Setting__mdt> retrieveMDFQuarterlyBudgetSettingsList()
    {
        return [select Id, DeveloperName, MasterLabel, Maximum_Managed_Accounts__c, Maximum_Quarterly_Budget_Allowance__c, Minimum_Managed_Accounts__c from Partner_MDF_Quarterly_Budget_Setting__mdt order by Maximum_Quarterly_Budget_Allowance__c DESC];
    }
}