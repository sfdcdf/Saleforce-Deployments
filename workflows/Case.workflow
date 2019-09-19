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
            <recipient>dcambouris@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mstaffieri@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ta.stanton@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>treece@lighthousepmg.com.ib</recipient>
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
</Workflow>
