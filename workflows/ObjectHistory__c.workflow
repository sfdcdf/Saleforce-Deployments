<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><fieldUpdates>
        <fullName>Object_History_Update_Time_Field</fullName>
        <description>Updates Time Value Field with time in CST</description>
        <field>Time_Value__c</field>
        <formula>TIMEVALUE( 
(DATETIMEVALUE( 
SUBSTITUTE(FieldValue__c, 
MID(FieldValue__c, 15,2) 
, '00' 
) ) 
- 5/24) 
)</formula>
        <name>Object History Update Time Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Object History Update Time</fullName>
        <actions>
            <name>Object_History_Update_Time_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ObjectHistory__c.FieldName__c</field>
            <operation>equals</operation>
            <value>Scheduled Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules></Workflow>