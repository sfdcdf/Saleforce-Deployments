<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Reactivation Organic Case</label>
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
        <value xsi:type="xsd:string">Subject__c:Reactivation, 
RecordTypeId:01232000000JOLI, 
OwnerId:00G60000001C9Hw</value>
    </values>
    <values>
        <field>Lookup_Relationships__c</field>
        <value xsi:type="xsd:string">Account_Name__c:Id</value>
    </values>
    <values>
        <field>Push_New_Record_Data_To_Marketo__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>SOQL__c</field>
        <value xsi:type="xsd:string">select id from Account where Reactivation_Date__c = LAST_N_DAYS:4 and id not in (select Account_Name__c from Organic_Analysis__c where RecordType.Name = &apos;Reactivation&apos; and CreatedDate = LAST_N_DAYS:5)</value>
    </values>
    <values>
        <field>Supported_Objects_for_Record_Auto_Create__c</field>
        <value xsi:type="xsd:string">Organic_Analysis__c</value>
    </values>
</CustomMetadata>
