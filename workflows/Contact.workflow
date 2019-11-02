<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Date_Post_Launch_Survey_Sent</fullName>
        <field>Date_Post_Launch_Survey_Sent__c</field>
        <formula>today()</formula>
        <name>Contact Date Post Launch Survey to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Date Post Launch Survey Sent</fullName>
        <actions>
            <name>Date_Post_Launch_Survey_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Send_Post_Launch_Survey__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
