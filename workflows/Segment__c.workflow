<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Local_Status_Change</fullName>
        <field>Last_Local_Status_Change__c</field>
        <formula>now()</formula>
        <name>Segment Last Local Status to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Local Status Change</fullName>
        <actions>
            <name>Local_Status_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>General</description>
        <formula>ISCHANGED( Local_Segment_Status__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
