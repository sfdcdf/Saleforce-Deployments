<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Emails_Reopen_Case_if_New_Email_Comes</fullName>
        <field>Status</field>
        <literalValue>Re-Opened</literalValue>
        <name>Emails - Reopen Case if New Email Comes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Move_Case_Email_to_LH_Email_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Support_Austin</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Move Case/Email to LH Email Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>New_Inbound_Email</fullName>
        <field>Status</field>
        <literalValue>New Inbound Email</literalValue>
        <name>New Inbound Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Email to Case - Lighthouse Threaded Email Moves</fullName>
        <actions>
            <name>Move_Case_Email_to_LH_Email_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>EmailMessage.CreatedById</field>
            <operation>equals</operation>
            <value>Jennifer Flanagan,Salesforce Automation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Client_Type__c</field>
            <operation>equals</operation>
            <value>Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Email,Phone,Chat,Web,Self</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>LH SPecific , This moves replied emails that didn't thread into the correct queue</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Emails - Reopen Case if New Email Comes In</fullName>
        <actions>
            <name>Emails_Reopen_Case_if_New_Email_Comes</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>EmailMessage.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.Subject</field>
            <operation>notEqual</operation>
            <value>Change Order</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.FromAddress</field>
            <operation>notContain</operation>
            <value>@yodle.com,@lighthousepmg.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.DoNotReopen__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>It's a general workflow</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Emails - New Inbound Email if Awaiting Response</fullName>
        <actions>
            <name>New_Inbound_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>6/15/16 - Included additional criteria for YBN case types.
7/6 added in Bug Reported</description>
        <formula>AND(   ISPICKVAL(Status, "New"),    OR(     AND(       Subject &lt;&gt; "Change Order",       OR( ISPICKVAL(Parent.Status, "Bug Reported"),         ISPICKVAL(Parent.Status, "Awaiting Internal Response"),         ISPICKVAL(Parent.Status, "Awaiting Customer Response")       )     ),     AND(       OR(         Parent.RecordType.Name = "YBN Outbound Touch Point",         Parent.RecordType.Name = "YBN Inbound Inquiry"       ),       NOT(ISPICKVAL(Parent.Status, "New")),       Parent.IsClosed = False     )   ) )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
