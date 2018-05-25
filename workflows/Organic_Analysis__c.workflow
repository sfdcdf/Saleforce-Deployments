<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Escalation_Email_Alert</fullName>
        <description>Escalation Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Escalation_Standard</template>
    </alerts><alerts>
        <fullName>Lighthouse_Received_Pins</fullName>
        <description>Lighthouse - Received Pins</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercare@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Pin_Collection_Templates/Lighthouse_Received_All_Pins</template>
    </alerts><alerts>
        <fullName>Maps_Initial_Claiming_Pin_Added</fullName>
        <ccEmails>pinsupport@yodle.com</ccEmails>
        <description>Maps Initial Claiming Pin Added</description>
        <protected>false</protected>
        <recipients>
            <recipient>sschoppert@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Initial_Maps_Pin_Added</template>
    </alerts><alerts>
        <fullName>National_Canada_Day_1_Pin</fullName>
        <description>National - Canada Day 1 Pin</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>pinsupport@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Pin_Collection_Templates/Canada_Pin_Day_1</template>
    </alerts><alerts>
        <fullName>National_PIN_Received</fullName>
        <description>National - PIN Received</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>pinsupport@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Pin_Collection_Templates/Canada_Pin_Received</template>
    </alerts><alerts>
        <fullName>Organic_Case_Feedback_Needed</fullName>
        <description>Organic Case Feedback Needed</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Case_Feedback_Needed</template>
    </alerts><alerts>
        <fullName>Organic_Cases_Underperformer_Organic_Consult</fullName>
        <description>Organic Cases - Underperformer &amp; Organic Consult</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Cases_Underperforming_Consult_Assigned_to_User</template>
    </alerts><alerts>
        <fullName>Rogers_Day_1_Google_Pin_Request</fullName>
        <description>Rogers - Day 1 Google Pin Request</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>pinsupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Pin_Collection_Templates/YO_Rogers_Pin_Email_Day_1</template>
    </alerts><alerts>
        <fullName>Rogers_Google_Not_Bing</fullName>
        <description>Rogers Google Not Bing</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>rogerssupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Pin_Collection_Templates/Rogers_Google_Not_Bing</template>
    </alerts><alerts>
        <fullName>Rogers_Google_PIN_Needed_Email</fullName>
        <description>Rogers - Google PIN Needed Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>rogerssupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Pin_Collection_Templates/Rogers_Bing_Not_Google</template>
    </alerts><alerts>
        <fullName>Rogers_Google_Pin_Received</fullName>
        <description>Rogers - Google Pin Received</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>pinsupport@service.rogersoutrank.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Pin_Collection_Templates/YO_Rogers_Pin_Received</template>
    </alerts><alerts>
        <fullName>YBN_Organic_Case_Escalation</fullName>
        <description>YBN: Organic Case Escalation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>YBN_Organic_Escalations</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>IMS_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Escalation_Standard</template>
    </alerts><fieldUpdates>
        <fullName>Assign_To_PIN_Team</fullName>
        <field>OwnerId</field>
        <lookupValue>PinCollection</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>OC - Owner to Pin Collection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Check_Escalated</fullName>
        <field>Escalated__c</field>
        <literalValue>1</literalValue>
        <name>Check Escalated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Check_Google_White_List_box</fullName>
        <field>Google_White_List_Test__c</field>
        <literalValue>1</literalValue>
        <name>Check Google White List box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Check_IsClosed_checkbox_on_Organic_Cases</fullName>
        <field>IsClosed__c</field>
        <literalValue>1</literalValue>
        <name>Check IsClosed checkbox on Organic Cases</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Check_Manager_Approved_Escalation_Field</fullName>
        <field>Manager_Approved_Escalation__c</field>
        <literalValue>1</literalValue>
        <name>Check Manager Approved Escalation Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Cleaned_Out_Date</fullName>
        <description>-update cleaned out date field with date</description>
        <field>Cleaned_Out_Date__c</field>
        <formula>Today()</formula>
        <name>Cleaned Out Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Client_ID</fullName>
        <field>Client_ID__c</field>
        <formula>Account_Name__r.Client_ID__c</formula>
        <name>Client ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Client_ID_Organic_Consult_case</fullName>
        <field>Client_ID__c</field>
        <formula>Account_Name__r.Client_ID__c</formula>
        <name>Client ID Organic Consult case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Google_Account_Status_to_Active</fullName>
        <field>Google_Account_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Google Account Status to Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Google_Listing_status_to_Active_Listing</fullName>
        <field>Google_Listing_Status__c</field>
        <literalValue>Active Listing</literalValue>
        <name>Google Listing status to Active Listing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Google_Login_Email_Clears_out</fullName>
        <field>Google_Login_Email__c</field>
        <name>Google Login Email Clears out</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Google_Login_Password_Clears_Out</fullName>
        <field>Google_Login_Password__c</field>
        <name>Google Login Password Clears Out</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Google_Status_to_Google_Whitelist</fullName>
        <field>Google_Listing_Created__c</field>
        <literalValue>Google Whitelist</literalValue>
        <name>Google Status to Google Whitelist</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Immediate_Teardown_Checkbox</fullName>
        <description>check the Immediate Teardown Checbox</description>
        <field>Listing_Teardown_Request__c</field>
        <literalValue>1</literalValue>
        <name>Immediate Teardown Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Live_Date</fullName>
        <field>Live_Date__c</field>
        <formula>Account_Name__r.Live_Date__c</formula>
        <name>Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Attempts_to_Contact_Update</fullName>
        <field>Attempts_to_Contact__c</field>
        <name>MICC - Attempts to Contact Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>NextValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Attempts_to_Contact_to_0</fullName>
        <field>Pin_Resend_Attempts__c</field>
        <name>MICC - Attempts to Contact to 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_B_Pin_Receipt_Date_Input</fullName>
        <field>B_Pin_Receipt__c</field>
        <formula>today()</formula>
        <name>MICC - B PIN Receipt to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_B_Pin_Receipt_to_None</fullName>
        <field>B_PIN_Received_By__c</field>
        <name>MICC - B Pin Received by to None</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Bing_Pin_Receipt_to_None</fullName>
        <field>B_Pin_Receipt__c</field>
        <name>MICC - Bing Pin Receipt to Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Bing_Pin_Resent</fullName>
        <field>Claimed_Listing_new__c</field>
        <name>MICC - Bing Pin Resent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Bing_Resend_Attempts_Update</fullName>
        <field>B_Pin_Resend_Attempts__c</field>
        <name>MICC - Bing Resend Attempts Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>NextValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Claimed_Listing_Updates_Bing</fullName>
        <field>Claimed_Listing_new__c</field>
        <literalValue>Bing</literalValue>
        <name>Claimed Listing Set to Bing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Claimed_Listing_Updates_Both</fullName>
        <field>Claimed_Listing_new__c</field>
        <literalValue>Google, Bing</literalValue>
        <name>Claimed Listing to Google, Bing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Claimed_Listing_Updates_Google</fullName>
        <field>Claimed_Listing_new__c</field>
        <literalValue>Google</literalValue>
        <name>MICC - Claimed Listing Updates Google</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_G_Pin_Receipt_Date_Input</fullName>
        <field>G_Pin_Receipt__c</field>
        <formula>today()</formula>
        <name>MICC - G Pin Receipt Date Input</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_G_Pin_Receipt_to_None</fullName>
        <field>G_Pin_Receipt__c</field>
        <name>MICC - G Pin Receipt to None</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_G_Pin_Received_by_to_None</fullName>
        <field>G_PIN_Received_By__c</field>
        <name>MICC - G Pin Received by to None</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Google_Resend_Attempts_Update</fullName>
        <field>Pin_Resend_Attempts__c</field>
        <name>MICC - Google Resend Attempts Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>NextValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Populate_Client_ID</fullName>
        <field>Client_ID__c</field>
        <formula>Account_Name__r.Client_ID__c</formula>
        <name>MICC - Populate Client ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Rebuild_Date_Changes_Google_Resen</fullName>
        <field>Pin_Resend_Attempts__c</field>
        <name>MICC - Rebuild Date Changes Google Resen</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Status_Update_to_Non_Compliant_Cl</fullName>
        <field>Status__c</field>
        <literalValue>Non Compliant Client</literalValue>
        <name>MICC - Status Update to Non Compliant Cl</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Status_to_All_Tasks_Completed</fullName>
        <field>Status__c</field>
        <literalValue>All Tasks Completed</literalValue>
        <name>MICC - Status to All Tasks Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>MICC_Status_to_Pending_Pin_Receipt_Upd</fullName>
        <field>Status__c</field>
        <literalValue>Pending Pin Receipt</literalValue>
        <name>MICC - Status to Pending Pin Receipt Upd</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Manager_Approved_For_Escalation_Check</fullName>
        <field>Manager_Approved_Escalation__c</field>
        <literalValue>1</literalValue>
        <name>Manager Approved For Escalation Check</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Move_Case_to_SEO_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>SEO_Marketing_Ops</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Move Case to SEO Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Move_Organic_Case_to_Manager_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Local_Manager_Approval_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Move Organic Case to Manager Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OC_Google_Listing_Status_to_No_Listing</fullName>
        <field>Google_Listing_Status__c</field>
        <literalValue>No Listing</literalValue>
        <name>OC - Google Listing Status to No Listing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>OC_Google_Setup_Address_Issue</fullName>
        <field>Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>OC - Google Setup:Address Issue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OC_Google_Setup_Address_Issue_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>SEO_Marketing_Ops</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>OC - Google Setup:Address Issue Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OC_Owner_to_YBN_SEO_Operations</fullName>
        <field>OwnerId</field>
        <lookupValue>YBN_SEO_Operations</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>OC - Owner to YBN SEO Operations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OV_Enter_Date</fullName>
        <field>OV_Enter_Date__c</field>
        <formula>today()</formula>
        <name>OV Enter Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>OV_Leave_Date</fullName>
        <field>OV_Leave_Date__c</field>
        <formula>today()</formula>
        <name>OV Leave Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>OV_Managed_for_Google_Listing_Status</fullName>
        <field>Google_Listing_Status__c</field>
        <literalValue>Owner-Verified/Managed</literalValue>
        <name>OV Managed for Google Listing Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>OV_Managed_for_OV_Status</fullName>
        <field>Owner_Verified_Status__c</field>
        <literalValue>Owner-Verified/Managed</literalValue>
        <name>OV Managed for OV Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>OV_Max_Attempts_Do_Not_Call_Enter_Date</fullName>
        <field>OV_Max_Attempts_Do_Not_Call_Date__c</field>
        <formula>NOW()</formula>
        <name>OV Max Attempts - Do Not Call Enter Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OV_Max_Attempts_when_out_of_OV</fullName>
        <field>OV_Max_Attempts__c</field>
        <literalValue>0</literalValue>
        <name>OV Max Attempts when out of OV</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OV_Pending_Management</fullName>
        <field>Owner_Verified_Status__c</field>
        <literalValue>Owner-Verified/Pending Management</literalValue>
        <name>OV Pending Management</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Open_Date_on_Organic_Case</fullName>
        <field>Open_Date__c</field>
        <formula>today()</formula>
        <name>Open Date on Organic Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Optimization_Clock_Start_Date</fullName>
        <field>Optimization_Clock_Start_Date__c</field>
        <formula>TODAY()</formula>
        <name>Optimization Clock Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Organic_Maps_Close_Date</fullName>
        <field>Closed_Date__c</field>
        <formula>now()</formula>
        <name>Organic Case Closed Date to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Organic_Optimization_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>SEO_Marketing_Ops</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Organic Case Owner to SEO Marketing Ops</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Owner_Update_to_SDB_Users</fullName>
        <field>OwnerId</field>
        <lookupValue>itpro@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner Update to SDB Users</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>PAN_Contact_Date_when_Reattempt_status</fullName>
        <field>Contact_Date__c</field>
        <formula>CASE( 
MOD( TODAY() - DATE(1900, 1, 7 ), 7 ),
1, NOW() + 2,
2, NOW() + 2,
3, NOW() + 2,
4, NOW() + 4,
5, NOW() + 4,
6, NOW() + 2,
NOW () + 1
)

/*1/7/1900 was a Sunday, 0 = Sunday, 1= Monday, 2 = Tuesday, 3 = Wednesday, 4 = Thursday, 5 = Friday, 6 = Saturday */</formula>
        <name>PAN - Contact Date when Reattempt status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>PAN_Maps_Contact_Google_Support_to_Pin</fullName>
        <description>For Pin Action Needed Case</description>
        <field>OwnerId</field>
        <lookupValue>PinCollection</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>PAN - Maps Contact Google Support to Pin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Pin_Action_Needed_Assignment_to_IT_Pro</fullName>
        <field>OwnerId</field>
        <lookupValue>IT_Pro_SEO_Optimization</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Pin Action Needed Assignment to IT Pro</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Pin_Action_Needed_Subject_Line_Populate</fullName>
        <field>Subject__c</field>
        <formula>"PAN -  "&amp;text(Pin_Action_Reason__c)</formula>
        <name>Pin Action Needed Subject Line Populate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Proxy_IP_Used_Clears_Out</fullName>
        <field>Proxy_IP_Used__c</field>
        <name>Proxy IP Used Clears Out</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Reopened_Date</fullName>
        <description>Reopened date populates with date of reopen</description>
        <field>Reopened_Date__c</field>
        <formula>now()</formula>
        <name>Reopened Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Reopened_checkbox_checked</fullName>
        <description>Reopened Checkbox = Checked</description>
        <field>Reopened__c</field>
        <literalValue>1</literalValue>
        <name>Reopened checkbox checked</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>SDB_Escalation_Request_Date</fullName>
        <field>Escalation_Request_Date__c</field>
        <formula>Today()</formula>
        <name>Organic Case Escalation Request to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>SEO_Mops_Completed_Date</fullName>
        <field>Date_Left_SEO_Mops__c</field>
        <formula>now()</formula>
        <name>SEO Mops Completed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Segment</fullName>
        <field>Segment__c</field>
        <formula>Account_Name__r.Secondary_Segments__c</formula>
        <name>Segment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Set_Claimed_Listing_to_Google</fullName>
        <field>Claimed_Listing_new__c</field>
        <literalValue>Google</literalValue>
        <name>Claimed Listing Set to Google</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Set_Claiming_Listing_to_None</fullName>
        <field>Claimed_Listing_new__c</field>
        <name>Claiming Listing Set to Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Set_Client_Services_Manager</fullName>
        <field>Client_Services_Manager__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>Set Client Services Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Setup_Date</fullName>
        <field>Setup_Date__c</field>
        <formula>CreatedDate</formula>
        <name>Setup Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Teardown_Date</fullName>
        <field>Teardown_Date__c</field>
        <formula>Today()</formula>
        <name>Teardown Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Time_Left_SEO_MOps</fullName>
        <field>Time_Left_SEO_MOps__c</field>
        <formula>now()</formula>
        <name>Time Left SEO MOps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Client_Phone</fullName>
        <field>Client_Phone_Number__c</field>
        <formula>Account_Name__r.Phone</formula>
        <name>Update Client Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Date_Moved_to_Google_Rebuild</fullName>
        <field>Date_Moved_to_Google_Account_Rebuild__c</field>
        <formula>NOW()</formula>
        <name>Update Date Moved to Google Rebuild</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Date_for_Bing_Rebuild_Needed</fullName>
        <field>Date_Moved_to_Bing_Rebuild_Needed__c</field>
        <formula>Now()</formula>
        <name>Update Date for Bing Rebuild Needed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Date_for_Google_Listing_Rebuild</fullName>
        <field>Date_Moved_to_Google_Listing_Rebuild__c</field>
        <formula>Now()</formula>
        <name>Update Date for Google Listing Rebuild</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Google_PIN_Send_Attempts</fullName>
        <field>Google_PIN_Send_Attempts__c</field>
        <formula>Google_PIN_Send_Attempts__c + 1</formula>
        <name>Update Google PIN Send Attempts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Status_New</fullName>
        <field>Status__c</field>
        <literalValue>New</literalValue>
        <name>Update Status - New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Status_Pending_Manager_Approval</fullName>
        <field>Status__c</field>
        <literalValue>Pending Manager Approval</literalValue>
        <name>Update Status - Pending Manager Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>YBN_Pan_Case_Owner_Update</fullName>
        <field>OwnerId</field>
        <lookupValue>YBN_Production_Specialists</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>YBN Pan Case Owner Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><outboundMessages>
        <fullName>AlpenhornCaseChange_OrganicCaseObject</fullName>
        <apiVersion>27.0</apiVersion>
        <endpointUrl>https://live.yodle.com:8443/ws/caseProcessingService</endpointUrl>
        <fields>Id</fields>
        <fields>IsClosed__c</fields>
        <fields>Issue_ID__c</fields>
        <fields>Name</fields>
        <fields>Subject2__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>sfsync@yodle.com</integrationUser>
        <name>AlpenhornCaseChange-OrganicCaseObject</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages><outboundMessages>
        <fullName>SDO_Maps_Initial_Claiming_Case_Updated</fullName>
        <apiVersion>26.0</apiVersion>
        <endpointUrl>https://live.yodle.com:8443/ws/caseProcessingService</endpointUrl>
        <fields>B_Pin_Receipt__c</fields>
        <fields>Categories_Inputted_Into_Hotfrog_ca__c</fields>
        <fields>Categories_Inputted_Into_Ibegin__c</fields>
        <fields>Categories_Inputted_Into_Ourbis_ca__c</fields>
        <fields>Categories_Inputted_Into_Yellowpages_ca__c</fields>
        <fields>Categories_Inputted_into_BLocal__c</fields>
        <fields>Categories_Inputted_into_GLocal__c</fields>
        <fields>Categories_Inputted_into_Weblocal__c</fields>
        <fields>Category_2_Inputted_into_GLocal__c</fields>
        <fields>Category_3_Inputted_into_GLocal__c</fields>
        <fields>Category_4_Inputted_into_GLocal__c</fields>
        <fields>Category_5_Inputted_into_GLocal__c</fields>
        <fields>Client_ID__c</fields>
        <fields>G_Pin_Receipt__c</fields>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>sfsync@yodle.com</integrationUser>
        <name>SDO: Maps Initial Claiming Case Updated</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages><rules>
        <fullName>Add Client Phone Number to Case</fullName>
        <actions>
            <name>Update_Client_Phone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Phone_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>AlpenhornCaseChangeRule-OrganicCaseObject</fullName>
        <actions>
            <name>AlpenhornCaseChange_OrganicCaseObject</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Assign To PIN Team</fullName>
        <actions>
            <name>Assign_To_PIN_Team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 5 AND 8) OR (1 AND 2 AND 8 AND ((3 or 6) AND (4 or 7)))</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>PIN Action Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Bing_Account__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Google_Account_2__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>notEqual</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Bing_Account__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Google_Account_2__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Pin_Action_Reason__c</field>
            <operation>notEqual</operation>
            <value>Pin Received,Pin Resend needed,Multiple Pins Received</value>
        </criteriaItems>
        <description>assign PIN Action Needed cases to that team upon creation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Auto-Verified %3D True</fullName>
        <actions>
            <name>Google_Listing_status_to_Active_Listing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_White_List_Test__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When “Auto-Verified” box is checked, automatically update “Google Listing Status” to “Active Listing”</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Calculate Google PIN Send Attempts</fullName>
        <actions>
            <name>Update_Google_PIN_Send_Attempts</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( G_Postcard_Request__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Check IsClosed checkbox on Organic Cases</fullName>
        <actions>
            <name>Check_IsClosed_checkbox_on_Organic_Cases</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>contains</operation>
            <value>Closed,Opt Not Completed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Client ID</fullName>
        <actions>
            <name>Client_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Rogers Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Client ID Organic Consult case</fullName>
        <actions>
            <name>Client_ID_Organic_Consult_case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>This fills in the client ID when it is left blank</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Date Moved to Bing Rebuild Needed</fullName>
        <actions>
            <name>Update_Date_for_Bing_Rebuild_Needed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Bing_Listing_Created__c</field>
            <operation>equals</operation>
            <value>Bing Rebuild Needed</value>
        </criteriaItems>
        <description>update date moved to bing rebuild needed when Bing Status=Bing Rebuild Needed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Date Moved to Google Account Rebuild</fullName>
        <actions>
            <name>Update_Date_Moved_to_Google_Rebuild</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Created__c</field>
            <operation>equals</operation>
            <value>Google Account Rebuild</value>
        </criteriaItems>
        <description>update date moved to google account rebuild when Google Status=Google Account Rebuild</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Date Moved to Google Listing Rebuild</fullName>
        <actions>
            <name>Update_Date_for_Google_Listing_Rebuild</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Created__c</field>
            <operation>equals</operation>
            <value>Google Listing Rebuild</value>
        </criteriaItems>
        <description>update date moved to google account rebuild when Google Status=Google listing Rebuild</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Escalated Opt Case</fullName>
        <actions>
            <name>Check_Escalated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Priority__c</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Manager_Approved_Escalation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>notContain</operation>
            <value>YBN</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Escalation Email</fullName>
        <actions>
            <name>Escalation_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Optimization</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse,YBN</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Google Listing Status is Active to Google</fullName>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Claimed_Listing_to_Google</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Active Listing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>When Google Listing Status is Active and Claimed Listing is Blank - Set Claimed Listing to "Google" and G Pin Receipt to Today</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Google Listing Status is Active to Google%2C Bing</fullName>
        <actions>
            <name>MICC_Claimed_Listing_Updates_Both</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Active Listing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>Bing</value>
        </criteriaItems>
        <description>When Google Listing Status is Active and Claimed Listing is "Bing" - Set Claimed Listing to "Google, Bing" and G Pin Receipt to Today</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Google Listing Status is Awaiting Pin</fullName>
        <actions>
            <name>MICC_G_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting PIN</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Google Listing Status is Awaiting Pin - Google</fullName>
        <actions>
            <name>MICC_G_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Claiming_Listing_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3) AND 4</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting PIN,Client Refuses Claim,Error Message,Needs Re-Verification,Owner-Verified/Pending Management</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>Google</value>
        </criteriaItems>
        <description>When Google Listing Status is Awaiting PIN, Client Refuses Claim, Error Message, or Needs Re-Verification and Claimed Listing is Google - Set Claimed Listing to "Null" and G Pin Receipt to Null</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Google Listing Status is Awaiting Pin - Google%2C Bing</fullName>
        <actions>
            <name>MICC_Claimed_Listing_Updates_Bing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3) AND 4</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting PIN,Client Refuses Claim,Error Message,Needs Re-Verification</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>"Google, Bing"</value>
        </criteriaItems>
        <description>When Google Listing Status is Awaiting PIN, Client Refuses Claim, Error Message, or Needs Re-Verification and Claimed Listing is Google - Set Claimed Listing to "Bing" and G Pin Receipt to Null</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Google White List check from account level</fullName>
        <actions>
            <name>Google_Listing_status_to_Active_Listing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_White_List_Test__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Google White List checked - Update Google Account Status %26 Clear Proxy IP Used</fullName>
        <actions>
            <name>Google_Account_Status_to_Active</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Google_Login_Email_Clears_out</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Google_Login_Password_Clears_Out</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Proxy_IP_Used_Clears_Out</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_White_List_Test__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Lighthouse Received All Pins</fullName>
        <actions>
            <name>Lighthouse_Received_Pins</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Pin_Receipt__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.B_Pin_Receipt__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Product_Type_Account__c</field>
            <operation>contains</operation>
            <value>Outrank</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Product_Type_Account__c</field>
            <operation>contains</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Non Compliant Client</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Listing Keyword Update Case - Organic Opt Case</fullName>
        <actions>
            <name>Owner_Update_to_SDB_Users</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Reason_for_Submission__c</field>
            <operation>includes</operation>
            <value>Listing Keyword Update (SDB Only)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Live Date</fullName>
        <actions>
            <name>Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Live_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - All Tasks Completed New 1</fullName>
        <actions>
            <name>MICC_B_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Claimed_Listing_Updates_Both</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Status_to_All_Tasks_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 or 2 or 3 or 4 or 5) and 6 and 7 and 8 and 9</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_1_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_2_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_3_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_4_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Created__c</field>
            <operation>equals</operation>
            <value>New Listing Created and Claimed,Listing Resides in Bulk Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bing_Listing_Created__c</field>
            <operation>equals</operation>
            <value>New Listing Created and Claimed,Listing Resides in Bulk Account,Existing Listing Claimed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.B_Pin_Receipt__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Hecker</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - All Tasks Completed New 1B</fullName>
        <actions>
            <name>MICC_Claimed_Listing_Updates_Both</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Status_to_All_Tasks_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 or 2 or 3 or 4 or 5 OR 10) and 6 and 7 and 8 and 9</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_1_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_2_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_3_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_4_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Created__c</field>
            <operation>equals</operation>
            <value>Listing Resides in Bulk Account,Google Whitelist</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bing_Listing_Created__c</field>
            <operation>equals</operation>
            <value>Listing Resides in Bulk Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Pin_Receipt__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Luikart</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Active Listing</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Attempts to Contact Update</fullName>
        <actions>
            <name>MICC_Attempts_to_Contact_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ischanged(  Date_of_Last_Contact__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>MICC - Attempts to Contact to 0</fullName>
        <actions>
            <name>MICC_Attempts_to_Contact_to_0</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ischanged( Rebuild_Date__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>MICC - B Pin Receipt Date Input</fullName>
        <actions>
            <name>MICC_B_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>Bing,"Google, Bing"</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Hecker</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.B_Pin_Receipt__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - B Pin Receipt to Null when Claimed Listing Set to Null or Google</fullName>
        <actions>
            <name>MICC_Bing_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>Google</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - B Pin Receipt to today when Claimed Listing set to Bing%2C %22Google%2C Bing%22</fullName>
        <actions>
            <name>MICC_B_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>Bing,"Google, Bing"</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.B_Pin_Receipt__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>When Claimed Listing is "Bing" or "Google, Bing" change B Pin Receipt to today</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Bing Resend Attempts Update</fullName>
        <actions>
            <name>MICC_Bing_Resend_Attempts_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ischanged( B_Postcard_Request__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>MICC - Client ID</fullName>
        <actions>
            <name>MICC_Populate_Client_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - G Pin Receipt Date Input</fullName>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>Google,"Google, Bing"</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Hecker</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Pin_Receipt__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Google Listing Status %3D Active when Auto-Verified %3D True</fullName>
        <actions>
            <name>Google_Listing_status_to_Active_Listing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_White_List_Test__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When “Auto-Verified” box is checked, automatically update “Google Listing Status” to “Active Listing”</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Google Listing Status is Active to Google</fullName>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Claimed_Listing_to_Google</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Active Listing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>When Google Listing Status is Active and Claimed Listing is Blank - Set Claimed Listing to "Google" and G Pin Receipt to Today</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Google Listing Status is Active to Google%2C Bing</fullName>
        <actions>
            <name>MICC_Claimed_Listing_Updates_Both</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Active Listing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>Bing</value>
        </criteriaItems>
        <description>When Google Listing Status is Active and Claimed Listing is "Bing" - Set Claimed Listing to "Google, Bing" and G Pin Receipt to Today</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Google Listing Status is Awaiting Pin - Google</fullName>
        <actions>
            <name>MICC_G_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Claiming_Listing_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3) AND 4</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting PIN,Client Refuses Claim,Error Message,Needs Re-Verification</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>Google</value>
        </criteriaItems>
        <description>When Google Listing Status is Awaiting PIN, Client Refuses Claim, Error Message, or Needs Re-Verification and Claimed Listing is Google - Set Claimed Listing to "Null" and G Pin Receipt to Null</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Google Listing Status is Awaiting Pin - Google%2C Bing</fullName>
        <actions>
            <name>MICC_Claimed_Listing_Updates_Bing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3) AND 4</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting PIN,Client Refuses Claim,Error Message,Needs Re-Verification,Owner-Verified/Pending Management</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>"Google, Bing"</value>
        </criteriaItems>
        <description>When Google Listing Status is Awaiting PIN, Client Refuses Claim, Error Message, or Needs Re-Verification and Claimed Listing is Google - Set Claimed Listing to "Bing" and G Pin Receipt to Null</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Google Resend Attempts Update</fullName>
        <actions>
            <name>MICC_Google_Resend_Attempts_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ischanged( G_Postcard_Request__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>MICC - Pending Pin Receipt New 1</fullName>
        <actions>
            <name>MICC_B_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Bing_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Bing_Pin_Resent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Received_by_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Status_to_Pending_Pin_Receipt_Upd</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5 and 6 and 7 and 8 AND 9 AND 10</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_1_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_2_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_3_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_4_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Created__c</field>
            <operation>notEqual</operation>
            <value>Listing Resides in Bulk Account,Google Whitelist</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bing_Listing_Created__c</field>
            <operation>notEqual</operation>
            <value>Listing Resides in Bulk Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Luikart</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Pin_Receipt__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>notEqual</operation>
            <value>Active Listing</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Pending Pin Receipt New 2</fullName>
        <actions>
            <name>MICC_B_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Bing_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Claimed_Listing_Updates_Google</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Status_to_Pending_Pin_Receipt_Upd</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 or 2 or 3 or 4 or 5 OR 9) and 6 and 7 and 8</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_1_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_2_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_3_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_4_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Created__c</field>
            <operation>equals</operation>
            <value>Listing Resides in Bulk Account,Google Whitelist</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bing_Listing_Created__c</field>
            <operation>notEqual</operation>
            <value>Listing Resides in Bulk Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Luikart</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Active Listing</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Pending Pin Receipt New 3</fullName>
        <actions>
            <name>MICC_Claimed_Listing_Updates_Bing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Receipt_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_G_Pin_Received_by_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MICC_Status_to_Pending_Pin_Receipt_Upd</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5 and 6 and 7 and 8 and 9</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_1_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_2_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_3_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_4_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Created__c</field>
            <operation>notEqual</operation>
            <value>Listing Resides in Bulk Account,Google Whitelist</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bing_Listing_Created__c</field>
            <operation>equals</operation>
            <value>Listing Resides in Bulk Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Luikart</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>notEqual</operation>
            <value>Active Listing</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Pending Pin Receipt New 4</fullName>
        <actions>
            <name>MICC_B_Pin_Receipt_Date_Input</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5 and 6 and 7 and 8 and 9</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_1_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_2_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_3_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_4_Action_Completed__c</field>
            <operation>notEqual</operation>
            <value>Listing Claimed Needs Updating,Listing Claimed &amp; Updated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Created__c</field>
            <operation>notEqual</operation>
            <value>New Listing Created and Claimed,Listing Resides in Bulk Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bing_Listing_Created__c</field>
            <operation>equals</operation>
            <value>New Listing Created and Claimed,Listing Resides in Bulk Account,Existing Listing Claimed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Hecker</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.B_Pin_Receipt__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Rebuild Date Changes Google Resend Attempts</fullName>
        <actions>
            <name>MICC_Rebuild_Date_Changes_Google_Resen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ischanged( Rebuild_Date__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>MICC - Status Update to Non Compliant Client</fullName>
        <actions>
            <name>MICC_Status_Update_to_Non_Compliant_Cl</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>((1 and 2) or 3 or 5) and 4</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Client Refuses Claim</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bing_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Client Refuses Claim</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_Teardown_Request__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Hecker</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Teardown_Status__c</field>
            <operation>contains</operation>
            <value>Immediate Teardown Request,Listing Cleaned Out,Listing Teardown Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>MICC - Status when Claimed Listing %3D Google%2C Bing</fullName>
        <actions>
            <name>MICC_Status_to_All_Tasks_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Claimed_Listing_new__c</field>
            <operation>equals</operation>
            <value>"Google, Bing"</value>
        </criteriaItems>
        <description>When the Claimed Listing Status = Google, Bing update the Status to All Tasks Complete</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>National Canada - Day 1 Pin Request</fullName>
        <actions>
            <name>National_Canada_Day_1_Pin</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Postcard_Request__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting Verification</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>contains</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Non Compliant Client</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>National Canada - Pin Received%21</fullName>
        <actions>
            <name>National_PIN_Received</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Pin_Receipt__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>contains</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Non Compliant Client</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>OC - Google Setup%3AAddress Issue</fullName>
        <actions>
            <name>OC_Google_Setup_Address_Issue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>3 AND (1 OR 2)</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Reason_for_Submission__c</field>
            <operation>includes</operation>
            <value>Google Setup:Address Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Manager_Approved_Escalation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Optimization</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>OC - Google Setup%3AAddress Issue Owner</fullName>
        <actions>
            <name>OC_Google_Setup_Address_Issue_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Reason_for_Submission__c</field>
            <operation>includes</operation>
            <value>Google Setup:Address Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Optimization</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>OC - Google SetupL Address Issue %3D Escalated</fullName>
        <actions>
            <name>Manager_Approved_For_Escalation_Check</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Optimization</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Reason_for_Submission__c</field>
            <operation>includes</operation>
            <value>Google Setup:Address Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Submission_Reason__c</field>
            <operation>equals</operation>
            <value>Google Setup:Address Issue</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>OC - Google Status from GWL to Listing No Listing</fullName>
        <actions>
            <name>OC_Google_Listing_Status_to_No_Listing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Created__c</field>
            <operation>equals</operation>
            <value>Pending Google Whitelist</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>OV Enter Date</fullName>
        <actions>
            <name>OV_Enter_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and (2 or 3 or 4 or 5) and 6</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Owner-Verified/Pending Management</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_1_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Owner-Verified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_2_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Owner-Verified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_3_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Owner-Verified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Listing_4_Action_Completed__c</field>
            <operation>equals</operation>
            <value>Owner-Verified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.OV_Enter_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>OV Leave Date</fullName>
        <actions>
            <name>OV_Leave_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.OV_Enter_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.OV_Leave_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>notEqual</operation>
            <value>Owner-Verified/Pending Management</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>OV Managed</fullName>
        <actions>
            <name>OV_Managed_for_Google_Listing_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OV_Managed_for_OV_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and (2 or 3)</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Active Listing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Owner_Verified_Status__c</field>
            <operation>equals</operation>
            <value>Owner-Verified/Pending Management</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Owner_Verified_Status__c</field>
            <operation>equals</operation>
            <value>Owner-Verified/Managed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>OV Max Attempts - Do Not Call Enter Date</fullName>
        <actions>
            <name>OV_Max_Attempts_Do_Not_Call_Enter_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.OV_Max_Attempts__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>OV Max Attempts when out of OV</fullName>
        <actions>
            <name>OV_Max_Attempts_when_out_of_OV</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Pin_Status__c</field>
            <operation>notEqual</operation>
            <value>Owner Verified</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>OV Pending Management</fullName>
        <actions>
            <name>OV_Pending_Management</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Owner-Verified/Pending Management</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Optimization Clock Date</fullName>
        <actions>
            <name>Optimization_Clock_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Pin_Receipt__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Case - Immediate Teardown Request</fullName>
        <actions>
            <name>Immediate_Teardown_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Teardown_Status__c</field>
            <operation>equals</operation>
            <value>Immediate Teardown Request</value>
        </criteriaItems>
        <description>if immediate teardown request is the status for MIC/CMC</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Case Feedback Needed</fullName>
        <actions>
            <name>Organic_Case_Feedback_Needed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Optimization</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.CreatedById</field>
            <operation>notContain</operation>
            <value>IT,sdb</value>
        </criteriaItems>
        <description>sends an email asking the consultant to go in and fill out the case writing</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Cases - Underperforming %26 Consult Assigned to User</fullName>
        <actions>
            <name>Organic_Cases_Underperformer_Organic_Consult</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Consultation,Underperforming,Organic Optimization</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed - Errors Found,Closed - False Trigger,Closed - No Errors Found,Closed,Closed - Sent to SDB,Opt Not Completed - Invalid Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Optimization Owner</fullName>
        <actions>
            <name>Organic_Optimization_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Organic Optimization,Organic Consultation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Reason_for_Submission__c</field>
            <operation>notEqual</operation>
            <value>Custom Domain Request,Google Setup:Address Issue (IT Pro),Listing Keyword Update (SDB Only)</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Optimization Reopen</fullName>
        <actions>
            <name>Reopened_checkbox_checked</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Reopened_Reason__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When an Organic Opt is reopened, the Reopened checkbox is checked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic object Close Date</fullName>
        <actions>
            <name>Organic_Maps_Close_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>equals</operation>
            <value>All Tasks Completed,Non Compliant Client,Closed,Closed - Errors Found,Closed - False Trigger,Closed - No Errors Found,Closed - Sent to SDB,Opt Not Completed - Invalid Case,Delete Case,Cannot Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>PAN - Contact Date when in Reattempt Status</fullName>
        <actions>
            <name>PAN_Contact_Date_when_Reattempt_status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>PIN Action Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending Reattempt</value>
        </criteriaItems>
        <description>For PIN Action Needed Case</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>PAN - Maps Contact Google Support to Pin Collection Queue</fullName>
        <actions>
            <name>PAN_Maps_Contact_Google_Support_to_Pin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 6) OR (1 AND 2 AND 3 AND (4 OR 7)) OR (1 and 2 and 3 AND (5 OR 8))</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Pin_Action_Reason__c</field>
            <operation>equals</operation>
            <value>Maps Contact - Google Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>PIN Action Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Bing_Account__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Google_Account_2__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>notEqual</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Bing_Account__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Google_Account_2__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>For Pin Action Need Case</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pin Action Needed Assignment to IT Pro</fullName>
        <actions>
            <name>Pin_Action_Needed_Assignment_to_IT_Pro</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>((1 AND 2 AND 3) OR ((1 AND 2 AND 4 And (5 OR 7)) OR (1 AND 2 AND 4 And (6 or 8))))</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Pin_Action_Reason__c</field>
            <operation>contains</operation>
            <value>Pin Received,Pin Resend needed,Multiple Pins Received</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>notEqual</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Bing_Account__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Google_Account_2__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Bing_Account__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Google_Account_2__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pin Action Needed Open Date</fullName>
        <actions>
            <name>Open_Date_on_Organic_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pin Action Needed Subject Line Populate</fullName>
        <actions>
            <name>Pin_Action_Needed_Subject_Line_Populate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>PIN Action Needed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pin Added to Maps Initial Claiming Object</fullName>
        <actions>
            <name>Maps_Initial_Claiming_Pin_Added</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Pin__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bing_Pin__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Reopened Date</fullName>
        <actions>
            <name>Reopened_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Reopened_Reason__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Reopened Date field populates with date on which case was reopened.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Rogers - Day 1 Pin Request</fullName>
        <actions>
            <name>Rogers_Day_1_Google_Pin_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Postcard_Request__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Listing_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting Verification</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>notContain</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Non Compliant Client</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Rogers All Pins Received</fullName>
        <actions>
            <name>Rogers_Google_Pin_Received</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Pin_Receipt__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.B_Pin_Receipt__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Product_Type_Account__c</field>
            <operation>contains</operation>
            <value>Outrank</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>contains</operation>
            <value>OEM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Non Compliant Client</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Rogers Received Bing NOT Google</fullName>
        <actions>
            <name>Rogers_Google_PIN_Needed_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Pin_Receipt__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.B_Pin_Receipt__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Product_Type_Account__c</field>
            <operation>contains</operation>
            <value>Outrank</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>contains</operation>
            <value>OEM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Non Compliant Client</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Rogers Received Google NOT Bing</fullName>
        <actions>
            <name>Rogers_Google_Not_Bing</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3 and 4 and 5 and 6 and 7 and 8</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.G_Pin_Receipt__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.B_Pin_Receipt__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Product_Type_Account__c</field>
            <operation>contains</operation>
            <value>Outrank</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>contains</operation>
            <value>OEM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.IMS_Rep__c</field>
            <operation>notContain</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Non Compliant Client</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Product_Type__c</field>
            <operation>notEqual</operation>
            <value>OR 1.0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>SDB Escalation Request Date</fullName>
        <actions>
            <name>SDB_Escalation_Request_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.SDB_Escalation_Status__c</field>
            <operation>equals</operation>
            <value>Optimization Needed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>SEO Mops Completed Date</fullName>
        <actions>
            <name>SEO_Mops_Completed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3) or  4</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.MOPs_Analyst__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Case_Owner_Role__c</field>
            <operation>notEqual</operation>
            <value>SEO Marketing Ops</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.OwnerId</field>
            <operation>notEqual</operation>
            <value>SEO Marketing Ops</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Segment</fullName>
        <actions>
            <name>Segment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Segment__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Setup Date</fullName>
        <actions>
            <name>Setup_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps Initial Claiming,Rogers Maps Claiming,Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Setup_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.CreatedDate</field>
            <operation>greaterThan</operation>
            <value>1/2/2013 1:00 AM</value>
        </criteriaItems>
        <description>Fill the setup date if it is not input in the case</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Teardown Status to Cleaned Out</fullName>
        <actions>
            <name>Cleaned_Out_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Teardown_Status__c</field>
            <operation>equals</operation>
            <value>Listing Cleaned Out</value>
        </criteriaItems>
        <description>When teardown status is updated to Listing Cleaned Out</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Teardown Status to Listing Teardown Complete</fullName>
        <actions>
            <name>Teardown_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Teardown_Status__c</field>
            <operation>equals</operation>
            <value>Listing Teardown Complete</value>
        </criteriaItems>
        <description>When teardown status is updated to Listing Teardown Complete</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Time Left SEO MOps</fullName>
        <actions>
            <name>Time_Left_SEO_MOps</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and(
ISCHANGED(OwnerId),
or(
PRIORVALUE(OwnerId) = "00G60000000zi8E",
PRIORVALUE(OwnerId) = "00G60000001CkQX",
PRIORVALUE(OwnerId) = "00560000003WwZr",
PRIORVALUE(OwnerId) = "00560000001HVQd",
PRIORVALUE(OwnerId) = "00560000001HVQJ",
PRIORVALUE(OwnerId) = "005320000053m3n",
PRIORVALUE(OwnerId) = "00532000004OMWX",
PRIORVALUE(OwnerId) = "00560000001w5vk",
PRIORVALUE(OwnerId) = "00560000001Hi20",
PRIORVALUE(OwnerId) = "00560000001HVRR",
PRIORVALUE(OwnerId) = "00532000004OR9i",
PRIORVALUE(OwnerId) = "00560000003W5ty",
PRIORVALUE(OwnerId) = "00560000001ua2i"),
not(OwnerId = "00G60000000zi8E"),
not(OwnerId = "00G60000001CkQX"),
not(OwnerId = "00560000003WwZr"),
not(OwnerId = "00560000001HVQd"),
not(OwnerId = "00560000001HVQJ"),
not(OwnerId = "005320000053m3n"),
not(OwnerId = "00532000004OMWX"),
not(OwnerId = "00560000001w5vk"),
not(OwnerId = "00560000001Hi20"),
not(OwnerId = "00560000001HVRR"),
not(OwnerId = "00532000004OR9i"),
not(OwnerId = "00560000003W5ty"),
not(OwnerId = "00560000001ua2i"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Update Account</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Canada Maps Claiming</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Google_Pin__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN PAN - Maps Contact Google Support to PES Team Queue</fullName>
        <actions>
            <name>YBN_Pan_Case_Owner_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3 and (4 or 5)</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Pin_Action_Reason__c</field>
            <operation>equals</operation>
            <value>Maps Contact - Google Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>PIN Action Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Bing_Account__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Google_Account_2__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>For Pin Action Need Case</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN Pin Action Needed Assignment to PES Team</fullName>
        <actions>
            <name>YBN_Pan_Case_Owner_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND (4 OR 5)</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.Status__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Pin_Action_Reason__c</field>
            <operation>equals</operation>
            <value>Pin Received,Pin Resend needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Bing_Account__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Google_Account_2__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN%3A Assign PAN to PES Team</fullName>
        <actions>
            <name>YBN_Pan_Case_Owner_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND (3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>Organic_Analysis__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>PIN Action Needed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>equals</operation>
            <value>YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Bing_Account__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Bulk_Google_Account_2__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>assign PIN Action Needed cases to that team upon creation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>YBN%3A Escalated Organic Case</fullName>
        <actions>
            <name>YBN_Organic_Case_Escalation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Organic_Analysis__c.Escalated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Organic_Analysis__c.Client_Type__c</field>
            <operation>contains</operation>
            <value>YBN</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>