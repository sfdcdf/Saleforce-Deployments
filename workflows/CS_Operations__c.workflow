<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>CS_Operations_New_Request_Alert_New</fullName>
        <description>CS Operations New Request Alert New</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/CS_Ops_Alert_New</template>
    </alerts><alerts>
        <fullName>CS_Operations_New_Request_to_be_estimated2</fullName>
        <description>CS Operations - New Request to be estimated</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/CS_Ops_Alert_New</template>
    </alerts><alerts>
        <fullName>CS_Operations_New_Request_to_be_reviewed_by_channel_lead</fullName>
        <description>CS Operations - New Request to be reviewed by channel lead</description>
        <protected>false</protected>
        <recipients>
            <field>Channel_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/CS_Operations_New_Change_Request_to_Channel_Lead</template>
    </alerts><alerts>
        <fullName>CS_Operations_Project_Backlogged_By_Channel_Lead</fullName>
        <description>CS Operations Project Backlogged By Channel Lead</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/CS_Operations_Project_Declined_By_Channel_Lead</template>
    </alerts><alerts>
        <fullName>CS_Ops_Auto_Assign_Sophie</fullName>
        <ccEmails>sfdc@yodle.com</ccEmails>
        <description>CS Ops - Auto Assign Sophie</description>
        <protected>false</protected>
        <recipients>
            <recipient>slavin@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CS_Ops_Object/CS_Ops_Auto_Assign_Sophie</template>
    </alerts><alerts>
        <fullName>CS_Ops_In_Progress_Request</fullName>
        <description>CS Ops - In Progress Request</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>sfdc@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/CS_Ops_In_Progress</template>
    </alerts><alerts>
        <fullName>CS_Ops_In_Review_Request</fullName>
        <description>CS Ops - In Review Request</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/CS_Ops_In_Review_Request</template>
    </alerts><alerts>
        <fullName>CS_Ops_Ineligibility_Request</fullName>
        <description>CS Ops - Ineligibility Request</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/CS_Ops_Ineligible_Request</template>
    </alerts><alerts>
        <fullName>CS_Ops_On_Hold_Request</fullName>
        <description>CS Ops - On Hold Request</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/CS_Ops_On_Hold_Request</template>
    </alerts><alerts>
        <fullName>CS_Ops_Operations_Request_Completed</fullName>
        <description>CS Ops - Operations Request Completed</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>sfdc@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/CS_Ops_Request_Completed</template>
    </alerts><alerts>
        <fullName>CS_Ops_Strategic_Account_Growth_Ineligible_Request</fullName>
        <ccEmails>aelbaum@yodle.com</ccEmails>
        <description>CS Ops - Strategic Account Growth Ineligible Request</description>
        <protected>false</protected>
        <recipients>
            <field>Strategic_Accounts_Team_Member__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/CS_Ops_Strategic_Account_Growth_Ineligible_Request</template>
    </alerts><alerts>
        <fullName>CS_Ops_Strategic_Account_Growth_Request_Added</fullName>
        <ccEmails>aelbaum@yodle.com</ccEmails>
        <description>CS Ops - Strategic Account Growth Request Added</description>
        <protected>false</protected>
        <recipients>
            <field>Strategic_Accounts_Team_Member__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/CS_Ops_Strategic_Account_Growth_Request_Added</template>
    </alerts><alerts>
        <fullName>New_Ops_Request_Submitted_Sent_email_to_creator</fullName>
        <description>New Ops Request Submitted - Sent email to creator</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>sfdc@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/New_Ops_Request_Email_to_Creator2</template>
    </alerts><alerts>
        <fullName>YBN_approval_denied_for_account_update</fullName>
        <description>YBN approval denied for account update</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Leadership_Approval_Denied</template>
    </alerts><alerts>
        <fullName>YBn_e</fullName>
        <description>YBn - email ybn leadership for approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>bheppner@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>emcintyre@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.volkel@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Leadership_Approval_Needed</template>
    </alerts><alerts>
        <fullName>email_alert_to_michele_for_account_service_level_change</fullName>
        <description>email alert to michele for account service level change</description>
        <protected>false</protected>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_IL_Service_Level_Approval</template>
    </alerts><alerts>
        <fullName>ybn_account_updateapproved</fullName>
        <description>ybn account update approved</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_accoutn_update_approved</template>
    </alerts><alerts>
        <fullName>ybn_new_ops_request_email_alert</fullName>
        <description>ybn - new ops request email alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/CS_Ops_Alert_New</template>
    </alerts><alerts>
        <fullName>ybn_notify_creator_case_is_completed</fullName>
        <description>ybn notify creator case is completed</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_operations_case_completed</template>
    </alerts><alerts>
        <fullName>ybn_servic_level_update</fullName>
        <ccEmails>ybnoperations@yodle.com</ccEmails>
        <description>ybn -servic level update</description>
        <protected>false</protected>
        <recipients>
            <recipient>alex.cuevas@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Leadership_Approval_Needed</template>
    </alerts><fieldUpdates>
        <fullName>CS_Operations_Closed_Date</fullName>
        <field>Closed_Date__c</field>
        <formula>today()</formula>
        <name>CS Ops Closed Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Operations_Date_Approved_To_Today</fullName>
        <field>Date_Approved_by_Channel_Lead__c</field>
        <formula>TODAY()</formula>
        <name>CS Operations Date Approved To Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Operations_Opened_Date</fullName>
        <field>Opened_Date__c</field>
        <formula>today()</formula>
        <name>CS Ops Opened Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Operations_Owner_to_Sophie_Lavin</fullName>
        <field>OwnerId</field>
        <lookupValue>mary.kellum@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>CS Operations Owner to Sophie Lavin</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Operations_Owner_to_YBN_Operations</fullName>
        <field>OwnerId</field>
        <lookupValue>YBN_Operations</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>CS Operations Owner to YBN Operations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Operations_Status_to</fullName>
        <field>Status__c</field>
        <literalValue>Pending Channel Lead</literalValue>
        <name>CS Operations Status to Pending Channel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Operations_Status_to_Pending_Estimate</fullName>
        <field>Status__c</field>
        <literalValue>Pending Estimate</literalValue>
        <name>CS Operations Status to Pending Estimate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Ops_Expected_Completion_Date</fullName>
        <field>Expected_Completion_Date__c</field>
        <formula>Today() + 7</formula>
        <name>CS Ops Expected Completion Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Ops_Request_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>CSOperations275821</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>CS Ops Owner to CS Operations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Ops_Status_In_Progress</fullName>
        <field>Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>CS Ops Status to In Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Ops_Status_to_Pending_Ops_Assignment</fullName>
        <field>Status__c</field>
        <literalValue>Pending Ops Assignment</literalValue>
        <name>CS Ops Status to Pending Ops Assignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CS_Ops_Web_Dev_Escalation</fullName>
        <field>OwnerId</field>
        <lookupValue>scornwall@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>CS Ops Owner to Sean Cornwall</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Classification_Field</fullName>
        <field>Classification__c</field>
        <literalValue>Administrative</literalValue>
        <name>Update Classification Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Classification_Field_for_Jira_Tic</fullName>
        <field>Classification__c</field>
        <literalValue>New Request</literalValue>
        <name>Update Classification Field for Jira Tic</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Upsell_Cases_to_CS_Operations</fullName>
        <field>OwnerId</field>
        <lookupValue>CSOperations275821</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Upsell Cases to CS Operations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>YBN_Account_Update</fullName>
        <field>OwnerId</field>
        <lookupValue>YBN_Leadership</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>YBN - Account Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>YBN_approval_status_request_denied</fullName>
        <field>Status__c</field>
        <literalValue>Closed - Not Approved</literalValue>
        <name>YBN approval status - request denied</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>YBN_status_update</fullName>
        <field>Status__c</field>
        <literalValue>Pending approval from YBN Leadership</literalValue>
        <name>Pending approval from YBN Leadership</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>update_ops_owner</fullName>
        <field>OwnerId</field>
        <lookupValue>mbrevig@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>CS Ops Owner to Michele Brevig</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>update_to_operations_owner</fullName>
        <field>OwnerId</field>
        <lookupValue>YBN_Operations</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Owner to YBN Operations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Add Administrative on Operations Cases</fullName>
        <actions>
            <name>Update_Classification_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Application Request/Changes,Essentials Features Request</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>CS Operation Owner Alert</fullName>
        <actions>
            <name>CS_Operations_New_Request_to_be_estimated2</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>And(  RecordType.Id ="012600000009XNe", ischanged (  OwnerId  ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>CS Operations Estimate Complete</fullName>
        <actions>
            <name>CS_Operations_New_Request_to_be_reviewed_by_channel_lead</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CS_Operations_Status_to</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CS_Ops_Request_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.OwnerId</field>
            <operation>notEqual</operation>
            <value>CS Operations</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Estimated_Minutes_to_Complete__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Estimated_Minutes_to_Complete__c</field>
            <operation>lessThan</operation>
            <value>120</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Request_Category__c</field>
            <operation>equals</operation>
            <value>Change/Project</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Operations Estimate Complete for Error Fix</fullName>
        <actions>
            <name>CS_Ops_Request_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CS_Ops_Status_to_Pending_Ops_Assignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.OwnerId</field>
            <operation>notEqual</operation>
            <value>CS Operations</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Request_Category__c</field>
            <operation>equals</operation>
            <value>Fixing Error</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Auto Assign Sophie</fullName>
        <actions>
            <name>CS_Ops_Auto_Assign_Sophie</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CS_Ops_Request_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CS_Ops_Status_In_Progress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(2 OR 3) AND 1 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>CS_Operations__c.Request_Type__c</field>
            <operation>notEqual</operation>
            <value>User Permissions</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Need_to_Escalate__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Manager_Approved_Escalation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Type__c</field>
            <operation>equals</operation>
            <value>Administrative Items</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Created_by_Role__c</field>
            <operation>notContain</operation>
            <value>YBN</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Auto Assign YBN Operations</fullName>
        <actions>
            <name>CS_Operations_Owner_to_YBN_Operations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(2 OR 3) AND 1 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>CS_Operations__c.Request_Type__c</field>
            <operation>notEqual</operation>
            <value>User Permissions</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Need_to_Escalate__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Manager_Approved_Escalation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Type__c</field>
            <operation>equals</operation>
            <value>Administrative Items</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Created_by_Role__c</field>
            <operation>contains</operation>
            <value>YBN</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Closed Date</fullName>
        <actions>
            <name>CS_Operations_Closed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>contains</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Date Approved by Channel Lead To Today</fullName>
        <actions>
            <name>CS_Operations_Date_Approved_To_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR (2 AND 3)</booleanFilter>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending Ops Assignment</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Channel_Requested_By__c</field>
            <operation>equals</operation>
            <value>National</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Expected Completion Date</fullName>
        <actions>
            <name>CS_Ops_Expected_Completion_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>National Project Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - In Progress Request</fullName>
        <actions>
            <name>CS_Ops_In_Progress_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Assistance,Administrative Items,Batch Uploads,Weekly Reports Assistance,Operations Request,Essentials Features Request,CMS 3.1 Update Request,Application Request/Changes</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Channel_Requested_By__c</field>
            <operation>equals</operation>
            <value>Lighthouse,Local,Operations,OPT,Partner,Performance,SEM Marketing Ops,SEO Marketing Ops</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - In Review Request</fullName>
        <actions>
            <name>CS_Ops_In_Review_Request</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>In Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Type__c</field>
            <operation>equals</operation>
            <value>Administrative Items,Operations Help Desk,Batch Uploads,SalesForce Assistance,National Project,Weekly Reports Update</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Ineligible Request</fullName>
        <actions>
            <name>CS_Ops_Ineligibility_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Operation Upsell Additions</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed - Not Eligible</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - On Hold Request</fullName>
        <actions>
            <name>CS_Ops_On_Hold_Request</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>On Hold</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Administrative Items,Batch Uploads &amp; Changes,Operations Help Desk,SalesForce Assistance,Weekly Reports Assistance</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Opened Date</fullName>
        <actions>
            <name>CS_Operations_Opened_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Operation Upsell Additions</fullName>
        <actions>
            <name>CS_Ops_Status_In_Progress</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Upsell_Cases_to_CS_Operations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Operation Upsell Additions</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Need_to_Escalate__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Manager_Approved_Escalation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Operations Request</fullName>
        <actions>
            <name>CS_Ops_Status_to_Pending_Ops_Assignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.Channel_Requested_By__c</field>
            <operation>equals</operation>
            <value>Operations</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Operations Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Operations Request Complete</fullName>
        <actions>
            <name>CS_Ops_Operations_Request_Completed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed - Added,Closed - Not Eligible,Closed - Completed/Updates Made,Closed - Completed,Closed - Could Not Complete,Closed - Review for CS Ops Plan,Closed - Declined by Channel Lead,Closed - Not Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Owner CS Operations NEW</fullName>
        <actions>
            <name>CS_Operations_New_Request_Alert_New</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>New_Ops_Request_Submitted_Sent_email_to_creator</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CS_Ops_Request_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Application Request/Changes,WBN Operations Request</value>
        </criteriaItems>
        <description>Email alert to sfdc with more info about submitted request
Field update to operations owner
Email Alert to the person who submitted the request with the details of their request</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>CS Ops - Partner Escalation</fullName>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.Created_by_Role__c</field>
            <operation>equals</operation>
            <value>Partner Associate,Partner Consultant</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Need_to_Escalate__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Manager_Approved_Escalation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Project Declined by Channel Lead</fullName>
        <actions>
            <name>CS_Operations_Project_Backlogged_By_Channel_Lead</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed - Declined by Channel Lead</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Request Owner</fullName>
        <actions>
            <name>CS_Ops_Request_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 or 2) and (3 OR (4 AND 5)) and 6</booleanFilter>
        <criteriaItems>
            <field>CS_Operations__c.Need_to_Escalate__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Manager_Approved_Escalation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Channel_Requested_By__c</field>
            <operation>equals</operation>
            <value>Operations</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>YBN Operations Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Strategic Account Growth Ineligible Request</fullName>
        <actions>
            <name>CS_Ops_Strategic_Account_Growth_Ineligible_Request</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Strategic Account Growth Addition</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed - Not Eligible</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Strategic Account Growth Request Added</fullName>
        <actions>
            <name>CS_Ops_Strategic_Account_Growth_Request_Added</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed - Added</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Strategic Account Growth Addition</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CS Ops - Web Dev Escalation</fullName>
        <actions>
            <name>CS_Ops_Web_Dev_Escalation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.Created_by_Role__c</field>
            <operation>equals</operation>
            <value>Web Dev</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Need_to_Escalate__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Manager_Approved_Escalation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Essentials Features Request - Assign to Sophie</fullName>
        <actions>
            <name>CS_Operations_Owner_to_Sophie_Lavin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Essentials Features Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Operations Estimate to CS Operations</fullName>
        <actions>
            <name>CS_Operations_New_Request_to_be_estimated2</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CS_Operations_Status_to_Pending_Estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CS_Ops_Request_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Channel_Requested_By__c</field>
            <operation>equals</operation>
            <value>Performance,SEM Marketing Ops,SEO Marketing Ops,Partner,Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Estimated_Minutes_to_Complete__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Type__c</field>
            <operation>notEqual</operation>
            <value>Administrative Items,Operations Help Desk</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Operations Estimate to Ellie - YBN</fullName>
        <actions>
            <name>CS_Operations_New_Request_to_be_estimated2</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CS_Operations_Status_to_Pending_Estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Channel_Requested_By__c</field>
            <operation>equals</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Estimated_Minutes_to_Complete__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Type__c</field>
            <operation>notEqual</operation>
            <value>Administrative Items,Operations Help Desk</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Update Classification Field for Jira Tickets</fullName>
        <actions>
            <name>Update_Classification_Field_for_Jira_Tic</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Application Request/Changes,Essentials Features Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.JIRA_Issue_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>WBN Cases to YBN Operations</fullName>
        <actions>
            <name>update_to_operations_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>WBN Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Request_Type__c</field>
            <operation>notEqual</operation>
            <value>Request New Account</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>YBN - Needs Michele Brevig Approval</fullName>
        <actions>
            <name>email_alert_to_michele_for_account_service_level_change</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_status_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>update_ops_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>WBN Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Request_Type__c</field>
            <operation>equals</operation>
            <value>Service Level Update/Assignment</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN - SD Assignment</fullName>
        <actions>
            <name>YBn_e</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_Account_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YBN_status_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>WBN Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Request_Type__c</field>
            <operation>equals</operation>
            <value>Request New Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN AD Assignment</fullName>
        <actions>
            <name>ybn_new_ops_request_email_alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>update_to_operations_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.Request_Type__c</field>
            <operation>equals</operation>
            <value>Account Director Assignment/Update</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN approval status - request approved</fullName>
        <actions>
            <name>ybn_account_updateapproved</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CS_Ops_Status_In_Progress</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>update_to_operations_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2) OR (3 AND 4) and 5</booleanFilter>
        <criteriaItems>
            <field>CS_Operations__c.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Request_Type__c</field>
            <operation>equals</operation>
            <value>Request New Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.CS_Approval_Status__c</field>
            <operation>equals</operation>
            <value>Request Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Request_Type__c</field>
            <operation>equals</operation>
            <value>Service Level Assignment for New Relationship,Corporate Relationship Service Level Update,Indiviudal Location Service Level Update - For All Accounts</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>Pending approval from YBN Leadership</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN approval status - request denied</fullName>
        <actions>
            <name>YBN_approval_denied_for_account_update</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>YBN_approval_status_request_denied</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 or 2</booleanFilter>
        <criteriaItems>
            <field>CS_Operations__c.Approval_Status__c</field>
            <operation>equals</operation>
            <value>Request Denied</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.CS_Approval_Status__c</field>
            <operation>equals</operation>
            <value>Request Denied</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN new ops request alert</fullName>
        <actions>
            <name>update_to_operations_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>WBN Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Request_Type__c</field>
            <operation>notEqual</operation>
            <value>Request New Account</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>ybn operations request completed</fullName>
        <actions>
            <name>ybn_notify_creator_case_is_completed</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CS_Operations__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>WBN Operations Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>CS_Operations__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed - Completed/Updates Made</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>