<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Automated_TP_Event_Scheduled</fullName>
        <description>Automated TP Event Scheduled</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Automated_TP_Event_Scheduled</template>
    </alerts><alerts>
        <fullName>YBN_Automated_TP_Event_Rescheduled</fullName>
        <description>YBN - Automated TP Event Rescheduled</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Automated_TP_Event_Rescheduled</template>
    </alerts><fieldUpdates>
        <fullName>YBN_date_stamp_close_plan</fullName>
        <field>Close_Date__c</field>
        <formula>TODAY()</formula>
        <name>YBN date stamp close plan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>ybn_update_close_date_when_closed</fullName>
        <field>Close_Date__c</field>
        <formula>TODAY()</formula>
        <name>ybn update close date when closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Event_Start_Time</fullName>
        <field>Event_Start_time__c</field>
        <formula>ActivityDateTime</formula>
        <name>Update Event Start Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>WBN - Automated TP Alert Created</fullName>
        <actions>
            <name>Automated_TP_Event_Scheduled</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event.RecordTypeId</field>
            <operation>equals</operation>
            <value>WBN Calendar Blocker</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>WBN - Automated TP Alert Updated</fullName>
        <actions>
            <name>YBN_Automated_TP_Event_Rescheduled</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(   RecordType.Name = "WBN Calendar Blocker",    OR(     ISCHANGED(ActivityDate),     ISCHANGED(ActivityDateTime)   ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>YBN Update Close Date for Events</fullName>
        <actions>
            <name>YBN_date_stamp_close_plan</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>ybn event update date when closed</fullName>
        <actions>
            <name>ybn_update_close_date_when_closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event.Status__c</field>
            <operation>equals</operation>
            <value>Completed,LifeCycle Milestone Completed,Closed - Not Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Update Event Start Time</fullName>
        <actions>
            <name>Update_Event_Start_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event.ActivityDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>
