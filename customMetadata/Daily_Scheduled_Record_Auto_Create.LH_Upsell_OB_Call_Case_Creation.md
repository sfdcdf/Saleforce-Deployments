<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>LH Upsell OB Call Case Creation</label>
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
        <value xsi:type="xsd:string">Subject:14 Day Touch Plan, 
RecordTypeId:012600000009cjs, 
Reason:CS Touch Plan, 
Channel_Type__c:Lighthouse, 
Link_to_Script__c:na26.salesforce.com/articles/Scripts/Lighthouse-SEM-Upsell-Touch-Plan-Script/p</value>
    </values>
    <values>
        <field>Lookup_Relationships__c</field>
        <value xsi:type="xsd:string">AccountId:AccountId,
OwnerId:OwnerId</value>
    </values>
    <values>
        <field>Push_New_Record_Data_To_Marketo__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>SOQL__c</field>
        <value xsi:type="xsd:string">select AccountId, OwnerId from Case where LastModifiedDate &gt; N_DAYS_AGO:20
and RecordType.Name = &apos;NCS - AutoLaunch&apos; and Account.Client_Experience_Key__c = &apos;lighthouse-main&apos; and Upsell__c = TRUE and Date_Moved_to_3CSC_Status__c = N_DAYS_AGO:14</value>
    </values>
    <values>
        <field>Supported_Objects_for_Record_Auto_Create__c</field>
        <value xsi:type="xsd:string">Case</value>
    </values>
</CustomMetadata>
