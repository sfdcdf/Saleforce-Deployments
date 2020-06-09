<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Canceled_Lighthouse_Auto_Account_Alert_to_BoltOn</fullName>
        <ccEmails>billing@boltontechnology.com</ccEmails>
        <description>Canceled Lighthouse Auto Account - Alert to BoltOn</description>
        <protected>false</protected>
        <recipients>
            <recipient>kevin.lewis@lighthousepmg.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Auto_IB_OB/Canceled_Lighthouse_Auto_Account_Alert_to_BoltOn</template>
    </alerts>
    <alerts>
        <fullName>LH_Cancel_Ownership_Change_Alert</fullName>
        <description>LH Cancel - Ownership Change Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Cancellation_Case_has_been_Assigned</template>
    </alerts>
    <alerts>
        <fullName>New_LH_Auto_Cancel_Request_has_been_created</fullName>
        <description>New LH Auto Cancel Request has been created</description>
        <protected>false</protected>
        <recipients>
            <recipient>kevin.lewis@lighthousepmg.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>autosupport@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Field_Service_Retention/Cancellation_Confirmation_Field_Service</template>
    </alerts>
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
        <fullName>LH_Cancel_Free_Time_Period</fullName>
        <field>Free_Time__c</field>
        <literalValue>1</literalValue>
        <name>LH Cancel - Free Time Period</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LH_Cancel_Free_Time_Period_CallDate</fullName>
        <field>Next_Scheduled_Contact_Date__c</field>
        <formula>NOW()+30</formula>
        <name>LH Cancel - Free Time Period - CallDate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LH_Cancel_Free_Time_Period_Checkbox</fullName>
        <field>Free_Time__c</field>
        <literalValue>1</literalValue>
        <name>LH Cancel - Free Time Period - Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LH_Cancellation_Fill_in_Date_of_Cancel</fullName>
        <field>Date_of_Cancellation_Request__c</field>
        <formula>TODAY()</formula>
        <name>LH Cancellation - Fill in Date of Cancel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Office_Phone_FillIn</fullName>
        <field>Client_s_Phone__c</field>
        <formula>Account_Name__r.Phone</formula>
        <name>Office Phone FillIn</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
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
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
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
        <description>General</description>
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
        <description>General workflow</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
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
        <description>General workflow</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Cancel - Free Time Period</fullName>
        <actions>
            <name>LH_Cancel_Free_Time_Period</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Cancel_Free_Time_Period_CallDate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Cancel_Free_Time_Period_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Cancellation_Fill_in_Date_of_Cancel</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.Outcome__c</field>
            <operation>equals</operation>
            <value>Saved With Free Time,Dollar Sync Period</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Cancellation Request,TORCHx Cancellation Request</value>
        </criteriaItems>
        <description>LH Specific .</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Cancel - Ownership Change Alert</fullName>
        <actions>
            <name>LH_Cancel_Ownership_Change_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>LH Specific</description>
        <formula>AND(RecordType.Name = "LH Cancellation Request", ISCHANGED( OwnerId ), LEFT(PRIORVALUE(OwnerId),3) = '00G', LEFT(OwnerId,3) = '005' )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LH Cancellation - Fill in Date of Cancellation Request</fullName>
        <actions>
            <name>LH_Cancellation_Fill_in_Date_of_Cancel</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cancellation_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Cancellation Request</value>
        </criteriaItems>
        <description>LH specific .</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
