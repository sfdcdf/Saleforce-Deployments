<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Call_Answering_Status_moves_to_Active</fullName>
        <description>Call Answering Status moves to Active</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/Call_Answering_Active</template>
    </alerts><alerts>
        <fullName>Call_Answering_Status_moves_to_Active_from_change_request</fullName>
        <description>Call Answering Status moves to Active from Change Request</description>
        <protected>false</protected>
        <recipients>
            <field>Requested_By_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/Call_Answering_ChangeCompleted</template>
    </alerts><alerts>
        <fullName>Call_Answering_Status_moves_to_Deactivated</fullName>
        <description>Call Answering Status moves to Deactivated</description>
        <protected>false</protected>
        <recipients>
            <field>Requested_By_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/Call_Answering_Deactivated</template>
    </alerts><alerts>
        <fullName>Call_Answering_Status_moves_to_Setup_In_Progress</fullName>
        <description>Call Answering Status moves to Setup In Progress</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CS_Ops_Object/Call_Answering_In_Progress</template>
    </alerts><alerts>
        <fullName>send_email_for_call_answering_work</fullName>
        <ccEmails>yodlecallanswering@yodle.com</ccEmails>
        <description>send email for call answering work</description>
        <protected>false</protected>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Call_Answering_Work</template>
    </alerts><fieldUpdates>
        <fullName>Assign_to_Call_Answering_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Call_Answering</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>CA - Owner to Call Answering Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CA_Cancel_Complete_Date</fullName>
        <field>Cancel_Complete_Date__c</field>
        <formula>now()</formula>
        <name>CA - Cancel Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>CA_Cancel_Submit_Date</fullName>
        <field>Cancel_Submit_Date__c</field>
        <formula>now()</formula>
        <name>CA - Cancel Submit Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>CA_Change_Complete_Date</fullName>
        <field>Change_Complete_Date__c</field>
        <formula>now()</formula>
        <name>CA - Change Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>CA_Change_Submit_Date</fullName>
        <field>Change_Submit_Date__c</field>
        <formula>now()</formula>
        <name>CA - Change Submit Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>CA_Question_Complete_Date</fullName>
        <field>Question_Complete_Date__c</field>
        <formula>now()</formula>
        <name>CA - Question Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>CA_Question_Submit_Date</fullName>
        <field>Question_Submit_Date__c</field>
        <formula>now()</formula>
        <name>CA - Question Submit Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>CA_Setup_Complete_Date</fullName>
        <field>Setup_Complete_Date__c</field>
        <formula>now()</formula>
        <name>CA - Setup Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>CA_Setup_Submit_Date</fullName>
        <field>Setup_Submit_Date__c</field>
        <formula>now()</formula>
        <name>CA - Setup Submit Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Change_Request_Details_to_Blank</fullName>
        <field>Change_Request_Details__c</field>
        <name>Change Request Details to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initial_Setup_Complete</fullName>
        <field>Initial_Setup_Complete__c</field>
        <literalValue>1</literalValue>
        <name>Initial Setup Complete to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Questions_Issues_to_Blank</fullName>
        <field>Question_Issue__c</field>
        <name>Questions/Issues to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Requested_By_to_User_F_L_Name</fullName>
        <field>Requested_By__c</field>
        <formula>$User.FirstName &amp;" "&amp; $User.LastName</formula>
        <name>Requested By to User F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_requested_by_email</fullName>
        <description>updates requested by email</description>
        <field>Requested_By_Email__c</field>
        <formula>$User.Email</formula>
        <name>Update requested by email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Assign to Call Answering Queue</fullName>
        <actions>
            <name>Assign_to_Call_Answering_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Business_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When a call answering setup request is submitted, it directs to the call answering queue.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CA - Cancel Complete Date</fullName>
        <actions>
            <name>CA_Cancel_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Deactivated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CA - Cancel Submit Date</fullName>
        <actions>
            <name>CA_Cancel_Submit_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Cancel Service</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CA - Change Complete Date</fullName>
        <actions>
            <name>CA_Change_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and(
ischanged (Call_Answering_Status__c),
ispickval( Call_Answering_Status__c , "Active"),
 ispickval(PRIORVALUE (Call_Answering_Status__c) , "Change Requested"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>CA - Change Submit Date</fullName>
        <actions>
            <name>CA_Change_Submit_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Change Requested</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CA - Question Complete Date</fullName>
        <actions>
            <name>CA_Question_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and(
ischanged (Call_Answering_Status__c),
ispickval( Call_Answering_Status__c , "Active"),
 ispickval(PRIORVALUE (Call_Answering_Status__c) , "Question/Issue"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>CA - Question Submit Date</fullName>
        <actions>
            <name>CA_Question_Submit_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Question/Issue</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>CA - Setup Complete Date</fullName>
        <actions>
            <name>CA_Setup_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>and(
ischanged (Call_Answering_Status__c),
ispickval( Call_Answering_Status__c , "Active"),
 ispickval(PRIORVALUE (Call_Answering_Status__c) , "Setup In Progress"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>CA - Setup Submit Date</fullName>
        <actions>
            <name>CA_Setup_Submit_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>New Setup</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Call Answering Status moved to Active</fullName>
        <actions>
            <name>Call_Answering_Status_moves_to_Active</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Answering__c.Requested_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Call Answering Status field is changed from In Progress to Active.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Call Answering Status moved to Deactivated</fullName>
        <actions>
            <name>Call_Answering_Status_moves_to_Deactivated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Deactivated</value>
        </criteriaItems>
        <description>Call Answering Status field is changed to Deactivated.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Call Answering Status moved to Setup In Progress</fullName>
        <actions>
            <name>Call_Answering_Status_moves_to_Setup_In_Progress</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Setup In Progress</value>
        </criteriaItems>
        <description>Call Answering Status field is changed from New Setup to In Progress.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Call Answering Status moves from Change Requested to Active</fullName>
        <actions>
            <name>Call_Answering_Status_moves_to_Active_from_change_request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Answering__c.Requested_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Call Answering Status field is changed from Change Requested to Active.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Change Request %26 Question User</fullName>
        <actions>
            <name>Requested_By_to_User_F_L_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_requested_by_email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Question/Issue,Change Requested</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initial Setup Complete</fullName>
        <actions>
            <name>Initial_Setup_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Send email for call answering work</fullName>
        <actions>
            <name>send_email_for_call_answering_work</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>notEqual</operation>
            <value>Setup In Progress,Active,Deactivated</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>notContain</operation>
            <value>YBN,National</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Status Changed to Active</fullName>
        <actions>
            <name>Change_Request_Details_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Questions_Issues_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Answering__c.Call_Answering_Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>