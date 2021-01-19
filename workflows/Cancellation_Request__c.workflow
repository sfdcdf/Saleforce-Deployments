<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>LBW_Cancellation_Alert</fullName>
        <description>LBW Cancellation Alert</description>
        <protected>false</protected>
        
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/LBW_New_Cancellation_Alert</template>
    </alerts>
    <alerts>
        <fullName>LSFS_Cancellation_Reqeust_Notification</fullName>
        <description>LSFS Cancellation Reqeust Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>leadstreamsupport@web.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lead_Stream_Templates/LSFS_Cancellation_Request_Notification</template>
    </alerts>
    <alerts>
        <fullName>WBN_Alert_Owner_of_Approval</fullName>
        <description>WBN - Alert Owner of Approval</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>YBN_Cancellation_Requests/Alert_Owner_Request_Approved</template>
    </alerts>
    <alerts>
        <fullName>WBN_Alert_Owner_of_Rejection</fullName>
        <description>WBN - Alert Owner of Rejection</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>YBN_Cancellation_Requests/Alert_Owner_Request_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Yodle_Gold_Service_Cancel_Closed_Email</fullName>
        <description>Yodle Gold Service Cancel Closed Email</description>
        <protected>false</protected>
        
        <senderAddress>sfdc@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Agent_Emails_Retention/Yodle_Gold_Cancel_Request_Closed</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_By_Manager</fullName>
        <field>Approval_By__c</field>
        <formula>Owner:User.Manager.Full_Name__c</formula>
        <name>Approval By -&gt; Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Local_Pod</fullName>
        <field>OwnerId</field>
        <lookupValue>Local_Pod_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to Local Pod</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Rogers_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Rogers_Outrank</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to Rogers Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Attempts_to_Contact_to_0</fullName>
        <field>Attempts_to_Contact__c</field>
        <literalValue>0</literalValue>
        <name>Attempts to Contact to 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Auto_Close_Date_Filler</fullName>
        <field>Auto_Close_Date__c</field>
        <formula>IF(Next_Scheduled_Contact_Date__c &gt; CreatedDate + 32, Next_Scheduled_Contact_Date__c + 1, CreatedDate +32
)</formula>
        <name>Auto Close Date Filler</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CF_Days_Live_at_Created_Date</fullName>
        <field>Days_Live_at__c</field>
        <formula>Account_Name__r.Days_Live__c</formula>
        <name>CF - Days Live at Created Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CF_Populate_current_monthly_revenue</fullName>
        <field>Current_Monthly_Revenue__c</field>
        <formula>Account_Name__r.Monthly_Budget__c +  Account_Name__r.Essentials_Fee__c +  Account_Name__r.OutRank_Fees__c</formula>
        <name>CF - Populate current monthly revenue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CR_Client_ID_to_Account_Client_ID</fullName>
        <field>Client_ID__c</field>
        <formula>Account_Name__r.Client_ID__c</formula>
        <name>CR - Client ID to Account Client ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CR_Closed_Date</fullName>
        <field>Closed_Date__c</field>
        <formula>today()</formula>
        <name>CR - Closed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CR_Initial_Product_to_New_Record</fullName>
        <field>Initial_Product__c</field>
        <formula>IF(Account_Name__r.Account_Product_Sub_Type__c = "Lead Stream - Platform Only", 
Account_Name__r.Account_Product_Sub_Type__c, 
Account_Name__r.Product_Type_Transactional__c)</formula>
        <name>CR - Initial Product to New Record</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CR_Next_Bill_Date_to_Account_Bill_Date</fullName>
        <field>Next_Bill_Date__c</field>
        <formula>Account_Name__r.Next_Billing_Date__c</formula>
        <name>CR - Next Bill Date to Account Bill Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cancel_Code_1_unknown</fullName>
        <description>New Cancel Codes.  Originally from workflow  - First Cancel Code = unknown and Field update Leadstream Auto Close First Cancel Code</description>
        <field>Cancel_Code_1__c</field>
        <literalValue>unknown</literalValue>
        <name>Cancel Code 1 = unknown</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cancellation_Auto_Close_Clear_Date</fullName>
        <field>Auto_Close_Date__c</field>
        <name>Cancellation - Auto Close Clear Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>First_Cancel_Code_unknown</fullName>
        <field>Cancel_Code__c</field>
        <literalValue>Unknown</literalValue>
        <name>First Cancel Code = unknown</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Free_Time_Period_Checkbox</fullName>
        <field>Free_Time__c</field>
        <literalValue>1</literalValue>
        <name>Free Time Period Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Future_Product_to_None</fullName>
        <field>Future_Product__c</field>
        <name>Future Product to None</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Future_Revenue_to_0</fullName>
        <field>Future_Monthly_Revenue__c</field>
        <formula>0</formula>
        <name>Future Revenue to $0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LBW_AMP_Cancellation_Auto_Close</fullName>
        <field>Outcome__c</field>
        <literalValue>Cancelled</literalValue>
        <name>LBW/AMP Cancellation Auto Close</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Office_Phone_FillIn</fullName>
        <field>Client_s_Phone__c</field>
        <formula>Account_Name__r.Phone</formula>
        <name>Office Phone FillIn</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Products_in_Cancel_to_All</fullName>
        <field>Account_in_Save_Mode__c</field>
        <literalValue>All</literalValue>
        <name>Products in Cancel to All</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Retention_Agent_Change</fullName>
        <field>Retention_Consultant__c</field>
        <name>Retention Agent Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Retention_Duplicate_Owner_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Retention_Duplicate_Audit_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Retention Duplicate Owner Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Approved_checked</fullName>
        <description>Sets the Approved field to TRUE. Used in validation rule on Cancellation Form, together with custom permission = only users with permission can edit approved records.</description>
        <field>Approved__c</field>
        <literalValue>1</literalValue>
        <name>Set Approved (checked)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cancel_Outcome_Cancelled</fullName>
        <field>Outcome__c</field>
        <literalValue>Cancelled</literalValue>
        <name>Update Cancel Outcome - Cancelled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cancel_Outcome_Duplicate_Case</fullName>
        <field>Outcome__c</field>
        <literalValue>Duplicate Retention Case</literalValue>
        <name>Update Cancel Outcome - Duplicate Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cancel_Outcome_In_Progress</fullName>
        <field>Outcome__c</field>
        <literalValue>In Progress</literalValue>
        <name>Update Cancel Outcome - In Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cancel_Outcome_In_Review</fullName>
        <field>Outcome__c</field>
        <literalValue>In Review</literalValue>
        <name>Update Cancel Outcome - In Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner_to_LBW_Customer_Care</fullName>
        <field>OwnerId</field>
        <lookupValue>LBW_Customer_Service</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Owner to LBW Customer Care</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Ownership</fullName>
        <field>OwnerId</field>
        <lookupValue>RetentionTeam275821</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Ownership</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Ownership_Retention_Dupldate</fullName>
        <field>OwnerId</field>
        <lookupValue>Retention_Duplicate_Audit_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Ownership Retention Dupldate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Add Phone Number to Cancel Form</fullName>
        <actions>
            <name>Office_Phone_FillIn</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Client_s_Phone__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Auto Assign to LBW Retention Team</fullName>
        <actions>
            <name>Update_Owner_to_LBW_Customer_Care</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Account_IMS__c</field>
            <operation>equals</operation>
            <value>00532000005P6l3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <description>Assigns LBW cancel forms to LBW Customer Care Team</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Auto Assign to Local Retention Team</fullName>
        <actions>
            <name>Update_Ownership</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>notEqual</operation>
            <value>Retention Consultant</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>notEqual</operation>
            <value>Dedicated CS Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Account_IMS__c</field>
            <operation>notEqual</operation>
            <value>005320000053YQ4</value>
        </criteriaItems>
        <description>Assigns local cancel forms to Local Retention Queue</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Auto Assign to Pod Retention Team</fullName>
        <actions>
            <name>Assign_to_Local_Pod</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Account_IMS__c</field>
            <operation>equals</operation>
            <value>005320000053YQ4</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <description>Assigns local cancel forms to Pod Retention Team</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Auto Assign to Rogers Retention Team</fullName>
        <actions>
            <name>Assign_to_Rogers_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>notEqual</operation>
            <value>Retention Consultant</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>notEqual</operation>
            <value>Dedicated CS Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Rogers Cancellation Request</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CF - Days Live at Created Date</fullName>
        <actions>
            <name>CF_Days_Live_at_Created_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CF - Populate current monthly revenue</fullName>
        <actions>
            <name>CF_Populate_current_monthly_revenue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CR - Client ID to Account Client ID</fullName>
        <actions>
            <name>CR_Client_ID_to_Account_Client_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Client_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CR - Closed Date</fullName>
        <actions>
            <name>CR_Closed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation_Request__c.IsClosed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CR - Initial Product to New Record</fullName>
        <actions>
            <name>CR_Initial_Product_to_New_Record</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CR - Next Bill Date to Account Bill Date</fullName>
        <actions>
            <name>CR_Next_Bill_Date_to_Account_Bill_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Next_Bill_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancellation - LBW Auto Close Clear Date</fullName>
        <actions>
            <name>Cancellation_Auto_Close_Clear_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 AND 5) OR (1 AND 3 AND 4 AND 5 AND 6)</booleanFilter>
        <criteriaItems>
            <field>Cancellation_Request__c.Auto_Close_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>notEqual</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Account_Product_Type__c</field>
            <operation>equals</operation>
            <value>Leads By Web,Lead Stream ATV</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Email</field>
            <operation>notEqual</operation>
            <value>sfdc@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Refund2__c</field>
            <operation>equals</operation>
            <value>Requested</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cancellation Case LBW Auto Close Filler</fullName>
        <actions>
            <name>Auto_Close_Date_Filler</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Account_Product_Type__c</field>
            <operation>equals</operation>
            <value>Leads By Web,Lead Stream ATV</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Refund2__c</field>
            <operation>notEqual</operation>
            <value>Requested</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cancellation Form Reopened Attempts to Contact to 0</fullName>
        <actions>
            <name>Attempts_to_Contact_to_0</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Attempts_to_Contact__c</field>
            <operation>equals</operation>
            <value>1,2,3,4,5,5+</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Free Time Period Checkbox</fullName>
        <actions>
            <name>Free_Time_Period_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>equals</operation>
            <value>Free Time Period</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LBW Cancellation Email Alert</fullName>
        <actions>
            <name>LBW_Cancellation_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Initial_Product__c</field>
            <operation>equals</operation>
            <value>Leads by Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>equals</operation>
            <value>Cancelled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LBW%2FPOD Cancel Form Auto Close</fullName>
        <actions>
            <name>LBW_AMP_Cancellation_Auto_Close</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Account_IMS__c</field>
            <operation>notEqual</operation>
            <value>00560000001HpEm</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Auto_Close_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Leadstream Auto Close Cancel Code 1</fullName>
        <actions>
            <name>Cancel_Code_1_unknown</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Account_Product_Type__c</field>
            <operation>equals</operation>
            <value>Leads By Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>equals</operation>
            <value>Cancelled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Auto_Close_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>equals</operation>
            <value>System Administrator,API Integration Read/Write</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Cancel_Code_1__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Updated Cancel Codes  
Original Leadstream Auto Close First Cancel Code</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Leadstream Auto Close First Cancel Code</fullName>
        <actions>
            <name>First_Cancel_Code_unknown</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Account_Product_Type__c</field>
            <operation>equals</operation>
            <value>Leads By Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>equals</operation>
            <value>Cancelled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Auto_Close_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>equals</operation>
            <value>System Administrator</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Cancel_Code__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Leadstream Auto Close Related Fields</fullName>
        <actions>
            <name>Future_Product_to_None</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Future_Revenue_to_0</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Products_in_Cancel_to_All</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Account_Product_Type__c</field>
            <operation>equals</operation>
            <value>Leads By Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>equals</operation>
            <value>Cancelled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Auto_Close_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>equals</operation>
            <value>System Administrator</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Ownership to Duplicate Team</fullName>
        <actions>
            <name>Update_Ownership_Retention_Dupldate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>equals</operation>
            <value>Duplicate Retention Case</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Yodle Gold Cancel Request Closed</fullName>
        <actions>
            <name>Yodle_Gold_Service_Cancel_Closed_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Yodle_Gold_Service__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>notEqual</operation>
            <value>In Progress,Duplicate Retention Case</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
