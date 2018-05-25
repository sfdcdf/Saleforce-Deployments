<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>OrganicCustomContentSetupCaseBatch_Email_Alert</fullName>
        <description>OrganicCustomContentSetupCaseBatch Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>sfdc@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Admin_Email_Templates/OrganicCustomContentSetupCaseBatch_Failed_Email_Template</template>
    </alerts><rules>
        <fullName>Organic Custom Content Case failure notification</fullName>
        <actions>
            <name>OrganicCustomContentSetupCaseBatch_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>DebugInfo__c.DebugData__c</field>
            <operation>contains</operation>
            <value>OrganicCustomContentSetupCaseBatch</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules></Workflow>