<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>WBN_Send_Email_New_Key_Decision_maker_contact_added_to_Master_Acc</fullName>
        <description>WBN - Send Email when a New Key Decision Maker contact added to master Acc record Type</description>
        <protected>false</protected>
        
        
        
        
        <senderType>CurrentUser</senderType>
        <template>National_Templates/WBN_New_Key_Contact_YBN_Master_Account</template>
    <recipients>
            <recipient>dlynch@web.com</recipient>
            <type>user</type>
        </recipients><recipients>
            <recipient>raymond.rosario@web.com</recipient>
            <type>user</type>
        </recipients></alerts>
    <fieldUpdates>
        <fullName>Date_Post_Launch_Survey_Sent</fullName>
        <field>Date_Post_Launch_Survey_Sent__c</field>
        <formula>today()</formula>
        <name>Contact Date Post Launch Survey to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Days_Since_Live_on_Contact</fullName>
        <field>Days_Since_Live__c</field>
        <formula>Account.Days_Since_Live__c</formula>
        <name>Contact Days Since Live to Acct Days Liv</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Date Post Launch Survey Sent</fullName>
        <actions>
            <name>Date_Post_Launch_Survey_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Send_Post_Launch_Survey__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Days %28%23%29 Since Live</fullName>
        <actions>
            <name>Days_Since_Live_on_Contact</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.send_45_day_survey__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>equals</operation>
            <value>jshecker@gmail.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>WBN - New Decision Maker Contact added to YBN Master Account</fullName>
        <actions>
            <name>WBN_Send_Email_New_Key_Decision_maker_contact_added_to_Master_Acc</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Role__c</field>
            <operation>equals</operation>
            <value>Decision Maker</value>
        </criteriaItems>
        <description>Contact is added/edited where Role = 'Decision Maker' on YBN Master Account Records</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
