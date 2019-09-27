<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Date_Sent_to_Queue</fullName>
        <field>Date_Sent_to_Queue__c</field>
        <formula>Today()</formula>
        <name>Date Sent to Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>QA Audit - Date Sent to Queue</fullName>
        <actions>
            <name>Date_Sent_to_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.OwnerId</field>
            <operation>contains</operation>
            <value>Post Launch Associate Queue</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
