<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>MDF_Form_Submit</fullName>
        <description>MDF Form Submit</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Portal_Templates/MDF_Submission_Template</template>
    </alerts><alerts>
        <fullName>Partner_MDF_Status_Notification_Email_Alert</fullName>
        <description>Partner MDF Status Notification Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Requested_By__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Portal_Templates/MDF_Partner_Status_Notification</template>
    </alerts><rules>
        <fullName>Partner MDF Status Notification</fullName>
        <actions>
            <name>Partner_MDF_Status_Notification_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( MDF_Status__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Partner Submission of MDF Form</fullName>
        <actions>
            <name>MDF_Form_Submit</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>1 = 1</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules></Workflow>