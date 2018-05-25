<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><fieldUpdates>
        <fullName>Account_MLS_Account_Status_Field_Update</fullName>
        <field>Account_Status__c</field>
        <formula>TEXT(Account__r.Status__c)</formula>
        <name>Account MLS Account Status Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Account MLS Acct Status Fill</fullName>
        <actions>
            <name>Account_MLS_Account_Status_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules></Workflow>