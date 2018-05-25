<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Notify_Case_Creator_of_Case_Comment</fullName>
        <description>Notify Case Creator of Case Comment</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Case_Comment_Added</template>
    </alerts><alerts>
        <fullName>YBN_Case_Comment_Fire_Drill_Taxonomy</fullName>
        <description>YBN Case Comment Fire Drill - Taxonomy</description>
        <protected>false</protected>
        <recipients>
            <recipient>akramer@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Fire_Drill_Case_Comment_Added</template>
    </alerts><alerts>
        <fullName>YBN_new_case_comment</fullName>
        <description>YBN new case comment email alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_new_case_comment</template>
    </alerts><alerts>
        <fullName>YBN_new_case_comment_email_alert</fullName>
        <description>YBN new case comment email alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_new_case_comment</template>
    </alerts><alerts>
        <fullName>YBN_new_case_comment_email_alertS</fullName>
        <description>YBN new case comment email alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_new_case_comment</template>
    </alerts><fieldUpdates>
        <fullName>lock_case_comment_true</fullName>
        <field>lock_case_comments__c</field>
        <literalValue>1</literalValue>
        <name>lock case comment = true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><rules>
        <fullName>Lock LH Maser Case Comment When Case Closed</fullName>
        <actions>
            <name>lock_case_comment_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>LH Master</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Notify Case Creator Of Case Comment</fullName>
        <actions>
            <name>Notify_Case_Creator_of_Case_Comment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>YBN Reporting</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Reporting</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Master</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules></Workflow>