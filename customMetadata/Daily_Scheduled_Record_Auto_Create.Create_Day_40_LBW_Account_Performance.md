<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Create Day 40 LBW Account Performance</label>
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
        <value xsi:type="xsd:string">and id not in (&apos;0013200001HFrNBAA1&apos;, &apos;0013200001HG9RIAA1&apos;, &apos;0013200001HGJT4AAP&apos;, &apos;0013200001HHAqbAAH&apos;) and Pause_Touchplan__c = false and Account_Product_Sub_Type__c != &apos;Lead Stream - Platform Only&apos;</value>
    </values>
    <values>
        <field>Default_Values__c</field>
        <value xsi:type="xsd:string">Reason:CS Touch Plan,
Subject:LBW Monthly Touchplan, 
OwnerId:00532000005P6l3,  
RecordTypeId:012600000009cjs, 
Priority:Major, 
Status:New,
Link_to_Script__c:webdc.my.salesforce.com/articles/Scripts/Leads-by-Web-Performance-Call-Script</value>
    </values>
    <values>
        <field>Lookup_Relationships__c</field>
        <value xsi:type="xsd:string">AccountId:Id, Scheduled_Call__c:Next_Scheduled_Touchpoint__c</value>
    </values>
    <values>
        <field>Push_New_Record_Data_To_Marketo__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>SOQL__c</field>
        <value xsi:type="xsd:string">SELECT Id,Next_Scheduled_Touchpoint__c FROM Account where Marketo_ID__c != &apos;&apos; and Status__c = &apos;LIVE&apos; and Product_Type_Transactional__c = &apos;Leads By Web&apos; and Days_Since_Live__c in (27,57,87)</value>
    </values>
    <values>
        <field>Supported_Objects_for_Record_Auto_Create__c</field>
        <value xsi:type="xsd:string">Case</value>
    </values>
</CustomMetadata>
