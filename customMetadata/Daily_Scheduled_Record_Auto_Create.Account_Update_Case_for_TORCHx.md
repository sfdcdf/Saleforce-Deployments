<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Account Update Case for TORCHx</label>
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
        <value xsi:type="xsd:string">Subject:Sitemap Submission, 
RecordTypeId:012600000009Usk,
Requested_Campaign_Updates__c:None, 
Requested_Updates__c:None,
Requested_Website_Updates__c:Sitemap Submission,
IMS_Rep__c:00532000005PDhS, 
OwnerId:00G32000003NPaW</value>
    </values>
    <values>
        <field>Lookup_Relationships__c</field>
        <value xsi:type="xsd:string">AccountId:AccountId</value>
    </values>
    <values>
        <field>Push_New_Record_Data_To_Marketo__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>SOQL__c</field>
        <value xsi:type="xsd:string">select AccountId from Case where RecordType.Name = &apos;TORCHx NCS - AutoLaunch&apos;  and Account.Client_Experience_Key__c = &apos;torchx-main&apos;  and Status = &apos;Completed&apos; and ClosedDate = N_DAYS_AGO:7</value>
    </values>
    <values>
        <field>Supported_Objects_for_Record_Auto_Create__c</field>
        <value xsi:type="xsd:string">Case</value>
    </values>
</CustomMetadata>
