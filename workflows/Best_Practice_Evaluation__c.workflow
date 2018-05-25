<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Best_Practice_Evaluation</fullName>
        <description>Best Practice Evaluation</description>
        <protected>false</protected>
        <recipients>
            <field>Account_Setup_For__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Best_Practive_Evaluation_to_IMS</template>
    </alerts><alerts>
        <fullName>Opt_Evaluation_Completed</fullName>
        <description>Opt Evaluation Completed</description>
        <protected>false</protected>
        <recipients>
            <field>CS_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Evaluation_for__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Optimization_Evaluation</template>
    </alerts><alerts>
        <fullName>QA_Audit_Assigned</fullName>
        <description>QA Audit Assigned Outrank</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Website_Built_By__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Best_Practive_Evaluation_to_IMS</template>
    </alerts><fieldUpdates>
        <fullName>Date_Sent_to_Queue</fullName>
        <field>Date_Sent_to_Queue__c</field>
        <formula>Today()</formula>
        <name>Date Sent to Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Best Practice Eval Assigned</fullName>
        <actions>
            <name>Best_Practice_Evaluation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.Evaluation_Status__c</field>
            <operation>equals</operation>
            <value>Complete - IMS Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.Account_Channel_Type__c</field>
            <operation>equals</operation>
            <value>Partner,Local</value>
        </criteriaItems>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>QA Audit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.Product__c</field>
            <operation>notEqual</operation>
            <value>Call Answering,Outrank +,National SEM,YO 2.0,Outrank</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Best Practice Eval Assigned - National</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.Evaluation_Status__c</field>
            <operation>equals</operation>
            <value>Complete - IMS Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.Account_Channel_Type__c</field>
            <operation>equals</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Opt Evaluation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Best Practice Eval Assigned Outrank</fullName>
        <actions>
            <name>QA_Audit_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.Evaluation_Status__c</field>
            <operation>equals</operation>
            <value>Complete - IMS Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.Product__c</field>
            <operation>contains</operation>
            <value>Outrank</value>
        </criteriaItems>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>QA Audit</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Opt Eval Completed</fullName>
        <actions>
            <name>Opt_Evaluation_Completed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Opt Evaluation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.Overall_Opt_Score__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>QA Audit - Date Sent to Queue</fullName>
        <actions>
            <name>Date_Sent_to_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Best_Practice_Evaluation__c.OwnerId</field>
            <operation>contains</operation>
            <value>Post Launch Associate Queue</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>