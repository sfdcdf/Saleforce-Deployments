<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>W9_Email_Alert</fullName>
        <ccEmails>cvolper@yodle.com</ccEmails>
        <description>W9 Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Marketing/W9_Form</template>
    </alerts><rules>
        <fullName>Send Out W9</fullName>
        <actions>
            <name>W9_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Partner_Name__c.Send_W9__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>