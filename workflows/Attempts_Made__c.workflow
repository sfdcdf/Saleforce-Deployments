<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><fieldUpdates>
        <fullName>Attempts_Made_Current_Sub_Status_Stamp</fullName>
        <field>Current_Sub_Status__c</field>
        <formula>IF(ISPICKVAL(Case__r.Sub_Status__c, "New"), "New", IF(ISPICKVAL(Case__r.Sub_Status__c, "In Progress"), "In Progress", IF(ISPICKVAL(Case__r.Sub_Status__c, "MLS - Client"), "MLS - Client", IF(ISPICKVAL(Case__r.Sub_Status__c, "MLS - Setup"), "MLS - Setup", IF(ISPICKVAL(Case__r.Sub_Status__c, "Site Build"), "Site Build", IF(ISPICKVAL(Case__r.Sub_Status__c, "Site - Client"), "Site - Client", ""))))))</formula>
        <name>Attempts Made - Current Sub Status Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>ICC_Complete_to_Today</fullName>
        <field>ICC_Complete__c</field>
        <formula>Attempt_Date__c</formula>
        <name>ICC Complete to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Case__c</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Last_Attempt_By_Update</fullName>
        <field>Last_Attempt_By__c</field>
        <formula>Attempts_Made_By__r.Full_Name__c</formula>
        <name>Last Attempt By - Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Case__c</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Last_Attempt_Date</fullName>
        <description>Updates the Last Attempt Date Date/Time field, not the formula field. This is updating based on the Attempts Made Object</description>
        <field>Attempt_Date_1__c</field>
        <formula>Attempt_Date__c</formula>
        <name>Last Attempt Date - Update from Attem</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Case__c</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Number_of_Attempts_to_CompleteICC</fullName>
        <field>Number_of_Attempts_to_Complete_ICC__c</field>
        <formula>Case__r.Number_of_Attempts_Made__c+1</formula>
        <name>Update Number of Attempts to ICC Complet</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Case__c</targetObject>
    </fieldUpdates><rules>
        <fullName>Attempts Made - Current Sub Status Stamp</fullName>
        <actions>
            <name>Attempts_Made_Current_Sub_Status_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Attempts_Made__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>ICC Complete to Today</fullName>
        <actions>
            <name>ICC_Complete_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Attempts_Made__c.ICC_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Last Attempt Date - Update from Attempt Date</fullName>
        <actions>
            <name>Last_Attempt_By_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Attempt_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the Last Attempt Date Date/Time field, not the formula field.  This is updating based on the Attempts Made Object</description>
        <formula>OR(IF(Attempt_Date__c &gt; DATETIMEVALUE(Case__r.Last_Attempt_Date__c), TRUE , FALSE), ISBLANK(DATETIMEVALUE(Case__r.Last_Attempt_Date__c)))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Number of Attempts Made to Close ICC</fullName>
        <actions>
            <name>Update_Number_of_Attempts_to_CompleteICC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Attempts_Made__c.ICC_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Number_of_Attempts_to_Complete_ICC__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx NCS - AutoLaunch</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>