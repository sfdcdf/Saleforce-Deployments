<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Email_for_Survey_on_Yodle_Path_Setup_Call_Complete</fullName>
        <description>Email for Survey on Yodle Path Setup Call Complete</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>kevinbiggs@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Yodle_Path_Setup_Call_Survey</template>
    </alerts><fieldUpdates>
        <fullName>Change_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Coaching_Call_4th_Attempt</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Closed_Date</fullName>
        <field>Completed_Date__c</field>
        <formula>Today()</formula>
        <name>Closed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Set_Date</fullName>
        <field>Pass_Fail_Date__c</field>
        <formula>TODAY()</formula>
        <name>Set Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Stamp_Closed_Date_TIme</fullName>
        <field>Completed_Date_Time__c</field>
        <formula>Now()</formula>
        <name>Stamp Closed Date/TIme</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Stamp_Closing_User</fullName>
        <field>Yodle_Path_Completed_by__c</field>
        <formula>LastModifiedBy.Full_Name__c</formula>
        <name>Stamp Closing User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Status_Update</fullName>
        <field>Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Status_Update_for_Fails</fullName>
        <field>Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>Status Update for Fails</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Status_Update_for_Passes</fullName>
        <field>Status__c</field>
        <literalValue>Completed</literalValue>
        <name>Status Update for Passes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Touch_Plan_1_Pass_Fail</fullName>
        <field>Touch_Plan_Pass_Fail__c</field>
        <formula>TP1_Goal__c</formula>
        <name>Touch Plan 1 Pass/Fail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Touch_Plan_2_Pass_Fail</fullName>
        <field>Touch_Plan_Pass_Fail__c</field>
        <formula>TP2_Goal__c</formula>
        <name>Touch Plan 2 Pass/Fail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Touch_Plan_3_Pass_Fail</fullName>
        <field>Touch_Plan_Pass_Fail__c</field>
        <formula>TP3_Goal__c</formula>
        <name>Touch Plan 3 Pass/Fail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Attempt_1_By</fullName>
        <field>X1st_Attempt_By__c</field>
        <formula>LastModifiedBy.Full_Name__c</formula>
        <name>Update Attempt 1 By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Record_Type_Setup_Call</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Setup_Call_4th_Attempt</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Record Type - Setup Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Status_to_Did_Not_Complete</fullName>
        <field>Status__c</field>
        <literalValue>Did Not Complete</literalValue>
        <name>Update Status to Did Not Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Workflow_Field</fullName>
        <field>In_Progress_Date__c</field>
        <formula>Today ()</formula>
        <name>Update Workflow Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>X2nd_Attempt_by</fullName>
        <field>X2nd_Attempt_By__c</field>
        <formula>LastModifiedBy.Full_Name__c</formula>
        <name>2nd Attempt by</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>X3rd_Attempt_by</fullName>
        <field>X3rd_Attempt_By__c</field>
        <formula>LastModifiedBy.Full_Name__c</formula>
        <name>3rd Attempt by</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Close Install Call after 14 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Did Not Complete,Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Setup Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Close Reschedule Setup Call after 14 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Did Not Complete,Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Setup Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Scheduled_Setup_Call_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Yodle_Path__c.Scheduled_Setup_Call_Date__c</offsetFromField>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Close Setup Call after 14 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Did Not Complete,Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Setup Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Scheduled_Setup_Call_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Close Setup Call after 14 days New</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Did Not Complete,Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Setup Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Scheduled_Setup_Call_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Yodle_Path__c.Scheduled_Setup_Call_Date__c</offsetFromField>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Stamp Closing User</fullName>
        <actions>
            <name>Closed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Closed_Date_TIme</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Closing_User</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Yodle_Path_Completed_by__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stamp attempt 1 by</fullName>
        <actions>
            <name>Status_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Attempt_1_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.X1st_Attempt_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.X1st_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stamp attempt 2 by</fullName>
        <actions>
            <name>X2nd_Attempt_by</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.X2nd_Attempt_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.X2nd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stamp attempt 3 by</fullName>
        <actions>
            <name>X3rd_Attempt_by</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.X3rd_Attempt_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.X3rd_Attempt_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Update Record Type - Coaching Call</fullName>
        <actions>
            <name>Change_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.X3rd_Attempt_Status__c</field>
            <operation>equals</operation>
            <value>Did Not Complete - LVM,Did Not Complete - Could Not Reach,Did Not Complete - Reschedule</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Coaching Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Update Record Type - Setup Call</fullName>
        <actions>
            <name>Update_Record_Type_Setup_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.X3rd_Attempt_Status__c</field>
            <operation>equals</operation>
            <value>Did Not Complete - LVM,Did Not Complete - Could Not Reach,Did Not Complete - Reschedule</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Setup Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Update Reschedule Status for Coaching Call - 7 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Coaching Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Scheduled_Coaching_Call__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Yodle_Path__c.Scheduled_Coaching_Call__c</offsetFromField>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update Reschedule Status for TP1 - 5 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Touch Plan 1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_1_Scheduled_Date_Time__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Yodle_Path__c.Touch_Plan_1_Scheduled_Date_Time__c</offsetFromField>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update Reschedule Status for TP2 - 5 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Touch Plan 2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_2_Scheduled_Date_Time__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Yodle_Path__c.Touch_Plan_2_Scheduled_Date_Time__c</offsetFromField>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update Reschedule Status for TP3 - 5 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Touch Plan 3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_3_Scheduled_Date_Time__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Yodle_Path__c.Touch_Plan_3_Scheduled_Date_Time__c</offsetFromField>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update Status for Coaching Call - 7 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Coaching Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Scheduled_Coaching_Call__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update Status for Coaching Call%2C TP1%2C TP2%2C and TP3 - 8 days</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Coaching Call,Touch Plan 1,Touch Plan 2,Touch Plan 3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update Status for TP1 - 5 days</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Touch Plan 1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_1_Scheduled_Date_Time__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update Status for TP1%2C TP2%2C and TP3 - 5 days</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Touch Plan 1,Touch Plan 2,Touch Plan 3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_1_Scheduled_Date_Time__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_2_Scheduled_Date_Time__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_3_Scheduled_Date_Time__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update Status for TP1%2C TP2%2C and TP3 - 5 days - No coaching Call Criteria</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Touch Plan 1,Touch Plan 2,Touch Plan 3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Yodle_Path__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Status_to_Did_Not_Complete</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update TP1 Pass%2FFail</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Yodle_Path__c.Coaching_Close_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Touch_Plan_1_Pass_Fail</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update TP1 Pass%2FFail and Set Date</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.Coaching_Close_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Set_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Touch_Plan_1_Pass_Fail</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update TP2 Pass%2FFail</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_1_Close_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Touch_Plan_2_Pass_Fail</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update TP2 Pass%2FFail and Set Date</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_1_Close_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Set_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Touch_Plan_2_Pass_Fail</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update TP3 Pass%2FFail</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_2_Close_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Touch_Plan_3_Pass_Fail</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Update TP3 Pass%2FFail and Set Date</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_2_Close_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Set_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Touch_Plan_3_Pass_Fail</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Yodle Path Status</fullName>
        <actions>
            <name>Status_Update_for_Passes</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_Pass_Fail__c</field>
            <operation>equals</operation>
            <value>Pass</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Yodle Path Status Fail</fullName>
        <actions>
            <name>Status_Update_for_Fails</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Workflow_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Yodle_Path__c.Touch_Plan_Pass_Fail__c</field>
            <operation>equals</operation>
            <value>FAIL</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>