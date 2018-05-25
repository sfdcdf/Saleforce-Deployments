<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Alert_Channel_Lead_of_New_Request</fullName>
        <description>Alert Channel Lead of New Request</description>
        <protected>false</protected>
        <recipients>
            <field>Channel_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Alert_to_Channel_Lead_For_Organic_Process_Request</template>
    </alerts><alerts>
        <fullName>Organic_Process_Request_Alert_Creator_In_Progress</fullName>
        <description>Organic Process Request - Alert Creator In Progress</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Process_Request_In_Progress</template>
    </alerts><alerts>
        <fullName>Organic_Process_Request_Alert_John_King_of_Rogers_MOPs_Update</fullName>
        <description>Organic Process Request - Alert John King of Rogers MOPs Update</description>
        <protected>false</protected>
        <recipients>
            <recipient>mary.kellum@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Process_Request_Completed</template>
    </alerts><alerts>
        <fullName>Organic_Process_Request_Alert_Michal_of_Web_Dev_Update</fullName>
        <description>Organic Process Request - Alert Michal of Web Dev Update</description>
        <protected>false</protected>
        <recipients>
            <recipient>mswiader@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Process_Request_Completed</template>
    </alerts><alerts>
        <fullName>Organic_Process_Request_Alert_Rusty_of_MA_Update</fullName>
        <description>Organic Process Request - Alert Rusty of MA Update</description>
        <protected>false</protected>
        <recipients>
            <recipient>sfdc@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Process_Request_Completed</template>
    </alerts><alerts>
        <fullName>Organic_Process_Request_Alert_User_Channel_Lead_Approved</fullName>
        <description>Organic Process Request - Alert User Channel Lead Approved</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic</template>
    </alerts><alerts>
        <fullName>Organic_Process_Request_Status_Moved_to_Completed</fullName>
        <description>Organic Process Request - Status Moved to Completed</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>dminchala@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jcoggin@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tbright@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Process_Request_Completed</template>
    </alerts><alerts>
        <fullName>Organic_Process_Request_Status_Moved_to_Completed_Denied</fullName>
        <description>Organic Process Request - Status Moved to Completed Denied</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Organic_Process_Request_Completed_Denied</template>
    </alerts><fieldUpdates>
        <fullName>Assign_to_Organic_Process_Request_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Production_Requests</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>OPR - Owner to Organic Process Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OR_Proc_Req_Update_Approval_Date</fullName>
        <field>Approved_Date__c</field>
        <formula>Today()</formula>
        <name>OR Proc Req - Update Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>OR_Proc_Req_Update_Channel_Appr_Date</fullName>
        <field>Channel_Lead_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>OR Proc Req - Update Channel Appr Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Organic_Process_Request_Created_Date</fullName>
        <description>Updates Created Date field on Organic Process Request Object with date on which object was created.</description>
        <field>Created_Date_2__c</field>
        <formula>today()</formula>
        <name>Organic Process Request - Created Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Organic Process Request - Created Date</fullName>
        <actions>
            <name>Organic_Process_Request_Created_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OPT_Process_Request__c.RecordTypeId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates Created Date with date of creation.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Organic Process Request - Status Completed%2C MA Impacted</fullName>
        <actions>
            <name>Organic_Process_Request_Alert_Rusty_of_MA_Update</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OPT_Process_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>OPT_Process_Request__c.Teams_Impacted__c</field>
            <operation>includes</operation>
            <value>Marketing Associates</value>
        </criteriaItems>
        <description>Organic Process Request status changed to "Completed" &amp; MA impacted</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Process Request - Status Completed%2C Rogers Mops Impacted</fullName>
        <actions>
            <name>Organic_Process_Request_Alert_John_King_of_Rogers_MOPs_Update</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OPT_Process_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>OPT_Process_Request__c.Teams_Impacted__c</field>
            <operation>includes</operation>
            <value>Rogers MOPs</value>
        </criteriaItems>
        <description>Organic Process Request status changed to "Completed" &amp; Rogers Mops impacted</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Process Request - Status Completed%2C Web Dev Impacted</fullName>
        <actions>
            <name>Organic_Process_Request_Alert_Michal_of_Web_Dev_Update</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OPT_Process_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>OPT_Process_Request__c.Teams_Impacted__c</field>
            <operation>includes</operation>
            <value>Web Dev</value>
        </criteriaItems>
        <description>Organic Process Request status changed to "Completed" &amp; Web Dev as Impacted Team</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Process Request - Status changed to Completed</fullName>
        <actions>
            <name>Organic_Process_Request_Status_Moved_to_Completed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OPT_Process_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Organic Process Request status changed to "Completed"</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Process Request - Status changed to Completed Denied</fullName>
        <actions>
            <name>Organic_Process_Request_Status_Moved_to_Completed_Denied</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OPT_Process_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed - Approval Denied</value>
        </criteriaItems>
        <description>Organic Process Request status changed to "Completed - Approval Denied"</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Organic Process Request - Status changed to In Progress</fullName>
        <actions>
            <name>Organic_Process_Request_Alert_Creator_In_Progress</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>OR_Proc_Req_Update_Approval_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OPT_Process_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <description>Organic Process Request status changed to "In Progress"</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Status changed to Pending MOPS OPT Discussion</fullName>
        <actions>
            <name>Organic_Process_Request_Alert_User_Channel_Lead_Approved</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>OR_Proc_Req_Update_Channel_Appr_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OPT_Process_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Channel Lead Approved - Pending OPT/MOPS Discussion</value>
        </criteriaItems>
        <description>Status changed to "Channel Lead Approved - Pending OPT/MOPS Discussion"</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Upon Creation Default to Channel Lead</fullName>
        <actions>
            <name>Alert_Channel_Lead_of_New_Request</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Assign_to_Organic_Process_Request_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OPT_Process_Request__c.Request_Details__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>