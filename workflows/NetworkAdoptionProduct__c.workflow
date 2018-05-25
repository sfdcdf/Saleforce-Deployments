<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><fieldUpdates>
        <fullName>Update_Monthly_Value</fullName>
        <field>MonthlyValue__c</field>
        <formula>AdoptionPct__c * Quantity__c * SalesPrice__c</formula>
        <name>Update Monthly Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Total_Value</fullName>
        <field>TotalValue__c</field>
        <formula>AdoptionPct__c * Quantity__c * SalesPrice__c * AdoptionLen__c</formula>
        <name>Update Total Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Calculate Values - One Time</fullName>
        <actions>
            <name>Update_Total_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
  NOT(CONTAINS(TEXT(Product__c), "Setup")),
  OR(
    ISNEW(),
    ISCHANGED(AdoptionPct__c),
    ISCHANGED(AdoptionLen__c),
    ISCHANGED(SalesPrice__c),
    ISCHANGED(Quantity__c),
    ISCHANGED(ApexUpdate__c) 
  )
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate Values - Recurring</fullName>
        <actions>
            <name>Update_Monthly_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Total_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
  ISNEW(),
  ISCHANGED(AdoptionPct__c),
  ISCHANGED(AdoptionLen__c),
  ISCHANGED(SalesPrice__c),
  ISCHANGED(Quantity__c),
  ISCHANGED(ApexUpdate__c) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules></Workflow>