<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Last_Attempt_By_Update</fullName>
        <field>Last_Attempt_By__c</field>
        <formula>Attempts_Made_By__r.Full_Name__c</formula>
        <name>Last Attempt By - Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Case__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Attempt_Date</fullName>
        <description>Updates the Last Attempt Date Date/Time field, not the formula field. This is updating based on the Attempts Made Object</description>
        <field>Attempt_Date_1__c</field>
        <formula>Attempt_Date__c</formula>
        <name>Last Attempt Date - Update from Attem</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Case__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Last Attempt Date - Update from Attempt Date</fullName>
        <actions>
            <name>Last_Attempt_By_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Attempt_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>General workflow , Updates the Last Attempt Date Date/Time field, not the formula field.  This is updating based on the Attempts Made Object</description>
        <formula>OR(IF(Attempt_Date__c &gt; DATETIMEVALUE(Case__r.Last_Attempt_Date__c), TRUE , FALSE), ISBLANK(DATETIMEVALUE(Case__r.Last_Attempt_Date__c)))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
