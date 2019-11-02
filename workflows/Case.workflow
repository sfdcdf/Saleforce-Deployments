<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CPP_Setup_Complete</fullName>
        <ccEmails>certifiedpartnersupport@yodle.com</ccEmails>
        <description>CPP - Setup Complete</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/CPP_Setup_Complete</template>
    </alerts>
    <alerts>
        <fullName>CSC_Date_in_the_Past</fullName>
        <description>CSC Date in the Past</description>
        <protected>false</protected>
        <recipients>
            <recipient>sravani.mutnuru@lighthouse.ib</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/CSC_Date_in_the_Past</template>
    </alerts>
    <alerts>
        <fullName>Case_Assigned_to_LH_Auto_Support_send_email</fullName>
        <ccEmails>LHAutoTechBots@yodle.com</ccEmails>
        <description>Case Assigned to LH Auto Support send email</description>
        <protected>false</protected>
        <senderAddress>customercare@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/LH_Auto_Case_Owner</template>
    </alerts>
    <alerts>
        <fullName>Case_Assigned_to_You_Alert</fullName>
        <description>Case Assigned to You Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Case_Assigned_to_You_Alert</template>
    </alerts>
    <alerts>
        <fullName>Case_Notification_to_case_creator</fullName>
        <description>Case - Notification to case creator</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Notification_to_Case_Creator_upon_Close_or_Awaiting_Internal_Response</template>
    </alerts>
    <alerts>
        <fullName>Charge_Failure_New_Email_Received</fullName>
        <description>Charge Failure - New Email Received</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Charge_Failure_New_Email_Received</template>
    </alerts>
    <alerts>
        <fullName>Client_Escalation_Case_Closed</fullName>
        <description>Client Escalation Case Closed</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Services_Mgr__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Client_Escalation_Case_Closed</template>
    </alerts>
    <alerts>
        <fullName>Gold_Service_Notify_Rep_of_Closure</fullName>
        <description>Gold Service - Notify Rep of Closure</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep_E_mail_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Gold_Service_Notify_Sales_Rep_of_Closure</template>
    </alerts>
    <alerts>
        <fullName>Integration_At_Risk</fullName>
        <ccEmails>integrationrisk@web.com</ccEmails>
        <description>Integration At Risk</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Integration_At_Risk</template>
    </alerts>
    <alerts>
        <fullName>LH_Logo_Work_Complete</fullName>
        <ccEmails>config@lighthousepmg.com</ccEmails>
        <description>LH Logo Work Complete</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/LH_Logo_Work_Complete</template>
    </alerts>
    <alerts>
        <fullName>LH_Master_Escalation</fullName>
        <description>LH Master Escalation</description>
        <protected>false</protected>
        <recipients>
            <recipient>ann.lewis@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>david.cambouris@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michael.staffieri@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ta.stanton@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>thomas.reece@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Escalation_Standard_Email</template>
    </alerts>
    <alerts>
        <fullName>LH_New_Training_Email_from_Support</fullName>
        <description>LH New Training Email from Support</description>
        <protected>false</protected>
        <recipients>
            <recipient>crystal.bellew@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/LH_Support_Email_to_Casey</template>
    </alerts>
    <alerts>
        <fullName>LH_Surveys_Issue_Res</fullName>
        <description>LH Issue Resolution Survey Email</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountservices@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Issue_Res_Survey</template>
    </alerts>
    <alerts>
        <fullName>LH_Surveys_Issue_Res_AUTO</fullName>
        <description>LH Issue Resolution Survey Email AUTO</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountservices@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Issue_Res_Survey_LH_Auto</template>
    </alerts>
    <alerts>
        <fullName>Lighthouse_Follow_Up_Needed</fullName>
        <ccEmails>support@lighthousepmg.com</ccEmails>
        <description>Lighthouse Follow Up Needed</description>
        <protected>false</protected>
        <senderAddress>customercare@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Lighthouse_Follow_Up_Needed</template>
    </alerts>
    <alerts>
        <fullName>Notification_New_Case_Created</fullName>
        <description>Notification - New Case Created</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/New_Case_Notification</template>
    </alerts>
    <alerts>
        <fullName>Pre_MA_Case_Assigned_to_Sugar_Hill_Support</fullName>
        <ccEmails>lh-configteam@yodle.com</ccEmails>
        <description>Pre-MA Case Assigned to Sugar Hill Support</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/Pre_MA_Case_Assigned_to_SH_Support</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_to_LHFS_Reps_for_Yodle_Gold</fullName>
        <description>Send Email to LHFS Reps for Yodle Gold</description>
        <protected>false</protected>
        <recipients>
            <recipient>ann.lewis@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Lighthouse_Gold_Service_Notification</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_to_LHFS_Reps_for_Yodle_Gold_Medical</fullName>
        <description>Send Email to LHFS Reps for Yodle Gold</description>
        <protected>false</protected>
        <recipients>
            <recipient>crystal.bellew@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kevin.lewis@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Lighthouse_Gold_Service_Notification</template>
    </alerts>
    <alerts>
        <fullName>Target_Service_Area_Added</fullName>
        <description>Target Service Area Added</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Target_Service_Area_Added</template>
    </alerts>
    <alerts>
        <fullName>SEM_Upsell_Email_to_Client</fullName>
        <ccEmails>customercare@yodle.com</ccEmails>
        <description>SEM Upsell Email to Client</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercare@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/SEM_Upsell</template>
    </alerts>
    <fieldUpdates>
        <fullName>Account_Client_ID_to_Case_Client_ID</fullName>
        <field>Client_ID__c</field>
        <formula>Account.Client_ID__c</formula>
        <name>Case - Client ID to Account Client ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Email_Populate_to_Case</fullName>
        <field>client_email__c</field>
        <formula>Account.Email__c</formula>
        <name>Case - Client Email to Account Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Product_Type_Update</fullName>
        <field>Product_Type_at_Open_Date__c</field>
        <formula>Account.Product_Type_Transactional__c</formula>
        <name>Case - Product Type at Open Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Segment_to_Case_Segment</fullName>
        <field>Segment__c</field>
        <formula>Account.Secondary_Segments__c</formula>
        <name>Case - Segment to Account Segment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actual_Resolution_Date_now</fullName>
        <description>for use in new client setup cases - to determine length of time in status</description>
        <field>Actual_Resolution_Date__c</field>
        <formula>now()</formula>
        <name>Date of Last Case Status Change to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_Script_for_FS_CSC</fullName>
        <field>Link_to_Script__c</field>
        <formula>"https://na26.salesforce.com/articles/Scripts/Lighthouse-CSC-Script-Field-Service"</formula>
        <name>Add Script for FS CSC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Tax_Case_Owner_to_Karly_Sanchez</fullName>
        <field>OwnerId</field>
        <lookupValue>MarketingOps</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign Tax. Case Owner to Marketing Ops</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_OBC_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>OBC_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to OBC Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Austin_CS_Ops_Retention_FT</fullName>
        <field>OwnerId</field>
        <lookupValue>Austin_CS_Ops</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Austin CS Ops</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Assignment_Internal_Emails_to_Email</fullName>
        <description>Moves cases to the Email Catch Queue to be deleted</description>
        <field>OwnerId</field>
        <lookupValue>Email_Catch_All</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Assignment Internal Emails to Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Closed_By</fullName>
        <field>Case_Closed_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>Case Closed By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Origin_to_Internal</fullName>
        <field>Origin</field>
        <literalValue>Internal</literalValue>
        <name>Case Origin to Internal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_LH_Future_Request</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Future_Request</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to LH Future Request</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_LH_Support_Sugar_Hill</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Support_Sugar_Hill</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to LH Support - Sugar Hill</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Lighthouse_Field_Service</fullName>
        <field>OwnerId</field>
        <lookupValue>Lighthouse_Field_Service</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Lighthouse Field Service</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Lighthouse_Logos</fullName>
        <field>OwnerId</field>
        <lookupValue>Lighthouse_Logos</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Lighthouse Logos</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Sophie_Lavin</fullName>
        <field>OwnerId</field>
        <lookupValue>sravani.mutnuru@lighthouse.ib</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Case Owner to Anne Marie Fulton</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Postpone_by_3_Days</fullName>
        <field>Postpone_4_Attempts__c</field>
        <formula>TODAY() + 3</formula>
        <name>Case - Postpone by 3 Days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Reason_to_Escalated_Email_Response</fullName>
        <field>Reason</field>
        <literalValue>Escalated Email Response</literalValue>
        <name>Case Reason to Escalated Email Response</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Reason_to_LH_Postcard</fullName>
        <field>Reason</field>
        <literalValue>LH Postcard</literalValue>
        <name>Case Reason to LH Postcard</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Reason_to_Lighthouse_Logo</fullName>
        <field>Reason</field>
        <literalValue>Lighthouse Logo</literalValue>
        <name>Case Reason to Lighthouse Logo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Scheduled_Call_to_blank</fullName>
        <field>Scheduled_Call__c</field>
        <name>Case - Scheduled Call to blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Production_Team_Mistake</fullName>
        <field>Production_Team_Mistake__c</field>
        <literalValue>1</literalValue>
        <name>Check Production Team Mistake</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>City_and_State_Added</fullName>
        <field>City_and_State__c</field>
        <formula>Account.BillingState</formula>
        <name>City and State Added</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Client_Email_from_Account</fullName>
        <field>client_email__c</field>
        <formula>Account.Email__c</formula>
        <name>Client Email from Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_Case</fullName>
        <description>Changes case status to close</description>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>Close Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Time_in_Progress</fullName>
        <field>Date_time_In_Progress__c</field>
        <formula>NOW()</formula>
        <name>Date Time in Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_of_Web_Dev_QA</fullName>
        <field>Date_of_Web_Dev_QA__c</field>
        <name>Date of Web Dev QA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Days_Live_on_Case</fullName>
        <field>Days_Live__c</field>
        <formula>Account.Days_Live__c</formula>
        <name>Case - Days Live to Account Days Live</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Description_for_Disable_Newsletter_Promo</fullName>
        <field>Description</field>
        <formula>"Delete special newsletter pricing for " + Account.Name + " after " + text(TODAY()+90)</formula>
        <name>Description for Disable Newsletter Promo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Due_Date_to_1_Year_from_Today</fullName>
        <field>Due_Date__c</field>
        <formula>TODAY()+90</formula>
        <name>Due Date to 1 Year from Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Escalated_Priority</fullName>
        <field>Escalated__c</field>
        <literalValue>1</literalValue>
        <name>Escalated? to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Facebook_Cases_Assign_to_MarketingOps</fullName>
        <field>OwnerId</field>
        <lookupValue>MarketingOps</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Facebook Cases Assign to MarketingOps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_in_Date_Work_Completed</fullName>
        <field>Date_Work_Completed__c</field>
        <formula>now()</formula>
        <name>Fill in Date Work Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>IMS_Rep_to_Blank</fullName>
        <field>IMS_Rep__c</field>
        <name>IMS Rep to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Initial_DateTime_Closed_Now</fullName>
        <description>Populates the "Initial_DateTime_Closed__c" field to current date/time.</description>
        <field>Initial_DateTime_Closed__c</field>
        <formula>NOW()</formula>
        <name>Initial DateTime Closed -&gt; Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LHMA_Post_Launch</fullName>
        <field>OwnerId</field>
        <lookupValue>LHMA_Post_Launch</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>LHMA Post Launch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LH_Assign_to_LH_Support_Austin</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Support_Austin</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to LH Support - Austin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LH_Postcard_Assign_to_LH_Postcard</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Postcard</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to LH Postcard</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Link_to_Script_FS_Adoption_Call</fullName>
        <field>Link_to_Script__c</field>
        <formula>"https://na26.salesforce.com/articles/Scripts/Lighthouse-Setup-Completion-Call-Script-Field-Services"</formula>
        <name>Link to Script = FS Adoption Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Manager_Approved_Quality</fullName>
        <field>OwnerId</field>
        <lookupValue>QualityTeam295311</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Quality Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mark_Escalated_Field</fullName>
        <field>Escalated__c</field>
        <literalValue>1</literalValue>
        <name>Mark Escalated? Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outrank_Wordpress_Email_to_Case_Reason</fullName>
        <field>Reason</field>
        <literalValue>Inbound Inquiry</literalValue>
        <name>Case Reason to Inbound Inquiry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reason_Detail_to_Lighthouse_Support</fullName>
        <field>Reason_Detail__c</field>
        <literalValue>Lighthouse Support</literalValue>
        <name>Reason Detail to Lighthouse Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reason_Detail_to_QA_Request_Lighthouse</fullName>
        <field>Reason_Detail__c</field>
        <literalValue>QA Request Lighthouse</literalValue>
        <name>Reason Detail to QA Request Lighthouse</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Record_Type_Update</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Blank_for_Email_Catch_All</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Record Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SEM_Ops_Status</fullName>
        <field>Status</field>
        <literalValue>In Progress</literalValue>
        <name>Status to In Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Shift_to_Billing_Notifications_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Local_Collections_Billing_Notification</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Shift to Billing Notifications Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_to_Closed</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>Status to Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_to_Delete_Case</fullName>
        <field>Status</field>
        <literalValue>Delete Case</literalValue>
        <name>Status to Delete Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Subject_for_Disable_Newsletter_Promo</fullName>
        <field>Subject</field>
        <formula>"Disable Newsletter Promo - " + Account.Client_ID__c + "/" + Account.LH_360_ID__c + " - " + Account.Name</formula>
        <name>Subject for Disable Newsletter Promo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Subject_for_OBC_Request</fullName>
        <field>Subject</field>
        <formula>Account.Client_ID__c &amp; "  -  " &amp; Account.Name &amp; " - OBC Request"</formula>
        <name>Subject for OBC Request</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Time_Entered_In_Progess</fullName>
        <field>Time_Entered_In_Progress__c</field>
        <formula>now()</formula>
        <name>Time Entered In Progess</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Total_Time_Round_2_Changes</fullName>
        <field>Web_Dev_Total_Minutes_Round_2_Changes__c</field>
        <name>Total Time Round 2 Changes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_3_CSC_Date_Field_When_Status_Chan</fullName>
        <field>Date_Moved_to_3CSC_Status__c</field>
        <formula>TODAY()</formula>
        <name>Update 3 CSC Date Field When Status Chan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Client_Phone</fullName>
        <field>Client_Phone_Number__c</field>
        <formula>Account.Phone</formula>
        <name>Update Client Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Desccription</fullName>
        <field>Description</field>
        <name>Update Desccription</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_IMS_Rep_to_Platinum_Support</fullName>
        <field>IMS_Rep__c</field>
        <lookupValue>sravani.mutnuru@lighthouse.ib</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update IMS Rep to Platinum Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_Field</fullName>
        <field>Status</field>
        <literalValue>Internal Review</literalValue>
        <name>Update Status Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_to_Delete_Case</fullName>
        <field>Status</field>
        <literalValue>Delete Case</literalValue>
        <name>Update Status to Delete Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_to_New</fullName>
        <field>Status</field>
        <literalValue>New</literalValue>
        <name>Update Status to New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Subject</fullName>
        <field>Subject</field>
        <name>Update Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Time_Owner_Changed</fullName>
        <field>Date_Time_Last_Owner_Changed__c</field>
        <formula>now()</formula>
        <name>Date/Time Last Owner Changed to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Web_Dev_Completed_By</fullName>
        <field>WD_QA_Completed_By__c</field>
        <name>Web Dev QA Completed By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Web_Dev_Completed_Date</fullName>
        <field>Web_Dev_Score_for_IMS__c</field>
        <name>Web Dev Completed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Web_Dev_Member</fullName>
        <field>Web_Dev_User__c</field>
        <name>Web Dev Member</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Web_Dev_Member_Round_2</fullName>
        <field>Web_Dev_Member_Round_2_Changes__c</field>
        <name>Web Dev Member Round 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Web_Dev_QA_Status</fullName>
        <field>Web_Dev_QA_Status__c</field>
        <name>Web Dev QA Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Web_Dev_Round_2_Date</fullName>
        <field>Web_Dev_Completed_Date_Round_2_Changes__c</field>
        <name>Web Dev Round 2 Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Web_Dev_Total_Minutes</fullName>
        <field>Web_Dev_Total_Minutes_for_Changes__c</field>
        <name>Web Dev Total Minutes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_status_to_In_Progress</fullName>
        <field>Status</field>
        <literalValue>In Progress</literalValue>
        <name>YBN: Update status to In Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>priort_critical</fullName>
        <field>Priority</field>
        <literalValue>Critical</literalValue>
        <name>Priority to Critical</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>LH - Assign to LH Support Sugar Hill</fullName>
        <actions>
            <name>Case_Owner_to_LH_Support_Sugar_Hill</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Feature Request,Consumables Adjustments,Customization,Export Patient Group</value>
        </criteriaItems>
        <description>LH Specific . Updated with https://jira.yodle.com/browse/YO-60625</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LH - Assign to Sugar Hill Support</fullName>
        <actions>
            <name>Case_Owner_to_LH_Support_Sugar_Hill</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 or 2) and 3</booleanFilter>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>,Customization,Consumables Adjustments,Investigate,Pre-MA Changes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Bounce List</fullName>
        <actions>
            <name>Case_Owner_to_LH_Support_Sugar_Hill</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Clear Bounce List</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Change to LH Future Request</fullName>
        <actions>
            <name>Case_Owner_to_LH_Future_Request</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>LH Specific . Consolidating 3 Workflow Rules.  Disabling 2, removed this Field update on another one. Using Case to compare if values not in the list</description>
        <formula>AND( RecordTypeId = "0122E000000lP1K", /* LH Master RT */ OR(      ISPICKVAL(Reason, "Custom Message Migration"),     ISPICKVAL(Reason, "Delayed Consumables"),     ISPICKVAL(Reason, "Remove Newsletter Special Pricing"),     ISPICKVAL(Reason, "Site/Listings Teardown"),     ISPICKVAL(Reason, "Transports On/Off") ),  OR(     ISNEW() ,   /*check if the reason changed to something outside this list */   AND(             NOT(ISNEW()), 	   Case( 		 TEXT(Reason), 		 "Custom Message Migration",1,  		 "Delayed Consumables", 1, 		 "Remove Newsletter Special Pricing", 1, 		 "Site/Listings Teardown", 1, 		 "Transports On/Off",1, 		 0) 	   &lt;&gt; 	   Case( 		 TEXT(PRIORVALUE(Reason)), 		 "Custom Message Migration",1,  		 "Delayed Consumables", 1, 		 "Remove Newsletter Special Pricing", 1, 		 "Site/Listings Teardown", 1, 		 "Transports On/Off",1, 		 0) 	) ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LH OBC Recording</fullName>
        <actions>
            <name>Assign_to_OBC_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Subject_for_OBC_Request</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>OBC Recording</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lighthouse Logos Email2Case</fullName>
        <actions>
            <name>Case_Owner_to_Lighthouse_Logos</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Case_Reason_to_Lighthouse_Logo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>logo@lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Lighthouse Logo</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Disable Newsletter Promo Created</fullName>
        <actions>
            <name>Account_Email_Populate_to_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Case_Origin_to_Internal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Description_for_Disable_Newsletter_Promo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Due_Date_to_1_Year_from_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Subject_for_Disable_Newsletter_Promo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Remove Newsletter Special Pricing</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH - Close out Upsell Emails</fullName>
        <actions>
            <name>Status_to_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>contains</operation>
            <value>Lighthouse 360: Setup Call Recap,Your Lighthouse Messages are now active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>support@lighthousepmg.com,medicalsupport@lighthousepmg.com,autosupport@lighthousepmg.com</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LH - Lighthouse Gold Service for Field Service</fullName>
        <actions>
            <name>Send_Email_to_LHFS_Reps_for_Yodle_Gold</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>LHGS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Closed,Delete Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Help_Portal_Product_Type__c</field>
            <operation>equals</operation>
            <value>Lighthouse Field Service</value>
        </criteriaItems>
        <description>LH Specific . Sends an email to LHGS Field Service Reps</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LH - Lighthouse Gold Service for Medical</fullName>
        <actions>
            <name>Send_Email_to_LHFS_Reps_for_Yodle_Gold_Medical</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>LHGS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Closed,Delete Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Help_Portal_Product_Type__c</field>
            <operation>contains</operation>
            <value>Lighthouse Dental,Lighthouse Chiro</value>
        </criteriaItems>
        <description>LH Specific . Sends an email to LHGS Medical</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LH DF Review Migration To SH Support</fullName>
        <actions>
            <name>Case_Owner_to_LH_Support_Sugar_Hill</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>DF Review Migration</value>
        </criteriaItems>
        <description>LH Specific . DF Review Migration Case Reason will assign to SH Support</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Inbound Support Email to Crystal</fullName>
        <actions>
            <name>LH_New_Training_Email_from_Support</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>support@lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>LH Training</value>
        </criteriaItems>
        <description>LH Specific.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Logo Work Complete</fullName>
        <actions>
            <name>LH_Logo_Work_Complete</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Lighthouse Logo</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Config Detail - Marks as Escalated</fullName>
        <actions>
            <name>Mark_Escalated_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>LH Specific</description>
        <formula>AND(RecordType.DeveloperName = "LH_Master", /*LH Master */  OR(  INCLUDES(Config_Detail__c, "New Template Update - Feedback Only"),  INCLUDES(Config_Detail__c, "New Template Update - All Campaigns")))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Escalated</fullName>
        <actions>
            <name>Escalated_Priority</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Awaiting Customer Response,Escalated (Dev),Escalated (Internal),Awaiting Internal Response,Bug Reported</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <description>LH Specific . Need to indicate escalated for LH Master cases when in status Awaiting Customer Response, Awaiting Internal Response, Escalated (Internal), Bug Reported and Escalated (Dev)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Production Team Mistake</fullName>
        <actions>
            <name>Mark_Escalated_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>ProductionTeam Mistake</value>
        </criteriaItems>
        <description>LH Specific . Mark Escalated? when production team mistake is selected</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Master Case Escalation</fullName>
        <actions>
            <name>LH_Master_Escalation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH New PPP CSC</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>PPP CSC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Postcard Email2Case</fullName>
        <actions>
            <name>Case_Reason_to_LH_Postcard</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Postcard_Assign_to_LH_Postcard</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Lh-postcards@lighthousepmg.com</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LH Quality</fullName>
        <actions>
            <name>Manager_Approved_Quality</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reason_Detail_to_QA_Request_Lighthouse</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SEM_Ops_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Quality Team</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Support Email2Case Delete Emails</fullName>
        <actions>
            <name>Status_to_Delete_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 4 or 5 or (3 and 6) or 7)</booleanFilter>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>contains</operation>
            <value>support@lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
            <value>Your scheduled payment has been declined,Client Spend Alert</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>contains</operation>
            <value>Thank You for Your Order</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>startsWith</operation>
            <value>[JIRA]</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>startsWith</operation>
            <value>Lighthouse 360: Please contact patient</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>contains</operation>
            <value>lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
            <value>The TIME on your Server is incorrect,The TIME ZONE on your Server is incorrect</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Support Email2Case to Austin</fullName>
        <actions>
            <name>LH_Assign_to_LH_Support_Austin</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outrank_Wordpress_Email_to_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reason_Detail_to_Lighthouse_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 and 2 and 3 and 4 and 5 and 6 and 7 and 9 and 10) or 8</booleanFilter>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>contains</operation>
            <value>support@lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
            <value>The TIME on your Server is incorrect,The TIME ZONE on your Server is incorrect,Your scheduled payment has been declined</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>Failed Task Lists,Failed transferring batch resource</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
            <value>root@app03.localdomain,root@lh-betaapp3.lhprod.yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>failure notice,SendGrid - Statistics</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
            <value>MAILER-DAEMON@mailer.lpmg360.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>LH Medical VM,LH Auto VM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Salesforce Automation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Blank for Email Catch All</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Support Email2Case to Sugar Hill</fullName>
        <actions>
            <name>Case_Owner_to_LH_Support_Sugar_Hill</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outrank_Wordpress_Email_to_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reason_Detail_to_Lighthouse_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND ((2 AND 3) OR 4) and 5</booleanFilter>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>contains</operation>
            <value>support@lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>startsWith</operation>
            <value>Failed Task Lists,Failed transferring batch resource:</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>equals</operation>
            <value>root@lh-betaapp3.lhprod.yodle.com,root@app03.localdomain</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>startsWith</operation>
            <value>Failed transferring batch resource,[BULK]  Failed transferring batch resource</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Blank for Email Catch All</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Support Email2Case to Tricia</fullName>
        <actions>
            <name>Outrank_Wordpress_Email_to_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reason_Detail_to_Lighthouse_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>contains</operation>
            <value>support@lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>startsWith</operation>
            <value>SendGrid - Statistics -</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LHMA Post Launch</fullName>
        <actions>
            <name>LHMA_Post_Launch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Requested_Updates__c</field>
            <operation>equals</operation>
            <value>Domain Swap,Metro Move</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>contains</operation>
            <value>Lighthouse,LH</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lighthouse Follow Up Needed</fullName>
        <actions>
            <name>Lighthouse_Follow_Up_Needed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Lighthouse Follow-Up Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Owner %3D LH Auto Support</fullName>
        <actions>
            <name>Case_Assigned_to_LH_Auto_Support_send_email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>LH Auto Support</value>
        </criteriaItems>
        <description>LH Specific.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate Client ID to Case</fullName>
        <actions>
            <name>Account_Client_ID_to_Case_Client_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Client_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-MA Case Assigned to SH Support</fullName>
        <actions>
            <name>Pre_MA_Case_Assigned_to_Sugar_Hill_Support</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Case_Owner_to_LH_Support_Sugar_Hill</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Pre-MA Changes</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Surveys - LH Issue Resolution SC%2FLO</fullName>
        <actions>
            <name>LH_Surveys_Issue_Res</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 and 12 AND 13 AND 14</booleanFilter>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>contains</operation>
            <value>lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>contains</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Charge_Failure_Status__c</field>
            <operation>notContain</operation>
            <value>billing decline</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>notEqual</operation>
            <value>Yodle Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Survey_Opt_Out__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>notEqual</operation>
            <value>OFF</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Suppress_Exit_Email__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sent_LH_Issue_Resolution_Survey__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>notContain</operation>
            <value>Out of Sync,Charge,Adoption,Maps Verification,Unknown,Cancel,Touch,Setup,Upsell,Pin Collectionn,Downsell,Invoice,Proactive</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>notContain</operation>
            <value>Out of Sync,Charge,Adoption,Maps Verification,Unknown,Cancel,Touch,Setup,Upsell,Pin Collection,Downsell,Invoice,Proactive</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Secondary_Segments__c</field>
            <operation>notContain</operation>
            <value>Auto</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Surveys - LH Issue Resolution SC%2FLO AUTO</fullName>
        <actions>
            <name>LH_Surveys_Issue_Res_AUTO</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 and 12 AND 13 AND 14</booleanFilter>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>contains</operation>
            <value>lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>contains</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Charge_Failure_Status__c</field>
            <operation>notContain</operation>
            <value>billing decline</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>notEqual</operation>
            <value>Yodle Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Survey_Opt_Out__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>notEqual</operation>
            <value>OFF</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Suppress_Exit_Email__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sent_LH_Issue_Resolution_Survey__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>notContain</operation>
            <value>Out of Sync,Charge,Adoption,Maps Verification,Unknown,Cancel,Touch,Setup,Upsell,Pin Collectionn,Downsell,Invoice,Proactive</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>notContain</operation>
            <value>Out of Sync,Charge,Adoption,Maps Verification,Unknown,Cancel,Touch,Setup,Upsell,Pin Collection,Downsell,Invoice,Proactive</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Secondary_Segments__c</field>
            <operation>contains</operation>
            <value>Auto</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Time Entered In Progess</fullName>
        <actions>
            <name>Time_Entered_In_Progess</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 or 2</booleanFilter>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Time in Ownership Update</fullName>
        <actions>
            <name>Update_Time_Owner_Changed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>LH Specific</description>
        <formula>ischanged( OwnerId )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cases Closed By Populate</fullName>
        <actions>
            <name>Case_Closed_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Product Update to Product Type at Open Date</fullName>
        <actions>
            <name>Account_Product_Type_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Account_Segment_to_Case_Segment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Add Client Phone Number to Case</fullName>
        <actions>
            <name>Update_Client_Phone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Client_Phone_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign Platinum Support to IMS Rep on Outbound Cases</fullName>
        <actions>
            <name>Update_IMS_Rep_to_Platinum_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>equals</operation>
            <value>Platinum Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign Tax%2E Case Owner to Marketing Ops</fullName>
        <actions>
            <name>Assign_Tax_Case_Owner_to_Karly_Sanchez</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Taxonomy</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Global Content Review,Global Image Review</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CPP - Setup Complete</fullName>
        <actions>
            <name>CPP_Setup_Complete</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>3-CSC AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>notContain</operation>
            <value>Rogers,Berry,ViaMedia</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSC Date in the Past</fullName>
        <actions>
            <name>CSC_Date_in_the_Past</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>General , Temporary solution when the 'Finalize Sale' is completed in YL after the CSC date.</description>
        <formula>GCC1_Date_Time__c &lt; CreatedDate</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case - IMS Rep blank on outbound reattempt</fullName>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>General</description>
        <formula>and(  RecordTypeId = "012600000009cjs", ischanged( Scheduled_Call__c ), ispickval( Status ,"New"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Case - Initial Date%2FTime Closed</fullName>
        <actions>
            <name>Initial_DateTime_Closed_Now</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Initial_DateTime_Closed__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>General , Captures the initial close date of a case.  Date does not change when a case is reopened.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Notification to Creator upon close or awaiting internal response</fullName>
        <actions>
            <name>Case_Notification_to_case_creator</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 or 2) and 3 And 5 and 4 and 6</booleanFilter>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Awaiting Internal Response</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>notContain</operation>
            <value>Tolman,Jayaraj,Connector,Laughlin,Flanagan,Lavin,Gelardi,Mettille,Mcmillian,Mcintyre,Fincke,Banker,Woodul,Salesforce,Sync,Amp,Ross,Starett</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.User_Created_By__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Created_by_Role__c</field>
            <operation>notContain</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>FS Product Feedback,LH Product Feedback</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Unscheduled Reattempt 4%2B</fullName>
        <actions>
            <name>Case_Postpone_by_3_Days</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Case_Scheduled_Call_to_blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Adoption Call,CSC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Unscheduled - 4+ Attempts</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Unscheduled Reattempt 4%2B and IMS Removed</fullName>
        <actions>
            <name>Case_Postpone_by_3_Days</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>General</description>
        <formula>and(  RecordType.DeveloperName = "Outbound_Call",  ischanged(IMS_Rep__c), ISBLANK(IMS_Rep__c),  ispickval(Status ,"Unscheduled - 4+ Attempts"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Case Assignment Billing Notifications</fullName>
        <actions>
            <name>Shift_to_Billing_Notifications_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>equals</operation>
            <value>noreply@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>contains</operation>
            <value>Billing succeeded for client</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case Assignment Internal Emails to Email Catch All</fullName>
        <actions>
            <name>Case_Assignment_Internal_Emails_to_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>((1 AND (2 OR 7) AND 3) OR (1 AND 2 AND 5 AND 6) OR 4 OR (8 AND 9)) AND 10</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>contains</operation>
            <value>@web.com,@yodle.com,@salesforce.com,@onesourcevhr.com,@webtime.com,@theoreminc.net,@00d600000006ycdeay.pnet,barracudanetworks.com,@chatter.salesforce.com,@jobvite.com,myworkday.com,aetnagetactive.com,@office.lhmailer.com,perkspot.com,adp.com,@register.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>notEqual</operation>
            <value>CS@Outrank.com,customercare@yodle.com,fsproductfeedback@yodle.com,lhproductfeedback@yodle.com,productideas@yodle.com,YBNProductIdeas@yodle.com,Platinum Support,TORCHxProductFeedback@yodle.com,support@torchx.com,LHWB@yodle.com,LBWCustomerService@web.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
            <value>New Web To Case,Billing Error: Credit Card Declined,Client Spend Alert,Low Advertising Funds,Billing Error: Credit Card Declined</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>contains</operation>
            <value>OR 3.0 GLocal &amp; BLocal,was unable to be billed,OR 3.0 - Organic Setup Search Influence Work Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>customercare@yodle.com,LBWCustomerService@web.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>contains</operation>
            <value>@registeredsite.com,@lighthousepmg.com,@hipchat.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Rep Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>contains</operation>
            <value>@lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>Action Needed</value>
        </criteriaItems>
        <description>LH SPecific, General</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case Owner - Ann Lewis</fullName>
        <actions>
            <name>Case_Assigned_to_You_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Ann Lewis</value>
        </criteriaItems>
        <description>LH SPecific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Owner to Quality Team</fullName>
        <actions>
            <name>Manager_Approved_Quality</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>,QA Request Lighthouse,QA Request Account Acceptance,QA Request Trifecta,QA Request Austin/St. Lucia</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Created_by_Role__c</field>
            <operation>contains</operation>
            <value>Retention</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Web Dev Specific Info</fullName>
        <actions>
            <name>Date_of_Web_Dev_QA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Total_Time_Round_2_Changes</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Web_Dev_Completed_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Web_Dev_Completed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Web_Dev_Member</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Web_Dev_Member_Round_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Web_Dev_QA_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Web_Dev_Round_2_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Web_Dev_Total_Minutes</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Web_Dev_Score_for_IMS__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case%3A Email Auto Reply Auto Close</fullName>
        <actions>
            <name>Close_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>contains</operation>
            <value>[Auto-Reply]</value>
        </criteriaItems>
        <description>General , Autocloses auto reply email cases</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Check Production Team Mistake</fullName>
        <actions>
            <name>Check_Production_Team_Mistake</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>ProductionTeam Mistake</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>City and State Case Record</fullName>
        <actions>
            <name>City_and_State_Added</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.City_and_State__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Client Email from Account</fullName>
        <actions>
            <name>Account_Email_Populate_to_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Client_Email_from_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.client_email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Account Update,YBN Master</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date Time in Progress</fullName>
        <actions>
            <name>Date_Time_in_Progress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <description>General workflow</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date%2FTime Status Changed</fullName>
        <actions>
            <name>Actual_Resolution_Date_now</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>updates actual resolution time, It's a general workflow</description>
        <formula>ischanged( Status )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Days Live on QA Case</fullName>
        <actions>
            <name>Days_Live_on_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Days_Live__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <description>It's a general workflow</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email2Case - Lighthouse Field Service</fullName>
        <actions>
            <name>Case_Owner_to_Lighthouse_Field_Service</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outrank_Wordpress_Email_to_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>customercare@lighthousepmg.com,LH Field Services VM,LHFS Service Task VM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Jennifer Flanagan,Salesforce Automation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>LH SPecific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email2Case - Notify Owner Of New Case</fullName>
        <actions>
            <name>Notification_New_Case_Created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Centermark BI</value>
        </criteriaItems>
        <description>It's a general workflow</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Escalated Email Response New</fullName>
        <actions>
            <name>Case_Owner_to_Sophie_Lavin</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Case_Reason_to_Escalated_Email_Response</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Escalated Email Response</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>It's a general workflow</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Escalated Priority</fullName>
        <actions>
            <name>Escalated_Priority</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Fill in Date Work Completed</fullName>
        <actions>
            <name>Fill_in_Date_Work_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>contains</operation>
            <value>Work Completed</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Manager Approved to Austin CS Ops</fullName>
        <actions>
            <name>Austin_CS_Ops_Retention_FT</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Free Time Guarantee Request,Free Time Performance Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>QA Request Consultative</fullName>
        <actions>
            <name>Manager_Approved_Quality</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>QA Request Account Acceptance,QA Request Trifecta,QA Request Austin/St. Lucia,Closing Script QA</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SEM Upsell Email to Client</fullName>
        <actions>
            <name>SEM_Upsell_Email_to_Client</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>SEM Upsell Test</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed - Upsell Accepted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Target Service Area Added</fullName>
        <actions>
            <name>Target_Service_Area_Added</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Target Service Area Addition</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <description>General , When a Target Service Area request case is closed, an email is sent to the record creator.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update 3 CSC Date Field When Status Change</fullName>
        <actions>
            <name>Update_3_CSC_Date_Field_When_Status_Chan</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Experience_Key__c</field>
            <operation>contains</operation>
            <value>lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Upsell__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>3-CSC AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Date_Moved_to_3CSC_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>LH SPecific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Case for Email Catch All Queue</fullName>
        <actions>
            <name>Record_Type_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Desccription</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Email Catch All</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Priority When Account Update Case Closed</fullName>
        <actions>
            <name>priort_critical</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Account Update</value>
        </criteriaItems>
        <description>General , Update "Escalated" Priority to "Critical" when case is closed to prevent re-opened cases from triggering 'escalation' emails</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
