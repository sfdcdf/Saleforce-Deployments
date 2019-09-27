<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>MLS_Worksheet_Subject</fullName>
        <field>Subject__c</field>
        <formula>"MLS Setup for Client "+ Account_Name__r.Client_ID__c</formula>
        <name>MLS Worksheet Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Client_s_Phone_Number</fullName>
        <field>Client_Phone_Number__c</field>
        <formula>Account_Name__r.Phone</formula>
        <name>Populate Client's Phone Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Client_ID_Field</fullName>
        <field>Client_ID__c</field>
        <formula>Account_Name__r.Client_ID__c</formula>
        <name>Update Client ID Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>MLS Subject Populate</fullName>
        <actions>
            <name>MLS_Worksheet_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Worksheets__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>MLS Worksheet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Worksheets__c.Subject__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate Client%27s Phone Number</fullName>
        <actions>
            <name>Populate_Client_s_Phone_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Worksheets__c.Client_Phone_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Client ID Field</fullName>
        <actions>
            <name>Update_Client_ID_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Worksheets__c.Client_ID__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
