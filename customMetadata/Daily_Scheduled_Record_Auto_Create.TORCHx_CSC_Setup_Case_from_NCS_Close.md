<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>TORCHx CSC Setup Case from NCS Close</label>
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
        <value xsi:type="xsd:string">and Account.Test_Management__c&lt;&gt; &apos;TORCHx Fulfillment Engagement Test&apos;</value>
    </values>
    <values>
        <field>Default_Values__c</field>
        <value xsi:type="xsd:string">Subject:TORCHx CSC - Setup Call, 
RecordTypeId:012600000009cjs, 
Reason:CSC, 
Channel_Type__c:Local, 
OwnerId:00G32000003NOtI</value>
    </values>
    <values>
        <field>Lookup_Relationships__c</field>
        <value xsi:type="xsd:string">AccountId:AccountId, 
Scheduled_Call__c:CSC_Reschedule_Date_2__c</value>
    </values>
    <values>
        <field>Push_New_Record_Data_To_Marketo__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>SOQL__c</field>
        <value xsi:type="xsd:string">select AccountId, CSC_Reschedule_Date_2__c from Case where RecordType.Name = &apos;TORCHx NCS - AutoLaunch&apos; and Account.Client_Experience_Key__c like &apos;%torchx%&apos; and Web_Dev_Score_for_IMS__c  = N_DAYS_AGO:1</value>
    </values>
    <values>
        <field>Supported_Objects_for_Record_Auto_Create__c</field>
        <value xsi:type="xsd:string">Case</value>
    </values>
</CustomMetadata>
