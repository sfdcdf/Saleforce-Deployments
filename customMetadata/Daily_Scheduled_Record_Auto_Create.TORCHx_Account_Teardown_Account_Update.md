<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>TORCHx Account Teardown - Account Update</label>
    <protected>false</protected>
    <values>
        <field>Active__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>Additional_Default_Values__c</field>
        <value xsi:nil="true"/>
    </values>
    <values>
        <field>Additional_SOQL_Criteria__c</field>
        <value xsi:nil="true"/>
    </values>
    <values>
        <field>Default_Values__c</field>
        <value xsi:type="xsd:string">Subject:Account Teardown,
RecordTypeId:012600000009Usk,
OwnerId:00G32000003NPaW,
Requested_Updates__c:None,
Requested_Website_Updates__c:MLS Vendor Fees,
IMS_Rep__c:00532000005PDhS,
Description:Verify Vendor Fees,
Requested_Campaign_Updates__c:None</value>
    </values>
    <values>
        <field>Lookup_Relationships__c</field>
        <value xsi:type="xsd:string">AccountId:Account_Name__c</value>
    </values>
    <values>
        <field>Push_New_Record_Data_To_Marketo__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>SOQL__c</field>
        <value xsi:type="xsd:string">select Account_Name__c from Cancellation_Request__c where RecordType.name = &apos;TORCHx Cancellation Request&apos; and Outcome__c = &apos;Cancelled&apos; and Closed_Date__c = YESTERDAY</value>
    </values>
    <values>
        <field>Supported_Objects_for_Record_Auto_Create__c</field>
        <value xsi:type="xsd:string">Case</value>
    </values>
</CustomMetadata>
