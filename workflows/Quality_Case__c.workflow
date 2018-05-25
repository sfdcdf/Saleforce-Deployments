<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Quality_Case_Assigned</fullName>
        <description>Quality Case Assigned</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>sfdc@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Quality_Case_New_Owner</template>
    </alerts><alerts>
        <fullName>Quality_Case_Work_Completed</fullName>
        <description>Quality Case Work Completed</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>sfdc@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Quality_Case_Completed</template>
    </alerts><fieldUpdates>
        <fullName>Owner_to_Quality_Team</fullName>
        <field>OwnerId</field>
        <lookupValue>QualityTeam295311</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Owner to Quality Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Quality_Case_Closed_Date_Time</fullName>
        <field>Case_Closed_Date_Time__c</field>
        <formula>NOW()</formula>
        <name>Quality Case Closed Date/Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Quality_Case_Closed_by_First_Last_Name</fullName>
        <field>Case_Closed_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>Quality Case Closed by First Last Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Assign to Quality Team When Created</fullName>
        <actions>
            <name>Owner_to_Quality_Team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR( RecordType.Id = "0120e000000ghup",  RecordType.Id = "0120e000000ghtI")</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Quality Case Closed</fullName>
        <actions>
            <name>Quality_Case_Closed_Date_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Quality_Case_Closed_by_First_Last_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Quality_Case__c.IsClosed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>