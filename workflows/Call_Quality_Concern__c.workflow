<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Call_Quality_Concern_to_IMS</fullName>
        <description>Call QualityConcern to IMS</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Call_Quality_Concern_Closed</template>
    </alerts><alerts>
        <fullName>Escalated_Call_Quality_Concern</fullName>
        <description>Escalated Call Quality Concern</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Escalation_Standard_Email</template>
    </alerts><alerts>
        <fullName>YBN_notify_ims_when_a_call_quality_case_is_created</fullName>
        <description>YBN notify ims when a call quality case is created</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Consultant__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_notify_consultant_of_call_quality_case</template>
    </alerts><fieldUpdates>
        <fullName>Call_Quality_Concerns</fullName>
        <field>OwnerId</field>
        <lookupValue>WebDev</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Call Quality Concerns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>ims_email_to_call_quality</fullName>
        <field>IMS_Consultant__c</field>
        <formula>Account_Name__r.IMS_Rep__r.Email</formula>
        <name>ybn ims email to call quality</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><rules>
        <fullName>Call Quality Concern Closed to IMS</fullName>
        <actions>
            <name>Call_Quality_Concern_to_IMS</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Quality_Concern__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed - Re-provisioned,Closed - outlets already paused,Closed - No Indicators Found,Closed - Blacklisted #,Closed - Paused Outlets</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Call Quality Concerns</fullName>
        <actions>
            <name>Call_Quality_Concerns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Quality_Concern__c.Status__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Escalated Call Quality Concern</fullName>
        <actions>
            <name>Escalated_Call_Quality_Concern</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Quality_Concern__c.Priority__c</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Quality_Concern__c.OwnerId</field>
            <operation>equals</operation>
            <value>Web Dev</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Quality_Concern__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Closed - Re-provisioned,Closed - outlets already paused,Closed - No Indicators Found,Closed - Blacklisted #,Closed - Paused Outlets</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>IMS Rep to Call Quality Case</fullName>
        <actions>
            <name>ims_email_to_call_quality</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Quality_Concern__c.Consultant_Channel__c</field>
            <operation>contains</operation>
            <value>National</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>YBN notify consultant of call quality case</fullName>
        <actions>
            <name>YBN_notify_ims_when_a_call_quality_case_is_created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Quality_Concern__c.Status__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>