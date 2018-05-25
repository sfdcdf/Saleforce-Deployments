<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><rules>
        <fullName>Test</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Product2.Name</field>
            <operation>equals</operation>
            <value>Ad Station Re-Fill</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Test Upsell Stuff</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Product2.Name</field>
            <operation>equals</operation>
            <value>New Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>