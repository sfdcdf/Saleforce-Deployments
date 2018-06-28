<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Bolt_On_Backed_Out_Sale_Cancel_All</fullName>
        <ccEmails>support@boltontechnology.com;</ccEmails>
        <ccEmails>pmcgee@boltontechnology.com</ccEmails>
        <description>Bolt On Backed Out Sale - Cancel All</description>
        <protected>false</protected>
        <recipients>
            <recipient>bosteros@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Bolt_On_Cancellation_ProPack_Welcome_Station</template>
    </alerts><alerts>
        <fullName>Completed_LH_OOS_Email_Follow_up_Auto</fullName>
        <description>Completed - LH OOS Email Follow-up Auto</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_from_Acct__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Config_and_Install/OOS_Resolved_Auto</template>
    </alerts><alerts>
        <fullName>Completed_LH_OOS_Email_Follow_up_Dental_Chiro</fullName>
        <description>Completed - LH OOS Email Follow-up  Dental/Chiro</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_from_Acct__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Config_and_Install/OOS_Resolved_Medical</template>
    </alerts><alerts>
        <fullName>LH_Auto_Nov_Sales_Lab_Sale</fullName>
        <description>LH Auto Nov Sales Lab Sale</description>
        <protected>false</protected>
        <recipients>
            <recipient>gswanson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>megan.scully@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>lhprogrammanagement@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/LH_Auto_Nov_2015_Lab_Sale</template>
    </alerts><alerts>
        <fullName>LH_Auto_Retention_for_AR_Request_Form</fullName>
        <description>LH Auto Retention for AR Request Form Package Upsell</description>
        <protected>false</protected>
        <recipients>
            <recipient>bhickman@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kami.banner@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Auto_Retention/AR_Form_Created_for_LH_Auto_Retention</template>
    </alerts><alerts>
        <fullName>LH_CSC_Email_Recap_Dental</fullName>
        <ccEmails>support@lighthousepmg.com</ccEmails>
        <description>LH CSC Email Recap - Dental</description>
        <protected>false</protected>
        <recipients>
            <field>CSC_Recap_Email_Address_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Cost_Verification_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Medical_IB_OB/CSC_Recap_Dental_October_2016</template>
    </alerts><alerts>
        <fullName>LH_CSC_Email_Recap_Medical</fullName>
        <ccEmails>medicalsupport@lighthousepmg.com</ccEmails>
        <description>LH CSC Email Recap - Medical</description>
        <protected>false</protected>
        <recipients>
            <field>CSC_Recap_Email_Address_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Cost_Verification_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>medicalsupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Medical_IB_OB/CSC_Recap_Chiro</template>
    </alerts><alerts>
        <fullName>LH_CSC_Rescheduled</fullName>
        <description>LH CSC/AR Rescheduled</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Lighthouse_CW_Rescheduled</template>
    </alerts><alerts>
        <fullName>LH_Curve_Cloud_Install_Notification</fullName>
        <ccEmails>support@curvedental.com</ccEmails>
        <description>LH - Curve Cloud Install Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>jamartini@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mstaffieri@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Config_and_Install/Curve_Cloud_Install</template>
    </alerts><alerts>
        <fullName>LH_Install_Rescheduled</fullName>
        <description>LH Install Rescheduled</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Lighthouse_IW_Rescheduled</template>
    </alerts><alerts>
        <fullName>LH_Message_Activation_Email_Auto</fullName>
        <description>LH Message Activation Email - Auto</description>
        <protected>false</protected>
        <recipients>
            <field>CSC_Recap_Email_Address_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Cost_Verification_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Config_and_Install/Message_Activation_Auto_Oct_2016</template>
    </alerts><alerts>
        <fullName>LH_Message_Activation_Email_Chiro</fullName>
        <ccEmails>medicalsupport@lighthousepmg.com</ccEmails>
        <description>LH Message Activation Email - Chiro</description>
        <protected>false</protected>
        <recipients>
            <field>CSC_Recap_Email_Address_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Cost_Verification_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>medicalsupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Config_and_Install/Message_Activation_Chiro</template>
    </alerts><alerts>
        <fullName>LH_Message_Activation_Email_Dental</fullName>
        <ccEmails>support@lighthousepmg.com</ccEmails>
        <description>LH Message Activation Email - Dental</description>
        <protected>false</protected>
        <recipients>
            <field>CSC_Recap_Email_Address_2__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Cost_Verification_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Config_and_Install/Message_Activation_Dental_Oct_2016</template>
    </alerts><alerts>
        <fullName>LH_New_CS_Assigned</fullName>
        <description>LH - New CW/AR Assigned</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Lighthouse_CW_Assigned</template>
    </alerts><alerts>
        <fullName>LH_New_IW_Assigned</fullName>
        <description>LH - New IW Assigned</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Lighthouse_IW_Assigned</template>
    </alerts><alerts>
        <fullName>LH_OOS_Email_Follow_up_Auto</fullName>
        <description>LH OOS Email Follow-up Auto</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_from_Acct__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Config_and_Install/OOS_Followup_Auto</template>
    </alerts><alerts>
        <fullName>LH_OOS_Email_Follow_up_Dental_Chiro</fullName>
        <description>LH OOS Email Follow-up  Dental/Chiro</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_from_Acct__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Config_and_Install/OOS_Followup_Medical</template>
    </alerts><alerts>
        <fullName>LH_OOS_Updated_Email_Alert</fullName>
        <description>LH OOS Updated Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/OOS_Case_Updated</template>
    </alerts><alerts>
        <fullName>LH_Pre_CSC_Email_Auto</fullName>
        <description>LH Pre-CSC Email - Auto</description>
        <protected>false</protected>
        <recipients>
            <field>General_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_CSC/Pre_CSC_Email_Auto</template>
    </alerts><alerts>
        <fullName>LH_Pre_CSC_Email_Auto_w_ProPack</fullName>
        <description>LH Pre-CSC Email - Auto w. ProPack</description>
        <protected>false</protected>
        <recipients>
            <field>General_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_CSC/Pre_CSC_Email_Auto_w_ProPack</template>
    </alerts><alerts>
        <fullName>LH_Pre_CSC_Email_Chiro</fullName>
        <description>LH Pre-CSC Email - Chiro</description>
        <protected>false</protected>
        <recipients>
            <field>General_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>medicalsupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_CSC/Pre_CSC_Email_Chiro</template>
    </alerts><alerts>
        <fullName>LH_Pre_CSC_Email_Dental</fullName>
        <description>LH Pre-CSC Email - Dental</description>
        <protected>false</protected>
        <recipients>
            <field>General_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_CSC/Pre_CSC_Email_Dental</template>
    </alerts><alerts>
        <fullName>Lighthouse_BCF_Auto_IW</fullName>
        <description>Lighthouse BCF - Auto - IW</description>
        <protected>false</protected>
        <recipients>
            <field>General_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Business_Customization_Form_BCF_Auto</template>
    </alerts><alerts>
        <fullName>Lighthouse_BCF_Chiro_IW</fullName>
        <description>Lighthouse BCF - Chiro - IW</description>
        <protected>false</protected>
        <recipients>
            <field>General_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>medicalsupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Business_Customization_Form_BCF_Chiro</template>
    </alerts><alerts>
        <fullName>Lighthouse_Business_Customization_Form_Auto_New</fullName>
        <description>Lighthouse Business Customization Form - Auto - New</description>
        <protected>false</protected>
        <recipients>
            <field>General_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Business_Customization_Form_BCF_Auto_NEW</template>
    </alerts><alerts>
        <fullName>Post_CSC_Survey</fullName>
        <description>Post CSC Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_from_Acct__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Post_Setup_Survey_2</template>
    </alerts><alerts>
        <fullName>Post_CSC_Survey_Auto</fullName>
        <description>Post CSC Survey - Auto</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_from_Acct__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Auto_Lighthouse_Post_Setup_Survey</template>
    </alerts><alerts>
        <fullName>Post_Install_Survey</fullName>
        <description>Post Install Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_from_Acct__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Post_Install_Survey_2</template>
    </alerts><alerts>
        <fullName>Post_Install_Survey_Auto</fullName>
        <description>Post Install Survey - Auto</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_from_Acct__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Auto_Lighthouse_Post_Install_Survey</template>
    </alerts><alerts>
        <fullName>Worksheet_Assigned_to_LH_Auto_Support_send_email</fullName>
        <ccEmails>LHAutoTechBots@yodle.com</ccEmails>
        <description>Worksheet Assigned to LH Auto Support send email</description>
        <protected>false</protected>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/LH_Auto_Case_Owner</template>
    </alerts><alerts>
        <fullName>LH_Install_Backed_Out</fullName>
        <description>LH Install/CSC Backed Out</description>
        <protected>false</protected>
        <recipients>
            <recipient>alewis@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mstaffieri@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sjohnson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Lighthouse_Install_Backed_Out</template>
    </alerts><alerts>
        <fullName>LH_Install_Moved_to_Stalled</fullName>
        <description>LH Install Moved to Stalled</description>
        <protected>false</protected>
        <recipients>
            <recipient>alewis@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mstaffieri@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sjohnson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Lighthouse_Install_Stalled</template>
    </alerts><fieldUpdates>
        <fullName>AR_Request_Form_Subject_Default</fullName>
        <field>Subject__c</field>
        <formula>Yodle_ID__c +": " +Practice_Name__r.Name + " - AR Request"</formula>
        <name>LHW - Subject to AR Request</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Assign_to_LH_CSC_queue</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Training</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>LHW - Owner to LH CSC Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Auto_Support_Ticket_Subject_Default</fullName>
        <field>Subject__c</field>
        <formula>"Auto Support Ticket - "+ Yodle_ID__c</formula>
        <name>Auto Support Ticket Subject Default</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CABD2_Fill_out</fullName>
        <field>CABD2__c</field>
        <formula>CASE( MOD( DATEVALUE( Date_Time_Closed__c )  - DATE(1985,6,24),7),
0,CASE( MOD( DATEVALUE( Date_Time_Closed__c )  - DATEVALUE( Date_Time_Opened__c ) ,7),1,2,2,3,3,4,4,5,5,5,6,5,1),
1,CASE( MOD( DATEVALUE( Date_Time_Closed__c )  - DATEVALUE( Date_Time_Opened__c ) ,7),1,2,2,3,3,4,4,4,5,4,6,5,1),
2,CASE( MOD( DATEVALUE( Date_Time_Closed__c )  - DATEVALUE( Date_Time_Opened__c ) ,7),1,2,2,3,3,3,4,3,5,4,6,5,1),
3,CASE( MOD( DATEVALUE( Date_Time_Closed__c )  - DATEVALUE( Date_Time_Opened__c ) ,7),1,2,2,2,3,2,4,3,5,4,6,5,1),
4,CASE( MOD( DATEVALUE( Date_Time_Closed__c )  - DATEVALUE( Date_Time_Opened__c ) ,7),1,1,2,1,3,2,4,3,5,4,6,5,1),
5,CASE( MOD( DATEVALUE( Date_Time_Closed__c )  - DATEVALUE( Date_Time_Opened__c ) ,7),1,0,2,1,3,2,4,3,5,4,6,5,0),
6,CASE( MOD( DATEVALUE( Date_Time_Closed__c )  - DATEVALUE( Date_Time_Opened__c ) ,7),1,1,2,2,3,3,4,4,5,5,6,5,0),
999) 
+
(FLOOR(( DATEVALUE( Date_Time_Closed__c )  - DATEVALUE( Date_Time_Opened__c ) )/7)*5-1)</formula>
        <name>CABD2 Fill out</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CSC_Completed_Date_to_Today</fullName>
        <field>CSC_Completed_Date__c</field>
        <formula>TODAY()</formula>
        <name>CSC Completed Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CSC_Worksheet_Subject_Default</fullName>
        <field>Subject__c</field>
        <formula>Yodle_ID__c +": "+Practice_Name__r.Name + " - CSC Worksheet"</formula>
        <name>CSC Worksheet Subject Default</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>City_State_to_Account_Client_Market</fullName>
        <field>City_and_State__c</field>
        <formula>Practice_Name__r.Client_Market__c</formula>
        <name>City &amp; State to Account Client Market</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Client_Email_from_Acct</fullName>
        <field>Client_Email_from_Acct__c</field>
        <formula>Client_Email__c</formula>
        <name>Client Email from Acct Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Copy_General_Email_to_Appt_Email</fullName>
        <field>Appointment_email__c</field>
        <formula>General_email__c</formula>
        <name>Copy General Email to Appt Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Curve_Install_Email_Sent_TRUE</fullName>
        <field>Curve_Install_Email_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Curve Install Email Sent TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Time_Closed_System_to_NOW</fullName>
        <field>DT_Closed_Sys__c</field>
        <formula>NOW()</formula>
        <name>Date/Time Closed System to NOW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Time_Logo_Complete</fullName>
        <field>Date_Time_Logo_Complete__c</field>
        <formula>now()</formula>
        <name>Date/Time Logo Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Time_Logo_Ready</fullName>
        <field>Date_Time_Logo_Ready__c</field>
        <formula>now()</formula>
        <name>Date/Time Logo Ready</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Time_Post_Install_In_Progress</fullName>
        <field>Date_Time_Post_Install_In_Progress__c</field>
        <formula>now()</formula>
        <name>Date/Time Post Install In Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_CHIRO_Friday</fullName>
        <field>Email_Friday__c</field>
        <literalValue>7</literalValue>
        <name>Email Schedule Default CHIRO - Friday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_CHIRO_Monday</fullName>
        <field>Email_Monday__c</field>
        <literalValue>7</literalValue>
        <name>Email Schedule Default CHIRO - Monday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_CHIRO_Saturday</fullName>
        <field>Email_Saturday__c</field>
        <literalValue>7</literalValue>
        <name>Email Schedule Default CHIRO - Saturday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_CHIRO_Sunday</fullName>
        <field>Email_Sunday__c</field>
        <literalValue>7</literalValue>
        <name>Email Schedule Default CHIRO - Sunday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_CHIRO_Thursday</fullName>
        <field>Email_Thursday__c</field>
        <literalValue>7</literalValue>
        <name>Email Schedule Default CHIRO - Thursday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_CHIRO_Tuesday</fullName>
        <field>Email_Tuesday__c</field>
        <literalValue>7</literalValue>
        <name>Email Schedule Default CHIRO - Tuesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_CHIRO_Wednesday</fullName>
        <field>Email_Wednesday__c</field>
        <literalValue>7</literalValue>
        <name>Email Schedule Default CHIRO - Wednesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_Friday</fullName>
        <field>Email_Friday__c</field>
        <literalValue>4</literalValue>
        <name>Email Schedule Default DENTAL - Friday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_Monday</fullName>
        <field>Email_Monday__c</field>
        <literalValue>6</literalValue>
        <name>Email Schedule Default DENTAL - Monday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_Saturday</fullName>
        <field>Email_Saturday__c</field>
        <literalValue>4</literalValue>
        <name>Email Schedule Default DENTAL - Saturday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_Sunday</fullName>
        <field>Email_Sunday__c</field>
        <literalValue>4</literalValue>
        <name>Email Schedule Default DENTAL - Sunday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_Thursday</fullName>
        <field>Email_Thursday__c</field>
        <literalValue>4</literalValue>
        <name>Email Schedule Default DENTAL - Thursday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_Tuesday</fullName>
        <field>Email_Tuesday__c</field>
        <literalValue>6</literalValue>
        <name>Email Schedule Default DENTAL - Tuesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Schedule_Default_Wednesday</fullName>
        <field>Email_Wednesday__c</field>
        <literalValue>4</literalValue>
        <name>Email Schedule Default DENTAL - Wed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>IW_Complete_Date_Time_LH_IW</fullName>
        <field>IW_Complete_Date_Time__c</field>
        <formula>now()</formula>
        <name>IW Complete Date/Time - LH IW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initial_Backed_Out_Date_to_Today</fullName>
        <field>Initial_Backed_Out_Date__c</field>
        <formula>TODAY()</formula>
        <name>Initial Backed Out Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initial_CSC_AR_Date_time_stamp</fullName>
        <field>Initial_CSC_AR_Date__c</field>
        <formula>CSC_Date__c</formula>
        <name>Initial CSC/AR Date time stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initial_Scheduled_Install_Date_Fill_In</fullName>
        <field>Initial_Scheduled_Install_Date__c</field>
        <formula>Date_Time_Install_Scheduled__c</formula>
        <name>Initial Scheduled Install Date Fill In</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initial_Stall_Date_to_Today</fullName>
        <field>Initial_Stall_date__c</field>
        <formula>TODAY()</formula>
        <name>Initial Stall Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Install_Completed_Date_to_Today</fullName>
        <field>Install_Date__c</field>
        <formula>TODAY()</formula>
        <name>Install Completed Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Install_Difficulty_to_Basic</fullName>
        <field>Install_Difficulty__c</field>
        <literalValue>Basic (10-20 mins)</literalValue>
        <name>Install Difficulty to Basic</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Install_Difficulty_to_Complex</fullName>
        <field>Install_Difficulty__c</field>
        <literalValue>Complex (30-60 mins)</literalValue>
        <name>Install Difficulty to Complex</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Install_Difficulty_to_Extensive</fullName>
        <field>Install_Difficulty__c</field>
        <literalValue>Extensive (20-40 mins)</literalValue>
        <name>Install Difficulty to Extensive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Install_Difficulty_to_Routine</fullName>
        <field>Install_Difficulty__c</field>
        <literalValue>Routine (15-30 mins)</literalValue>
        <name>Install Difficulty to Routine</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Install_Difficulty_to_Variable</fullName>
        <field>Install_Difficulty__c</field>
        <literalValue>Variable</literalValue>
        <name>Install Difficulty to Variable</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Installation_Worksheet_Subject_Default</fullName>
        <field>Subject__c</field>
        <formula>Yodle_ID__c +": "+Practice_Name__r.Name + " - Installation Worksheet"</formula>
        <name>Installation Worksheet Subject Default</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_1st_Attempt_By_to_User_F_L_Name</fullName>
        <field>X1st_Attempt_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>LH - 1st Attempt By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_2nd_Attempt_By_to_User_F_L_Name</fullName>
        <field>X2nd_Attempt_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>LH 2nd Attempt By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_3rd_Attempt_By_to_User_F_L_Name</fullName>
        <field>X3rd_Attempt_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>LH 3rd Attempt By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_4th_Attempt_By_to_User_F_L_Name</fullName>
        <field>X4th_Attempt_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>LH 4th Attempt By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_IW_QAed_By_Stamp</fullName>
        <field>QAed_By_Name__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>LH IW QAed By Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_IW_QAed_Date_Stamp</fullName>
        <field>QAed__c</field>
        <formula>Now()</formula>
        <name>LH IW QAed Date Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_Priority_to_1_Attempt</fullName>
        <field>Priority__c</field>
        <literalValue>1 Attempt</literalValue>
        <name>LH Priority to 1 Attempt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_Priority_to_2_Attempts</fullName>
        <field>Priority__c</field>
        <literalValue>2 Attempts</literalValue>
        <name>LH Priority to 2 Attempts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_Priority_to_3_Attempts</fullName>
        <field>Priority__c</field>
        <literalValue>3 Attempts</literalValue>
        <name>LH Priority to 3 Attempts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_Priority_to_4_Attempts</fullName>
        <field>Priority__c</field>
        <literalValue>4 Attempts</literalValue>
        <name>LH Priority to 4 Attempts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MA_Date_to_Today</fullName>
        <field>MA_Date__c</field>
        <formula>TODAY()</formula>
        <name>MA Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MA_Ready</fullName>
        <field>Time_Message_Activated__c</field>
        <formula>now()</formula>
        <name>MA Ready</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Most_Recent_Communication_Date_to_Today</fullName>
        <field>Most_Recent_Communication_Date__c</field>
        <formula>today()</formula>
        <name>Most Recent Communication Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Schedule_Default_Friday</fullName>
        <field>OBC_Friday__c</field>
        <literalValue>2</literalValue>
        <name>OBC Schedule Default DENTAL - Friday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Schedule_Default_Monday</fullName>
        <field>OBC_Monday__c</field>
        <literalValue>4</literalValue>
        <name>OBC Schedule Default DENTAL - Monday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Schedule_Default_Saturday</fullName>
        <field>OBC_Saturday__c</field>
        <literalValue>2</literalValue>
        <name>OBC Schedule Default DENTAL - Saturday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Schedule_Default_Sunday</fullName>
        <field>OBC_Sunday__c</field>
        <literalValue>2</literalValue>
        <name>OBC Schedule Default DENTAL - Sunday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Schedule_Default_Thursday</fullName>
        <field>OBC_Thursday__c</field>
        <literalValue>2</literalValue>
        <name>OBC Schedule Default DENTAL - Thursday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Schedule_Default_Tuesday</fullName>
        <field>OBC_Tuesday__c</field>
        <literalValue>4</literalValue>
        <name>OBC Schedule Default DENTAL - Tuesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Schedule_Default_Wednesday</fullName>
        <field>OBC_Wednesday__c</field>
        <literalValue>2</literalValue>
        <name>OBC Schedule Default DENTAL - Wednesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Scheduled_Default_CHIRO_Friday</fullName>
        <field>OBC_Friday__c</field>
        <literalValue>1</literalValue>
        <name>OBC Scheduled Default CHIRO - Friday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Scheduled_Default_CHIRO_Monday</fullName>
        <field>OBC_Monday__c</field>
        <literalValue>1</literalValue>
        <name>OBC Scheduled Default CHIRO - Monday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Scheduled_Default_CHIRO_Saturday</fullName>
        <field>OBC_Saturday__c</field>
        <literalValue>1</literalValue>
        <name>OBC Scheduled Default CHIRO - Saturday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Scheduled_Default_CHIRO_Sunday</fullName>
        <field>OBC_Sunday__c</field>
        <literalValue>1</literalValue>
        <name>OBC Scheduled Default CHIRO - Sunday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Scheduled_Default_CHIRO_Thursday</fullName>
        <field>OBC_Thursday__c</field>
        <literalValue>1</literalValue>
        <name>OBC Scheduled Default CHIRO - Thursday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Scheduled_Default_CHIRO_Tuesday</fullName>
        <field>OBC_Tuesday__c</field>
        <literalValue>1</literalValue>
        <name>OBC Scheduled Default CHIRO - Tuesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OBC_Scheduled_Default_CHIRO_Wednesday</fullName>
        <field>OBC_Wednesday__c</field>
        <literalValue>1</literalValue>
        <name>OBC Scheduled Default CHIRO - Wednesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Owner_to_LH_CSC</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Training</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Owner to LH CSC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Owner_to_LH_Install</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Install</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Owner to LH Install</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Phone_Number_to_Account_Phone_Number</fullName>
        <field>Office_Phone__c</field>
        <formula>Practice_Name__r.Phone</formula>
        <name>Phone Number to Account Phone Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Post_CSC_Survey_Checkbox</fullName>
        <field>Post_CSC_Survey_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Post-CSC Survey Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Post_Install_Ready_LH_IW</fullName>
        <field>Post_Install_Ready__c</field>
        <formula>now()</formula>
        <name>Post Install Ready -LH IW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Post_Install_Survey_Sent_Checkbox</fullName>
        <field>Post_Install_Survey_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Post-Install Survey Sent Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Private_Portal_to_Account_Private_Portal</fullName>
        <field>Private_Portal__c</field>
        <formula>Practice_Name__r.LH_Client_Portal__c</formula>
        <name>Private Portal to Account Private Portal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Status_to_New</fullName>
        <field>Status__c</field>
        <literalValue>New</literalValue>
        <name>Status to New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Status_to_Stalled</fullName>
        <field>Status__c</field>
        <literalValue>Stalled</literalValue>
        <name>Status to Stalled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_to_RFC</fullName>
        <field>Sub_Status__c</field>
        <literalValue>RFC</literalValue>
        <name>Sub Status to RFC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Subject_for_PMS_Swap_Form</fullName>
        <field>Subject__c</field>
        <formula>"PMS Swap / G5 Upgrade - " + Practice_Name__r.Name + " - " + Yodle_ID__c</formula>
        <name>Subject for PMS Swap Form</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Subject_to_LH_Out_of_Sync</fullName>
        <field>Subject__c</field>
        <formula>"LH Out of Sync - "+ Yodle_ID__c</formula>
        <name>Subject to LH Out of Sync</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_CHIRO_Friday</fullName>
        <field>Text_Friday__c</field>
        <literalValue>2</literalValue>
        <name>Text Schedule Default CHIRO - Friday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_CHIRO_Monday</fullName>
        <field>Text_Monday__c</field>
        <literalValue>2</literalValue>
        <name>Text Schedule Default CHIRO - Monday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_CHIRO_Saturday</fullName>
        <field>Text_Saturday__c</field>
        <literalValue>2</literalValue>
        <name>Text Schedule Default CHIRO - Saturday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_CHIRO_Sunday</fullName>
        <field>Text_Sunday__c</field>
        <literalValue>2</literalValue>
        <name>Text Schedule Default CHIRO - Sunday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_CHIRO_Thursday</fullName>
        <field>Text_Thursday__c</field>
        <literalValue>2</literalValue>
        <name>Text Schedule Default CHIRO - Thursday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_CHIRO_Tuesday</fullName>
        <field>Text_Tuesday__c</field>
        <literalValue>2</literalValue>
        <name>Text Schedule Default CHIRO - Tuesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_CHIRO_Wednesday</fullName>
        <field>Text_Wednesday__c</field>
        <literalValue>2</literalValue>
        <name>Text Schedule Default CHIRO - Wednesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_Friday</fullName>
        <field>Text_Friday__c</field>
        <literalValue>3</literalValue>
        <name>Text Schedule Default DENTAL - Friday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_Monday</fullName>
        <field>Text_Monday__c</field>
        <literalValue>5</literalValue>
        <name>Text Schedule Default DENTAL - Monday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_Saturday</fullName>
        <field>Text_Saturday__c</field>
        <literalValue>3</literalValue>
        <name>Text Schedule Default DENTAL - Saturday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_Sunday</fullName>
        <field>Text_Sunday__c</field>
        <literalValue>3</literalValue>
        <name>Text Schedule Default DENTAL - Sunday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_Thursday</fullName>
        <field>Text_Thursday__c</field>
        <literalValue>3</literalValue>
        <name>Text Schedule Default DENTAL - Thursday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_Tuesday</fullName>
        <field>Text_Tuesday__c</field>
        <literalValue>5</literalValue>
        <name>Text Schedule Default DENTAL - Tuesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Text_Schedule_Default_Wednesday</fullName>
        <field>Text_Wednesday__c</field>
        <literalValue>3</literalValue>
        <name>Text Schedule Default DENTAL - Wednesday</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Time_MA_Entered_In_Progress</fullName>
        <field>MA_Ready_In_Progress__c</field>
        <formula>now()</formula>
        <name>Time MA Entered In Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Initial_Scheduled_Date</fullName>
        <field>Initial_Scheduled_CSC_Date__c</field>
        <formula>CSC_Date__c</formula>
        <name>Update Initial Scheduled Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Owner_to_LH_Config_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Config_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Owner to LH Config Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>AR Request Form Created</fullName>
        <actions>
            <name>AR_Request_Form_Subject_Default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>AR Request Form</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>AR Request Form Created by Support</fullName>
        <actions>
            <name>Assign_to_LH_CSC_queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>equals</operation>
            <value>inbound specialist,lighthouse inbound</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>AR Request Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Support_Reason__c</field>
            <operation>notEqual</operation>
            <value>Package Upsell</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>notContain</operation>
            <value>Auto</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Assign Auto Upsell to Install</fullName>
        <actions>
            <name>Owner_to_LH_Install</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Auto Support Ticket</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Support_Reason__c</field>
            <operation>equals</operation>
            <value>Package Upsell</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Assign Auto Upsell to Install - when created</fullName>
        <actions>
            <name>Owner_to_LH_Install</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Auto Support Ticket</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Auto Support Ticket Created</fullName>
        <actions>
            <name>Auto_Support_Ticket_Subject_Default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Auto Support Ticket</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Bolt On Backed Sale - Cancel All</fullName>
        <actions>
            <name>Bolt_On_Backed_Out_Sale_Cancel_All</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Backed Out Sale</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.LH_Package__c</field>
            <operation>contains</operation>
            <value>Lighthouse + PP</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CSC Completed Date Fill-in</fullName>
        <actions>
            <name>CSC_Completed_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(

OR(
ISPICKVAL( Status__c ,"MA-1 Ready"),
ISPICKVAL( Status__c ,"MA-2 Pending Review")),

ISBLANK( CSC_Completed_Date__c ),

CONTAINS( RecordType.Name ,"CSC Worksheet"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>CSC Worksheet Created</fullName>
        <actions>
            <name>CSC_Worksheet_Subject_Default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>contains</operation>
            <value>CSC Worksheet</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Convert IW to CW - RFC</fullName>
        <actions>
            <name>Assign_to_LH_CSC_queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CSC_Worksheet_Subject_Default</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Status_to_Stalled</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sub_Status_to_RFC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
PRIORVALUE (RecordTypeId) = "012600000009a0h",
CONTAINS( RecordType.Name ,"CSC Worksheet"),
ISBLANK( CSC_Date__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Convert IW to CW - Scheduled</fullName>
        <actions>
            <name>Assign_to_LH_CSC_queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CSC_Worksheet_Subject_Default</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Status_to_New</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
PRIORVALUE (RecordTypeId) = "012600000009a0h",
CONTAINS( RecordType.Name ,"CSC Worksheet"),
NOT(ISBLANK( CSC_Date__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Copy General Email to Appt Email</fullName>
        <actions>
            <name>Copy_General_Email_to_Appt_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.General_email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Appointment_email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Date%2FTime Closed System</fullName>
        <actions>
            <name>CABD2_Fill_out</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Date_Time_Closed_System_to_NOW</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Date%2FTime Logo Complete</fullName>
        <actions>
            <name>Date_Time_Logo_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Logo Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Date%2FTime Logo Ready</fullName>
        <actions>
            <name>Date_Time_Logo_Ready</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Logo Ready</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Date%2FTime Post Install In Progress</fullName>
        <actions>
            <name>Date_Time_Post_Install_In_Progress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Post Install In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Defer Until Filled Out - OOS Wksht</fullName>
        <actions>
            <name>Owner_to_LH_Install</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(

AND(
ISCHANGED(  Defer_Until__c  ),
NOT(ISBLANK(Defer_Until__c))),

  RecordTypeId  = "012600000009cWo")</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Email Schedule Default - Dental</fullName>
        <actions>
            <name>Email_Schedule_Default_Friday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_Monday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_Saturday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_Sunday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_Thursday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_Tuesday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_Wednesday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Email_Schedule__c</field>
            <operation>equals</operation>
            <value>Default</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Dental</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Email Schedule Default - Medical</fullName>
        <actions>
            <name>Email_Schedule_Default_CHIRO_Friday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_CHIRO_Monday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_CHIRO_Saturday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_CHIRO_Sunday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_CHIRO_Thursday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_CHIRO_Tuesday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Email_Schedule_Default_CHIRO_Wednesday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Email_Schedule__c</field>
            <operation>equals</operation>
            <value>Default</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Medical</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>IW Complete Date%2FTime - LH IW</fullName>
        <actions>
            <name>IW_Complete_Date_Time_LH_IW</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.IW_Complete_Date_Time__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initial Backed Out Date</fullName>
        <actions>
            <name>Initial_Backed_Out_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Backed Out Sale</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Initial_Backed_Out_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initial CSC%2FAR Date time stamp</fullName>
        <actions>
            <name>Initial_CSC_AR_Date_time_stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Initial_CSC_AR_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>contains</operation>
            <value>CSC</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initial Scheduled Install Date</fullName>
        <actions>
            <name>Initial_Scheduled_Install_Date_Fill_In</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Initial_Scheduled_Install_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Date_Time_Install_Scheduled__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Initial Stall Date</fullName>
        <actions>
            <name>Initial_Stall_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Stalled,Backed Out Sale</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Initial_Stall_date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Install Completed Date Fill-in</fullName>
        <actions>
            <name>Install_Completed_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISPICKVAL( Status__c ,"Post Install Ready"),
ISBLANK(  Install_Date__c  ),
RecordTypeId = "012600000009a0h")</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Install Difficulty to Basic</fullName>
        <actions>
            <name>Install_Difficulty_to_Basic</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 4) AND 3</booleanFilter>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet,PMS Swap Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.PMS__c</field>
            <operation>equals</operation>
            <value>Dentrix,Eaglesoft,Easy Dental,EZDent,Open Dental,Practice Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.New_PMS__c</field>
            <operation>equals</operation>
            <value>Dentrix,Eaglesoft,Easy Dental,EZDent,Open Dental,Practice Web</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Install Difficulty to Complex</fullName>
        <actions>
            <name>Install_Difficulty_to_Complex</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 4) AND 3</booleanFilter>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet,PMS Swap Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.PMS__c</field>
            <operation>equals</operation>
            <value>Eclipse/BestNotes,First Pacific Pro,Medisoft,Mogo</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.New_PMS__c</field>
            <operation>equals</operation>
            <value>Eclipse/Best Notes,First Pacific Pro,Medisoft,Mogo</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Install Difficulty to Extensive</fullName>
        <actions>
            <name>Install_Difficulty_to_Extensive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 4) AND 3</booleanFilter>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet,PMS Swap Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.PMS__c</field>
            <operation>equals</operation>
            <value>Compulink/ChiroAdvantage,DSN,Future Health,MacPractice,NAPA TRACS,PracticeWorks,Tracker</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.New_PMS__c</field>
            <operation>equals</operation>
            <value>Compulink/ChiroAdvantage,DSN,Future Health,MacPractice,NAPA TRACS,PracticeWorks,Tracker</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Install Difficulty to Routine</fullName>
        <actions>
            <name>Install_Difficulty_to_Routine</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 4) AND 3</booleanFilter>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet,PMS Swap Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.PMS__c</field>
            <operation>equals</operation>
            <value>Abeldent,ACOM Health,Autumn8,Chiro 8000,Chirotouch,Dolphin,EON TPS Chiro 2000,OCS Dental,Ortho2,OrthoTrac,Softdent,WinOMS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.New_PMS__c</field>
            <operation>equals</operation>
            <value>Abeldent,ACOM Health,Autumn8,Chiro 8000,Chirotouch,Dolphin,EON TPS Chiro 2000,OCS Dental,Ortho2,OrthoTrac,Softdent,WinOMS</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Install Difficulty to Variable</fullName>
        <actions>
            <name>Install_Difficulty_to_Variable</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet,PMS Swap Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.PMS__c</field>
            <operation>notEqual</operation>
            <value>Abeldent,ACOM Health,Autumn8,Chiro 8000,Chirotouch,Compulink/ChiroAdvantage,Dentrix,Dolphin,DSN,Eaglesoft,Easy Dental,Eclipse/BestNotes,EON TPS Chiro 2000,EZDent,First Pacific Pro,Future Health,MacPractice,Medisoft,Mogo,NAPA TRACS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.New_PMS__c</field>
            <operation>notEqual</operation>
            <value>Abeldent,ACOM Health,Autumn8,Chiro 8000,Chirotouch,Compulink/ChiroAdvantage,Dentrix,Dolphin,DSN,Eaglesoft,Easy Dental,Eclipse/Best Notes,EON TPS Chiro 2000,EZDent,First Pacific Pro,Future Health,MacPractice,Medisoft,Mogo,NAPA TRACS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.PMS__c</field>
            <operation>notEqual</operation>
            <value>EON TPS Chiro 2000,OCS Dental,Open Dental,Ortho2,OrthoTrac,Practice Web,PracticeWorks,Softdent,Tracker,WinOMS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.New_PMS__c</field>
            <operation>notEqual</operation>
            <value>EON TPS Chiro 2000,OCS Dental,Open Dental,Ortho2,OrthoTrac,Practice Web,PracticeWorks,Softdent,Tracker,WinOMS</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Installation Worksheet Created</fullName>
        <actions>
            <name>Installation_Worksheet_Subject_Default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH - Curve Cloud Install</fullName>
        <actions>
            <name>LH_Curve_Cloud_Install_Notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Curve_Install_Email_Sent_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.PMS__c</field>
            <operation>equals</operation>
            <value>Curve</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Curve_Install_Email_Sent__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>LH - New CW%2FAR Assigned</fullName>
        <actions>
            <name>LH_New_CS_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(

OR(
CONTAINS( RecordType.Name ,"CSC Worksheet"),
RecordType.Name = "AR Request Form"),

OR(
ISPICKVAL( Status__c ,"New"),
ISPICKVAL(Status__c,"RFC")),

 NOT(OwnerId = "00G60000001mKtM"),
 ISCHANGED(OwnerId) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LH - New IW Assigned</fullName>
        <actions>
            <name>LH_New_IW_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
 RecordTypeId = "012600000009a0h",
 NOT(OwnerId = "00G60000001mKtM"),
 ISCHANGED(OwnerId),
$UserRole.Id &lt;&gt; "00E60000001Gham" )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LH Auto Nov 2015 Lab Sale</fullName>
        <actions>
            <name>LH_Auto_Nov_Sales_Lab_Sale</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>contains</operation>
            <value>auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Install_Meeting_Notes__c</field>
            <operation>contains</operation>
            <value>ellison,abston,truxillo,cox,izquierdo,bouldin,mm lab,manager lab</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>LH Auto%2C Package Upsell to LH Retention</fullName>
        <actions>
            <name>LH_Auto_Retention_for_AR_Request_Form</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Owner_to_LH_CSC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>AR Request Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>contains</operation>
            <value>Auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Support_Reason__c</field>
            <operation>equals</operation>
            <value>Package Upsell</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>New,Stalled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH CSC%2FAR Rescheduled</fullName>
        <actions>
            <name>LH_CSC_Rescheduled</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
(OwnerId &lt;&gt;  $User.Id ),
OR(
ISCHANGED( CSC_Date__c ),
ISCHANGED( CSC_Time__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LH IW QAed</fullName>
        <actions>
            <name>LH_IW_QAed_By_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_IW_QAed_Date_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.IW_QAed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH Install Rescheduled</fullName>
        <actions>
            <name>LH_Install_Rescheduled</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
OwnerId &lt;&gt;  $User.Id ,
ISCHANGED( Date_Time_Install_Scheduled__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LH Install Stalled</fullName>
        <actions>
            <name>LH_Install_Moved_to_Stalled</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Stalled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH Install and CW fill in %22Client Email from Acct%22</fullName>
        <actions>
            <name>Client_Email_from_Acct</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Dental,Installation Worksheet,CSC Worksheet - Medical,CSC Worksheet - Auto</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>LH Install%2FCSC Backed Out</fullName>
        <actions>
            <name>LH_Install_Backed_Out</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet,CSC Worksheet - Dental,CSC Worksheet - Medical,CSC Worksheet - Auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Backed Out Sale</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>rozenblat</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH OOS Created</fullName>
        <actions>
            <name>Owner_to_LH_Install</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Subject_to_LH_Out_of_Sync</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH OOS</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>LH OOS Field Updates</fullName>
        <actions>
            <name>City_State_to_Account_Client_Market</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Phone_Number_to_Account_Phone_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Private_Portal_to_Account_Private_Portal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH OOS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.City_and_State__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Office_Phone__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH OOS Updated Email Alert</fullName>
        <actions>
            <name>LH_OOS_Updated_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH OOS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Updated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH OOS fill in %22Client Email from Acct%22</fullName>
        <actions>
            <name>Client_Email_from_Acct</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH OOS,CSC Worksheet - Dental,Installation Worksheet,CSC Worksheet - Medical,CSC Worksheet - Auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>New,Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH Pre-CSC Email - Auto</fullName>
        <actions>
            <name>LH_Pre_CSC_Email_Auto</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.CSC_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Message_Manager_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH Pre-CSC Email - Auto w%2E ProPack</fullName>
        <actions>
            <name>LH_Pre_CSC_Email_Auto_w_ProPack</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.CSC_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Message_Manager_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH Pre-CSC Email - Chiro</fullName>
        <actions>
            <name>LH_Pre_CSC_Email_Chiro</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Medical</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.CSC_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH Pre-CSC Email - Dental</fullName>
        <actions>
            <name>LH_Pre_CSC_Email_Dental</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Dental</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.CSC_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LH RFC to Scheduled</fullName>
        <actions>
            <name>Status_to_New</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
ISBLANK(PRIORVALUE ( CSC_Date__c )), 
NOT(ISBLANK(CSC_Date__c)),
ISPICKVAL( Status__c ,"RFC"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LHOOS - Attempt 1</fullName>
        <actions>
            <name>LH_1st_Attempt_By_to_User_F_L_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Priority_to_1_Attempt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH OOS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Attempt_Date_1__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.X1st_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LHOOS - Attempt 2</fullName>
        <actions>
            <name>LH_2nd_Attempt_By_to_User_F_L_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Priority_to_2_Attempts</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH OOS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Attempt_Date_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.X2nd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LHOOS - Attempt 3</fullName>
        <actions>
            <name>LH_3rd_Attempt_By_to_User_F_L_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Priority_to_3_Attempts</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH OOS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Attempt_Date_3__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.X3rd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>LHOOS - Attempt 4</fullName>
        <actions>
            <name>LH_4th_Attempt_By_to_User_F_L_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Priority_to_4_Attempts</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH OOS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Attempt_Date_4__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.X4th_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Lighthouse Business Customization Form %28BCF%29 - Auto - NEW</fullName>
        <actions>
            <name>Lighthouse_Business_Customization_Form_Auto_New</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>contains</operation>
            <value>Auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Subject__c</field>
            <operation>notContain</operation>
            <value>CSC</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Lighthouse Fast Track Email - Chiro</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>contains</operation>
            <value>Chiropractor</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Install_Meeting_Notes__c</field>
            <operation>notContain</operation>
            <value>BRS,GOETZE,EDDSON,XLDent,Curve</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Subject__c</field>
            <operation>notContain</operation>
            <value>CSC</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Lighthouse Fast Track Email - Dental</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>contains</operation>
            <value>Dentist,Ortho</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Install_Meeting_Notes__c</field>
            <operation>notContain</operation>
            <value>BRS,GOETZE,EDDSON,XLDent,Curve</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Subject__c</field>
            <operation>notContain</operation>
            <value>CSC</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>MA Ready</fullName>
        <actions>
            <name>MA_Ready</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Messages Activated,MA-6 Ready/Config Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.MA_Ready_In_Progress__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>contains</operation>
            <value>CSC Worksheet</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Most Recent Communication Date</fullName>
        <actions>
            <name>Most_Recent_Communication_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Communication_Notes__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>OBC Schedule Default - Dental</fullName>
        <actions>
            <name>OBC_Schedule_Default_Friday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Schedule_Default_Monday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Schedule_Default_Saturday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Schedule_Default_Sunday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Schedule_Default_Thursday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Schedule_Default_Tuesday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Schedule_Default_Wednesday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.OBC_Schedule__c</field>
            <operation>equals</operation>
            <value>Default</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Dental</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>OBC Schedule Default - Medical</fullName>
        <actions>
            <name>OBC_Scheduled_Default_CHIRO_Friday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Scheduled_Default_CHIRO_Monday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Scheduled_Default_CHIRO_Saturday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Scheduled_Default_CHIRO_Sunday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Scheduled_Default_CHIRO_Thursday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Scheduled_Default_CHIRO_Tuesday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OBC_Scheduled_Default_CHIRO_Wednesday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.OBC_Schedule__c</field>
            <operation>equals</operation>
            <value>Default</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Medical</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>OOS Category%2FDetails Other</fullName>
        <actions>
            <name>Owner_to_LH_Install</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.OOS_Category__c</field>
            <operation>equals</operation>
            <value>Other</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.OOS_Details__c</field>
            <operation>equals</operation>
            <value>Other</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Owner %3D LH Auto Support 2</fullName>
        <actions>
            <name>Worksheet_Assigned_to_LH_Auto_Support_send_email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.OwnerId</field>
            <operation>equals</operation>
            <value>LH Auto Support</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>PMS Swap Form Created</fullName>
        <actions>
            <name>Subject_for_PMS_Swap_Form</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>PMS Swap Form</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Post Install Ready -LH IW</fullName>
        <actions>
            <name>Post_Install_Ready_LH_IW</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Post_Install_Ready__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Post Install Ready</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Send Post CSC Survey</fullName>
        <actions>
            <name>Post_CSC_Survey</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Post_CSC_Survey_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Dental,CSC Worksheet - Medical</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Messages Activated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>notContain</operation>
            <value>Auto</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Send Post CSC Survey - AUTO</fullName>
        <actions>
            <name>Post_CSC_Survey_Auto</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Post_CSC_Survey_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Messages Activated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>contains</operation>
            <value>Auto</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Send Post Install Survey</fullName>
        <actions>
            <name>Post_Install_Survey</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Post_Install_Survey_Sent_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>notContain</operation>
            <value>Auto</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Send Post Install Survey - AUTO</fullName>
        <actions>
            <name>Post_Install_Survey_Auto</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Post_Install_Survey_Sent_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Installation Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>contains</operation>
            <value>Auto</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Status is Messages Activated</fullName>
        <actions>
            <name>MA_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Messages Activated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Status to RFC</fullName>
        <actions>
            <name>Assign_to_LH_CSC_queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Status_to_Stalled</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sub_Status_to_RFC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>AR Request Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.CSC_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Segment__c</field>
            <operation>notContain</operation>
            <value>Auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Support_Reason__c</field>
            <operation>notEqual</operation>
            <value>Package Upsell</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Text Schedule Default - Dental</fullName>
        <actions>
            <name>Text_Schedule_Default_Friday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_Monday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_Saturday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_Sunday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_Thursday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_Tuesday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_Wednesday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Text_Schedule__c</field>
            <operation>equals</operation>
            <value>Default</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Dental</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Text Schedule Default - Medical</fullName>
        <actions>
            <name>Text_Schedule_Default_CHIRO_Friday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_CHIRO_Monday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_CHIRO_Saturday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_CHIRO_Sunday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_CHIRO_Thursday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_CHIRO_Tuesday</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Text_Schedule_Default_CHIRO_Wednesday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Text_Schedule__c</field>
            <operation>equals</operation>
            <value>Default</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Worksheet - Medical</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Time MA Entered In Progress</fullName>
        <actions>
            <name>Time_MA_Entered_In_Progress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>MA-1 Ready</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.MA_Ready_In_Progress__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.RecordTypeId</field>
            <operation>contains</operation>
            <value>CSC Worksheet</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Update Initial Scheduled Date</fullName>
        <actions>
            <name>Update_Initial_Scheduled_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Initial_Scheduled_CSC_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.CSC_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Updates when Status %3D MA-1 or MA-2</fullName>
        <actions>
            <name>Update_Owner_to_LH_Config_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lighthouse_Worksheets__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending Message Activation,MA-1 Ready,MA-2 Pending Review,MA-8 Multi Location Split</value>
        </criteriaItems>
        <description>Updates when status MA-1,MA-2, or MA-8</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>
