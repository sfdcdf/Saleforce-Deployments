<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Acct_Notify_Account_Owner_Expired_Hold_Status</fullName>
        <description>Acct - Notify Account Owner - Expired Hold Status</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Acct_Notice_to_Owner_Hold_Status</template>
    </alerts><alerts>
        <fullName>Berry_SEM_Future_Add_Date</fullName>
        <description>Berry - SEM Future Add Date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Email_Templates/SEM_Future_Add_Date</template>
    </alerts><alerts>
        <fullName>Lighthouse_Exit_Survey</fullName>
        <description>Lighthouse Exit Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountservices@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Exit_Survey</template>
    </alerts><alerts>
        <fullName>NPS_Email_YBN</fullName>
        <description>NPS Email - YBN</description>
        <protected>false</protected>
        <recipients>
            <field>Email_for_Touchplan__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>cunningham@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/NPS_YBN_Email_Template</template>
    </alerts><alerts>
        <fullName>NPS_Email_Yodle</fullName>
        <description>NPS Email - Yodle</description>
        <protected>false</protected>
        <recipients>
            <field>Email_for_Touchplan__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>cunningham@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/NPS_Yodle_Email_Template</template>
    </alerts><alerts>
        <fullName>NPS_Email_Yodle_Non_Essentials</fullName>
        <description>NPS Email - Yodle Non Essentials</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>cunningham@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/NPS_Yodle_NonEssentials_Email_Template</template>
    </alerts><alerts>
        <fullName>Non_SEM</fullName>
        <description>Non SEM</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Non_SEM_Distro_Network_to_IMS</template>
    </alerts><alerts>
        <fullName>Rogers_Exit_Email</fullName>
        <description>Rogers Exit Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>rogerssupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Email_Templates/Rogers_Exit_Email</template>
    </alerts><alerts>
        <fullName>Rogers_New_Client_Alert</fullName>
        <ccEmails>rogersalerts@yodle.com</ccEmails>
        <description>Rogers - New Client Alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Partner_Email_Templates/Rogers_New_Client</template>
    </alerts><alerts>
        <fullName>Rogers_Send_70_Day</fullName>
        <description>Rogers Send 70 Day</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>rogerssupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Rogers_70_Day</template>
    </alerts><alerts>
        <fullName>Testing_Days_Live</fullName>
        <description>Testing Days Live</description>
        <protected>false</protected>
        <recipients>
            <recipient>allison.spinelli@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.scully@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Test</template>
    </alerts><alerts>
        <fullName>Testing_Days_Since_Live</fullName>
        <description>Testing Days Since Live</description>
        <protected>false</protected>
        <recipients>
            <recipient>allison.spinelli@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.scully@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Test_15</template>
    </alerts><alerts>
        <fullName>YBN_AD_Assigned</fullName>
        <description>YBN AD Assigned</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_AD_Assigned</template>
    </alerts><alerts>
        <fullName>YBN_Adoption_Plan_Uploaded</fullName>
        <description>YBN Adoption Plan Uploaded</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>emcintyre@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>gregg.swensen@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tgahagan@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Adoption_Plan_Uploaded</template>
    </alerts><alerts>
        <fullName>YBN_CSM_Begins_Filling_Out_Run_Book</fullName>
        <description>YBN CSM Begins Filling Out Run Book</description>
        <protected>false</protected>
        <recipients>
            <recipient>jswitzer@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Account_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Customer_Success_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Force_Field_Sales_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_CSM_Begins_Filling_Out_Run_Book</template>
    </alerts><alerts>
        <fullName>YBN_FF_SD_Assigned</fullName>
        <description>YBN FF SD Assigned</description>
        <protected>false</protected>
        <recipients>
            <field>Force_Field_Sales_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_FF_SD_Assigned</template>
    </alerts><alerts>
        <fullName>YBN_SA_Schedule_Internal_Download_Call_with_SD</fullName>
        <description>YBN SA Schedule Internal Download Call with SD</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Solutions_Architect__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_SA_Schedule_Internal_Download_Call_with_SD</template>
    </alerts><alerts>
        <fullName>YBN_alert_SD_when_account_is_assigned</fullName>
        <description>YBN alert SD when account is assigned</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_SDAccount_Assignment_Alert</template>
    </alerts><alerts>
        <fullName>YBN_alert_ads_when_account_is_assigned</fullName>
        <description>YBN alert ads when account is assigned</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Account_Assignment_Alert</template>
    </alerts><alerts>
        <fullName>YBN_e</fullName>
        <description>YBN email alert for ILs with no service level</description>
        <protected>false</protected>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_IL_launched_with_no_service_level</template>
    </alerts><alerts>
        <fullName>tradeshowpromoemailtoIMS</fullName>
        <description>trade show promo email to IMS</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Trade_Show_promo</template>
    </alerts><fieldUpdates>
        <fullName>Account_Important_Notes_to_National</fullName>
        <field>Important_National_Notes__c</field>
        <formula>Parent.Important_National_Notes__c</formula>
        <name>Account - Important Notes to Ntl Notes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CSC_Survey_E_mail_Sent_True</fullName>
        <field>CSC_Survey_E_mail_Sent__c</field>
        <literalValue>1</literalValue>
        <name>CSC Survey E-mail Sent True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Cancellation_Checkbox</fullName>
        <field>Cancelled__c</field>
        <literalValue>1</literalValue>
        <name>Account - Cancelled to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Clear_Hold_Status_Date</fullName>
        <field>Hold_Status_Date__c</field>
        <name>Clear Hold Status Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Closing_to_Blank</fullName>
        <field>Closing__c</field>
        <name>Closing to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Commission_December_2011</fullName>
        <field>NE_09_Commission_Month__c</field>
        <formula>date(2011,12,01)</formula>
        <name>Commission - December 2011</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Commission_November_2011</fullName>
        <field>NE_09_Commission_Month__c</field>
        <formula>date(2011,11,01)</formula>
        <name>Commission - November 2011</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Consumable_Price_to_0_99</fullName>
        <field>Consumable_Price__c</field>
        <formula>0.99</formula>
        <name>Consumable Price to $0.99</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Consumable_Price_to_1_79</fullName>
        <field>Consumable_Price__c</field>
        <formula>1.79</formula>
        <name>Consumable Price to $1.79</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Consumable_Price_to_Blank</fullName>
        <field>Consumable_Price__c</field>
        <name>Consumable Price to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Consumables_Price_to_199</fullName>
        <field>Consumable_Price__c</field>
        <formula>1.99</formula>
        <name>Consumables Price to $1.99</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Consumables_Price_to_2_49</fullName>
        <field>Consumable_Price__c</field>
        <formula>2.49</formula>
        <name>Consumables Price to $2.49</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Pitched_to_Today</fullName>
        <field>Date_Pitched__c</field>
        <formula>Today()</formula>
        <name>Date Pitched to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Facebook_Ads_TODAY</fullName>
        <field>Facebook_Ads_Live_Date__c</field>
        <formula>TODAY()</formula>
        <name>Facebook Ads -&gt; TODAY</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LBW_Welcome_Email_Sync</fullName>
        <field>Sync_to_Marketo__c</field>
        <literalValue>1</literalValue>
        <name>LBW Welcome Email Sync</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_Exit_Survey_Sent</fullName>
        <field>LH_Exit_Survey_Sent__c</field>
        <literalValue>1</literalValue>
        <name>LH Exit Survey Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_Exit_Survey_Sent_Date</fullName>
        <field>LH_Exit_Survey_Sent_Date__c</field>
        <formula>today()</formula>
        <name>LH Exit Survey Sent Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_PPP_Important_Account_Notes_MAX</fullName>
        <field>Important_National_Notes__c</field>
        <formula>"This is a PPP customer with a $400 budget (listed as $0 in YL - we are issuing credits each month)"</formula>
        <name>LH PPP Important Account Notes - MAX</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_PPP_Important_Account_Notes_ORGANIC</fullName>
        <field>Important_National_Notes__c</field>
        <formula>"This is a PPP customer"</formula>
        <name>LH PPP Important Account Notes - ORGANIC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Live_Date_Update_Timestamp</fullName>
        <field>Live_Date__c</field>
        <formula>TODAY ()</formula>
        <name>Live Date Update - Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Marketo_Sync_Checkbox_Update_for_Marketo</fullName>
        <field>Sync_to_Marketo__c</field>
        <literalValue>1</literalValue>
        <name>Sync to Marketo On Demand</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>NPS_Survey_Type_Sent</fullName>
        <field>NPS_Survey_Type_Sent__c</field>
        <formula>"NPS Survey Yodle"</formula>
        <name>NPS Survey Type Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>NPS_Survey_Type_Sent_YBN</fullName>
        <field>NPS_Survey_Type_Sent__c</field>
        <formula>"NPS Survey YBN"</formula>
        <name>NPS Survey Type Sent - YBN</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Organic_Deactivate_Date</fullName>
        <field>Organic_Deactivation_Date__c</field>
        <formula>today()</formula>
        <name>Account - Organic Deactive Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Pitch_Script_to_Blank</fullName>
        <field>Pitch_Script__c</field>
        <name>Pitch Script to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Pitched_By_User_Fill_In</fullName>
        <field>Pitched_By__c</field>
        <formula>$User.FirstName &amp; " " &amp; $User.LastName</formula>
        <name>Pitched By User Fill In</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Populate_Client_Email</fullName>
        <field>Client_E_mail__c</field>
        <formula>Email__c</formula>
        <name>Populate Client Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Populate_Relationship_Live_Date</fullName>
        <field>Live_Date__c</field>
        <formula>TODAY()</formula>
        <name>Populate Relationship Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>SE_Update</fullName>
        <field>NCE__c</field>
        <name>SE Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Service_Model_Changed</fullName>
        <field>Service_Model_Change__c</field>
        <formula>NOW()</formula>
        <name>Service Model Changed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Touchplan_Email_to_Populate</fullName>
        <field>Email_for_Touchplan__c</field>
        <formula>Email__c</formula>
        <name>Account - Email for Touchplan to Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Transition_to_Blank</fullName>
        <field>Transition__c</field>
        <name>Transition to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_FF_SD</fullName>
        <field>Force_Field_Sales_Director__c</field>
        <name>Update FF SD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_the_Weekly_TouchPlan_Next_Date_c</fullName>
        <description>Field used in the Next TP Needed By Formula field. This formula determines the date of the following Friday. TPs need to be completed each calendar week</description>
        <field>Weekly_TouchPlan_Next_Date__c</field>
        <formula>IF(
ISBLANK(Last_Completed_YBN_TP__c)
,

((Live_Date__c + Month_1_Check_In_Date_Adjustment__c) +
CASE(
MOD((Live_Date__c + Month_1_Check_In_Date_Adjustment__c) - DATE(1900,1,7),7 ), 
  0, 12, 
  1, 11,
  2, 10,
  3, 9, 
  4, 8, 
  5, 7, 
  6, 6, 
  0)
)
,

(Last_Completed_YBN_TP__c + 
CASE(
MOD(Last_Completed_YBN_TP__c - DATE(1900,1,7),7 ), 
0, 12, 
1, 11,
2, 10,
3, 9, 
4, 8, 
5, 7, 
6, 6, 
0)
)
)</formula>
        <name>Update the Weekly_TouchPlan_Next_Date__c</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>X180_day_live_rate</fullName>
        <field>Live_on_180th_Day__c</field>
        <literalValue>1</literalValue>
        <name>Account - Live 180th Day to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>YBN_Account_Owner_Last_Modified_Date</fullName>
        <field>Account_Owner_Last_Modified_Date__c</field>
        <formula>NOW()</formula>
        <name>YBN: Account Owner Last Modified Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>berrycontractreceived</fullName>
        <field>Date_Berry_Contract_Received__c</field>
        <formula>IF(ISCHANGED( Berry_Contract_Received__c) ,NOW(),NULL)</formula>
        <name>Account - Date Berry Contract Rec to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>channel_partnertype_white_label</fullName>
        <field>Channel_Partner_Type__c</field>
        <literalValue>White Label</literalValue>
        <name>Account - Channel Ptr Typ to White Label</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>orderdatelivedate</fullName>
        <description>when there is a live date, but no order date</description>
        <field>Order_Date__c</field>
        <formula>Live_Date__c</formula>
        <name>Account - Order Date to Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>split_false</fullName>
        <field>split_account__c</field>
        <literalValue>0</literalValue>
        <name>split = false</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>splitaccounts</fullName>
        <field>split_account__c</field>
        <literalValue>1</literalValue>
        <name>split accounts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>substatusstatus</fullName>
        <field>Sub_Status__c</field>
        <formula>CASE(Status__c , "LIVE", "Live", "OFF", "Off","")</formula>
        <name>Account - Sub Status to Live/Off</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>typecustomer</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>Account - Type to Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>update_SD</fullName>
        <field>Sales_Director__c</field>
        <name>update SD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>update_ad</fullName>
        <field>Account_Director__c</field>
        <name>update ad</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>update_sales_person</fullName>
        <field>Sales_Person__c</field>
        <name>update sales person</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>ybn_national_client_type_is_national</fullName>
        <field>Client_Type__c</field>
        <literalValue>National Account</literalValue>
        <name>ybn national client type is national</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>180-day live rate</fullName>
        <actions>
            <name>X180_day_live_rate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Days_Since_Live__c</field>
            <operation>greaterOrEqual</operation>
            <value>180</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>LIVE</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Acct - Hold Status Cleared</fullName>
        <actions>
            <name>Clear_Hold_Status_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Account.Account_Hold_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_Hold_Status__c</field>
            <operation>equals</operation>
            <value>Non-Compete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Hold_Status_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Acct - Hold Status Date Populated</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Account_Hold_Status__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_Hold_Status__c</field>
            <operation>notEqual</operation>
            <value>Non-Compete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Hold_Status_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Acct_Notify_Account_Owner_Expired_Hold_Status</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Account.Hold_Status_Date__c</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <offsetFromField>Account.Hold_Status_Date__c</offsetFromField>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Adoption Plan Uploaded</fullName>
        <actions>
            <name>YBN_Adoption_Plan_Uploaded</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Adoption_Plan_Last_Uploaded_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Berry - SEM Future Add Date</fullName>
        <actions>
            <name>Berry_SEM_Future_Add_Date</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.SEM_Future_Add_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>notEqual</operation>
            <value>Rogers</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Berry Contract Received</fullName>
        <actions>
            <name>berrycontractreceived</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Berry_Contract_Received__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Cancellation Checkbox</fullName>
        <actions>
            <name>Cancellation_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>OFF</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Client Touch Point Reminder IL SL A</fullName>
        <actions>
            <name>Client_Touch_Point_Reminder_A</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Standard</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Individual_Location_Service_Level__c</field>
            <operation>equals</operation>
            <value>Service Level A</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>LIVE</value>
        </criteriaItems>
        <description>Reminder for CS team to touch base with client based on SL - A</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>X90_Day_YBN_Client_Touch_Point_Reminder_SL_A</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Account.Live_Date__c</offsetFromField>
            <timeLength>90</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>X120_Day_YBN_Customer_Touch_Point_Reminder_SL_A</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Account.Live_Date__c</offsetFromField>
            <timeLength>120</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>X150_Day_YBN_Customer_Touch_Point_Reminder_SL_A</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Account.Live_Date__c</offsetFromField>
            <timeLength>150</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>X180_Day_YBN_Customer_Touch_Point_Reminder_SL_A</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Account.Live_Date__c</offsetFromField>
            <timeLength>180</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>X210_Day_YBN_Customer_Touch_Point_Reminder_SL_A</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Account.Live_Date__c</offsetFromField>
            <timeLength>210</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <offsetFromField>Account.Live_Date__c</offsetFromField>
            <timeLength>240</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Client Touch Point Reminder IL SL B</fullName>
        <actions>
            <name>Client_Touch_Point_Reminder_B</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Standard</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Individual_Location_Service_Level__c</field>
            <operation>equals</operation>
            <value>Service Level B</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <description>Reminder for CS team to touch base with client based on SL - B</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Account.Date_of_Last_Customer_Status_Call__c</offsetFromField>
            <timeLength>60</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Client Touch Point Reminder IL SL C</fullName>
        <actions>
            <name>Customer_Touch_Point_Reminder_C</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Standard</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Individual_Location_Service_Level__c</field>
            <operation>equals</operation>
            <value>Service Level C</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <description>Reminder for CS team to touch base with client based on SL - C</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Account.Date_of_Last_Customer_Status_Call__c</offsetFromField>
            <timeLength>90</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Commission - December 2011</fullName>
        <actions>
            <name>Commission_December_2011</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>((1 AND 2) AND (3 AND 4)) or (5 and 6 and 7)</booleanFilter>
        <criteriaItems>
            <field>Account.Order_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>12/1/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Order_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>12/31/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>12/1/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>12/31/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Order_Date__c</field>
            <operation>lessThan</operation>
            <value>1/1/2012</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>greaterThan</operation>
            <value>12/9/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>12/31/2011</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Commission - November 2011</fullName>
        <actions>
            <name>Commission_November_2011</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>((1 AND 2) AND (3 AND 4)) or (5 and 6 and 7)</booleanFilter>
        <criteriaItems>
            <field>Account.Order_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>11/1/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Order_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>11/30/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>11/1/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>12/9/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Order_Date__c</field>
            <operation>lessThan</operation>
            <value>12/1/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>greaterThan</operation>
            <value>11/10/2011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>12/9/2011</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LBW Welcome Email - Marketo</fullName>
        <actions>
            <name>LBW_Welcome_Email_Sync</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>equals</operation>
            <value>Leads By Web,Lead Stream ATV</value>
        </criteriaItems>
        <description>Sends information to Marketo when LBW client signs up.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>LH PPP Important Account Notes - MAX</fullName>
        <actions>
            <name>LH_PPP_Important_Account_Notes_MAX</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>contains</operation>
            <value>Price Per Patient</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>contains</operation>
            <value>Sponsored</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LH PPP Important Account Notes - ORGANIC</fullName>
        <actions>
            <name>LH_PPP_Important_Account_Notes_ORGANIC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>contains</operation>
            <value>Price Per Patient</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>notContain</operation>
            <value>Sponsored</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LH Upsell Result Detail</fullName>
        <actions>
            <name>Date_Pitched_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pitched_By_User_Fill_In</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED ( Upsell_Result__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LHFS SSU Email - Marketo</fullName>
        <actions>
            <name>Marketo_Sync_Checkbox_Update_for_Marketo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.LHFS_Self_Sign_Up__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Letters Price for Non-US</fullName>
        <actions>
            <name>Consumables_Price_to_2_49</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BillingCountry</field>
            <operation>notEqual</operation>
            <value>US,USA,United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Upsell_Candidate__c</field>
            <operation>equals</operation>
            <value>Letters</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Letters Price for US</fullName>
        <actions>
            <name>Consumables_Price_to_199</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BillingCountry</field>
            <operation>equals</operation>
            <value>US,USA,United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Upsell_Candidate__c</field>
            <operation>equals</operation>
            <value>Letters</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Lighthouse Exit Survey</fullName>
        <actions>
            <name>Lighthouse_Exit_Survey</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>LH_Exit_Survey_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Exit_Survey_Sent_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>sent to lighthouse dental/chiro clients when account moves to "off" status</description>
        <formula>AND( 
 ISPICKVAL(Status__c, "OFF"),
 CONTAINS (IMS_Rep__c, "Lighthouse"),

OR(
CONTAINS(Secondary_Segments__c , "Dentist"),
CONTAINS(Secondary_Segments__c , "Chiro"),
CONTAINS(Secondary_Segments__c , "Orthodontist")),


 CPP_Account__c = "No", 
 CONTAINS (Product_Type_Transactional__c, "Lighthouse"),
 Days_Live__c &gt; 60

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Live Date Update</fullName>
        <actions>
            <name>Live_Date_Update_Timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>LIVE</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>contains</operation>
            <value>TORCHx</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Experience_Key__c</field>
            <operation>equals</operation>
            <value>torchx-main</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>equals</operation>
            <value>Local</value>
        </criteriaItems>
        <description>Timestamps the Live date when an account goes to LIVE</description>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>NPS YBN Survey</fullName>
        <actions>
            <name>NPS_Email_YBN</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>NPS_Survey_Type_Sent_YBN</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Account.NPS_Survey_Send__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Survey_Opt_Out__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>LIVE</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ParentId</field>
            <operation>notContain</operation>
            <value>Berry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>contains</operation>
            <value>National,YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>National Notes form Parent</fullName>
        <actions>
            <name>Account_Important_Notes_to_National</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.ParentId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Deactivation Date</fullName>
        <actions>
            <name>Organic_Deactivate_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ispickval ( YO_Status__c, 'Off')</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Populate Client Email</fullName>
        <actions>
            <name>Populate_Client_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client_E_mail__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Postcard Price for Non-US</fullName>
        <actions>
            <name>Consumable_Price_to_1_79</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BillingCountry</field>
            <operation>notEqual</operation>
            <value>US,USA,United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Upsell_Candidate__c</field>
            <operation>equals</operation>
            <value>Postcards</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Postcard Price for US</fullName>
        <actions>
            <name>Consumable_Price_to_0_99</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BillingCountry</field>
            <operation>equals</operation>
            <value>US,USA,United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Upsell_Candidate__c</field>
            <operation>equals</operation>
            <value>Postcards</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Proactive Paused Outlets</fullName>
        <actions>
            <name>Non_SEM</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
not(isblank(  Date_of_Proactive_Pause_for_MSN_Partner__c )),
NOT(CONTAINS(IMS_Rep__c, "Customer Care")),
NOT(CONTAINS(IMS_Rep__c, "Lighthouse")))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Remove Pitch</fullName>
        <actions>
            <name>Closing_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Consumable_Price_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pitch_Script_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Transition_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Account.Upsell_Candidate__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Upsell_Candidate__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Rogers - Payment Received</fullName>
        <actions>
            <name>Rogers_New_Client_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Rogers_Payment_Received__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Rogers</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Rogers Billing Reminder</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Days_Live__c</field>
            <operation>greaterThan</operation>
            <value>60</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Rogers</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Account.Next_Billing_Date__c</offsetFromField>
            <timeLength>-3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Rogers Exit Email</fullName>
        <actions>
            <name>Rogers_Exit_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>OFF</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Suppress_Exit_Email__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>contains</operation>
            <value>OEM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Rogers</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Rogers IMS Rep Fills</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>notEqual</operation>
            <value>Rogers</value>
        </criteriaItems>
        <description>converts the IMS rep to a text field</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Rogers Send 70 Day</fullName>
        <actions>
            <name>Rogers_Send_70_Day</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Rogers_Send_70_Day__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Sales Person Is Riley Hughes</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Riley Hughes</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Service Model Change</fullName>
        <actions>
            <name>Service_Model_Changed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and( 
ISCHANGED(Service_Model_Local__c),  
NOT(ISNULL(PRIORVALUE(Service_Model_Local__c))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Test</fullName>
        <actions>
            <name>Lighthouse_Exit_Survey</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>contains</operation>
            <value>Jeremy</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Sales_Person__c</field>
            <operation>equals</operation>
            <value>Megan Scully</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Test Days Live</fullName>
        <actions>
            <name>Testing_Days_Live</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Days_Live__c</field>
            <operation>equals</operation>
            <value>9</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_ID__c</field>
            <operation>equals</operation>
            <value>212232</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Test Days Since Live</fullName>
        <actions>
            <name>Testing_Days_Since_Live</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Days_Since_Live__c</field>
            <operation>equals</operation>
            <value>15</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_ID__c</field>
            <operation>equals</operation>
            <value>212232</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Touchplan Email to Populate</fullName>
        <actions>
            <name>Touchplan_Email_to_Populate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>National,YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Trade Show Promo</fullName>
        <actions>
            <name>tradeshowpromoemailtoIMS</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Trade_Show_Promo__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Update Force Field Sales Director</fullName>
        <active>false</active>
        <formula>AND( RecordType.Id = "012600000009Yy6",  $UserRole.Id = "00E60000001J40K" ,  ISCHANGED( Account_Owner_Last_Modified_Date__c ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>WBN-Weekly Touch Plan - Next Date</fullName>
        <actions>
            <name>Update_the_Weekly_TouchPlan_Next_Date_c</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update the field with the next Friday date to be used in the Next TP Needed By field and not cuase a formula too large to compile error</description>
        <formula>AND(  OR(   ISCHANGED(Last_Completed_YBN_TP__c),   ISCHANGED(YBN_CSC_Completed_Date__c),   ISCHANGED(Month_1_Check_In_Completed_Date__c),   PRIORVALUE(Weekly_TouchPlan__c)=FALSE  ),  Weekly_TouchPlan__c = TRUE,  RecordType.Id ="012600000009Yy5",   ISPICKVAL(Client_Type__c , "YBN") )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>White Label Partner</fullName>
        <actions>
            <name>channel_partnertype_white_label</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>ViaMedia,AVVO,Advance</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Partner_Type__c</field>
            <operation>notEqual</operation>
            <value>White Label</value>
        </criteriaItems>
        <description>Marks the channel partner type as 'white label' whenever a rep selects the channel partner as one of our white label partners.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN - Populate Facebook Ads Live Date</fullName>
        <actions>
            <name>Facebook_Ads_TODAY</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>contains</operation>
            <value>FACEBOOK_ADS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Facebook_Ads_Live_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN AD Assigned</fullName>
        <actions>
            <name>YBN_AD_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(PRIORVALUE(Account_Director__c) = "",RecordType.Id = "012600000009Yy6")</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>YBN Alert AD when account is assigned</fullName>
        <actions>
            <name>YBN_alert_ads_when_account_is_assigned</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Account_Director__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN Alert SA of Assignment %26 to schedule Internal Download</fullName>
        <actions>
            <name>YBN_SA_Schedule_Internal_Download_Call_with_SD</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Solutions_Architect__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN CSM Begins Filling Out Run Book</fullName>
        <actions>
            <name>YBN_CSM_Begins_Filling_Out_Run_Book</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Customer_Success_Manager__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN Change Account Owner to Ellie</fullName>
        <actions>
            <name>SE_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_FF_SD</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>update_SD</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>update_ad</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>update_sales_person</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Tricia Gahagan,Ellie McIntyre,Sarah McMillian</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN FF SD Assigned Alert</fullName>
        <actions>
            <name>YBN_FF_SD_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Force_Field_Sales_Director__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN Populate Live Date</fullName>
        <actions>
            <name>Populate_Relationship_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ILs_Live__c</field>
            <operation>greaterOrEqual</operation>
            <value>50</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN SD account assignment alert</fullName>
        <actions>
            <name>YBN_alert_SD_when_account_is_assigned</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Sales_Person__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN account launches with no service level</fullName>
        <actions>
            <name>YBN_e</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Individual_Location_Service_Level__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Days_Live__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep_Role__c</field>
            <operation>contains</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notContain</operation>
            <value>test</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN update master account to national client type</fullName>
        <actions>
            <name>ybn_national_client_type_is_national</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master Account</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>YBN%3A Account Owner Last Modified Date</fullName>
        <actions>
            <name>YBN_Account_Owner_Last_Modified_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(OwnerId)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>YL customer</fullName>
        <actions>
            <name>typecustomer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>live date without order date</fullName>
        <actions>
            <name>orderdatelivedate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Order_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>for when accounts have a live date, but no order date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>no live date %3D no commission</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>remove %27sales%27 substatus</fullName>
        <actions>
            <name>substatusstatus</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>LIVE,OFF</value>
        </criteriaItems>
        <description>when accounts move to Live or off, make the sub status the same as the status</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>split accounts</fullName>
        <actions>
            <name>splitaccounts</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Second_Rep__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>split accounts-no longer split</fullName>
        <actions>
            <name>split_false</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Second_Rep__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><tasks>
        <fullName>Client_Touch_Point_Reminder_A</fullName>
        <assignedTo>sarah.mctate@yodle.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>10</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Client Touch Point Reminder_A</subject>
    </tasks><tasks>
        <fullName>Client_Touch_Point_Reminder_B</fullName>
        <assignedTo>YBN_Consultant</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>60</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Client Touch Point Reminder_B</subject>
    </tasks><tasks>
        <fullName>Customer_Touch_Point_Reminder_C</fullName>
        <assignedTo>YBN_Consultant</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>90</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.Live_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Customer Touch Point Reminder - C</subject>
    </tasks><tasks>
        <fullName>X120_Day_YBN_Customer_Touch_Point_Reminder_SL_A</fullName>
        <assignedTo>YBN_Consultant</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>120</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.Live_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>120 Day YBN Customer Touch Point Reminder SL A</subject>
    </tasks><tasks>
        <fullName>X150_Day_YBN_Customer_Touch_Point_Reminder_SL_A</fullName>
        <assignedTo>YBN_Consultant</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>150</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.Live_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>150 Day YBN Customer Touch Point Reminder SL A</subject>
    </tasks><tasks>
        <fullName>X180_Day_YBN_Customer_Touch_Point_Reminder_SL_A</fullName>
        <assignedTo>YBN_Consultant</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>180</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.Live_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>180 Day YBN Customer Touch Point Reminder SL A</subject>
    </tasks><tasks>
        <fullName>X210_Day_YBN_Customer_Touch_Point_Reminder_SL_A</fullName>
        <assignedTo>YBN_Consultant</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>210</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.Live_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>210 Day YBN Customer Touch Point Reminder SL A</subject>
    </tasks><tasks>
        <fullName>X90_Day_YBN_Client_Touch_Point_Reminder_SL_A</fullName>
        <assignedTo>YBN_Consultant</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>90</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.Live_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>90 Day YBN Client Touch Point Reminder SL_A</subject>
    </tasks></Workflow>