<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_New_Inbound_Email</fullName>
        <description>Alert - New Inbound Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Alert_New_Inbound_Email</template>
    </alerts>
    <alerts>
        <fullName>Berry_72_Hour_Email</fullName>
        <ccEmails>support@viviallocalleads.com</ccEmails>
        <description>Berry 72 Hour Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>logan.rollier@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>berrysales@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Email_Templates/Berry_72_Hour_Emails</template>
    </alerts>
    <alerts>
        <fullName>Berry_Additional_Notes_Escalated_to_Berry</fullName>
        <ccEmails>yodle-escalations@theberrycompany.com</ccEmails>
        <description>Berry Additional Notes - Escalated to Berry</description>
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
        <template>Partner_Email_Templates/Escalation_Additional_Notes</template>
    </alerts>
    <alerts>
        <fullName>Berry_NCS_Additional_Notes_for_Escalation</fullName>
        <ccEmails>yodle-escalations@theberrycompany.com</ccEmails>
        <description>Berry NCS Additional Notes for Escalation</description>
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
        <template>Partner_Email_Templates/NCS_Escalation_Additional_Notes</template>
    </alerts>
    <alerts>
        <fullName>Berry_Post_Setup_Issue</fullName>
        <ccEmails>yodle-escalations@theberrycompany.com</ccEmails>
        <description>Berry Post-Setup Issue</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Email_Templates/Berry_Post_Setup_Issue</template>
    </alerts>
    <alerts>
        <fullName>Berry_Red_Segment_email</fullName>
        <ccEmails>yodle-sitelaunches@theberrycompany.com</ccEmails>
        <description>Berry Red Segment email</description>
        <protected>false</protected>
        <recipients>
            <field>Berry_Account_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Email_Templates/Berry_Red_Segment_Email</template>
    </alerts>
    <alerts>
        <fullName>Berry_SW_Issue</fullName>
        <ccEmails>yodle-escalations@theberrycompany.com</ccEmails>
        <description>Berry Sales Wizard Issue</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>berryswconfirmation@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Email_Templates/Berry_SW_Incomplete</template>
    </alerts>
    <alerts>
        <fullName>Berry_case_open_for_6_days</fullName>
        <description>Berry - WO Almost at SLA</description>
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
        <template>Partner_Email_Templates/Berry_WO_almost_at_SLA</template>
    </alerts>
    <alerts>
        <fullName>Berry_no_contract_after_5_days</fullName>
        <ccEmails>yodle-escalations@theberrycompany.com</ccEmails>
        <description>Berry - no contract after 5 days</description>
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
        <template>Partner_Email_Templates/Berry_5_days_still_no_contract</template>
    </alerts>
    <alerts>
        <fullName>Bolt_On_Cancellation_Cancel_All</fullName>
        <ccEmails>support@boltontechnology.com</ccEmails>
        <ccEmails>pmcgee@boltontechnology.com</ccEmails>
        <description>Bolt On Cancellation - Cancel All</description>
        <protected>false</protected>
        <recipients>
            <recipient>bosteros@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Bolt_On_Cancellation_ProPack_Welcome_Station</template>
    </alerts>
    <alerts>
        <fullName>CPP_Setup_Complete</fullName>
        <ccEmails>certifiedpartnersupport@yodle.com</ccEmails>
        <description>CPP - Setup Complete</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/CPP_Setup_Complete</template>
    </alerts>
    <alerts>
        <fullName>CSC_Business_Customization_Form</fullName>
        <description>CSC Business Customization Form</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercare@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/CSC_Business_Customization_Form</template>
    </alerts>
    <alerts>
        <fullName>CSC_Business_Customization_Form_Plumber</fullName>
        <description>CSC Business Customization Form Plumber</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercare@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/CSC_Business_Customization_Form_Plumber</template>
    </alerts>
    <alerts>
        <fullName>CSC_Date_in_the_Past</fullName>
        <description>CSC Date in the Past</description>
        <protected>false</protected>
        <recipients>
            <recipient>katie.green@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>makenzie.cunningham@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pkoepke@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/CSC_Date_in_the_Past</template>
    </alerts>
    <alerts>
        <fullName>CSC_Survey_Dedicated_Email</fullName>
        <description>CSC Survey Dedicated - Email</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>kevinbiggs@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/CSC_Survey_Email_Dedicated</template>
    </alerts>
    <alerts>
        <fullName>CSC_Survey_Pooled_Email</fullName>
        <description>CSC Survey - Email</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>kentwarren@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/CSC_Survey_Email_Pooled</template>
    </alerts>
    <alerts>
        <fullName>CS_Touch_Plan_Email_Scheduled_Change_Email_Notification</fullName>
        <description>CS Touch Plan Email Scheduled Change Email Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CS_Touch_Plan_Schedule_Change</template>
    </alerts>
    <alerts>
        <fullName>Case_Assigned_to_LH_Auto_Support_send_email</fullName>
        <ccEmails>LHAutoTechBots@yodle.com</ccEmails>
        <description>Case Assigned to LH Auto Support send email</description>
        <protected>false</protected>
        <senderAddress>csops@yodle.com</senderAddress>
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
        <fullName>Case_Email_Rescheduled_CSC_or_TP</fullName>
        <description>Case - Email Rescheduled CSC, TP, or Adoption Call</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Case_Email_Rescheduled_CSC_or_TP</template>
    </alerts>
    <alerts>
        <fullName>Case_Email_Rescheduled_CSC_or_TP_LBW_Lead_Stream_Queue</fullName>
        <description>Case - Email Rescheduled CSC, TP, or Adoption Call LBW or Lead Stream Support Queue</description>
        <protected>false</protected>
        <recipients>
            <recipient>makenzie.cunningham@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Case_Email_Rescheduled_CSC_or_TP</template>
    </alerts>
    <alerts>
        <fullName>Case_Milestone_SLA_Violation</fullName>
        <description>Case - Milestone - SLA Violation</description>
        <protected>false</protected>
        <recipients>
            <field>Owner_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>no-reply@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Case_SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Case_Milestone_SLA_Violation_First_Response</fullName>
        <description>Case - Milestone - SLA Violation - First Response</description>
        <protected>false</protected>
        <recipients>
            <field>Owner_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>no-reply@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Case_SLA_Violation_First_Response</template>
    </alerts>
    <alerts>
        <fullName>Case_Milestone_SLA_Warning</fullName>
        <description>Case - Milestone - SLA Warning</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>no-reply@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Case_SLA_Warning</template>
    </alerts>
    <alerts>
        <fullName>Case_Milestone_SLA_Warning_First_Response</fullName>
        <description>Case - Milestone - SLA Warning - First Response</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>no-reply@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Case_SLA_Warning_First_Response</template>
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
        <fullName>Case_Notification_to_case_owner</fullName>
        <description>Case - Notification to case owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Notification_to_Case_Creator_upon_Close_or_Awaiting_Internal_Response</template>
    </alerts>
    <alerts>
        <fullName>Case_Send_LH_Winback_Notification</fullName>
        <ccEmails>eric.gallegos@lighthousepmg.com</ccEmails>
        <ccEmails>KBrewer@yodle.com</ccEmails>
        <description>Case - Send LH Winback Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>apierpont@web.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mhenry@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Support/Case_Send_LH_Winback_Notification_2</template>
    </alerts>
    <alerts>
        <fullName>Case_Updated_Changed_or_Assigned_to_you</fullName>
        <description>Case Updated/Changed or Assigned to you</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Case_Updated_Changed_or_Assigned_to_you</template>
    </alerts>
    <alerts>
        <fullName>Charge_Failure_New_Email_Received</fullName>
        <description>Charge Failure - New Email Received</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>sfdc@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Charge_Failure_New_Email_Received</template>
    </alerts>
    <alerts>
        <fullName>Client_Escalation_Case_Closed</fullName>
        <ccEmails>mhausman@yodle.com</ccEmails>
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
        <fullName>Dedicated_CSC_New_Assignment</fullName>
        <description>Dedicated CSC New Assignment</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>csc@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Dedicated_CSC_New_Assignment</template>
    </alerts>
    <alerts>
        <fullName>Dedicated_CSC_New_Assignment_CS_Ops</fullName>
        <description>Dedicated CSC New Assignment (CS Ops)</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>csc@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Dedicated_CSC_New_Assignment_CS_Ops</template>
    </alerts>
    <alerts>
        <fullName>Email_internal_user_of_Yodle_Gold_Closure</fullName>
        <description>Email internal user of Yodle Gold Closure</description>
        <protected>false</protected>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>yodlegoldservice@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Client_Escalation_Case_Closed</template>
    </alerts>
    <alerts>
        <fullName>Escalated_Account_Performance</fullName>
        <description>Escalated Account Performance</description>
        <protected>false</protected>
        <recipients>
            <recipient>jcarpenter@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kbanker@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mgelardi@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Client_Services_Mgr__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Escalation_Standard_Email</template>
    </alerts>
    <alerts>
        <fullName>Escalated_Closed</fullName>
        <ccEmails>yodle-escalations@theberrycompany.com</ccEmails>
        <description>Berry Escalation Closed</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Email_Templates/Escalation_Escalated_To_Berry</template>
    </alerts>
    <alerts>
        <fullName>Escalated_SEM_Ops</fullName>
        <description>Escalated SEM Ops</description>
        <protected>false</protected>
        <recipients>
            <recipient>brwilliams@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>heather.rubio@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Client_Services_Mgr__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Escalation_Standard_Email</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Escalated_to_Berry</fullName>
        <ccEmails>yodle-escalations@theberrycompany.com</ccEmails>
        <description>Berry Escalation, Escalated to Berry</description>
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
        <template>Partner_Email_Templates/Escalation_Escalated_To_Berry</template>
    </alerts>
    <alerts>
        <fullName>Gold_Service_Notify_Rep_of_Closure</fullName>
        <description>Gold Service - Notify Rep of Closure</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep_E_mail_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>yodlegoldservice@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Gold_Service_Notify_Sales_Rep_of_Closure</template>
    </alerts>
    <alerts>
        <fullName>GreenSky_Email_to_Client_When_Account_Update_is_Complete</fullName>
        <description>GreenSky Finance - MA Work Complete Email - Local</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercare@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/GreenSky_Finance_MA_Work_Complete_Email</template>
    </alerts>
    <alerts>
        <fullName>GreenSky_Finance_MA_Work_Complete_Email_LBW</fullName>
        <description>GreenSky Finance - MA Work Complete Email - LBW.</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>leadstreamsupport@web.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/GreenSky_Finance_MA_Work_Complete_Email_LBW</template>
    </alerts>
    <alerts>
        <fullName>Greenskye_Sales_Lab_Alert</fullName>
        <ccEmails>GreenSkyReferral@yodle.com</ccEmails>
        <description>Greenskye Sales Lab Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>jrozenblat@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Agent_Emails_Local_Pooled/GreenSky_Email_Lead_for_Sales_Team</template>
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
        <fullName>JCI_Issue_Tracker</fullName>
        <description>JCI Issue Tracker Notice to Melissa Lidey</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/JCI_Issue_Tracker_Notice_to_Melissa_Lidey</template>
    </alerts>
    <alerts>
        <fullName>LBW_CSC_Survey</fullName>
        <description>LBW CSC Survey</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>leadstreamsupport@web.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/CSC_Survey_LBW</template>
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
            <recipient>alewis@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dcambouris@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jamartini@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mstaffieri@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ta.stanton@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>treece@yodle.com</recipient>
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
            <recipient>crystal.bellew@yodle.com</recipient>
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
        <fullName>LSFS_Onboarding_Notification</fullName>
        <description>LSFS Onboarding Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>leadstreamsupport@web.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lead_Stream_Templates/LSFS_Onboarding_Calls_Notification</template>
    </alerts>
    <alerts>
        <fullName>LSFS_Performance_Call_Complete_Notification</fullName>
        <description>LSFS Performance Call Complete Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>leadstreamsupport@web.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lead_Stream_Templates/LSFS_Performance_Calls_Notification</template>
    </alerts>
    <alerts>
        <fullName>Lighthouse_Business_Customization_Form_Auto</fullName>
        <description>Lighhouse Business Customization Form - Auto</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Business_Customization_Form_BCF_Auto</template>
    </alerts>
    <alerts>
        <fullName>Lighthouse_Business_Customization_Form_Chiro</fullName>
        <description>Lighhouse Business Customization Form - Chiro</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>medicalsupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Business_Customization_Form_BCF_Chiro</template>
    </alerts>
    <alerts>
        <fullName>Lighthouse_Business_Customization_Form_Dental</fullName>
        <description>Lighhouse Business Customization Form - Dental</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Business_Customization_Form_BCF_Dental</template>
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
        <fullName>Lighthouse_Site_Listing_Teardown_owner_email_alert</fullName>
        <description>LH Master Needs Your Attention to Adam Stanton</description>
        <protected>false</protected>
        <recipients>
            <recipient>ta.stanton@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/LH_Master_Site_Listing_Teardown</template>
    </alerts>
    <alerts>
        <fullName>NCS_AutoLaunch_to_Sales</fullName>
        <description>NCS Case Escalation Notification to Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/new_client_setup_sales</template>
    </alerts>
    <alerts>
        <fullName>New_Greenskymerchant_web_com_email_sent</fullName>
        <description>New Greenskymerchant@web.com email sent</description>
        <protected>false</protected>
        <recipients>
            <recipient>jrozenblat@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>slavin@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/New_GreenSkyMerchant_Web_com_Case</template>
    </alerts>
    <alerts>
        <fullName>New_TORCHx_CSC_Case_Created</fullName>
        <description>New TORCHx CSC Case Created</description>
        <protected>false</protected>
        <recipients>
            <recipient>TORCHx_CSC_Email_Alerts</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/TORCHx_New_CSC_Case_Create</template>
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
        <fullName>Notify_reporting_case_updated</fullName>
        <description>Notify reporting case updated</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/CASE_Reporting_case_updated_information</template>
    </alerts>
    <alerts>
        <fullName>Organic_Search_Influence_Work_Completed</fullName>
        <description>Organic - Search Influence Work Completed</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Search_Influence</template>
    </alerts>
    <alerts>
        <fullName>PES_team_escalation</fullName>
        <ccEmails>psescalation@yodle.com</ccEmails>
        <description>PES team escalation</description>
        <protected>false</protected>
        <recipients>
            <recipient>bpekarek@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>christine.bergman@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mswiader@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shannon.doherty@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Escalation_Standard_Email</template>
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
        <fullName>Relationship_auto_fire_drill_email</fullName>
        <description>YBN Relationship auto fire drill email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Sales_Manager__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>iitenberg@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.hendrickson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mmachado@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>Rogers_QA_Assigned_Anna</fullName>
        <ccEmails>aburleigh@rogersoutrank.com</ccEmails>
        <description>Rogers QA Assigned Anna</description>
        <protected>false</protected>
        <senderAddress>rogerssupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Email_Templates/Rogers_QA_Assigned</template>
    </alerts>
    <alerts>
        <fullName>Rogers_QA_Assigned_Ashlee</fullName>
        <ccEmails>awallace@rogersoutrank.com</ccEmails>
        <description>Rogers QA Assigned Ashlee</description>
        <protected>false</protected>
        <senderAddress>rogerssupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Email_Templates/Rogers_QA_Assigned</template>
    </alerts>
    <alerts>
        <fullName>Rogers_QA_Assigned_Julie</fullName>
        <ccEmails>jwojteczko@rogersoutrank.com</ccEmails>
        <description>Rogers QA Assigned Julie</description>
        <protected>false</protected>
        <senderAddress>rogerssupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Email_Templates/Rogers_QA_Assigned</template>
    </alerts>
    <alerts>
        <fullName>Rogers_Sales_Wizard_Issue</fullName>
        <ccEmails>qualityassurance@rogersoutrank.com</ccEmails>
        <description>Rogers Sales Wizard Issue</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Partner_Rep_E_mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>rogerssupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Email_Templates/Rogers_Sales_Wizard_Incomplete</template>
    </alerts>
    <alerts>
        <fullName>SEM_Escalated_To_Berry</fullName>
        <ccEmails>yodle-escalations@theberrycompany.com</ccEmails>
        <description>Berry NCS, Escalated to Berry</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Email_Templates/SEM_Escalation</template>
    </alerts>
    <alerts>
        <fullName>SEM_Initial_Req_Fulfilled</fullName>
        <description>Berry NCS Initial Req Fulfilled</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Email_Templates/SEM_Berry_Website_Only</template>
    </alerts>
    <alerts>
        <fullName>SEM_New_Client_Launched</fullName>
        <ccEmails>yodle-sitelaunches@theberrycompany.com</ccEmails>
        <description>Berry New Launch</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Email_Templates/SEM_New_Client_Launched</template>
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
        <senderAddress>customercare@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/SEM_Upsell</template>
    </alerts>
    <alerts>
        <fullName>SOW_approved_Ready_to_create_Strategy_Document</fullName>
        <description>SOW approved: Ready to create Strategy Document</description>
        <protected>false</protected>
        <recipients>
            <recipient>amarco@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Strategy_Document_Ready_for_Creation</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_to_LHFS_Reps_for_Yodle_Gold</fullName>
        <description>Send Email to LHFS Reps for Yodle Gold</description>
        <protected>false</protected>
        <recipients>
            <recipient>kday@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tdube@yodle.com</recipient>
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
            <recipient>crystal.bellew@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>klewis@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Lighthouse_Gold_Service_Notification</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_to_Yodle_Gold_Email_Manager</fullName>
        <description>Send Email to Yodle Gold Email Manager</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep_E_mail_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>yodlegoldservice@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Yodle_Gold_Service_Manager_Email</template>
    </alerts>
    <alerts>
        <fullName>Surveys_Issue_Res_Updated_May_3_16</fullName>
        <description>Issue Resolution Survey Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>kentwarren@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Issue_Resolution_May_2016</template>
    </alerts>
    <alerts>
        <fullName>TORCHx_CSC_Proactive_Touch_Email_to_Owner_Email_Alert</fullName>
        <description>TORCHx CSC/Proactive Touch Email to Owner - Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@torchx.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/TORCHx_Notify_Owner_of_New_Email</template>
    </alerts>
    <alerts>
        <fullName>TORCHx_Escalation_Case</fullName>
        <description>TORCHx Escalation Case</description>
        <protected>false</protected>
        <recipients>
            <recipient>TORCHx_Escalations</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Escalation_Standard_Email</template>
    </alerts>
    <alerts>
        <fullName>TORCHx_Issue_Resolution_Survey_Email_Alert</fullName>
        <description>TORCHx Issue Resolution Survey Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>kentwarren@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/TORCHx_Issue_Resolution</template>
    </alerts>
    <alerts>
        <fullName>TORCHx_NCS_Email_to_Owner_Email_Alert</fullName>
        <ccEmails>support@torchx.com</ccEmails>
        <description>TORCHx NCS Email to Owner - Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@torchx.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/TORCHx_NCS_Email</template>
    </alerts>
    <alerts>
        <fullName>TORCHx_Outbound_Time_Rescheduled_to_Today</fullName>
        <description>TORCHx Outbound Time Rescheduled to Today</description>
        <protected>false</protected>
        <recipients>
            <recipient>TORCHx_CSC_Email_Alerts</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/TORCHx_Outbound_Case_rescheduled_to_today</template>
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
        <fullName>WBN_NCS_Case_Status_Has_Not_Changed</fullName>
        <description>WBN - NCS - Case Status Has Not Changed</description>
        <protected>false</protected>
        <recipients>
            <field>Owner_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>WBN_Templates/WBN_NCS_Status_Has_Not_Changed</template>
    </alerts>
    <alerts>
        <fullName>WBN_NCS_Never_Launch</fullName>
        <description>WBN - NCS - Never Launch</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>no-reply@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>WBN_Templates/WBN_NCS_Never_Launched</template>
    </alerts>
    <alerts>
        <fullName>WBN_NCS_Notify_Ownership_needs_changing</fullName>
        <description>WBN - NCS - Ownership needs changing</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>no-reply@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>WBN_Templates/WBN_NCS_Change_Ownership</template>
    </alerts>
    <alerts>
        <fullName>WBN_NCS_On_Hold_Next_Action_Date_Past</fullName>
        <description>WBN - NCS - On Hold - Next Action Date Past</description>
        <protected>false</protected>
        <recipients>
            <field>Owner_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>no-reply@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>WBN_Templates/WBN_NCS_Next_Action_Date_Past</template>
    </alerts>
    <alerts>
        <fullName>WBN_NCS_Requested_Launch_Date</fullName>
        <description>WBN - NCS - Requested Launch Date</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>no-reply@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>WBN_Templates/WBN_NCS_Launch_Date_Approaching</template>
    </alerts>
    <alerts>
        <fullName>WBN_NCS_Status_Change_issues</fullName>
        <description>WBN - NCS - Status Change (issues)</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>no-reply@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>WBN_Templates/WBN_NCS_Status_Changes</template>
    </alerts>
    <alerts>
        <fullName>Web_Dev_Escalated</fullName>
        <ccEmails>webdevescalation@yodle.com</ccEmails>
        <description>Web Dev Escalated</description>
        <protected>false</protected>
        <recipients>
            <recipient>mswiader@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scornwall@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Client_Services_Mgr__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Escalation_Standard_Email</template>
    </alerts>
    <alerts>
        <fullName>Web_To_Case</fullName>
        <description>Web To Case</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Web_To_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN</fullName>
        <description>YBN: Notify Consultant Managers when Case Owner = National Client Support</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Notify_Consultant_Managers_when_Case_Owner_National_Client_Support</template>
    </alerts>
    <alerts>
        <fullName>YBN_1500_Refund_Approval_Request_Case_Assigned</fullName>
        <description>YBN 1500+ Refund or Credit Approval Request Case Assigned</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_East_Coast_A</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_West_Coast</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>alex.cuevas@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cmcdowell@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>iitenberg@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/New_1500_Refund_Approval_Request_Case_In_The_Queue</template>
    </alerts>
    <alerts>
        <fullName>YBN_500_Refund_Approval_Request_Case_Assigned</fullName>
        <description>YBN &lt;= 500 Credit or Refund Case</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Refund_or_Credit_Request_Submitted</template>
    </alerts>
    <alerts>
        <fullName>YBN_Billing_Case_Assigned</fullName>
        <description>YBN Billing Case Assigned</description>
        <protected>false</protected>
        <recipients>
            <recipient>alisha.balkarran@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ejoseph@web.com.yodle</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.fucaloro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>marthur@web.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nluong@web.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>reid.beck@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Billing_Case_Alert</template>
    </alerts>
    <alerts>
        <fullName>YBN_Credit_or_Refund_Approval_Email</fullName>
        <description>YBN Credit or Refund Approval Email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Refund_or_Credit_Approval</template>
    </alerts>
    <alerts>
        <fullName>YBN_Credit_or_Refund_Denied_Email</fullName>
        <description>YBN Credit or Refund Denied Email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Refund_or_Credit_Denied</template>
    </alerts>
    <alerts>
        <fullName>YBN_Credit_or_Refund_between_501_1500_Created</fullName>
        <description>YBN Credit or Refund between $501-$1500 Created</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>cmcdowell@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Refund_or_Credit_Request_Submitted</template>
    </alerts>
    <alerts>
        <fullName>YBN_Es</fullName>
        <description>YBN Master: Escalated Performance Reporting</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>aspinelli@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>bonny.evans@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>natalie.flynn@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Escalated_Email_Marketing_Client_Qualification</fullName>
        <description>YBN: Escalated Email Marketing Client Qualification</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Customer_Success_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Fire_Drill_Email_Marketing_Client_Qualification</fullName>
        <description>YBN: Fire Drill Email Marketing Client Qualification</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Customer_Success_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Fire_Drill_Escalated_Custom_Implementation</fullName>
        <description>YBN Master: Fire Drill Custom Implementation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>jwilder@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sjones@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Franchisee_Issue_Resolved_Director</fullName>
        <description>YBN: Franchisee Issue Resolved (Director)</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>thess@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Issue_Resolved</template>
    </alerts>
    <alerts>
        <fullName>YBN_Franchisee_Issue_Resolved_Manager</fullName>
        <description>YBN: Franchisee Issue Resolved (Manager)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Issue_Resolved</template>
    </alerts>
    <alerts>
        <fullName>YBN_Franchisee_Issue_Resolved_VP</fullName>
        <description>YBN: Franchisee Issue Resolved (VP)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Issue_Resolved</template>
    </alerts>
    <alerts>
        <fullName>YBN_Franchisee_Issue_Submitted_Director</fullName>
        <description>YBN: Franchisee Issue Submitted (Director)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Submission</template>
    </alerts>
    <alerts>
        <fullName>YBN_Franchisee_Issue_Submitted_Manager</fullName>
        <description>YBN: Franchisee Issue Submitted (Manager)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Submission</template>
    </alerts>
    <alerts>
        <fullName>YBN_Franchisee_Issue_Submitted_VP</fullName>
        <description>YBN: Franchisee Issue Submitted (VP)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Submission</template>
    </alerts>
    <alerts>
        <fullName>YBN_Issue_Resolution_Survey_Email</fullName>
        <description>YBN: Issue Resolution Survey Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Survey_Emails/WBN_Issue_Resolution_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>YBN_Margin_Change_Request_Approved</fullName>
        <description>YBN Margin Change Request Approved</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Margin_Change_Request_Approved</template>
    </alerts>
    <alerts>
        <fullName>YBN_Margin_Change_Request_Denied</fullName>
        <description>YBN Margin Change Request Denied</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Margin_Change_Request_Denied</template>
    </alerts>
    <alerts>
        <fullName>YBN_Margin_Change_Request_Submitted_for_approval</fullName>
        <description>YBN Margin Change Request Submitted for approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>iitenberg@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/VP_Approval_Needed_Margin_Change</template>
    </alerts>
    <alerts>
        <fullName>YBN_Marketing_Case_Assigned</fullName>
        <description>YBN Marketing Case Assigned</description>
        <protected>false</protected>
        <recipients>
            <recipient>alex.odell@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>amanda.brief@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kassidy.keller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Marketing_Case_Alert</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_1500_Refund</fullName>
        <description>YBN Master: Escalated $1500+ Refund</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Sales_Manager__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_500_Refund</fullName>
        <description>YBN Master: Escalated &lt;=$500 Refund</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_501_1500_Refund</fullName>
        <description>YBN Master: Escalated $501-$1500 Refund</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_Acct_Not_Launched</fullName>
        <description>YBN Master: Escalated Acct Not Launched</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_Billing</fullName>
        <description>YBN Master: Escalated Billing</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>alisha.balkarran@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.fucaloro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>reid.beck@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_Custom_Implementation</fullName>
        <description>YBN Master: Escalated Custom Implementation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>jwilder@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sjones@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_Franchisee_Issue</fullName>
        <description>YBN Master: Escalated Franchisee Issue</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_IL_budget_estimates</fullName>
        <description>YBN Master: Escalated IL budget estimates</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>anderson.allen@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jlawson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_Margin_Request</fullName>
        <description>YBN Master: Escalated Margin Request</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_Marketing</fullName>
        <description>YBN Master: Escalated Marketing</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>alex.odell@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>amanda.brief@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>codonnell@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kassidy.keller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_Organic_Ops</fullName>
        <description>YBN Master: Escalated Organic Ops</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>anderson.allen@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jlawson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matt.austin@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_Organic_Strategy</fullName>
        <description>YBN Master: Escalated Organic Strategy</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_PES_Team</fullName>
        <ccEmails>psescalation@yodle.com</ccEmails>
        <description>YBN Master: Escalated PES Team</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>bpekarek@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>christine.bergman@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mswiader@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shannon.doherty@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_SEO_Lead_Estimates</fullName>
        <description>YBN Master: Escalated SEO Lead Estimates</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_SF_Bulk_Setup_Update</fullName>
        <description>YBN Master: Escalated SF Bulk Setup/Update</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Sales_Manager__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_SF_YL_Bulk_Setup_Update</fullName>
        <ccEmails>psescalation@yodle.com</ccEmails>
        <description>YBN Master: Escalated SF + YL Bulk Setup/Update</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>christine.bergman@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_SOW</fullName>
        <description>YBN Master: Escalated SOW</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>aelkin@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jwilder@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_Staffing_Service_Concerns</fullName>
        <description>YBN Master: Escalated Relationship Issue (General)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_YL_Bulk_Setup_Update</fullName>
        <ccEmails>psescalation@yodle.com</ccEmails>
        <description>YBN Master: Escalated YL Bulk Setup/Update</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>christine.bergman@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Escalated_relationship_budgets_ROI_calc</fullName>
        <description>YBN Master: Escalated relationship budgets &amp; ROI calc</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Acct_Not_Launched</fullName>
        <description>YBN Master: Fire Drill Acct Not Launched</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Billing</fullName>
        <description>YBN Master: Fire Drill Billing</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>alisha.balkarran@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>iitenberg@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.fucaloro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Franchisee_Issue</fullName>
        <description>YBN Master: Fire Drill Franchisee Issue</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Sales_Manager__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_East_Coast_A</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_West_Coast</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Sales_Director_Manager_East_Coast_B</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_IL_budget_estimates</fullName>
        <description>YBN Master: Fire Drill IL budget estimates</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Director_Product_Performance</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>anderson.allen@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jlawson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Margin_Request</fullName>
        <description>YBN Master: Fire Drill Margin Request</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Marketing</fullName>
        <description>YBN Master: Fire Drill Marketing</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>codonnell@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mcarlough@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Organic_Ops</fullName>
        <description>YBN Master: Fire Drill Organic Ops</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Director_Product_Performance</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>anderson.allen@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jlawson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matt.austin@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Organic_Strategy</fullName>
        <description>YBN Master: Fire Drill Organic Strategy</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Director_Product_Performance</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_PES_Team</fullName>
        <description>YBN Master: Fire Drill PES Team</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>christine.bergman@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Refund</fullName>
        <description>YBN Master: Fire Drill Refund</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_SEO_Lead_Estimates</fullName>
        <description>YBN Master: Fire Drill SEO Lead Estimates</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Director_Product_Performance</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_SF_Bulk_Setup_Update</fullName>
        <description>YBN Master: Fire Drill SF Bulk Setup/Update</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_SF_YL_Bulk_Setup_Update</fullName>
        <description>YBN Master: Fire Drill SF + YL Bulk Setup/Update</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>christine.bergman@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_SOW</fullName>
        <description>YBN Master: Fire Drill SOW</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>aelkin@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jwilder@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Staffing_Service_Concerns</fullName>
        <description>YBN Master: Fire Drill Relationship Issue (General)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Sales_Manager__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_East_Coast_A</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_West_Coast</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Sales_Director_Manager_East_Coast_B</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_Taxonomy</fullName>
        <description>YBN Master: Fire Drill Taxonomy</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>becky.ochs@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jcarpenter@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_YL_Bulk_Setup_Update</fullName>
        <description>YBN Master: Fire Drill YL Bulk Setup/Update</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>christine.bergman@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Fire_Drill_relationship_budgets_ROI_calc</fullName>
        <description>YBN Master: Fire Drill relationship budgets &amp; ROI calc</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Director_Product_Performance</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill</template>
    </alerts>
    <alerts>
        <fullName>YBN_Master_Taxonomy_Escalated</fullName>
        <description>YBN Master: Taxonomy Escalated</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Case_Creator_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>becky.ochs@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jcarpenter@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Escalated_Case</template>
    </alerts>
    <alerts>
        <fullName>YBN_New_Case_In_VP_Approval_Queue</fullName>
        <description>YBN: New Case In VP Approval Queue</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>ami.dave@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dshapiro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>iitenberg@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/VP_Approval_Needed_Credit_Refund</template>
    </alerts>
    <alerts>
        <fullName>YBN_Non_Escalation_Path_Issue_Resolved</fullName>
        <description>YBN: Non-Escalation Path Issue Resolved</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Issue_Resolved</template>
    </alerts>
    <alerts>
        <fullName>YBN_Relationship_Budget_Estimates_Completed</fullName>
        <description>YBN Relationship Budget Estimates Completed</description>
        <protected>false</protected>
        <recipients>
            <recipient>ryan.ciampi@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Relationship_Budget_Estimates_Completed</template>
    </alerts>
    <alerts>
        <fullName>YBN_Relationship_Issue_Resolved_Director</fullName>
        <description>YBN: Relationship Issue Resolved (Director)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_East_Coast_A</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_West_Coast</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Sales_Director_Manager_East_Coast_B</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Issue_Resolved</template>
    </alerts>
    <alerts>
        <fullName>YBN_Relationship_Issue_Resolved_Manager</fullName>
        <description>YBN: Relationship Issue Resolved (Manager)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Issue_Resolved</template>
    </alerts>
    <alerts>
        <fullName>YBN_Relationship_Issue_Resolved_VP</fullName>
        <description>YBN: Relationship Issue Resolved (VP)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_East_Coast_A</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_West_Coast</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Sales_Director_Manager_East_Coast_B</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Issue_Resolved</template>
    </alerts>
    <alerts>
        <fullName>YBN_Relationship_Issue_Submitted_Director</fullName>
        <description>YBN: Relationship Issue Submitted (Director)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_East_Coast_A</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_West_Coast</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Sales_Director_Manager_East_Coast_B</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Submission</template>
    </alerts>
    <alerts>
        <fullName>YBN_Relationship_Issue_Submitted_Manager</fullName>
        <description>YBN: Relationship Issue Submitted (Manager)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Submission</template>
    </alerts>
    <alerts>
        <fullName>YBN_Relationship_Issue_Submitted_VP</fullName>
        <description>YBN: Relationship Issue Submitted (VP)</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Account_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SD_Geo_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_East_Coast_A</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Area_VP_of_Sales_West_Coast</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Sales_Director_Manager_East_Coast_B</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Escalation_Path_Submission</template>
    </alerts>
    <alerts>
        <fullName>YBN_Send_Issue_Resolution_Survey_To_Spoke_To</fullName>
        <description>YBN: Send Issue Resolution Survey To Spoke To</description>
        <protected>false</protected>
        <recipients>
            <field>Spoke_To_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>mbrevig@web.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/WBN_Issue_Resolution_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>YBN_Send_Issue_Resolution_Survey_To_Web_Email</fullName>
        <description>YBN: Send Issue Resolution Survey To Web Email</description>
        <protected>false</protected>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>mbrevig@web.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/WBN_Issue_Resolution_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>YBN_Send_Notification_Of_Budget_Change</fullName>
        <description>YBN: Send Notification Of Budget Change</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Notify_Budget_Update_Due</template>
    </alerts>
    <alerts>
        <fullName>YBN_YBN_Request_Case_Closed_Notify_SE</fullName>
        <description>YBN: YBN Request Case Closed - Notify SE</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_YBN_Request_From_SE</template>
    </alerts>
    <alerts>
        <fullName>YBN_case_creator_to_alert_them_additional_analysis_for_zip_codes_is_required</fullName>
        <description>YBN - case creator to alert them additional analysis for zip codes is required</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_extended_sla_for_performance_estimates</template>
    </alerts>
    <alerts>
        <fullName>YBN_new_case_comment_email_alert</fullName>
        <description>YBN new case comment email alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_new_case_comment</template>
    </alerts>
    <alerts>
        <fullName>YBN_perforamnce_estimtes_email_alert</fullName>
        <description>YBN perforamnce estimtes email alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Estimates_Needed</template>
    </alerts>
    <alerts>
        <fullName>budget_decrease_closed_case_email_to_contact</fullName>
        <description>budget decrease - closed case email to contact</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>contracts/Completed_Budget_Change_Email</template>
    </alerts>
    <alerts>
        <fullName>notify_AD_when_status_of_custom_implementation_quote_moves_to_in_progress</fullName>
        <description>YBN notify AD when status of custom implementation quote moves to in progress</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_custom_implementation_quote</template>
    </alerts>
    <alerts>
        <fullName>ybn_email_lead_analyst</fullName>
        <description>ybn - email lead analyst</description>
        <protected>false</protected>
        <recipients>
            <field>Lead_Analyst__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Estimate_Alert</template>
    </alerts>
    <alerts>
        <fullName>ybn_ncs_case_not_touched_in_at_least_four_days</fullName>
        <description>ybn - ncs case not touched in at least four days</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>cbolton@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kristen.krzesicki@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mpagonas@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>National_Templates/NCS_Case_Not_Touched_in_4_days</template>
    </alerts>
    <alerts>
        <fullName>YBN_SOW_Denied</fullName>
        <description>YBN SOW Denied</description>
        <protected>false</protected>
        <recipients>
            <recipient>SOW_Denial_Alert</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_SOW_Not_Approved</template>
    </alerts>
    <alerts>
        <fullName>YBN_SOW_Email_Alert</fullName>
        <description>YBN SOW Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>SOW_Submission_Alert</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_SOW_Submission</template>
    </alerts>
    <alerts>
        <fullName>YBN_SOW_approved_Email_Alert</fullName>
        <description>YBN SOW approved Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>SOW_Approval_Alert</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_SOW_Approved</template>
    </alerts>
    <alerts>
        <fullName>Escalated_National_Analyst</fullName>
        <description>Escalated National Analyst</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Organic_Escalations</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>shawna.kays@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Client_Services_Mgr__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Escalation_Standard_Email</template>
    </alerts>
    <alerts>
        <fullName>NCS_case_notify_owner_on_Status_change</fullName>
        <description>NCS case notify owner on Status change</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/NCS_case_notify_owner_on_Status_change</template>
    </alerts>
    <alerts>
        <fullName>TORCHx_Optimization_case_Status_notification_to_Client</fullName>
        <description>TORCHx Optimization case notify Client when the performance team completes/closes the Optimization Case</description>
        <protected>false</protected>
        <recipients>
            <field>client_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@torchx.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>TorchX_Onboarding_Engagement_Test/TORCHx_Service_Performance_Request_Completed</template>
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
        <fullName>Assign_to_AutoTP_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>YBN_AutoTP_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to AutoTP Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Bryan_Heckler</fullName>
        <description>H2 Escalation cases should assign to Bryan Heckler</description>
        <field>OwnerId</field>
        <lookupValue>bheckler@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Case - Owner to Bryan Heckler</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Client_Update_Queu</fullName>
        <field>OwnerId</field>
        <lookupValue>Client_Update_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to Client Update Queu</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Jennifer_Carpenter</fullName>
        <description>Case Reason = Taxonomy; Reason Detail = Global Content Review; assign to Marketing Ops (formerly Marissa Gelardi/Maurie Backman)</description>
        <field>OwnerId</field>
        <lookupValue>MarketingOps</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Marketing Ops</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Local_Email_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Local_Email_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to Local Email Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Makenzie_Cunningham</fullName>
        <field>OwnerId</field>
        <lookupValue>makenzie.cunningham@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign to Makenzie Cunningham</name>
        <notifyAssignee>true</notifyAssignee>
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
        <fullName>Assign_to_TORCHx_Post_Launch_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>TORCHx_Post_Launch_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to TORCHx Post Launch Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assigned_to_Vendor_Date</fullName>
        <field>Assigned_to_Vendor_Date__c</field>
        <formula>Today()</formula>
        <name>Case - Assign to Vendor Date Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Attempt_Date_1_Now</fullName>
        <field>Attempt_Date_1__c</field>
        <formula>NOW()</formula>
        <name>Attempt Date 1 -&gt; Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Attempt_Result_No_Answer</fullName>
        <field>Resolution_Attempt_Status_1__c</field>
        <literalValue>No answer</literalValue>
        <name>Attempt Result -&gt; No Answer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
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
        <fullName>AutoLaunch_NCS_Adversite_Pro_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>AutoLaunchQueue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Auto Launch Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Berry_Account_Manager_Email</fullName>
        <field>Berry_Account_Manager_Email__c</field>
        <formula>Account.Berry_Account_Manager_Email__c</formula>
        <name>Berry Account Manager Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Berry_Escalations_Update_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>support@berrylocalleads.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Case Owner to Berry Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Berry_Web_to_Case_Change_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>Berry_Support</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Berry Web to Case Change Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Business_Address_Fill_In</fullName>
        <field>Business_Address__c</field>
        <formula>Account.BillingStreet &amp; BR() &amp;  Account.BillingCity &amp; ", " &amp; Account.BillingState &amp; " "&amp; Account.BillingPostalCode</formula>
        <name>Business Address Fill-In</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CSC_Survey_E_mail_Sent_True</fullName>
        <field>CSC_Survey_E_mail_Sent__c</field>
        <literalValue>1</literalValue>
        <name>CSC Survey E-mail Sent True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
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
        <fullName>Case_Outbound_Call_Subject</fullName>
        <field>Subject</field>
        <formula>text(Reason)&amp;" - "&amp; Client_ID__c</formula>
        <name>Case - Outbound Call Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_LH_Support_Sugar_Hill</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Support_Sugar_Hill</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner LH Support Sugar Hill</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Implementation_Specialist</fullName>
        <field>OwnerId</field>
        <lookupValue>Implementation_Specialist_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Implementation Specialist</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_JCI_Outbound</fullName>
        <field>OwnerId</field>
        <lookupValue>JCI_Outbound</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to JCI Outbound</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Kyle_Zaffin</fullName>
        <description>Updates Case Owner to Kyle Zaffin</description>
        <field>OwnerId</field>
        <lookupValue>kzaffin@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Case Owner to Kyle Zaffin</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_LH_CSC</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Training</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to LH CSC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
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
        <fullName>Case_Owner_to_LH_Marketing_Associates</fullName>
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
        <fullName>Case_Owner_to_Local_Email_Queue</fullName>
        <description>Sets Owner to the Local Email Queue</description>
        <field>OwnerId</field>
        <lookupValue>Local_Email_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Local Email Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Pooled</fullName>
        <description>Case owner changed to queue: Rogers Pooled Inbound Inquiries</description>
        <field>OwnerId</field>
        <lookupValue>Rogers_Support</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Rogers Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Post_Launch_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>PostLaunchAssociateQueue275821</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Post Launch Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Quality_Team_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>QualityTeam295311</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Quality Team Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Shannon_Vaughn</fullName>
        <field>OwnerId</field>
        <lookupValue>shannon.vaughn@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Case Owner to Shannon Vaughn</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Sophie_Lavin</fullName>
        <field>OwnerId</field>
        <lookupValue>anne.fulton@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Case Owner to Anne Marie Fulton</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Touch_Plan_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Outbound_Touch</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Outbound Touch Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Owner_to_Tricia_Valadez</fullName>
        <field>OwnerId</field>
        <lookupValue>tricia.valadez@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Case Owner to Tricia Valadez</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Populate_Owner_Manager_Email</fullName>
        <field>Owner_Manager_Email__c</field>
        <formula>Owner:User.Manager.Email</formula>
        <name>Case - Populate Owner Manager Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Case_Reason_ViaMedia_Assignment</fullName>
        <field>OwnerId</field>
        <lookupValue>stephanie.verdusco@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Case Owner to Stephanie Smith</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
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
        <fullName>Case_Reason_to_Rogers_Inbound_Inquiry</fullName>
        <field>Reason</field>
        <literalValue>Rogers Inbound Inquiry</literalValue>
        <name>Case Reason to Rogers Inbound Inquiry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Record_Type_YBN_Inbound_Inquiry</fullName>
        <field>RecordTypeId</field>
        <lookupValue>YBN_Inbound_Inquiry</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Case Record Type -&gt; YBN Inbound Inquiry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
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
        <fullName>Case_Stopped_False</fullName>
        <field>IsStopped</field>
        <literalValue>0</literalValue>
        <name>Case - Stopped -&gt; False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Stopped_True</fullName>
        <field>IsStopped</field>
        <literalValue>1</literalValue>
        <name>Case - Stopped -&gt; True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_TORCHx_NCS_Autolaunch_Subject</fullName>
        <field>Subject</field>
        <formula>"New TORCHx NCS Case"</formula>
        <name>Case - TORCHx NCS Autolaunch Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_TORCHx_NCS_Record_Type_Change</fullName>
        <field>RecordTypeId</field>
        <lookupValue>TORCHx_NCS_AutoLaunch</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Case - TORCHx NCS Record Type Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Case_Owner_to_Berry_Email_Queue</fullName>
        <description>Add Case to Berry Email Queue</description>
        <field>OwnerId</field>
        <lookupValue>Berry_Email_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Change Case Owner to Berry Email Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Channel_Type_to_Partner</fullName>
        <field>Channel_Type__c</field>
        <literalValue>Partner</literalValue>
        <name>Channel Type to Partner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Charge_Failure_Case_Reason</fullName>
        <field>Reason</field>
        <literalValue>Charge Failure</literalValue>
        <name>Case Reason to Charge Failure</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Charge_Failure_Case_Resolution_1</fullName>
        <field>Resolution_Attempt_Status__c</field>
        <literalValue>Completed Attempt 1</literalValue>
        <name>Charge Failure Case - Resolution 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Charge_Failure_Case_Resolution_2</fullName>
        <field>Resolution_Attempt_Status__c</field>
        <literalValue>Completed Attempt 2</literalValue>
        <name>Charge Failure Case - Resolution 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Charge_Failure_Case_Resolution_3</fullName>
        <field>Resolution_Attempt_Status__c</field>
        <literalValue>Completed Attempt 3</literalValue>
        <name>Charge Failure Case - Resolution 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Charge_Failure_Subject</fullName>
        <field>Subject</field>
        <formula>"Charge Failure"</formula>
        <name>Subject to Charge Failure</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Check_firedrill_box</fullName>
        <field>Fire_drill__c</field>
        <literalValue>1</literalValue>
        <name>Check firedrill box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
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
        <fullName>Client_Email_Fill_In_JCI_Email</fullName>
        <field>client_email__c</field>
        <formula>Account.X2013_JCI_Dealer_Email__c</formula>
        <name>Client Email Fill In (JCI Email)</name>
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
        <fullName>Date_Left_SEM_Ops</fullName>
        <field>Date_Left_SEM_Ops__c</field>
        <formula>Now()</formula>
        <name>Date Left SEM Ops</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Left_Web_Dev_to_Today</fullName>
        <field>Date_Left_Production__c</field>
        <formula>now()</formula>
        <name>Date Left Web Dev to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Left_Web_Dev_to_Today1</fullName>
        <field>Date_Left_Production__c</field>
        <formula>now()</formula>
        <name>(DEL) Date Left Web Dev to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Sent_SEM_OPs</fullName>
        <field>Date_Sent_to_SEM_Ops__c</field>
        <formula>now()</formula>
        <name>Date Sent SEM OPs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Sent_to_Web_Dev_to_Today</fullName>
        <field>Date_Sent_to_Production__c</field>
        <formula>now()</formula>
        <name>Date Sent to Web Dev to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Time_Left_Performance</fullName>
        <field>Date_Time_Left_Performance__c</field>
        <formula>Now()</formula>
        <name>Date/Time Left Performance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Time_Moved_to_Awaiting_Internal_Res</fullName>
        <field>Date_Time_Awaiting_Internal_Response__c</field>
        <formula>NOW()</formula>
        <name>Date/Time Moved to Awaiting Internal Res</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Time_Moved_to_Clarification_Sent</fullName>
        <field>Date_Time_Clarification_Sent__c</field>
        <formula>NOW()</formula>
        <name>Date/Time Moved to Clarification Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Time_Sent_To_Performance</fullName>
        <field>Date_Sent_to_Performance__c</field>
        <formula>NOW()</formula>
        <name>Date/Time Sent To Performance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Email_to_Case_Outrank_Support</fullName>
        <field>OwnerId</field>
        <lookupValue>Rogers_Support</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Email to Rogers Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
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
        <fullName>Inbound_No_Follow_Up_Cancel_Request_Ow</fullName>
        <field>OwnerId</field>
        <lookupValue>RetentionTeam275821</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Retention Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inbound_No_Follow_Up_Website_Change_Re</fullName>
        <field>Reason</field>
        <literalValue>Web Dev Cases</literalValue>
        <name>Case Reason to Web Dev Cases</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inbound_Website_Escalation_Follow_Up_P</fullName>
        <field>Priority</field>
        <literalValue>Escalated</literalValue>
        <name>Priority to Escalated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
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
        <fullName>LBW_60_Day_Call_Script_Update</fullName>
        <field>Link_to_Script__c</field>
        <formula>"https://webdc.my.salesforce.com/articles/Scripts/Leads-by-Web-70-Day-Performance-Call-Path"</formula>
        <name>LBW 60+ Day Call Script Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LBW_Case_Owner_Change</fullName>
        <description>Changes case owner to LBW Customer Service Queue</description>
        <field>OwnerId</field>
        <lookupValue>leadstreamsupport@web.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>LBW Case Owner Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
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
        <fullName>LH_Upsell_Case_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Upsells</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>LH Upsell Case Owner</name>
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
        <fullName>Low_Lead_Warning</fullName>
        <field>Priority</field>
        <literalValue>Major</literalValue>
        <name>Priority to Major</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
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
        <fullName>Master_Call_Answering_Web_Dev</fullName>
        <field>OwnerId</field>
        <lookupValue>mary.kellum@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Case Owner to Sophie Lavin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Move_to_Local_Email_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Local_Email_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Move to Local Email Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NCS_Case_Priority_New_Client</fullName>
        <field>Priority</field>
        <literalValue>New Client</literalValue>
        <name>Priority to New Client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Old_LBW_Content_Case_Subject_Notes</fullName>
        <field>Status_Notes__c</field>
        <formula>"This is a Lead Stream Client see LBW Content Organic Setup case for content."</formula>
        <name>Old LBW Content Case - Subject Notes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Optimization_Case_Status_to_Opt_Status</fullName>
        <field>Optimization_Status__c</field>
        <literalValue>Opt Completed</literalValue>
        <name>Optimization Case Status to Opt Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Optimization_Case_Status_to_Opt_Status_N</fullName>
        <field>Optimization_Status__c</field>
        <literalValue>Opt Not Necessary</literalValue>
        <name>Optimization Case Status to Opt Status N</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Optimization_Status_to_Case_Status_Compl</fullName>
        <field>Status</field>
        <literalValue>Closed - Opt Complete</literalValue>
        <name>Optimization Status to Case Status Compl</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Optimization_Status_to_Case_Status_Opt_N</fullName>
        <field>Status</field>
        <literalValue>Closed - Opt Not Necessary</literalValue>
        <name>Optimization Status to Case Status Opt N</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Organic_Setup_Case_Subject_1</fullName>
        <description>Subject = "YO 2.0 - Organic Setup Search Influence - Rewrite Content"</description>
        <field>Subject</field>
        <formula>"YO 2.0 - Organic Setup Search Influence - Rewrite Content"</formula>
        <name>Subject to YO 2.0 Setup Search Influence</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Organic_Setup_Segment</fullName>
        <field>Segment__c</field>
        <formula>Account.Secondary_Segments__c</formula>
        <name>Segment to Account Secondary Segment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Organic_Setup_Subject</fullName>
        <field>Subject</field>
        <formula>"Website Re-Optimization Case"</formula>
        <name>Subject to Website ReOptimization</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Organic_Setup_Vendor_Completed</fullName>
        <field>Vendor_Completed_Date_Time__c</field>
        <formula>Today()</formula>
        <name>Vendor Completed Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Call_Auto_Close_After_14_days</fullName>
        <field>Status</field>
        <literalValue>Did Not Complete</literalValue>
        <name>Outbound Call - Auto Close After 14 days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Call_Auto_Close_Date_Field_Upda</fullName>
        <field>Auto_Close_Date__c</field>
        <formula>IF( ISNULL(Scheduled_Call__c), TODAY() + 14, DATEVALUE(Scheduled_Call__c) + 14)</formula>
        <name>Outbound Call Auto Close Date Field Upda</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Outrank_Plus_Attempt_3_By</fullName>
        <field>X3rd_Attempt_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>Case - 3rd Attempt By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Outrank_Plus_Attempt_4_By</fullName>
        <field>X4th__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>Case - 4th Attempt By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Touch_1st_Attempt_VM</fullName>
        <field>X1st_Attempt_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>Case - 1st Attempt By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Touch_2nd_Attempt_VM</fullName>
        <field>X2nd_Attempt_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>Case - 2nd Attempt By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Touch_Attempts_Priority_1</fullName>
        <field>Priority</field>
        <literalValue>1 Attempt</literalValue>
        <name>Priority to 1 Attempt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Touch_Attempts_Priority_2</fullName>
        <field>Priority</field>
        <literalValue>2 Attempts</literalValue>
        <name>Priority to 2 Attempts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Touch_Attempts_Priority_3</fullName>
        <field>Priority</field>
        <literalValue>3 Attempts</literalValue>
        <name>Priority to 3 Attempts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Touch_Attempts_Priority_4</fullName>
        <field>Priority</field>
        <literalValue>4 Attempts</literalValue>
        <name>Priority to 4 Attempts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Touch_NCS_Attempt_None_Priori</fullName>
        <field>Priority</field>
        <literalValue>No Attempts</literalValue>
        <name>Priority to No Attempts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outbound_Touch_OR_Bundle_Type</fullName>
        <field>Client_Bundle_Type__c</field>
        <formula>"Outrank Plus"</formula>
        <name>Client Bundle Type to Outrank Plus</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Owner_Updated_to_Berry_VM_Queue</fullName>
        <description>Update the Case Owner to Berry Voicemail Queue</description>
        <field>OwnerId</field>
        <lookupValue>Berry_Voicemail_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Owner Updated to Berry VM Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_Updates_To_Aaron_Woodul</fullName>
        <description>Case Owner field updates to Aaron Woodul</description>
        <field>OwnerId</field>
        <lookupValue>awoodul@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner Updates To Aaron Woodul</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_Updates_To_Beau_Osteros</fullName>
        <field>OwnerId</field>
        <lookupValue>bosteros@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner Updates To Beau Osteros</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_Updates_To_Erik_Vicars</fullName>
        <description>Case Owner field updates to Erik Vicars</description>
        <field>OwnerId</field>
        <lookupValue>erik.vicars@web.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner Updates To Erik Vicars</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_Updates_To_Lynn_Tobias</fullName>
        <description>Case Owner field updates to Lynn Tobias</description>
        <field>OwnerId</field>
        <lookupValue>lynn.tobias@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner Updates To Lynn Tobias</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_Updates_To_Travis_Dube</fullName>
        <description>Case Owner field updates to Travis Dube</description>
        <field>OwnerId</field>
        <lookupValue>tdube@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner Updates To Travis Dube</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_Updates_To_Tricia_Llanas</fullName>
        <description>Case Owner field updates to Aaron Woodul</description>
        <field>OwnerId</field>
        <lookupValue>tricia.valadez@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner Updates To Tricia Llanas</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_to_Kelly_Hall</fullName>
        <field>OwnerId</field>
        <lookupValue>kelly.hall@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner to Kelly Hall</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_to_TORCHx</fullName>
        <field>OwnerId</field>
        <lookupValue>TORCHx_Outbound</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Owner to TORCHx Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Rep_Email_to_Populate</fullName>
        <field>Partner_Rep_E_mail__c</field>
        <formula>Account.Partner_Rep_E_mail__c</formula>
        <name>Partner Rep Email to Populate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ptnr_NCS_Case_Reason</fullName>
        <field>Reason</field>
        <literalValue>New Client Setup</literalValue>
        <name>Case Reason to New Client Setup</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reactive_Outlets_Paused</fullName>
        <field>Subject</field>
        <formula>"Reactive Call Quality Concerns - "&amp; text(Reason_Detail__c)</formula>
        <name>Subject to Reactive Call Quality Concern</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reason_Detail_to_Conf_Call</fullName>
        <field>Reason_Detail__c</field>
        <literalValue>Conf Call</literalValue>
        <name>Reason Detail to Conf Call</name>
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
        <fullName>Reason_detail_default</fullName>
        <field>Reason</field>
        <literalValue>Other/Unknown</literalValue>
        <name>Reason Detail Default</name>
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
        <fullName>Remove_from_SLA</fullName>
        <field>Remove_From_SLA__c</field>
        <literalValue>1</literalValue>
        <name>Remove from SLA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Request_Approved_By_CSD_CSM_True</fullName>
        <field>Request_Approved_By_CSD_CSM__c</field>
        <literalValue>1</literalValue>
        <name>Request Approved By CSD / CSM -&gt; True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rogers_L2_Escalation</fullName>
        <field>L2_Escalation_Date__c</field>
        <formula>Now ()</formula>
        <name>Rogers L2 Escalation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Send_To_IT_Pro</fullName>
        <field>OwnerId</field>
        <lookupValue>IT_Pro_SEO_Optimization</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to IT Pro SEO Optimization</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Cancellation_Date</fullName>
        <field>Rogers_Cancellation_Date__c</field>
        <formula>NOW()</formula>
        <name>Set Cancellation Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Cancellation_Date_For_Post_Cancel_Dt</fullName>
        <field>Rogers_Cancellation_Date__c</field>
        <formula>NOW()</formula>
        <name>Set Cancellation Date For Post Cancel Dt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Status_Needs_2nd_Attempt</fullName>
        <field>Status</field>
        <literalValue>Needs 2nd Attempt</literalValue>
        <name>Status -&gt; Needs 2nd Attempt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
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
        <fullName>Status_to_New</fullName>
        <field>Status</field>
        <literalValue>New</literalValue>
        <name>Status to New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Subject_Line_for_NCS</fullName>
        <field>Subject</field>
        <formula>"New Client Setup Case"</formula>
        <name>Subject to New Client Setup Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>TORCHx_NCS_Email_to_Owner_Uncheck</fullName>
        <field>TORCHx_NCS_Email_Notification__c</field>
        <literalValue>0</literalValue>
        <name>TORCHx NCS Email to Owner - Uncheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TORCHx_NCS_Reschedule_Reassignment</fullName>
        <field>OwnerId</field>
        <lookupValue>TORCHx_Outbound</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>TORCHx NCS Reschedule Reassignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TORCHx_Proactive_Touch_Assignment</fullName>
        <field>OwnerId</field>
        <lookupValue>TORCHx_Outbound</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>TORCHx Proactive Touch Assignment- Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TORCHx_Proactive_Touch_Assignment_IMS</fullName>
        <field>IMS_Rep__c</field>
        <lookupValue>support@torchx.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>TORCHx Proactive Touch Assignment - IMS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Template_Escalation</fullName>
        <field>Escalated__c</field>
        <literalValue>1</literalValue>
        <name>Template Escalation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
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
        <fullName>Uncheck_Cancel_Next_Month</fullName>
        <field>Cancel_Next_Month__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Cancel Next Month</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
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
        <fullName>Update_AutoCloseDate_90_days_post_cancle</fullName>
        <field>Auto_Close_Date__c</field>
        <formula>DATEVALUE(Account.Deactivation_Date__c)+ 90</formula>
        <name>Update AutoCloseDate 90 days post cancle</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_IMS_Rep_LBW_Customer_Service</fullName>
        <field>IMS_Rep__c</field>
        <lookupValue>leadstreamsupport@web.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update Case IMS Rep-LBW Customer Service</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Owner_LBW_Customer_Service</fullName>
        <field>OwnerId</field>
        <lookupValue>leadstreamsupport@web.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update Case Owner - LBW Customer Service</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Reason</fullName>
        <field>Reason</field>
        <literalValue>Touchplan Response</literalValue>
        <name>Case Reason to Touchplan Response</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Reason_Exit</fullName>
        <field>Reason</field>
        <literalValue>Exit Email Response</literalValue>
        <name>Case Reason to Exit Email Response</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Reason_to_Product</fullName>
        <field>Reason</field>
        <literalValue>Product</literalValue>
        <name>Update Case Reason to Product</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Record_Type_To_Master</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Master</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Case Record Type To Master</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Subject</fullName>
        <field>Subject</field>
        <formula>"LH Upsell Email"</formula>
        <name>Update Case Subject</name>
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
        <lookupValue>platinumsupport@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update IMS Rep to Platinum Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner_to_Partner_VM_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Partner_Voicemail_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Owner to Partner VM Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Reason_Detail_to_Upsell</fullName>
        <field>Reason_Detail__c</field>
        <literalValue>Upsell</literalValue>
        <name>Update Reason Detail to Upsell</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
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
        <fullName>Update_Subject_of_Upsell_Lead_Case</fullName>
        <field>Subject</field>
        <formula>"Email Upsell Lead - " + Account.Offer_to_Client__c</formula>
        <name>Update Subject of Upsell Lead Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Update_to_Care_Customer</fullName>
        <field>OwnerId</field>
        <lookupValue>customercare@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update to Care, Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Vivial_Escalated_Detail</fullName>
        <field>Escalated_Detail__c</field>
        <literalValue>Vivial Escalation (non-error)</literalValue>
        <name>Vivial - Escalated Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_Owner_YBN_Production_Specialist</fullName>
        <field>OwnerId</field>
        <lookupValue>YBN_Production_Specialists</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>WBN - Owner -&gt; YBN Production Specialist</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_Partner_Case_RT_set_to_Partner_Inb</fullName>
        <description>For Vivial (Partner) Email-to-Case workflow, correcting recordtype</description>
        <field>RecordTypeId</field>
        <lookupValue>Partner_Inbound_Inquiry</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>WBN Partner - Case RT set to Partner Inb</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
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
        <fullName>Web_Dev_Completed_Date_to_Today</fullName>
        <description>This fills in the date with TODAY</description>
        <field>Web_Dev_Score_for_IMS__c</field>
        <formula>TODAY()</formula>
        <name>Web Dev Completed Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
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
        <fullName>Website_Tier_Approval_checkbox</fullName>
        <description>After being approved by manager, automatically checks off checkbox.</description>
        <field>Manager_Approved_Changes__c</field>
        <literalValue>1</literalValue>
        <name>Manager Approved Changes to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Website_Tier_Mgr_Approve_to_Web_Dev</fullName>
        <field>OwnerId</field>
        <lookupValue>WebDev</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to Web Dev</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Website_Tier_Mgr_Approved_4b</fullName>
        <field>Status</field>
        <literalValue>4b. MPA Website Setup</literalValue>
        <name>Status to 211</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Winback_Subject_Line</fullName>
        <field>Subject</field>
        <formula>"Reactivated by Winback"</formula>
        <name>Winback Subject Line</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X1st_Touch_Attempt_Made_By</fullName>
        <field>X1st_Touch_Attempt_Made_By__c</field>
        <lookupValue>sfsync@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>1st Touch Attempt Made By -&gt;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Auto_TP_Date</fullName>
        <field>Auto_TP_Date__c</field>
        <formula>/*
IF(TODAY()&gt;DATE(YEAR(TODAY()+32), MONTH(TODAY()+32), 1)-14, 
  DATE(YEAR(TODAY()), MONTH(TODAY()+32), 1),
  DATE(YEAR(TODAY()), MONTH(TODAY()), 1)
)
*/
Account.Next_TP_Needed_By__c</formula>
        <name>YBN  - Auto TP Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Case_Owner_to_Michele_Brevig</fullName>
        <field>OwnerId</field>
        <lookupValue>mbrevig@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>YBN: Case Owner to Michele Brevig</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Case_Owner_to_Sarah_Mc</fullName>
        <field>OwnerId</field>
        <lookupValue>sarah.mctate@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>YBN Case Owner to Sarah Mc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Case_Owner_to_Sarah_McMillian</fullName>
        <field>OwnerId</field>
        <lookupValue>nationalclientsupport@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>YBN Case Owner to National Client Suppor</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Case_Owner_to_YBN_Product_Ideas</fullName>
        <field>OwnerId</field>
        <lookupValue>YBN_Product_Ideas</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>YBN Case Owner to YBN Product Ideas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Director_Level_Escalation</fullName>
        <field>Status</field>
        <literalValue>Director Level Escalation</literalValue>
        <name>YBN: Director Level Escalation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Inbound_Subject</fullName>
        <field>Subject</field>
        <formula>Account.Client_ID__c&amp;": "&amp; TEXT(Reason)</formula>
        <name>YBN Inbound Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Manager_Level_Escalation</fullName>
        <field>Status</field>
        <literalValue>Manager Level Escalation</literalValue>
        <name>YBN: Manager Level Escalation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Outbound_TP</fullName>
        <field>Subject</field>
        <formula>Account.Client_ID__c&amp;": "&amp; TEXT(Reason_Detail__c)</formula>
        <name>YBN Outbound TP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_AD_Email</fullName>
        <field>Account_Director_Email__c</field>
        <formula>Account.Account_Director__r.Email</formula>
        <name>YBN Update AD Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_Case_Creator_Manager_Email</fullName>
        <field>Case_Creator_Manager_Email__c</field>
        <formula>CreatedBy.Manager.Email</formula>
        <name>YBN Update Case Creator Manager Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_SD_Email</fullName>
        <field>Sales_Director_Email__c</field>
        <formula>Account.Force_Field_Sales_Director__r.Email</formula>
        <name>YBN Update SD Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_SD_Geo_Email</fullName>
        <field>SD_Geo_Email__c</field>
        <formula>Account.Sales_Director__r.Email</formula>
        <name>YBN Update SD Geo Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_Sale_Manager</fullName>
        <field>Case_Creator_Sales_Manager__c</field>
        <formula>If( Created_by_Role__c="YBN: Sales/Account Director A", "gregg.swensen@yodle.com",
If( Created_by_Role__c="YBN: Sales/Account Director B", "lee.vansluyters@yodle.com",
If( Created_by_Role__c="YBN: Sales/Account Director C", "bheppner@yodle.com",
"")))</formula>
        <name>YBN Update Sale Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
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
        <fullName>YBN_VP_Level_Escalation</fullName>
        <field>Status</field>
        <literalValue>VP Level Escalation</literalValue>
        <name>YBN: VP Level Escalation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_credit_or_refund_approved_update</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>YBN credit or refund approved update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_credit_or_refund_denied_update</fullName>
        <field>Status</field>
        <literalValue>Request Denied</literalValue>
        <name>YBN credit or refund denied update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_sub_status_to_geo_targeting_analysi</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Geo Targeting Analysis</literalValue>
        <name>YBN: sub status to geo targeting analysi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_update_Status_of_Contract</fullName>
        <field>Status</field>
        <literalValue>Internal Review</literalValue>
        <name>YBN update Status of Contract</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_update_case_status_for_sow</fullName>
        <field>Status</field>
        <literalValue>Internal Review</literalValue>
        <name>YBN update case status for sow</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_zip_code_metropage_analysis_need</fullName>
        <field>OwnerId</field>
        <lookupValue>NationalCharlotte</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case Owner to National Performance Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YO_2_0_AutoLaunch_NCS_Client_Hosted</fullName>
        <field>Status</field>
        <literalValue>Website Assessment</literalValue>
        <name>Status to Website Assessment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YO_2_0_AutoLaunch_NCS_Owner_Adversite</fullName>
        <field>Status</field>
        <literalValue>1-MA Setup AutoLaunch</literalValue>
        <name>Status to 1-MA Setup AutoLaunch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YO_2_0_AutoLaunch_NCS_Status_Mirror</fullName>
        <field>Status</field>
        <literalValue>1-Web Dev AutoLaunch</literalValue>
        <name>Status to 1-Web Dev AutoLaunch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>budget_difference_renewals_upsells</fullName>
        <field>Design_Fee__c</field>
        <formula>Budget__c - Old_Budget__c</formula>
        <name>Design Fee to Budget minus Budget</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>description_client_id</fullName>
        <field>Description</field>
        <formula>Client_ID__c</formula>
        <name>Description to Client ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>keywords_2</fullName>
        <field>KeyWord_2__c</field>
        <formula>"two (2)"</formula>
        <name>Final Keyword 2 to # 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>keywords_3</fullName>
        <field>KeyWord_2__c</field>
        <formula>"three (3)"</formula>
        <name>Final Keyword 2 to # 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>managerapprova</fullName>
        <field>Manager_Approved_Changes__c</field>
        <literalValue>1</literalValue>
        <name>manager approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>origin_yodle_live</fullName>
        <field>Origin</field>
        <literalValue>YodleLive</literalValue>
        <name>Case Origin to YodleLive</name>
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
    <fieldUpdates>
        <fullName>sow_approved</fullName>
        <field>Status</field>
        <literalValue>Request Approved</literalValue>
        <name>sow approved status updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>status</fullName>
        <field>IsEscalated</field>
        <name>status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>status_update</fullName>
        <field>Status</field>
        <literalValue>Request Denied</literalValue>
        <name>status update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>subject_sales_promo</fullName>
        <field>Subject</field>
        <formula>"Sales Promotion"</formula>
        <name>Subject to Sales Promotion</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>total_keywords_5</fullName>
        <field>KeyWord_3__c</field>
        <formula>"five (5)"</formula>
        <name>Final Keyword 3 to #5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>total_keywords_6</fullName>
        <field>KeyWord_3__c</field>
        <formula>"six (6)"</formula>
        <name>Final Keyword 3 to #6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>type_new_chnl_ptnr</fullName>
        <field>Type</field>
        <literalValue>Channel Partner-New Client</literalValue>
        <name>Type to Channel Partner-New Client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>upsell_renewals_12_month_promo</fullName>
        <field>Description</field>
        <formula>"Once the customer agrees, please note they will be getting their 13th month free, and change the budget, if necessary"</formula>
        <name>Description to 13th Month Free</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>upsell_renewals_6_month_promo</fullName>
        <description>tells IMS to credit customer with 20% on budget for 6-11month contract.  once customer agrees</description>
        <field>Description</field>
        <formula>"Once the customer agrees, please apply a 20% credit to the change in budget, and change the budget, if necessary"</formula>
        <name>Upsell / renewals - 6 month promo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Subject_to_NCS_Product_Type</fullName>
        <field>Subject</field>
        <formula>"NCS - " + TEXT(SEO_Product__c)</formula>
        <name>Subject to NCS - Product Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>AlpenhornCaseChange_Case</fullName>
        <apiVersion>27.0</apiVersion>
        <endpointUrl>https://live.yodle.com:8443/ws/caseProcessingService</endpointUrl>
        <fields>CaseNumber</fields>
        <fields>Id</fields>
        <fields>IsClosed</fields>
        <fields>Issue_ID__c</fields>
        <fields>Subject</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>sfsync@yodle.com</integrationUser>
        <name>AlpenhornCaseChange-Case</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Seo_Case_Closed</fullName>
        <apiVersion>8.0</apiVersion>
        <endpointUrl>http://cms-dev.yodle.com:8443/ws/caseProcessingService</endpointUrl>
        <fields>Announce_Detail__c</fields>
        <fields>Announce_by_Default__c</fields>
        <fields>Headline__c</fields>
        <fields>Id</fields>
        <fields>taskId__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>salesforcealerts@yodle.com</integrationUser>
        <name>Seo_Case_Closed_QA</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Seo_Case_Closed_Production</fullName>
        <apiVersion>8.0</apiVersion>
        <endpointUrl>https://live.yodle.com:8443/ws/caseProcessingService</endpointUrl>
        <fields>Announce_Detail__c</fields>
        <fields>Announce_by_Default__c</fields>
        <fields>Headline__c</fields>
        <fields>Id</fields>
        <fields>taskId__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>salesforcealerts@yodle.com</integrationUser>
        <name>Seo_Case_Closed_Production</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Seo_Case_Closed_Production_V18</fullName>
        <apiVersion>18.0</apiVersion>
        <endpointUrl>https://live.yodle.com:8443/ws/caseProcessingService</endpointUrl>
        <fields>Announce_Detail__c</fields>
        <fields>Announce_by_Default__c</fields>
        <fields>Headline__c</fields>
        <fields>Id</fields>
        <fields>ParentId</fields>
        <fields>taskId__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>salesforcealerts@yodle.com</integrationUser>
        <name>Seo_Case_Closed_Production_V18</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Seo_Case_Closed_QA_V18</fullName>
        <apiVersion>18.0</apiVersion>
        <endpointUrl>http://cms-dev.yodle.com:8443/ws/caseProcessingService</endpointUrl>
        <fields>Announce_Detail__c</fields>
        <fields>Announce_by_Default__c</fields>
        <fields>Headline__c</fields>
        <fields>Id</fields>
        <fields>ParentId</fields>
        <fields>taskId__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>salesforcealerts@yodle.com</integrationUser>
        <name>Seo_Case_Closed_QA_V18</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>TestBaseOutbound</fullName>
        <apiVersion>8.0</apiVersion>
        <endpointUrl>http://live.yodle.com/NatpalLive/app/service</endpointUrl>
        <fields>Id</fields>
        <fields>Status</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>salesforcealerts@yodle.com</integrationUser>
        <name>TestBaseOutbound</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>12month organic renewal-3 keywords</fullName>
        <actions>
            <name>keywords_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>total_keywords_6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Organic Renewal + Maps,Organic Renewal + Maps (promo),Organic Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Term_months__c</field>
            <operation>equals</operation>
            <value>12</value>
        </criteriaItems>
        <description>for all organic renewals for 12 months, they get 3 additional keywords</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>6month organic renewal-2 keywords</fullName>
        <actions>
            <name>keywords_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>total_keywords_5</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Organic Renewal + Maps (promo),Organic Renewal + Maps,Organic Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Term_months__c</field>
            <operation>equals</operation>
            <value>6</value>
        </criteriaItems>
        <description>for all organic renewals for 6 months, they get 2 additional keywords</description>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Services Email to Case %28Exit%29</fullName>
        <actions>
            <name>Update_Case_Reason_Exit</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Account Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>contains</operation>
            <value>Account Deactivation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Services Email to Case %28TP%29</fullName>
        <actions>
            <name>Update_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Account Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>contains</operation>
            <value>Account Tips</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Update - Send to National Analyst</fullName>
        <actions>
            <name>Date_Left_Web_Dev_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Account Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Date_Left_Production__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Requested_Campaign_Updates__c</field>
            <operation>excludes</operation>
            <value>None</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Requested_Website_Updates__c</field>
            <operation>excludes</operation>
            <value>None</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>contains</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Work Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Update - TORCHx Accounts</fullName>
        <actions>
            <name>Assign_to_TORCHx_Post_Launch_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Account Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Experience_Key__c</field>
            <operation>contains</operation>
            <value>torchx</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Add Business Address to LH Cancel</fullName>
        <actions>
            <name>Business_Address_Fill_In</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Cancel Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Business_Address__c</field>
            <operation>equals</operation>
        </criteriaItems>
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
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Add Script for FS Adoption Call</fullName>
        <actions>
            <name>Link_to_Script_FS_Adoption_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Adoption Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Product_Type__c</field>
            <operation>contains</operation>
            <value>Field Service</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Add Script for FS CSC</fullName>
        <actions>
            <name>Add_Script_for_FS_CSC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep__c</field>
            <operation>equals</operation>
            <value>Lighthouse Customer Care</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Alert - New Email Status Change</fullName>
        <actions>
            <name>Alert_New_Inbound_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Outbound Touch Point,YBN Inbound Inquiry,Partner Inbound Inquiry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Re-Opened,New Inbound Email</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AlpenhornCaseChangeRule-Case</fullName>
        <actions>
            <name>AlpenhornCaseChange_Case</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>true</formula>
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
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Assign to LH CSC queue</fullName>
        <actions>
            <name>Case_Owner_to_LH_CSC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>AR Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Attempt 1 Field Updates</fullName>
        <actions>
            <name>Outbound_Touch_1st_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 AND 5) OR (1 AND 2 AND 3) OR (1 AND 2 AND 3 AND 4) OR (2 AND 3 and 6)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X1st_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_Status_1__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Dedicated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>contains</operation>
            <value>Outbound Campaign</value>
        </criteriaItems>
        <description>This is used to consolidate Outbound Outrank Plus - Attempt 1, Outbound Outrank Plus - Attempt 1 Completed, NCS - Attempt 1, Outbound Dedicated - Attempt 1, LH Outbound Campaign Priority to 1 Attempt</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Attempt 2 Field Updates</fullName>
        <actions>
            <name>Outbound_Touch_2nd_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 AND 5) OR (1 AND 2 AND 3) OR (1 AND 2 AND 3 AND 4) OR (2 AND 3 and 6)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X2nd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_2_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Dedicated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>contains</operation>
            <value>Outbound Campaign</value>
        </criteriaItems>
        <description>This is used to consolidate Outbound Outrank Plus - Attempt 2, Outbound Outrank Plus - Attempt 2 Completed, NCS - Attempt 2, Outbound Dedicated - Attempt 2, LH Outbound Campaign Priority to 2 Attempt</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Attempt 3 Field Updates</fullName>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_3_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 AND 5) OR (1 AND 2 AND 3) OR (1 AND 2 AND 3 AND 4) OR (2 AND 3 and 6)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_3__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X3rd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_3_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Dedicated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>contains</operation>
            <value>Outbound Campaign</value>
        </criteriaItems>
        <description>This is used to consolidate Outbound Outrank Plus - Attempt 3, Outbound Outrank Plus - Attempt 3 Completed, NCS - Attempt 3, Outbound Dedicated - Attempt 3, LH Outbound Campaign Priority to 3 Attempt</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Attempt 4 Field Updates</fullName>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_4_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 AND 5) OR (1 AND 2 AND 3) OR (1 AND 2 AND 3 AND 4) OR (2 AND 3 and 6)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_4__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X4th__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_4_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Dedicated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>contains</operation>
            <value>Outbound Campaign</value>
        </criteriaItems>
        <description>This is used to consolidate Outbound Outrank Plus - Attempt 4, Outbound Outrank Plus - Attempt 4 Completed, NCS - Attempt 4, Outbound Dedicated - Attempt 4, LH Outbound Campaign Priority to 4 Attempt</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Auto close LBW Organic Setup cases created by automation</fullName>
        <actions>
            <name>Old_LBW_Content_Case_Subject_Notes</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Status_to_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Plan_Id__c</field>
            <operation>equals</operation>
            <value>LEADS_BY_WEB</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
            <value>OR 3.0 - Organic Setup Search Influence</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>equals</operation>
            <value>SFDC Sync</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>AutoLaunch NCS - Escalated</fullName>
        <actions>
            <name>NCS_AutoLaunch_to_Sales</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AutoLaunch NCS Adversite and Pro</fullName>
        <actions>
            <name>AutoLaunch_NCS_Adversite_Pro_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Date_Sent_SEM_OPs</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YO_2_0_AutoLaunch_NCS_Owner_Adversite</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 or 4) AND 3</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>,NCS - AutoLaunch,Partner - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Website_Type2__c</field>
            <operation>equals</operation>
            <value>Adversite,Adversite Pro,Adversite Plus,OneSite</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>2. BPM/SBW,1-Web Dev AutoLaunch,1-MA Setup AutoLaunch,1-GCC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Website_Type2__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AutoLaunch NCS Client Hosted</fullName>
        <actions>
            <name>Website_Tier_Mgr_Approve_to_Web_Dev</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YO_2_0_AutoLaunch_NCS_Client_Hosted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Client Setup,NCS - AutoLaunch,New Client Setup (NON AUTO LAUNCH)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Client_Type_Pilots__c</field>
            <operation>includes</operation>
            <value>Automated Launch,YO 2.0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>2. BPM/SBW,1-Web Dev AutoLaunch,1-MA Setup AutoLaunch,1-GCC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Website_Type2__c</field>
            <operation>equals</operation>
            <value>Client-Hosted</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AutoLaunch NCS Mirror</fullName>
        <actions>
            <name>Website_Tier_Mgr_Approve_to_Web_Dev</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YO_2_0_AutoLaunch_NCS_Status_Mirror</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Website_Type2__c</field>
            <operation>equals</operation>
            <value>Mirror</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>2. BPM/SBW,1-Web Dev AutoLaunch,1-MA Setup AutoLaunch,1-GCC</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry - SW Issue</fullName>
        <actions>
            <name>Berry_SW_Issue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Berry Sales Wizard Issue</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry 72 Hour Email</fullName>
        <actions>
            <name>Berry_72_Hour_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Partner_Account4__c</field>
            <operation>contains</operation>
            <value>Berry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>contains</operation>
            <value>3-CSC AutoLaunch</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry Account Manager Email</fullName>
        <actions>
            <name>Berry_Account_Manager_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Berry_Account_Manager_Email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Berry Additional Notes - Escalated to Berry</fullName>
        <actions>
            <name>Berry_Additional_Notes_Escalated_to_Berry</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Additional Notes - Escalation to Berry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Berry Group</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry Assign Web to Case</fullName>
        <actions>
            <name>Berry_Web_to_Case_Change_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>dl-newdomain@yodle.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry AutoLaunch Escalation</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Berry Escalation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Sales Issue</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry Escalation Closed</fullName>
        <actions>
            <name>Escalated_Closed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Berry Escalation,Escalation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Partner_Account4__c</field>
            <operation>equals</operation>
            <value>Berry Group</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry Escalation%2C Escalated to Berry</fullName>
        <actions>
            <name>Escalation_Escalated_to_Berry</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 3 and 4 and (2 or 5)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Escalated to Berry - No Action,Escalated to Berry - Action Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Berry Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Escalation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry Escalations - Update Owner</fullName>
        <actions>
            <name>Berry_Escalations_Update_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>escalations@yodle.com,berrysupport@yodle.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry NCS Additional Notes - Escalated to Berry</fullName>
        <actions>
            <name>Berry_NCS_Additional_Notes_for_Escalation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - New Client Setup,XJen - Partner NCS ASW</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Berry Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Additional Notes - Escalated to Berry</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry NCS Escalated To Berry</fullName>
        <actions>
            <name>SEM_Escalated_To_Berry</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - New Client Setup,XJen - Partner NCS ASW</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Escalated to Berry - Action Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Berry Group</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry NCS Initial Req Fulfilled</fullName>
        <actions>
            <name>SEM_Initial_Req_Fulfilled</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - New Client Setup,XJen - Partner NCS ASW</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Date_of_Initial_Req_Fulfilled__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Berry Group</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry NCS No Contract after 7 Days</fullName>
        <actions>
            <name>Berry_no_contract_after_5_days</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND (4 OR 5) and 6</booleanFilter>
        <criteriaItems>
            <field>Case.Berry_Contract_Received__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Days_Open__c</field>
            <operation>equals</operation>
            <value>7</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.GCC_1_Status__c</field>
            <operation>equals</operation>
            <value>Attempted and Successful</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.GCC_2_Status__c</field>
            <operation>equals</operation>
            <value>Attempted and Successful</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Berry Group</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry New or Never Launch</fullName>
        <actions>
            <name>SEM_New_Client_Launched</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - New Client Setup,XJen - Partner NCS ASW</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>LIVE,Never launched</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Berry Group</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry Post-Setup Issue</fullName>
        <actions>
            <name>Berry_Post_Setup_Issue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Berry Post-Setup Issue</value>
        </criteriaItems>
        <description>Sends email when Berry Post-Setup Issue is created</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry Red Segment Email</fullName>
        <actions>
            <name>Berry_Red_Segment_email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.BES_SLA__c</field>
            <operation>equals</operation>
            <value>18 days (Red)</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Berry VM Email to Case</fullName>
        <actions>
            <name>Owner_Updated_to_Berry_VM_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Berry VM</value>
        </criteriaItems>
        <description>Changes owner of case with origin of Berry VM</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Berry WSO Open for 6 Days</fullName>
        <actions>
            <name>Berry_case_open_for_6_days</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5</booleanFilter>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Berry Group</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Days_Open__c</field>
            <operation>equals</operation>
            <value>6</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>notEqual</operation>
            <value>LIVE</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Berry_Product_Type__c</field>
            <operation>equals</operation>
            <value>Website Only</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Bolt On Cancellation - Cancel All</fullName>
        <actions>
            <name>Bolt_On_Cancellation_Cancel_All</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND (3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Cancel Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>contains</operation>
            <value>Lighthouse + PP</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Churned</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Downsold to LH Only</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Bolt On Cancellation - Welcome Station</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Cancel Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>contains</operation>
            <value>Lighthouse + PP</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Downsold to LH+ProPack,Downsold to LH+ProPack+Mobile Manager</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Brittany Hickman Owner</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Brittany Hickman</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>1 in 30,4 in 60</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CS Upsell Cases</fullName>
        <actions>
            <name>Assign_to_Makenzie_Cunningham</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Reason_to_Product</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Record_Type_To_Master</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Reason_Detail_to_Upsell</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Subject_of_Upsell_Lead_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>CS Upsell</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CSC Business Customization Form</fullName>
        <actions>
            <name>CSC_Business_Customization_Form</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Total_Acct_Revenue__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Channel_Type__c</field>
            <operation>notEqual</operation>
            <value>National,Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Days_Live__c</field>
            <operation>lessOrEqual</operation>
            <value>2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Secondary_Segments__c</field>
            <operation>notContain</operation>
            <value>Plumber,HVAC Contractor,Carpet Cleaning,Property Inspector,Photographer,Architect,Accountant,Real Estate Agent</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep_Role__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notContain</operation>
            <value>Jeremy</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CSC Business Customization Form - Lighthouse Auto - Case</fullName>
        <actions>
            <name>Lighthouse_Business_Customization_Form_Auto</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Check_to_send_BCF__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Secondary_Segments__c</field>
            <operation>contains</operation>
            <value>Auto</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSC Business Customization Form - Lighthouse Chiro - Case</fullName>
        <actions>
            <name>Lighthouse_Business_Customization_Form_Chiro</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Check_to_send_BCF__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Secondary_Segments__c</field>
            <operation>contains</operation>
            <value>Chiro</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSC Business Customization Form - Plumber</fullName>
        <actions>
            <name>CSC_Business_Customization_Form_Plumber</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 and 7 and 8 and 9 and 10 and 11 AND 12</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Total_Acct_Revenue__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Channel_Type__c</field>
            <operation>notEqual</operation>
            <value>National,Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Days_Live__c</field>
            <operation>lessOrEqual</operation>
            <value>2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Secondary_Segments__c</field>
            <operation>contains</operation>
            <value>Plumber</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep_Role__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notContain</operation>
            <value>Jeremy</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CSC Date in the Past</fullName>
        <actions>
            <name>CSC_Date_in_the_Past</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Temporary solution when the 'Finalize Sale' is completed in YL after the CSC date.</description>
        <formula>GCC1_Date_Time__c &lt; CreatedDate</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CSC Survey</fullName>
        <actions>
            <name>CSC_Survey_Pooled_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CSC_Survey_E_mail_Sent_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12</booleanFilter>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>equals</operation>
            <value>Local</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>National,OEM,Master,Partner,YBN,Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Send Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Client Setup Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Survey_Opt_Out__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Issue_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>notContain</operation>
            <value>Pin Collection</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>LIVE</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>notContain</operation>
            <value>Ads,Web,Lighthouse,Field Service</value>
        </criteriaItems>
        <description>Post CSC survey sent upon call completion for pooled support</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSC Survey - LBW</fullName>
        <actions>
            <name>LBW_CSC_Survey</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CSC_Survey_E_mail_Sent_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8</booleanFilter>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>equals</operation>
            <value>Local</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>equals</operation>
            <value>Leads by Web,Lead Stream ATV</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>CSC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>notEqual</operation>
            <value>OFF</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse,TORCHx,Customer Care</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Survey_Opt_Out__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>Post CSC survey sent upon call completion for LBW CSCs</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSC Survey - LO%2FSC</fullName>
        <actions>
            <name>CSC_Survey_Pooled_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CSC_Survey_E_mail_Sent_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND ((3 AND 4 AND 5 AND 13) OR (9 AND 10 AND 14)) AND 6 AND 7 AND 8 AND 11 AND 12</booleanFilter>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>equals</operation>
            <value>Local</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>National,OEM,Master,Partner,YBN,Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call,Yodle Path Experience</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>CSC,Setup Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Survey_Opt_Out__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>notEqual</operation>
            <value>OFF</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>notContain</operation>
            <value>Ads,Web,Lighthouse,Field Service,Torchx</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Pooled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Dedicated</value>
        </criteriaItems>
        <description>Post CSC survey sent upon call completion for pooled and dedicated support once LO/SC go GA</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSC Survey Dedicated</fullName>
        <actions>
            <name>CSC_Survey_Dedicated_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12</booleanFilter>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Dedicated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>National,OEM,Master,Partner,YBN,Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Send Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Client Setup Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Survey_Opt_Out__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Issue_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>notContain</operation>
            <value>Pin Collection</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>LIVE</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>notContain</operation>
            <value>Web</value>
        </criteriaItems>
        <description>Post CSC survey sent upon call completion</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Awaiting Customer Response</fullName>
        <actions>
            <name>Remove_from_SLA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner Inbound Inquiry,Partner - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Awaiting Customer Response</value>
        </criteriaItems>
        <description>When Partner - NCS and Partner Inbound Inquiry are changed to Awaiting Customer Response, check the Remove from SLA</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Email Rescheduled CSC%2C TP%2C or Adoption Call</fullName>
        <actions>
            <name>Case_Email_Rescheduled_CSC_or_TP</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(  ISCHANGED(Scheduled_Call__c),  OwnerId &lt;&gt; "00532000005P6l3", /* Lead Stream Support */  OwnerId &lt;&gt; "00G32000001TnzL", /* LBW Customer Service */ OwnerId &lt;&gt; "",  OR(  ISPICKVAL(Reason, "CSC"),  ISPICKVAL(Reason, "CS Touch Plan"),  ISPICKVAL(Reason, "CS Touch Plan -Dedicated"),  ISPICKVAL(Reason, "Adoption Call")  ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Case - Email Rescheduled CSC%2C TP%2C or Adoption Call LBW or Lead Stream Support Queue</fullName>
        <actions>
            <name>Case_Email_Rescheduled_CSC_or_TP_LBW_Lead_Stream_Queue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(  ISCHANGED(Scheduled_Call__c),  OwnerId  =  "00532000005P6l3", /* Lead Stream Support */  OwnerId  =  "00G32000001TnzL", /* LBW Customer Service */ OR(  ISPICKVAL(Reason, "CSC"),  ISPICKVAL(Reason, "CS Touch Plan"),  ISPICKVAL(Reason, "CS Touch Plan -Dedicated"),  ISPICKVAL(Reason, "Adoption Call")  ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Case - IMS Rep blank on outbound reattempt</fullName>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and(
 RecordTypeId = "012600000009cjs",
ischanged( Scheduled_Call__c ),
ispickval( Status ,"New"))</formula>
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
        <description>Captures the initial close date of a case.  Date does not change when a case is reopened.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Matthew Scott %26 Zach Bailey Email Notices</fullName>
        <actions>
            <name>Case_Updated_Changed_or_Assigned_to_you</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Zach Bailey,Matthew Scott,Rustin Fincke</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Full_Name__c</field>
            <operation>notEqual</operation>
            <value>Zach Bailey,Matthew Scott,Rustin Fincke</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
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
            <value>Tolman,Jayaraj,Connector,Laughlin,Flanagan,Lavin,Gelardi,Mettille,Mcmillian,Mcintyre,Fincke,Banker,Woodul,Salesforce,Sync,Amp</value>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Outbound Call Proactive Touch Subject</fullName>
        <actions>
            <name>Case_Outbound_Call_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Proactive Touch,Proactive Touch - Set to Deactivate</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>RT - Outbound Call
Case Reason - Proactive Touch</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Outbound Call Subject</fullName>
        <actions>
            <name>Case_Outbound_Call_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch,Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Primary Rep Support Assignment</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notEqual</operation>
            <value>,Lead Stream Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>equals</operation>
            <value>Leads By Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master,Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>notEqual</operation>
            <value>Quality Team,Taxonomy</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case - Rogers to Local Email Queue</fullName>
        <actions>
            <name>Case_Owner_to_Local_Email_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND (4 OR 5)</booleanFilter>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Rogers Support,Outrank Customer Support,Rogers Outrank</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>notEqual</operation>
            <value>Circuit Breaker</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>Canceled:,Accepted:,Initial Setup,Survey,Organic,Low Adv,Client Spend,Decline,Low Advertising Funds,Credit Card Declined</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>startsWith</operation>
            <value>RE:</value>
        </criteriaItems>
        <description>This rule moves cases in the Rogers Support Queue into the Local Email Queue instead.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Send LH Winback Notification</fullName>
        <actions>
            <name>Case_Send_LH_Winback_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>LHWB@yodle.com</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case - Start SLA Timer</fullName>
        <actions>
            <name>Case_Stopped_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Start the SLA Timer for WBN cases when Status moved out of Awaiting....</description>
        <formula>AND(      OR(     RecordTypeId = "012320000009epJ", /* YBN Inbound Inquiry */      RecordTypeId = "012320000009flI", /* Partner Inbound Inquiry */  	RecordTypeId = "012600000009TnK" /* Partner New Client Setup  */    ),       NOT(ISBLANK(EntitlementId)),      IsStopped = true,      NOT(ISPICKVAL(Status, "Awaiting Customer Response")),      NOT(ISPICKVAL(Status, "Awaiting Case Work Completion")   )  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Stop SLA Timer</fullName>
        <actions>
            <name>Case_Stopped_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stop the SLA Timer for WBN cases when Status changes to Awaiting....</description>
        <formula>AND(      OR(     RecordTypeId = "012320000009epJ", /* YBN Inbound Inquiry */        RecordTypeId = "012320000009flI", /* Partner Inbound Inquiry */  	RecordTypeId = "012600000009TnK" /* Partner New Client Setup  */    ),   NOT(ISBLANK(EntitlementId)),      IsStopped = false,      OR(          ISPICKVAL(Status, "Awaiting Customer Response"),         ISPICKVAL(Status, "Awaiting Case Work Completion")      )  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - TORCHx NCS Autolaunch Subject</fullName>
        <actions>
            <name>Case_TORCHx_NCS_Autolaunch_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHX NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
            <value>New Client Setup Case</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - TORCHx NCS Record Type Change</fullName>
        <actions>
            <name>Case_TORCHx_NCS_Record_Type_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>contains</operation>
            <value>TORCHX</value>
        </criteriaItems>
        <description>This changes NCS Cases to TORCHx NCS cases with the Account Product Type contains TORCHx</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case - TORCHx NCS Reschedule Reassignment</fullName>
        <actions>
            <name>TORCHx_NCS_Reschedule_Reassignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(RecordTypeId = "012600000009cjs", ISCHANGED(Scheduled_Call__c),  $User.Id = "00532000005K6nE",  CONTAINS(Product_Type__c, "TORCHx"))</formula>
        <triggerType>onAllChanges</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Unscheduled Reattempt 4%2B and IMS Removed</fullName>
        <actions>
            <name>Case_Postpone_by_3_Days</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and( 
RecordTypeId = "012600000009cjs", 
ischanged(IMS_Rep__c),
ISBLANK(IMS_Rep__c), 
ispickval(Status ,"Unscheduled - 4+ Attempts"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Case - YBN - Notify owner of approaching budget update</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Budget Change</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Due_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>YBN_Send_Notification_Of_Budget_Change</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.Due_Date__c</offsetFromField>
            <timeLength>-3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
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
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case Client Escalation Closed Notification</fullName>
        <actions>
            <name>Client_Escalation_Case_Closed</name>
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
            <value>Client Escalation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notEqual</operation>
            <value>National Account,National Master Account,YBN</value>
        </criteriaItems>
        <description>When a Client Escalation is closed, an email is sent to the SMC, the CSM, and Matt Hausman</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Owner to Ann Lewis</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Ann Lewis</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Owner to Austin CS Ops</fullName>
        <actions>
            <name>Austin_CS_Ops_Retention_FT</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3 and 4</booleanFilter>
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
            <field>Case.Created_by_Role__c</field>
            <operation>contains</operation>
            <value>Retention</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Reason Partner</fullName>
        <actions>
            <name>Ptnr_NCS_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - New Client Setup</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Reason ViaMedia Assignment</fullName>
        <actions>
            <name>Case_Reason_ViaMedia_Assignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>ViaMedia Sales Issue</value>
        </criteriaItems>
        <description>Automatically Assigns Stephanie Smith, when ViaMedia Sales Issue is selected as the case reason.</description>
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
        <description>Autocloses auto reply email cases</description>
        <triggerType>onCreateOnly</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Partner e-mail alert</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Channel Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Charge Failure Case - Update resolution attempt status</fullName>
        <actions>
            <name>Charge_Failure_Case_Resolution_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Charge Failure</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_2__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_3__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Charge Failure Case - Update resolution attempt status 2</fullName>
        <actions>
            <name>Charge_Failure_Case_Resolution_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Charge Failure</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_3__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Charge Failure Case - Update resolution attempt status 3</fullName>
        <actions>
            <name>Charge_Failure_Case_Resolution_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Charge Failure</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_3__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Charge Failure Field Updates</fullName>
        <actions>
            <name>Charge_Failure_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Charge_Failure_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Charge Failure</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Client Ads Request to Client Update Queue</fullName>
        <actions>
            <name>Assign_to_Client_Update_Queu</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Client Ads Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
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
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Close SEM Upsell Change Order Copy</fullName>
        <actions>
            <name>Status_to_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
            <value>Change Order</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>CS@Outrank.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Date Left Performance Fill In</fullName>
        <actions>
            <name>Date_Time_Left_Performance</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
OR($User.UserRoleId = "00E60000001Ghar", 
$User.UserRoleId = "00E60000001HVws",
$User.UserRoleId = "00E60000000rq67",
$User.UserRoleId = "00E60000001HVwY"),

OR(ISPICKVAL(Status,"Closed - Opt Complete"), 
ISPICKVAL(Status,"Closed - Opt Not Necessary"), 
ISPICKVAL(Status,"Closed"),
ISPICKVAL(Status,"5 - Pending Partner QA"),
ISPICKVAL(Optimization_Status__c,"Opt Completed"),
ISPICKVAL(Optimization_Status__c,"Opt Not Necessary")), 

ISBLANK(Date_Time_Left_Performance__c),
NOT(ISBLANK(Date_Sent_to_Performance__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date Left SEM Ops Fill In</fullName>
        <actions>
            <name>Date_Left_SEM_Ops</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>3 and ((1 and 2) or (4 and 5 and 6) or (7 and 8) or (2 and 8))</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>3-CSC AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - New Client Setup,NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Date_Left_SEM_Ops__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>JCI Outbound</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>National - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Launched</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Account Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Awaiting Internal Response,Closed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date Left Web Dev Fill In</fullName>
        <actions>
            <name>Date_Left_Web_Dev_to_Today1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( 
OR($User.UserRoleId = "00E60000000rjoS", 
$User.UserRoleId = "00E60000000sSEH",
$User.UserRoleId = "00E60000001J9zD",
$User.UserRoleId = "00E60000001J7cM",
$User.UserRoleId = "00E60000001J7bY"),
OR(ISPICKVAL(Status,"Work Completed"), 
ISPICKVAL(Status,"4 MA/MPA Setup"), 
ISPICKVAL(Status,"1-MA Setup AutoLaunch"), 
ISPICKVAL(Status,"In Progress"),  
ISPICKVAL(Status,"Closed")), 
ISBLANK(Date_Left_Production__c),
NOT(ISBLANK(Date_Sent_to_Production__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date Sent SEM OPs Fill In</fullName>
        <actions>
            <name>Date_Sent_SEM_OPs</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Date_Sent_to_SEM_Ops__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>Rogers MA Queue,Post Launch Associate Queue,JCI Setup Queue,Auto Launch Queue,NCS Associate Queue,Partner MPA NCS,TORCHx Post Launch</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date Sent to Web Dev %28Non Organic Setup%29</fullName>
        <actions>
            <name>Date_Sent_to_Web_Dev_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 3 AND (2 OR 4) AND 5</booleanFilter>
        <criteriaItems>
            <field>Case.Date_Sent_to_Production__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Web Dev,Michal Swiader,Sean Cornwall,Rustin Fincke,Kaylissa Spurlock,Quinn Campbell,Michelle Carlough,Bryan Chapman,Ernest Cook,Brian Pekarek,Joshua Price,Kyle Stark,Christine Bergman,Charles Butzine,Mark Fazio,Shannon Doherty,Shawna Davis,Chase Woodhams</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Organic Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>YBN PES Team,Theorem Users,Jennifer Wilder,YBN Production Specialists</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Clarification Sent</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date Sent to Web Dev %28Organic Setup%29</fullName>
        <actions>
            <name>Date_Sent_to_Web_Dev_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 8) AND 3 AND ((4 AND 5) OR (6 OR 7))</booleanFilter>
        <criteriaItems>
            <field>Case.Date_Sent_to_Production__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Web Dev,Michal Swiader,John Switzer,Jeremy Coggin,Amie Guidry,Sean Cornwall,Joseph Tanner,Rustin Fincke,Kaylissa Spurlock,Quinn Campbell,Michelle Carlough,Bryan Chapman,Ernest Cook,Brittany Dean,Brian Pekarek,Joshua Price,Ben Rollier,Daniel Terc</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>Rogers</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>contains</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>contains</operation>
            <value>Rogers</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Theorem Users,Jennifer Wilder,YBN Production Specialists</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date%2FTime Moved to Awaiting Internal Response</fullName>
        <actions>
            <name>Date_Time_Moved_to_Awaiting_Internal_Res</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
OR($User.UserRoleId = "00E60000000rjoS", 
$User.UserRoleId = "00E60000000sSEH",
$User.UserRoleId = "00E60000001J9zD"),
ISPICKVAL(Status,"Awaiting Internal Response"), 
ISBLANK(Date_Left_Production__c),
NOT(ISBLANK(Date_Sent_to_Production__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date%2FTime Moved to Clarification Sent</fullName>
        <actions>
            <name>Date_Time_Moved_to_Clarification_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 3 AND (2 OR 4) AND 5</booleanFilter>
        <criteriaItems>
            <field>Case.Date_Sent_to_Production__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Web Dev,Michal Swiader,Sean Cornwall,Rustin Fincke,Kaylissa Spurlock,Quinn Campbell,Michelle Carlough,Bryan Chapman,Ernest Cook,Brian Pekarek,Joshua Price,Kyle Stark</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Organic Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Theorem Users,Jennifer Wilder</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Clarification Sent</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date%2FTime Sent to Performance Fill In</fullName>
        <actions>
            <name>Date_Time_Sent_To_Performance</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Date_Sent_to_Performance__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Account Performance Queue,National Performance Queue</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date%2FTime Status Changed</fullName>
        <actions>
            <name>Actual_Resolution_Date_now</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>updates actual resolution time</description>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Dedicated CSC New Assignment</fullName>
        <actions>
            <name>Dedicated_CSC_New_Assignment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep_Role__c</field>
            <operation>equals</operation>
            <value>Local Consultant</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>notEqual</operation>
            <value>CS Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Dedicated CSC New Assignment %28CS Ops%29</fullName>
        <actions>
            <name>Dedicated_CSC_New_Assignment_CS_Ops</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep_Role__c</field>
            <operation>equals</operation>
            <value>Local Consultant,CS Operations</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>equals</operation>
            <value>CS Operations</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email - Move Email to Case to Local Queue</fullName>
        <actions>
            <name>Move_to_Local_Email_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Email to Case Outrank Support</value>
        </criteriaItems>
        <description>This rule moves Email to Case Outrank support emails to the Local Email Queue</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email - Vivial Escalation Email</fullName>
        <actions>
            <name>Escalated_Priority</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Vivial_Escalated_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Vivial Escalations</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Email to Case - Outrank Support</fullName>
        <actions>
            <name>Email_to_Case_Outrank_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outrank_Wordpress_Email_to_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>CS@Outrank.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
            <value>customercare@yodle.com,jlaughlin@yodle.com,algorithm@yodle.com,jhecker@yodle.com,outranksatisfaction@yodle.com,noreply@yodle.com,no-reply@yodle.com,clientservices@outrank.com,customercare@outrank.com,noreply@salesforce.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>Paused Outlets Notification,Initial Setup Work Completed,[Outrank],SPAM,News from Outrank,Search Influence,Out of Office,Out-of-Office</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notContain</operation>
            <value>stacie@yodle.com,itproindia.com,MAILER-DAEMON,sfsync@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
            <value>Your Yodle Account has been Launched!,email2SMS system was unable to recognise email address,Credit Card Declined: Outrank Advertising Paused</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Description</field>
            <operation>notContain</operation>
            <value>Please review the comments (if applicable) in the survey below.</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email to Case - Outrank Support Updated 12 11 13</fullName>
        <actions>
            <name>Email_to_Case_Outrank_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outrank_Wordpress_Email_to_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>CS@Outrank.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
            <value>jlaughlin@yodle.com,algorithm@yodle.com,outranksatisfaction@yodle.com,noreply@yodle.com,no-reply@yodle.com,clientservices@outrank.com,customercare@outrank.com,noreply@salesforce.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>Paused Outlets Notification,Initial Setup Work Completed,[Outrank],SPAM,News from Outrank,Search Influence,Out of Office,Out-of-Office</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notContain</operation>
            <value>stacie@yodle.com,itproindia.com,MAILER-DAEMON,sfsync@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
            <value>Your Yodle Account has been Launched!,email2SMS system was unable to recognise email address,Credit Card Declined: Outrank Advertising Paused</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
            <value>Credit Card Declined: Yodle Advertising Paused</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>contains</operation>
            <value>yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Description</field>
            <operation>notContain</operation>
            <value>Please review the comments (if applicable) in the survey below.</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
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
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Email2Case - Product Ideas</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>productideas@yodle.com</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Escalated - Account Performance</fullName>
        <actions>
            <name>Escalated_Account_Performance</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>almus,lunkenheimer,andrew wilson,becky ochs,enrique ramirez sanchez,jennifer carpenter,karly sanchez,katie gulukyan,kelsie mettille,marissa geldardi,vinay sagar</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Escalated - National Analyst</fullName>
        <actions>
            <name>Escalated_National_Analyst</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>national performance,fortunatus,wesley adams,matt austin,josh kunis,dembitze</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Escalated - National PES</fullName>
        <actions>
            <name>PES_team_escalation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>PES,Bergman,Mark Fazio,Shannon Doherty,Shawna Davis,Bryce Butzine,Chase Woodhams</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Escalated - SEM Ops</fullName>
        <actions>
            <name>Escalated_SEM_Ops</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>auto launch queue,post launch associate queue,NCS Associate Queue,martin,corbett,spurlock,cabrales,pollard,copeland,ryan,belk,skowronski,wildes,barreda,fisher,scott,mcknight,o'sullivan,webster,barnes,lidey,oliver,walker,zwicker,gonzalez,kepper</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Escalated - YBN Master Update Priority</fullName>
        <actions>
            <name>Inbound_Website_Escalation_Follow_Up_P</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>managerapprova</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Exit Email Case Routing to Anne Marie Fulton</fullName>
        <actions>
            <name>Case_Owner_to_Sophie_Lavin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Account Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Blank for Email Catch All</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Exit Email Case Routing to Ron Lancaster</fullName>
        <actions>
            <name>Case_Owner_to_Sophie_Lavin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Account Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Facebook Cases Assign to MarketingOps</fullName>
        <actions>
            <name>Facebook_Cases_Assign_to_MarketingOps</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Facebook Post-For-You</value>
        </criteriaItems>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Gold Service - Notify Rep of Closure</fullName>
        <actions>
            <name>Gold_Service_Notify_Rep_of_Closure</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>YodleGoldService@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Send an email to Rep of the case closure</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GreenSky Account Update Client Email Field Update</fullName>
        <actions>
            <name>Account_Email_Populate_to_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Account Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>greenskymerchant@web.com</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GreenSky Sales Lab Email Alert</fullName>
        <actions>
            <name>Greenskye_Sales_Lab_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>CSC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Interested_in_GreenSky__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>Sends email to Sales lab automatically when green sky checkbox is selected.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Greensky LBW- Send Email to client when Account Update Case is complete</fullName>
        <actions>
            <name>GreenSky_Finance_MA_Work_Complete_Email_LBW</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Account Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>greenskymerchant@web.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>equals</operation>
            <value>Leads by Web,Lead Stream ATV</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Greensky Max%2FEssentials - Send Email to client when Account Update Case is complete</fullName>
        <actions>
            <name>GreenSky_Email_to_Client_When_Account_Update_is_Complete</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Account Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>greenskymerchant@web.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>equals</operation>
            <value>Yodle Max,Essentials</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>equals</operation>
            <value>Rusty's Cleaning Service - Test</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inbound - No Follow Up Website Change</fullName>
        <actions>
            <name>Inbound_No_Follow_Up_Website_Change_Re</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Website_Tier_Mgr_Approve_to_Web_Dev</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Inbound Inquiry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Website Change/Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Major</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inbound Website Escalation Inbound Specialist</fullName>
        <actions>
            <name>Inbound_Website_Escalation_Follow_Up_P</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Website Change/Update,BPF Entry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Created_by_Role__c</field>
            <operation>equals</operation>
            <value>Outbound Specialist,Outbound Associate</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Critical,Blocker</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inbound Website Escalation Outbound Specialist</fullName>
        <actions>
            <name>Inbound_Website_Escalation_Follow_Up_P</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Website Change/Update,BPF Entry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Created_by_Role__c</field>
            <operation>equals</operation>
            <value>Outbound Specialist</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Critical,Blocker</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Initial Error Check Subject</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Initial Error Check</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>JCI 2013 NCS Owner to JCI Outbound</fullName>
        <actions>
            <name>Case_Owner_to_JCI_Outbound</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reason_Detail_to_Conf_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.SEO_Product__c</field>
            <operation>equals</operation>
            <value>2013 Existing JCI Upgrade to OR,2013 New JCI Client - OR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>LIVE</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.JCI_Upsold_to_PPC__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Blank for Email Catch All</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>JCI Email Address to Client Email</fullName>
        <actions>
            <name>Client_Email_Fill_In_JCI_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.X2013_JCI_Dealer_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>JCI Issue Tracker Notice to Created by</fullName>
        <actions>
            <name>JCI_Issue_Tracker</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.ParentId</field>
            <operation>contains</operation>
            <value>Johnson Controls Corporate</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Issue_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>notEqual</operation>
            <value>Jennifer Hecker</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LBW 60%2B Day Call Script Update</fullName>
        <actions>
            <name>LBW_60_Day_Call_Script_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>CS Touch Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>equals</operation>
            <value>Leads By Web,Lead Stream ATV</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Account_Days_Live__c</field>
            <operation>greaterOrEqual</operation>
            <value>60</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LBW Email Route</fullName>
        <actions>
            <name>LBW_Case_Owner_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>equals</operation>
            <value>Leads By Web,Lead Stream ATV</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>equals</operation>
            <value>Jennifer Flanagan,Salesforce Automation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Blank for Email Catch All</value>
        </criteriaItems>
        <description>This rule is used to move LBW email responses to Email queue without routing through Jen Flanagan</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LBW Outbound Call</fullName>
        <actions>
            <name>Update_Case_IMS_Rep_LBW_Customer_Service</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Owner_LBW_Customer_Service</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Plan_Id__c</field>
            <operation>equals</operation>
            <value>LEADS_BY_WEB</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>notEqual</operation>
            <value>Lead Stream Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep__c</field>
            <operation>notEqual</operation>
            <value>Lead Stream Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>notEqual</operation>
            <value>Dedicated CS Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep_Full_Name__c</field>
            <operation>notEqual</operation>
            <value>Kyle Zaffin</value>
        </criteriaItems>
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
        <description>Sends an email to LHGS Field Service Reps</description>
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
        <description>Sends an email to LHGS Medical</description>
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
        <description>DF Review Migration Case Reason will assign to SH Support</description>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Config Detail - Marks as Escalated</fullName>
        <actions>
            <name>Mark_Escalated_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(   RecordType.Id = "012600000009bZX", /*LH Master */  OR(  INCLUDES(Config_Detail__c, "New Template Update - Feedback Only"),  INCLUDES(Config_Detail__c, "New Template Update - All Campaigns")))</formula>
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
            <value>Awaiting Customer Response,Escalated (Dev),Escalated (Internal)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <description>Need to indicate escalated for LH Master cases when in status Awaiting Customer Response and Escalated (Dev)</description>
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
        <description>Mark Escalated? when production team mistake is selected</description>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Support Email2Case to Tricia</fullName>
        <actions>
            <name>Case_Owner_to_Tricia_Valadez</name>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Upsell Cases</fullName>
        <actions>
            <name>LH_Upsell_Case_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Reason_to_Product</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Record_Type_To_Master</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Reason_Detail_to_Upsell</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>LH Upsell</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>notEqual</operation>
            <value>LH Upsell - Walkme</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
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
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Local Email Queue Routing</fullName>
        <actions>
            <name>Assign_to_Local_Email_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and ((2 and 3) or (4 and 5)) and 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13</booleanFilter>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Web,CS@Outrank.com,Local Pooled VM,customercare@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>Customer Care,Jennifer Flanagan</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>[Auto-Reply],Re-Optimization,CSC has been assigned,billing error</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Email to Case Outrank Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>notEqual</operation>
            <value>Renewal / Upsell</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
            <value>no-reply@yodle.com,noreply@yodle.com,customercare@yodle.com,sfsync@yodle.com,@salesforce.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
            <value>itprosalesforce@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep__c</field>
            <operation>notEqual</operation>
            <value>Lighthouse Customer Care</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>notEqual</operation>
            <value>Leads By Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Experience_Key__c</field>
            <operation>notContain</operation>
            <value>rogers</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Blank for Email Catch All</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Manager Approved H2 Escalation</fullName>
        <actions>
            <name>Assign_to_Bryan_Heckler</name>
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
            <value>H2 Escalation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Manager Approved Quality</fullName>
        <actions>
            <name>Manager_Approved_Quality</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SEM_Ops_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master,LH Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Quality Team</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>notEqual</operation>
            <value>QA Request Consultative</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Manager Approved Website Escalation</fullName>
        <actions>
            <name>Escalated_Priority</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Website_Tier_Mgr_Approve_to_Web_Dev</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Website Change/Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Escalated,Critical,Blocker</value>
        </criteriaItems>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Master Case Work Completed Status</fullName>
        <actions>
            <name>Low_Lead_Warning</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master,Partner - Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Work Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Move Case to Outbound Touch Queue</fullName>
        <actions>
            <name>Case_Owner_to_Touch_Plan_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Rustan Valino</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Experience_Key__c</field>
            <operation>notContain</operation>
            <value>TORCHx</value>
        </criteriaItems>
        <description>Moves Cases Owned by Rustan into a Queue</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NCS - Attempt 1</fullName>
        <actions>
            <name>Outbound_Touch_1st_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X1st_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_Status_1__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NCS - Attempt 2</fullName>
        <actions>
            <name>Outbound_Touch_2nd_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X3rd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_2_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NCS - Attempt 3</fullName>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_3_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_3__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X4th__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_3_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NCS - Attempt 4</fullName>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_4_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_4__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X4th__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_4_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NCS - Res%2FLVM - 2nd Attp - Pooled</fullName>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_2_Result__c</field>
            <operation>equals</operation>
            <value>Connected - Rescheduled,Left VM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_3__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_4__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CS_Support_Type__c</field>
            <operation>equals</operation>
            <value>Pooled Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X3_Day_Approval__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NCS - Res%2FLVM - 3rd Attp - Pooled</fullName>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_3_Result__c</field>
            <operation>equals</operation>
            <value>Connected - Rescheduled,Left VM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_4__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CS_Support_Type__c</field>
            <operation>equals</operation>
            <value>Pooled Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X3_Day_Approval__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NCS - Res%2FLeftVm - 4th Attp - Pooled</fullName>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_4_Result__c</field>
            <operation>equals</operation>
            <value>Connected - Rescheduled,Left VM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_3__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CS_Support_Type__c</field>
            <operation>equals</operation>
            <value>Pooled Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X3_Day_Approval__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NCS - ResLeftVM - 1st Attp - Pooled</fullName>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_Status_1__c</field>
            <operation>equals</operation>
            <value>Connected - Rescheduled,Left VM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_2__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_3__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_4__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CS_Support_Type__c</field>
            <operation>equals</operation>
            <value>Pooled Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X3_Day_Approval__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>Touch Plan workflow - connected rescheduled, 1st attempt for pooled support</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>NCS AutoLaunch Create - Subject %26 Reason Detail</fullName>
        <actions>
            <name>Reason_Detail_to_Conf_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Subject_Line_for_NCS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <fullName>NCS Case New Client Priority</fullName>
        <actions>
            <name>NCS_Case_Priority_New_Client</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Client - National,National - New Client Setup,ZDep - NCS,ZDep - NCS 4,ZDep - Partner NCS 2,NCS - AutoLaunch,Partner - New Client Setup,XJen Test - Partner NCS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>4a. MPA Campaign Setup,4b. MPA Website Setup,1-MA Setup AutoLaunch,2-QA AutoLaunch</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>National Custom Implementation cases</fullName>
        <actions>
            <name>Case_Owner_to_Implementation_Specialist</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SEM_Ops_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>National Custom Implementation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Need Manager Approval - Chris Booth Team</fullName>
        <active>false</active>
        <booleanFilter>1 and 3 and 4 and (2 or 5)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>QA Request Consultative,QA Request Transactional,Procedural Errors,Payout Adjustment,H2 Escalation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Created_by_Role__c</field>
            <operation>equals</operation>
            <value>Inbound Specialist</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Free Time Guarantee Request,Free Time Performance Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Need Manager Approval Website - Chris Booth</fullName>
        <actions>
            <name>Inbound_Website_Escalation_Follow_Up_P</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Website Change/Update,BPF Entry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Created_by_Role__c</field>
            <operation>equals</operation>
            <value>Outrank 1.0 AM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Manager_Approved_Changes__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Critical,Blocker</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Austin CS Ops</fullName>
        <actions>
            <name>Inbound_No_Follow_Up_Cancel_Request_Ow</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>30 Day Cancel,Same Day Cancel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>notEqual</operation>
            <value>Blocker</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Greenskymerchant%40web%2Ecom email sent</fullName>
        <actions>
            <name>New_Greenskymerchant_web_com_email_sent</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>greenskymerchant@web.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notify Case Owner of CS Touch Plan Scheduled Call Change</fullName>
        <actions>
            <name>CS_Touch_Plan_Email_Scheduled_Change_Email_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>NOT(ISBLANK(Owner:User.Username)) &amp;&amp; ISPICKVAL( Reason , 'CS Touch Plan') &amp;&amp; RecordType.Name == 'Outbound Call' &amp;&amp; ISCHANGED(Scheduled_Call__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Optimization Case Priority</fullName>
        <actions>
            <name>priort_critical</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Optimization</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Date_Opt_Completed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason2__c</field>
            <operation>notEqual</operation>
            <value>Touch Plan Optimization</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Optimization Case Status to Opt Status</fullName>
        <actions>
            <name>Optimization_Case_Status_to_Opt_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed - Opt Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Optimization</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Optimization Case Status to Opt Status Not Complete</fullName>
        <actions>
            <name>Optimization_Case_Status_to_Opt_Status_N</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed - Opt Not Necessary</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Optimization</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Optimization Status to Case Status Complete</fullName>
        <actions>
            <name>Optimization_Status_to_Case_Status_Compl</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and(
 RecordTypeId = "012600000009TWs",
ispickval ( Optimization_Status__c , "Opt Completed"),
not ( $User.Id =  CreatedById ),
ispickval ( Reason2__c , "Touch Plan Optimization"),
or(
ispickval( Reason_Detail__c , "20 Day Touch"),
ispickval( Reason_Detail__c , "40 Day Touch")))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Optimization Status to Case Status Opt Not Necessary</fullName>
        <actions>
            <name>Optimization_Status_to_Case_Status_Opt_N</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and( 
RecordTypeId = "012600000009TWs", 
ispickval ( Optimization_Status__c , "Opt Not Necessary"), 
not ( $User.Id = CreatedById ), 
ispickval ( Reason2__c , "Touch Plan Optimization"),
or(
ispickval( Reason_Detail__c , "20 Day Touch"),
ispickval( Reason_Detail__c , "40 Day Touch")))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Organic Setup - Segment</fullName>
        <actions>
            <name>Organic_Setup_Segment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Setup</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Organic Setup - Subject 1</fullName>
        <actions>
            <name>Organic_Setup_Case_Subject_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SI_Task__c</field>
            <operation>equals</operation>
            <value>Rewrite Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Organic Setup - Work Completed</fullName>
        <actions>
            <name>Organic_Search_Influence_Work_Completed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>contains</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse,Customer Care</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Organic Setup Case Assigned To Vendor</fullName>
        <actions>
            <name>Assigned_to_Vendor_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>Search Influence,Bie Media,Textbroker,Textbroker Users</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Setup,LBW Content Organic Setup</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Organic Setup Case Not Owned by Vendor</fullName>
        <actions>
            <name>Organic_Setup_Vendor_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3) or  4</booleanFilter>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>notEqual</operation>
            <value>Search Influence,Textbroker,Bie Media,Textbroker Users</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Setup,LBW Content Organic Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Assigned_to_Vendor_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CopyStatus__c</field>
            <operation>equals</operation>
            <value>Document Retrieval Confirmed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Organic Setup Subject</fullName>
        <actions>
            <name>Organic_Setup_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Web_Dev_Task__c</field>
            <operation>equals</operation>
            <value>Website Re-Optimization</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Call - Auto Close After 24 days</fullName>
        <actions>
            <name>Outbound_Call_Auto_Close_After_14_days</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Days_Open__c</field>
            <operation>greaterOrEqual</operation>
            <value>24</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Scheduled_Call__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Adoption Call</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Call - Enter Schedule Date Remove IMS and New</fullName>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Status_to_New</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISNEW() = FALSE, 
ischanged( Scheduled_Call__c ),
RecordType.Name = "Outbound Call",
AND(
NOT(ISPICKVAL(Status, "Did Not Complete")), 
NOT(ISPICKVAL(Status, "Unscheduled - Reattempt")),
NOT(ISPICKVAL(Status, "Unscheduled - 4+ Attempts"))
))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Call Auto Close Date</fullName>
        <actions>
            <name>Outbound_Call_Auto_Close_Date_Field_Upda</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( ISNEW() || ISCHANGED(Scheduled_Call__c), RecordType.DeveloperName = 'Outbound_Call', CASE( TEXT( Reason ), 'CSC', 1, 'CS Touch Plan', 1, 'Proactive Touch', 1, 'Adoption Call', 1, 0) = 1, Product_Type__c = 'Leads By Web' ||  ISPICKVAL(Channel_Type__c, 'Local') || CONTAINS(Product_Type__c, 'TORCHx') )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Case To Kyle Zaffin</fullName>
        <actions>
            <name>Case_Owner_to_Kyle_Zaffin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Channel_Type__c</field>
            <operation>equals</operation>
            <value>Local</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>CS Touch Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>contains</operation>
            <value>Leads By Web,Lead Stream ATV</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep_Full_Name__c</field>
            <operation>equals</operation>
            <value>Kyle Zaffin</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Outbound JCI - Attempt 1</fullName>
        <actions>
            <name>Case_Owner_to_JCI_Outbound</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_1st_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>National - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X1st_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_Status_1__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound JCI - Attempt 2</fullName>
        <actions>
            <name>Case_Owner_to_JCI_Outbound</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_2nd_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>National - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X2nd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_2_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound JCI - Attempt 3</fullName>
        <actions>
            <name>Case_Owner_to_JCI_Outbound</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_3_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>National - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_3__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X3rd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_3_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound JCI - Attempt 4</fullName>
        <actions>
            <name>Case_Owner_to_JCI_Outbound</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_4_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>National - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_4__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X4th__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_4_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Outrank Plus - Attempt 1</fullName>
        <actions>
            <name>Case_Owner_to_Touch_Plan_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_1st_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X1st_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_Status_1__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Pooled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Outrank Plus - Attempt 1 Completed</fullName>
        <actions>
            <name>Outbound_Touch_1st_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X1st_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Outrank Plus - Attempt 2</fullName>
        <actions>
            <name>Case_Owner_to_Touch_Plan_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_2nd_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X2nd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_2_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Pooled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Outrank Plus - Attempt 2 Completed</fullName>
        <actions>
            <name>Outbound_Touch_2nd_Attempt_VM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X2nd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Outrank Plus - Attempt 3</fullName>
        <actions>
            <name>Case_Owner_to_Touch_Plan_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_3_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_3__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X3rd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_3_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Pooled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Outrank Plus - Attempt 3 Completed</fullName>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_3_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_3__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X3rd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Outrank Plus - Attempt 4</fullName>
        <actions>
            <name>Case_Owner_to_Touch_Plan_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_4_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_4__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X4th__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_4_Result__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Model_Local__c</field>
            <operation>equals</operation>
            <value>Pooled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Outrank Plus - Attempt 4 Completed</fullName>
        <actions>
            <name>Outbound_Outrank_Plus_Attempt_4_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_Attempts_Priority_4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_Date_4__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.X4th__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Outrank Plus No Attempts</fullName>
        <actions>
            <name>Outbound_Touch_NCS_Attempt_None_Priori</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outbound_Touch_OR_Bundle_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SEO_Product__c</field>
            <operation>equals</operation>
            <value>Outrank Plus,Outrank 3.0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_Status_1__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outrank Wordpress Email to Case</fullName>
        <actions>
            <name>Email_to_Case_Outrank_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Outrank_Wordpress_Email_to_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Outrank Wordpress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
        </criteriaItems>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Owner to Kelly SEM Upsell Change Order Copy</fullName>
        <actions>
            <name>Owner_to_Kelly_Hall</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
            <value>Change Order</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Partner Master Case Population</fullName>
        <actions>
            <name>Channel_Type_to_Partner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Master</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner Rep Email to Populate</fullName>
        <actions>
            <name>Partner_Rep_Email_to_Populate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
            <value>Rogers,Berry Group</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner VM Email To Case</fullName>
        <actions>
            <name>Update_Owner_to_Partner_VM_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Partner VM</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Pooled Web to Case Check</fullName>
        <active>false</active>
        <formula>or( 
and( 
ispickval ( Origin , "Web"), 
OwnerId = "00560000001HpEm"), 
and( 
not (contains( Subject , "([Auto-Reply],Re-Optimization,CSC has been assigned)")), 
OwnerId = "00G60000001CJm2"))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate %22Date Left Web Dev%22</fullName>
        <actions>
            <name>Date_Left_Web_Dev_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Date_Left_Production__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Awaiting Internal Response,In Progress,Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Outbound Touch Point,YBN Product Ideas,YBN Inbound Inquiry,Partner Inbound Inquiry,YBN Corporate Interaction,YBN Request,National - New Client Setup,Optimization,Account Update,YBN Master</value>
        </criteriaItems>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pro Website Care to Post Launch Queue</fullName>
        <actions>
            <name>Case_Owner_to_Post_Launch_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Account Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Pro_Website_Care__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>notContain</operation>
            <value>TORCHX</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Proactive Touch IMS Rep</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Proactive Touch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>notEqual</operation>
            <value>Outbound Touch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IMS_Rep__c</field>
            <operation>equals</operation>
        </criteriaItems>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Reactive Outlets Paused</fullName>
        <actions>
            <name>Reactive_Outlets_Paused</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Call Quality - Reactive</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Reassign a Reopened Case</fullName>
        <actions>
            <name>Update_to_Care_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Re-Opened</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Channel_Type__c</field>
            <operation>equals</operation>
            <value>Local</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>CSC</value>
        </criteriaItems>
        <description>Reassign are Reopened Local Case to Care, Customer</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rogers - SW Issue</fullName>
        <actions>
            <name>Rogers_Sales_Wizard_Issue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Rogers Sales Wizard Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>notEqual</operation>
            <value>No Physical Address for Organic/Combo</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rogers Dedicated Email to Case</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Rogers Dedicated VM</value>
        </criteriaItems>
        <description>Assign Rogers Dedicated voicemail emails to new owner</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Rogers Pooled - VM Cases</fullName>
        <actions>
            <name>Case_Reason_to_Rogers_Inbound_Inquiry</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Rogers Pooled VM</value>
        </criteriaItems>
        <description>Updates Case Reason to Rogers Inbound Inquiry</description>
        <triggerType>onCreateOnly</triggerType>
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
        <criteriaItems>
            <field>Case.Monthly_Advertising_Budget__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SEO_Case_Closed</fullName>
        <actions>
            <name>Seo_Case_Closed_Production_V18</name>
            <type>OutboundMessage</type>
        </actions>
        <actions>
            <name>Seo_Case_Closed_QA_V18</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>SEO Product</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolved__c</field>
            <operation>equals</operation>
            <value>Unresolved,Resolved</value>
        </criteriaItems>
        <description>Workflow Rule when a Case is Closed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send To IT Pro</fullName>
        <actions>
            <name>Send_To_IT_Pro</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CopyStatus__c</field>
            <operation>equals</operation>
            <value>Document Retrieval Confirmed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Surveys - Issue Resolution</fullName>
        <actions>
            <name>Account_Email_Populate_to_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12</booleanFilter>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Account Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Issue_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>OEM,National,Partner,Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
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
            <field>Account.Days_Live__c</field>
            <operation>greaterOrEqual</operation>
            <value>70</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>notContain</operation>
            <value>Lighthouse,Field Service</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Surveys_Issue_Res_Updated_May_3_16</name>
                <type>Alert</type>
            </actions>
            <timeLength>24</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Surveys - Issue Resolution NEW</fullName>
        <actions>
            <name>Surveys_Issue_Res_Updated_May_3_16</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Account_Email_Populate_to_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 and 12 and 13</booleanFilter>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Send Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Issue_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>OEM,National,Partner,Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
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
            <field>Case.Issue_Resolved_Survey_Send_Date__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>notContain</operation>
            <value>Out of Sync,Charge,Adoption,Maps Verification,Unknown,Cancel,Touch,Setup,Upsell,Pin Collection,Downsell,Invoice,Proactive</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>notContain</operation>
            <value>lighthouse,field service,TorchX</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>24</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Surveys - Issue Resolution SC%2FLO</fullName>
        <actions>
            <name>Surveys_Issue_Res_Updated_May_3_16</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Account_Email_Populate_to_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 and 12 AND 13</booleanFilter>
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
            <operation>notContain</operation>
            <value>lighthouse,field service,TORCHx</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Channel_Development__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>OEM,National,Partner,Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
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
            <field>Case.Issue_Resolved_Survey_Send_Date__c</field>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Surveys - TORCHx Issue Resolution</fullName>
        <actions>
            <name>TORCHx_Issue_Resolution_Survey_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Account_Email_Populate_to_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 and 12 AND 13</booleanFilter>
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
            <operation>notContain</operation>
            <value>lighthouse,field service</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Plan_Id__c</field>
            <operation>contains</operation>
            <value>torchx</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>OEM,National,Partner,Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
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
            <field>Case.Issue_Resolved_Survey_Send_Date__c</field>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx - Email Members with new CSC</fullName>
        <actions>
            <name>New_TORCHx_CSC_Case_Created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client_Experience_Key__c</field>
            <operation>contains</operation>
            <value>torchx</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>CSC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>notContain</operation>
            <value>Rustin,Rustan</value>
        </criteriaItems>
        <description>Email the team when a new CSC case is created</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx - NCS Case CSC Date Filled Out</fullName>
        <actions>
            <name>Web_Dev_Completed_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CSC_Reschedule_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Web_Dev_Score_for_IMS__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx NCS - AutoLaunch</value>
        </criteriaItems>
        <description>When the CSC Reschedule Date is filled out, this will populate the WebDev Complete Date for CSC Case Creation Automation.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx CSC%2FProactive Touch Email to Owner - Email Alert</fullName>
        <actions>
            <name>TORCHx_CSC_Proactive_Touch_Email_to_Owner_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>TORCHx_NCS_Email_to_Owner_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.TORCHx_NCS_Email_Notification__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>TORCHx CSC,Proactive Touch</value>
        </criteriaItems>
        <description>This Sends an Email to the Case Owner when someone replies to an Open Proactive Touch or TORCHx CSC Case</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx Master Escalation Notification</fullName>
        <actions>
            <name>TORCHx_Escalation_Case</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsEscalated</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx Master Owner to Quality Team</fullName>
        <actions>
            <name>Case_Owner_to_Quality_Team_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Quality Team</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx Master Owner to Sugar Hill</fullName>
        <actions>
            <name>Case_Owner_to_LH_Support_Sugar_Hill</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>notEqual</operation>
            <value>Quality Team</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx NCS Email to Owner - Email Alert</fullName>
        <actions>
            <name>TORCHx_NCS_Email_to_Owner_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>TORCHx_NCS_Email_to_Owner_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.TORCHx_NCS_Email_Notification__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx NCS - AutoLaunch</value>
        </criteriaItems>
        <description>This sends an email notice to case owner for TORCHx</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx Outbound Call Case Rescheduled Today</fullName>
        <actions>
            <name>TORCHx_Outbound_Time_Rescheduled_to_Today</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(  RecordTypeId = "012600000009cjs",   CONTAINS(Account.Client_Experience_Key__c,"torchx"),  ISCHANGED( Scheduled_Call__c ),  DATEVALUE(Scheduled_Call__c) = TODAY(),   OR(     ISPICKVAL(  Reason ,"CSC"),  CONTAINS( Subject,"Managing Relationships"),  CONTAINS( Subject,"Advanced Features")   ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx Owner Update for new TPs</fullName>
        <actions>
            <name>Owner_to_TORCHx</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Experience_Key__c</field>
            <operation>contains</operation>
            <value>TORCHx</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>CS Touch Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Rustan Valino,Salesforce Automation</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx Proactive Touch Assignment</fullName>
        <actions>
            <name>TORCHx_Proactive_Touch_Assignment</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>TORCHx_Proactive_Touch_Assignment_IMS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>contains</operation>
            <value>TORCHx</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Proactive Touch</value>
        </criteriaItems>
        <description>This updated the Case Owner and IMS Rep to be TORCHx Queue and Support when the case is an Outbound Call and Proactive Touch.</description>
        <triggerType>onCreateOnly</triggerType>
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
        <description>When a Target Service Area request case is closed, an email is sent to the record creator.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Taxonomy Case Assign to Global Content Review Queue</fullName>
        <actions>
            <name>Assign_to_Jennifer_Carpenter</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master,YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Taxonomy</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Global Content Review</value>
        </criteriaItems>
        <description>Case owner to Marketing Ops when Master Case Reason is Taxonomy and Reason Detail is Global Content Review.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Taxonomy Case Assignment Content Request</fullName>
        <actions>
            <name>Assign_Tax_Case_Owner_to_Karly_Sanchez</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master,YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Taxonomy</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Content Request</value>
        </criteriaItems>
        <description>Case owner should be Marketing Ops when Master Case Reason is Taxonomy and Reason Detail is Content Request.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Template Escalation</fullName>
        <actions>
            <name>Template_Escalation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Escalates if "New Template Update" or  "New Template - FB Only" is true.</description>
        <formula>OR (  ISPICKVAL (Reason, "New Template Update"),  ISPICKVAL (Reason, "New Template - FB Only")  )</formula>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Time in Ownership Update</fullName>
        <actions>
            <name>Update_Time_Owner_Changed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ischanged( OwnerId )</formula>
        <triggerType>onAllChanges</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Case Closed By</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Issue Resolved By</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Workflow_Complete__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
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
        <description>Update "Escalated" Priority to "Critical" when case is closed to prevent re-opened cases from triggering 'escalation' emails</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Resolved By</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Workflow_Complete__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>WBN - New email threaded cases to Inbound Inquiry</fullName>
        <actions>
            <name>Change_Case_Owner_to_Berry_Email_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>WBN_Partner_Case_RT_set_to_Partner_Inb</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>contains</operation>
            <value>Vivial</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <description>Correcting Vivial Email-to-Case - set to Inbound Inquiry and add to proper Queue</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>WBN - Request Approval By CSD</fullName>
        <actions>
            <name>Request_Approved_By_CSD_CSM_True</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>WBN_Owner_YBN_Production_Specialist</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
  RecordType.Name = "YBN Request",
  ISPICKVAL(YBNRequestReason__c, "Production Specialists"),
  ISPICKVAL(YBNRequestDetail__c, "Project"),
  OR(
    Request_Approved_By_CSD_CSM__c = True,
    CreatedBy.UserRoleId = "00E60000000umPx", /* YBN: Manager, Customer Success Consultants */ 
    CreatedBy.UserRoleId = "00E60000001J50u" /* YBN: Customer Success Director */ 
  )
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Web Dev Escalation - DL Web Dev</fullName>
        <actions>
            <name>Web_Dev_Escalated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>theorem,web dev,swiader,price,pekarek,chapman,cornwall,wilder,ruoss,cook,campbell,steve jones,michael lawson,foley,griffith,faulk</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsEscalated</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Web To Case</fullName>
        <actions>
            <name>Web_To_Case</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>contains</operation>
            <value>Client</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>National Client Support</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Web to Case - Outrank Support</fullName>
        <actions>
            <name>Case_Owner_to_Pooled</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Outrank Customer Support</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Winback 90 Day Close</fullName>
        <actions>
            <name>Update_AutoCloseDate_90_days_post_cancle</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Winback</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Deactivation_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Winback Subject Line</fullName>
        <actions>
            <name>Winback_Subject_Line</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Winback</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Saved/Winback</value>
        </criteriaItems>
        <description>This rules changes the winback case subject when closed and won back.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN %3E%3D %24500 Refund or Credit Approval Request Case Assigned</fullName>
        <actions>
            <name>YBN_500_Refund_Approval_Request_Case_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>&lt;= $500</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>YBN - Auto Create Outbound TP</fullName>
        <actions>
            <name>Attempt_Date_1_Now</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>X1st_Touch_Attempt_Made_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Outbound Touch Point</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Proactive Touch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_1_Method__c</field>
            <operation>equals</operation>
            <value>Auto-Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Resolution_Attempt_Status_1__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Attempt_Result_No_Answer</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Status_Needs_2nd_Attempt</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>YBN - AutoTP case</fullName>
        <actions>
            <name>Assign_to_AutoTP_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YBN_Auto_TP_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Outbound Touch Point</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Attempt_1_Method__c</field>
            <operation>equals</operation>
            <value>Auto-Email</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>YBN - Reporting - Notify of case update</fullName>
        <actions>
            <name>Notify_reporting_case_updated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notify the YBN reporting queue of updates to reporting related cases.</description>
        <formula>AND( 
OwnerId = "00G320000038bxI", /* YBN Reporting */ 
OR( 
RecordTypeId = "012600000009bw2", /* YBN Master */ 
RecordTypeId = "01232000000M3wJ" /* YBN Request */ 
), 
OR( 
ISCHANGED(Status), 
ISCHANGED(Estimated_Completion_Date__c) 
) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN - zip code %26 metropage analysis needed</fullName>
        <actions>
            <name>YBN_case_creator_to_alert_them_additional_analysis_for_zip_codes_is_required</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_zip_code_metropage_analysis_need</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Geo Targeting Analysis</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN 1500%2B Refund or Credit Approval Request Case Assigned</fullName>
        <actions>
            <name>YBN_1500_Refund_Approval_Request_Case_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>$1500+</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Chris McDowell</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Credit or Refund Denied</fullName>
        <actions>
            <name>YBN_Credit_or_Refund_Denied_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_credit_or_refund_denied_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND (3 or 4)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Credit Request,Refund Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CS_Approved__c</field>
            <operation>equals</operation>
            <value>Request Denied</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Finance_Approved__c</field>
            <operation>equals</operation>
            <value>Request Denied</value>
        </criteriaItems>
        <description>When either "CS Approved" or "Finance Approved" are denied update status owner and send notification email.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Default Auto Assign</fullName>
        <actions>
            <name>YBN_Case_Owner_to_Sarah_Mc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Created_by_Role__c</field>
            <operation>equals</operation>
            <value>Inbound Specialist,Outbound Specialist,Pin Collection Associate,Services Inbound,Services Outbound</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>YBN Inbound - Auto populate Subject</fullName>
        <actions>
            <name>YBN_Inbound_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Inbound Inquiry</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN Margin Change Request Denied</fullName>
        <actions>
            <name>YBN_Margin_Change_Request_Denied</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_credit_or_refund_denied_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Margin Change Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Finance_Approved__c</field>
            <operation>equals</operation>
            <value>Request Denied</value>
        </criteriaItems>
        <description>When "Finance Approved" is denied update status owner and send notification email.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated %241500%2B Refund</fullName>
        <actions>
            <name>YBN_Master_Escalated_1500_Refund</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>$1500+</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated %24501-%241500 Refund</fullName>
        <actions>
            <name>YBN_Master_Escalated_501_1500_Refund</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>$501-$1500</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated %3C%3D%24500 Refund</fullName>
        <actions>
            <name>YBN_Master_Escalated_500_Refund</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>&lt;= $500</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Billing</fullName>
        <actions>
            <name>YBN_Master_Escalated_Billing</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Billing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Custom Implementation</fullName>
        <actions>
            <name>YBN_Master_Escalated_Custom_Implementation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Custom Implementation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Email Marketing Client Qualification</fullName>
        <actions>
            <name>YBN_Escalated_Email_Marketing_Client_Qualification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Email Marketing Client Qualification</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Franchisee Issue</fullName>
        <actions>
            <name>YBN_Master_Escalated_Franchisee_Issue</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Franchisee Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated IL budget estimates</fullName>
        <actions>
            <name>YBN_Master_Escalated_IL_budget_estimates</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Budget estimate for existing IL account,Budget estimate for new IL account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Margin Request</fullName>
        <actions>
            <name>YBN_Master_Escalated_Margin_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Margin Change Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Marketing</fullName>
        <actions>
            <name>YBN_Master_Escalated_Marketing</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Marketing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Organic Ops</fullName>
        <actions>
            <name>YBN_Master_Escalated_Organic_Ops</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Organic Operations Request,Organic Audit Request,Custom SEO Keywords</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Organic Strategy</fullName>
        <actions>
            <name>YBN_Master_Escalated_Organic_Strategy</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Organic Consultation,Pre-launch Custom Content Creation,Zoom Rank Custom Reporting,SEO Keyword Strategy,Organic Site Audit Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated PES Team</fullName>
        <actions>
            <name>YBN_Master_Escalated_PES_Team</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Project</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>notEqual</operation>
            <value>Performance Reporting</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Performance Reporting</fullName>
        <actions>
            <name>YBN_Es</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Reporting</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Relationship Issue %28General%29</fullName>
        <actions>
            <name>YBN_Master_Escalated_Staffing_Service_Concerns</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Relationship Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated SEO Lead Estimates</fullName>
        <actions>
            <name>YBN_Master_Escalated_SEO_Lead_Estimates</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>SEO Lead Estimates</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated SF %2B YL Bulk Setup%2FUpdate</fullName>
        <actions>
            <name>YBN_Master_Escalated_SF_YL_Bulk_Setup_Update</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>ybn master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>SalesFroce + Yodle Live Bulk Setup,SalesForce + Yodle Live Bulk Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated SF Bulk Setup%2FUpdate</fullName>
        <actions>
            <name>YBN_Master_Escalated_SF_Bulk_Setup_Update</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>SalesForce Bulk Setup,SalesForce Bulk Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated SOW</fullName>
        <actions>
            <name>YBN_Master_Escalated_SOW</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.YBNRequestDetail__c</field>
            <operation>equals</operation>
            <value>SOW</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated Taxonomy</fullName>
        <actions>
            <name>YBN_Master_Taxonomy_Escalated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Taxonomy</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>when case reason = taxonomy and escalated checkbox is true</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated YL Bulk Setup%2FUpdate</fullName>
        <actions>
            <name>YBN_Master_Escalated_YL_Bulk_Setup_Update</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Yodle Live Bulk Setup,Yodle Live Bulk Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Master%3A Escalated relationship budgets %26 ROI calc</fullName>
        <actions>
            <name>YBN_Master_Escalated_relationship_budgets_ROI_calc</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Relationship budget &amp; performance estimates,ROI Calculator</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN National Client Support Email To Case</fullName>
        <actions>
            <name>YBN</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_Case_Owner_to_Sarah_McMillian</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>nationalclientsupport@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>spend alert,low advertising funds,flex,been in save mode for,been assigned to you,billing error,has accepted a change order,billing failed,unable to be billed,your monthly performance report,automatic reply,new case comment notification</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notContain</operation>
            <value>14-day decline alert,client spend alert,credit card declined,accts ready for cleanout,squeeze,smartsheet,auto-reactivated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Outbound - Auto populate Subject</fullName>
        <actions>
            <name>YBN_Outbound_TP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Outbound Touch Point</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN Performance or Budget Estimates</fullName>
        <actions>
            <name>YBN_perforamnce_estimtes_email_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>YBN Estimates</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Product Ideas Email To Case</fullName>
        <actions>
            <name>YBN_Case_Owner_to_YBN_Product_Ideas</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>YBNProductIdeas@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Blank for Email Catch All</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Relationship Budget Estimates Completed</fullName>
        <actions>
            <name>YBN_Relationship_Budget_Estimates_Completed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Budget Estimate for Existing Relationship,Budget Estimate for New Relationship</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Budget &amp; Performance Estimates</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Work Completed,Closed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN SOW Approved</fullName>
        <actions>
            <name>YBN_SOW_approved_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>sow_approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.YBNRequestDetail__c</field>
            <operation>equals</operation>
            <value>SOW</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Performance_Approved__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CS_Approved__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Web_Dev_Approved__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Integration_Team_Approved__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Finance_Approved__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN SOW Denied</fullName>
        <actions>
            <name>YBN_SOW_Denied</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>status_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND (3 or 4 or 5 or 6)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.YBNRequestDetail__c</field>
            <operation>equals</operation>
            <value>SOW</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Performance_Approved__c</field>
            <operation>equals</operation>
            <value>Request Denied</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CS_Approved__c</field>
            <operation>equals</operation>
            <value>Request Denied</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Web_Dev_Approved__c</field>
            <operation>equals</operation>
            <value>Request Denied</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Integration_Team_Approved__c</field>
            <operation>equals</operation>
            <value>Request Denied</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN SOW Submission</fullName>
        <actions>
            <name>YBN_SOW_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_update_case_status_for_sow</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.YBNRequestDetail__c</field>
            <operation>equals</operation>
            <value>SOW</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>YBN Update AD%2C SD and Manager Email Fields</fullName>
        <actions>
            <name>YBN_Update_AD_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YBN_Update_Case_Creator_Manager_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YBN_Update_SD_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YBN_Update_SD_Geo_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>2 and (1 or 3 or 4 OR 5)</booleanFilter>
        <criteriaItems>
            <field>Case.Account_Director_Email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sales_Director_Email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Creator_Manager_Email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SD_Geo_Email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Update Sales Case Creator Manager</fullName>
        <actions>
            <name>YBN_Update_Sale_Manager</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>YBN VM To Case</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>ybnpooledvm@yodle.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Web Submission Cases</fullName>
        <actions>
            <name>Case_Record_Type_YBN_Inbound_Inquiry</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>equals</operation>
            <value>SFDC Sync</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>YBN between %24501-%241500 Credit or Refund Approval Request Case Assigned</fullName>
        <actions>
            <name>YBN_Credit_or_Refund_between_501_1500_Created</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>$501-$1500</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>YBN case asigned to marketing</fullName>
        <actions>
            <name>YBN_Marketing_Case_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 or 2</booleanFilter>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>YBN Marketing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>contains</operation>
            <value>Collateral Request - Newsletter Entries,Collateral Request - Thought Leadership Articles,Product Collateral Initial Request,Product Collateral Updates,Email Marketing Program Request,Custom Email Marketing Request,MyCent,Collateral Request - Custom</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN credit or refund approved by VPs</fullName>
        <actions>
            <name>YBN_Credit_or_Refund_Approval_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_credit_or_refund_approved_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 8 AND ((3 AND 5) OR (3 AND 4 AND 6) OR (3 AND 4 AND 7))</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Credit Request,Refund Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CS_Approved__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Finance_Approved__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>&lt;= $500</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>$501-$1500</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>$1500+</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Credit_Refund_Reason__c</field>
            <operation>notEqual</operation>
            <value>Net Zero Refund: Payment mapping issue,Net Zero Refund: Wrong payment option billed,Net Zero Refund: Incorrectly billed upon CO acceptance,Credit: Sales Promotion</value>
        </criteriaItems>
        <description>When "CS Approved" and/or "Finance Approved" are checked update status owner and send notification email.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN custom implementation</fullName>
        <actions>
            <name>YBN_update_Status_of_Contract</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>YBN Custom Implementation Quote,YBN Custom Implementation Setup,YBN Bulk Onboarding,YBN Bulk Update</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Implementation Specialist Queue</value>
        </criteriaItems>
        <description>status initially updats to awaiting internal reponse</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN custom implementation approved notification</fullName>
        <actions>
            <name>notify_AD_when_status_of_custom_implementation_quote_moves_to_in_progress</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>YBN Custom Implementation Quote</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN email lead analyst</fullName>
        <actions>
            <name>ybn_email_lead_analyst</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Lead_Audit__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Date_Work_Completed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN margin change request approved by VPs</fullName>
        <actions>
            <name>YBN_Margin_Change_Request_Approved</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_credit_or_refund_approved_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Margin Change Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Finance_Approved__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <description>When "Finance Approved" is checked for a margin request update status owner and send notification email.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN master case asigned to billing</fullName>
        <actions>
            <name>YBN_Billing_Case_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>YBN Billing</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Budget Estimate for new relationship update substatus</fullName>
        <actions>
            <name>YBN_Update_status_to_In_Progress</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YBN_sub_status_to_geo_targeting_analysi</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Budget Estimate for New Relationship</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Franchisee Issue Resolved %28Director%29</fullName>
        <actions>
            <name>YBN_Franchisee_Issue_Resolved_Director</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Franchisee Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Michele Brevig</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Franchisee Issue Resolved %28Manager%29</fullName>
        <actions>
            <name>YBN_Franchisee_Issue_Resolved_Manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Franchisee Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Mia Pagonas,Cecily Bolton,Kristen Krzesicki</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Franchisee Issue Resolved %28VP%29</fullName>
        <actions>
            <name>YBN_Franchisee_Issue_Resolved_VP</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Franchisee Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Brandon Ramos</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Franchisee Issue Submitted %28Director%29</fullName>
        <actions>
            <name>YBN_Franchisee_Issue_Submitted_Director</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_Director_Level_Escalation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Franchisee Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Michele Brevig</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Fire_drill__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Franchisee Issue Submitted %28Manager%29</fullName>
        <actions>
            <name>YBN_Franchisee_Issue_Submitted_Manager</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_Manager_Level_Escalation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Franchisee Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Mia Pagonas,Cecily Bolton,Kristen Krzesicki</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Franchisee Issue Submitted %28VP%29</fullName>
        <actions>
            <name>YBN_Franchisee_Issue_Submitted_VP</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_VP_Level_Escalation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Franchisee Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Brandon Ramos</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Non-Escalation Path Issue Resolved</fullName>
        <actions>
            <name>YBN_Non_Escalation_Path_Issue_Resolved</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Franchisee Issue (General),Relationship Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>notEqual</operation>
            <value>Kristen Krzesicki,Cecily Bolton,Mia Pagonas,Michele Brevig,Jennifer Hendrickson,Kelly Rix,Brandon Ramos</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Notify Consultant Managers when Case Owner %3D National Client Support</fullName>
        <actions>
            <name>YBN</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>National Client Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Master,YBN Master</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Relationship Issue Resolved %28Director%29</fullName>
        <actions>
            <name>YBN_Relationship_Issue_Resolved_Director</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Relationship Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Michele Brevig</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Relationship Issue Resolved %28Manager%29</fullName>
        <actions>
            <name>YBN_Relationship_Issue_Resolved_Manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Relationship Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Jennifer Hendrickson,Matthew Machado</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Relationship Issue Resolved %28VP%29</fullName>
        <actions>
            <name>YBN_Relationship_Issue_Resolved_VP</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Relationship Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Brandon Ramos</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Relationship Issue Submitted %28Director%29</fullName>
        <actions>
            <name>YBN_Relationship_Issue_Submitted_Director</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_Director_Level_Escalation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Relationship Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Michele Brevig</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Fire_drill__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Relationship Issue Submitted %28Manager%29</fullName>
        <actions>
            <name>YBN_Relationship_Issue_Submitted_Manager</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_Manager_Level_Escalation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Relationship Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Jennifer Hendrickson,Matthew Machado</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Relationship Issue Submitted %28VP%29</fullName>
        <actions>
            <name>YBN_Relationship_Issue_Submitted_VP</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_VP_Level_Escalation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Relationship Issue (General)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Brandon Ramos</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A VP Approval Case Assigned</fullName>
        <actions>
            <name>YBN_New_Case_In_VP_Approval_Queue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>$1500+,$501-$1500</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Credit_Refund_Reason__c</field>
            <operation>notEqual</operation>
            <value>Net Zero Refund: Payment mapping issue,Net Zero Refund: Wrong payment option billed,Net Zero Refund: Incorrectly billed upon CO acceptance,Credit: Sales Promotion</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>VP Approval Queue</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A VP Margin Change Approval Case Assigned</fullName>
        <actions>
            <name>YBN_Margin_Change_Request_Submitted_for_approval</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Margin Change Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>VP Approval Queue</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A YBN Request From SE</fullName>
        <actions>
            <name>YBN_YBN_Request_Case_Closed_Notify_SE</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.YBNRequestReason__c</field>
            <operation>equals</operation>
            <value>Miscellaneous</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.YBNRequestDetail__c</field>
            <operation>equals</operation>
            <value>SE Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Yodle Gold Service - Manager Email</fullName>
        <actions>
            <name>Send_Email_to_Yodle_Gold_Email_Manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>YodleGoldService@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>Send an email to manager of the case submitter</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Yodle Gold Service Case Close</fullName>
        <actions>
            <name>Email_internal_user_of_Yodle_Gold_Closure</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Yodle Gold Service</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>contains</operation>
            <value>@Yodle.com,@lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <description>When a Yodle Gold Service  is closed, an email is sent to the Internal Web Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Z- LH - Assign James Martini</fullName>
        <actions>
            <name>priort_critical</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH OOS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Created_by_Role__c</field>
            <operation>notContain</operation>
            <value>admin,operations</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Created_by_Role__c</field>
            <operation>contains</operation>
            <value>inbound specialist</value>
        </criteriaItems>
        <description>Deactivated for this ticket:  https://jira.yodle.com/browse/YO-60625</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>budget change - renewals %26 upsells</fullName>
        <actions>
            <name>budget_difference_renewals_upsells</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Renewal / Upsell</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Budget change/no extension,Budget change/extension</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>budget decrease - closed email</fullName>
        <actions>
            <name>budget_decrease_closed_case_email_to_contact</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed - changes made</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Design_Fee__c</field>
            <operation>lessThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Budget change/no extension,Budget change/extension</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>channel ptnr-new case submitted</fullName>
        <actions>
            <name>priort_critical</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>type_new_chnl_ptnr</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Channel Partner-New Client</value>
        </criteriaItems>
        <description>makes sure the fields are filled out correctly when a new case is submitted by a channel ptnr to have the account set up in YL</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>sales promo  - new case</fullName>
        <actions>
            <name>description_client_id</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>subject_sales_promo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Sales Promotion</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>upsell %2F renewals - 12 month promo</fullName>
        <actions>
            <name>upsell_renewals_12_month_promo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Extension/no budget change,Budget change/extension</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Term_months__c</field>
            <operation>equals</operation>
            <value>12</value>
        </criteriaItems>
        <description>tells case owner to apply a 13th month free once the acceptance email has been received</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>upsell %2F renewals - 6 month promo</fullName>
        <actions>
            <name>upsell_renewals_6_month_promo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Extension/no budget change,Budget change/extension</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Term_months__c</field>
            <operation>equals</operation>
            <value>10,9,8,7,6,11</value>
        </criteriaItems>
        <description>tells case owner to apply a 20% credit to the budget once the acceptance email has been received</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>ybn - ncs case not touched in at least four days</fullName>
        <actions>
            <name>ybn_ncs_case_not_touched_in_at_least_four_days</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND (5 OR 6) AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>National - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>LIVE,Never launched,Organic GCC Complete,Dummy Account,Delete Case,Complete AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Channel_Type__c</field>
            <operation>equals</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>contains</operation>
            <value>cocos,parker small,april reynolds,kate mac,blew,kozsan,searight,cory morrison,emily currin,jessica head,alina torres,brandon barckley,casey o'mara,messerli,kate o'conor,kelly clements,lisa ferris,meagan barker,rachel fisher,harsh,brevig,jessica stewart</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Date_Time_Last_Owner_Changed__c</field>
            <operation>lessThan</operation>
            <value>LAST 4 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Actual_Resolution_Date__c</field>
            <operation>lessThan</operation>
            <value>LAST 4 DAYS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedDate</field>
            <operation>lessThan</operation>
            <value>LAST 4 DAYS</value>
        </criteriaItems>
        <description>alert when ncs case hasn't been touched in at leat four days</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>yodle live %3D origin</fullName>
        <actions>
            <name>origin_yodle_live</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>YodleLive</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx NCS Case Sub Status change notification</fullName>
        <actions>
            <name>NCS_case_notify_owner_on_Status_change</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Site Build</value>
        </criteriaItems>
        <description>Notify NCS Case owner when the NCS case sub status is changed to "Site Build"</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TORCHx Optimization Case completed Email notification to Client</fullName>
        <actions>
            <name>TORCHx_Optimization_case_Status_notification_to_Client</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Optimization</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed - Opt Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Type_Transactional__c</field>
            <operation>contains</operation>
            <value>TORCHx</value>
        </criteriaItems>
        <description>Once the TORCHx Service Performance Team completes/closes an Optimization Case. This sends an email notification to the client email address on the Account.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
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
        <description>Updated with https://jira.yodle.com/browse/YO-60625</description>
        <triggerType>onCreateOnly</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>National New Client Setup Create - Subject</fullName>
        <actions>
            <name>Subject_to_NCS_Product_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>National - New Client Setup</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case - Unscheduled Attempt</fullName>
        <actions>
            <name>Case_Scheduled_Call_to_blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>IMS_Rep_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Unscheduled - Reattempt,Unscheduled - 4+ Attempts</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outbound Call - Auto Close After 14 days</fullName>
        <actions>
            <name>Outbound_Call_Auto_Close_After_14_days</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Days_Open__c</field>
            <operation>greaterOrEqual</operation>
            <value>14</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Scheduled_Call__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>notEqual</operation>
            <value>Adoption Call</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Custom Message Migration</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Custom Message Migration</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Delayed Consumable</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Delayed Consumables,Site/Listings Teardown,Transports On/Off</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
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
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Master - Change to LH Future Request</fullName>
        <actions>
            <name>Case_Owner_to_LH_Future_Request</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Consolidating 3 Workflow Rules.  Disabling 2, removed this Field update on another one. Using Case to compare if values not in the list</description>
        <formula>AND( RecordTypeId = "012600000009bZX", /* LH Master RT */ TEXT(PRIORVALUE(Reason)) &lt;&gt; TEXT(Reason) /*True = ISCHANGED*/, /*check if the reason changed to something outside this list */ AND(     Case(      TEXT(Reason),      "Custom Message Migration",1,       "Delayed Consumables", 1,      "Remove Newsletter Special Pricing", 1,      "Site/Listings Teardown", 1,      "Transports On/Off",1,      0)    &lt;&gt;    Case(      TEXT(PRIORVALUE(Reason)),      "Custom Message Migration",1,       "Delayed Consumables", 1,      "Remove Newsletter Special Pricing", 1,      "Site/Listings Teardown", 1,      "Transports On/Off",1,      0) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Mary_Case_Task</fullName>
        <assignedTo>mary.kellum@yodle.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Mary Case Task</subject>
    </tasks>
</Workflow>
