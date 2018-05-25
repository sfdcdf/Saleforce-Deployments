<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Comment_Send_to_Cancel_Owner</fullName>
        <description>Comment - Send to Cancel Owner</description>
        <protected>false</protected>
        <recipients>
            <field>Parent_Owner__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Comment_Send_to_Cancel_Owner</template>
    </alerts><alerts>
        <fullName>Comment_Send_to_Opportunity_Owner</fullName>
        <description>Comment - Send to Opportunity Owner</description>
        <protected>false</protected>
        <recipients>
            <field>Parent_Owner__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Comment_Send_to_Opportunity_Owner</template>
    </alerts></Workflow>