<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Account Update Case for GreenSky</label>
    <protected>false</protected>
    <values>
        <field>Active__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>Additional_Default_Values__c</field>
        <value xsi:type="xsd:string">Description: See Notes Below,
Requested_Campaign_Updates__c:Ad Copy / Promotion Update,
general_notes__c:Please see implementation guide and follow all appropriate steps docs.google.com/document/d/1CSc-uUnMDaSnGBo6HiJb_i0ShsHKIjtdpnttj5ythmE</value>
    </values>
    <values>
        <field>Additional_SOQL_Criteria__c</field>
        <value xsi:nil="true"/>
    </values>
    <values>
        <field>Default_Values__c</field>
        <value xsi:type="xsd:string">Subject:Implement GreenSky into Marketing,
RecordTypeId:012600000009Usk,
OwnerId:00G60000001C52n,
Requested_Updates__c:None,
Requested_Website_Updates__c:Website Change/Update,
Ad_Copy_Changes_PPC__c:See Notes Below,
IMS_Rep__c:00560000001HpEm</value>
    </values>
    <values>
        <field>Lookup_Relationships__c</field>
        <value xsi:type="xsd:string">AccountId:AccountId,Origin:Origin,Description:Description</value>
    </values>
    <values>
        <field>Push_New_Record_Data_To_Marketo__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>SOQL__c</field>
        <value xsi:type="xsd:string">select AccountId, Origin, Description from Case where RecordType.Name = &apos;Master&apos; and Status = &apos;New&apos; and Origin = &apos;greenskymerchant@web.com&apos; and CreatedDate = YESTERDAY</value>
    </values>
    <values>
        <field>Supported_Objects_for_Record_Auto_Create__c</field>
        <value xsi:type="xsd:string">Case</value>
    </values>
</CustomMetadata>
