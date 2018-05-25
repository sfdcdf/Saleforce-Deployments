<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><fieldUpdates>
        <fullName>Emails_Reopen_Case_if_New_Email_Comes</fullName>
        <field>Status</field>
        <literalValue>Re-Opened</literalValue>
        <name>Emails - Reopen Case if New Email Comes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Move_Case_Email_to_LBW_Customer_Care</fullName>
        <field>OwnerId</field>
        <lookupValue>LBW_Customer_Service</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Move Case/Email to LBW Customer Care</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Move_Case_Email_to_LH_Email_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Support_Austin</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Move Case/Email to LH Email Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Move_Case_Email_to_Local_Email_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Local_Email_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Move Case/Email to Local Email Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Move_Case_Email_to_Partner_Email_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Rogers_Support</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Move Case/Email to Partner Email Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Move_to_Customer_Care</fullName>
        <field>OwnerId</field>
        <lookupValue>customercare@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Move to Customer Care</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>New_Inbound_Email</fullName>
        <field>Status</field>
        <literalValue>New Inbound Email</literalValue>
        <name>New Inbound Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Reopen_Email</fullName>
        <field>Status</field>
        <literalValue>Re-Opened</literalValue>
        <name>Reopen Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>TORCHx_NCS_Email_to_Owner_Checkbox</fullName>
        <field>TORCHx_NCS_Email_Notification__c</field>
        <literalValue>1</literalValue>
        <name>TORCHx NCS Email to Owner - Check</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Case_Origin_to_Customer_Care</fullName>
        <description>This will update case origin to customercare@yodle.com</description>
        <field>Origin</field>
        <literalValue>customercare@yodle.com</literalValue>
        <name>Update Case Origin to Customer Care</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Case_Origin_to_LBW_Customer_Care</fullName>
        <field>Origin</field>
        <literalValue>LBWCustomerService@web.com</literalValue>
        <name>Update Case Origin to LBW Customer Care</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Substatus_to_MLS_Client</fullName>
        <field>Sub_Status__c</field>
        <literalValue>MLS Setup</literalValue>
        <name>Update Substatus to MLS Client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates><rules>
        <fullName>Email to Case - LBW Threaded Email Moves</fullName>
        <actions>
            <name>Move_Case_Email_to_LBW_Customer_Care</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Origin_to_LBW_Customer_Care</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
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
            <value>Local</value>
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
        <criteriaItems>
            <field>Case.Product_Type__c</field>
            <operation>contains</operation>
            <value>Leads By Web</value>
        </criteriaItems>
        <description>This moves replied emails that didn't thread into the correct queue</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
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
        <description>This moves replied emails that didn't thread into the correct queue</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Email to Case - Local Threaded Email Moves</fullName>
        <actions>
            <name>Move_Case_Email_to_Local_Email_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Origin_to_Customer_Care</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
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
            <value>Local</value>
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
        <criteriaItems>
            <field>Case.Product_Type__c</field>
            <operation>notContain</operation>
            <value>Leads,TORCHx,Lighthouse,Rogers</value>
        </criteriaItems>
        <description>This moves replied emails that didn't thread into the correct queue</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Email to Case - Partner Threaded Email Moves</fullName>
        <actions>
            <name>Move_Case_Email_to_Local_Email_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Move_Case_Email_to_Partner_Email_Queue</name>
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
            <value>Partner</value>
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
        <description>Moves Jenn Flanagan Partner Created Case (mostly for Rogers Support) to the Local Email Queue - changed from sending to Rogers Support Queue.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
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
    </rules><rules>
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
            <value>@yodle.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.DoNotReopen__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Local Email Case Open and Move</fullName>
        <actions>
            <name>Move_to_Customer_Care</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reopen_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
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
            <field>Case.Client_Type__c</field>
            <operation>contains</operation>
            <value>Local</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Client_ID__c</field>
            <operation>equals</operation>
            <value>999991010</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>TORCHx CSC%2FProactive Touch Email to Owner - Checkbox</fullName>
        <actions>
            <name>TORCHx_NCS_Email_to_Owner_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>TORCHx CSC,Proactive Touch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Product_Type__c</field>
            <operation>contains</operation>
            <value>TORCHx</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>TORCHx NCS Email to Owner - Checkbox</fullName>
        <actions>
            <name>TORCHx_NCS_Email_to_Owner_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3) OR (3 AND 4)</booleanFilter>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Product_Type__c</field>
            <operation>contains</operation>
            <value>TORCHx</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner Inbound Inquiry,Partner - New Client Setup</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>TORCHx Substatus update after first email sent via NCS Case</fullName>
        <actions>
            <name>Update_Substatus_to_MLS_Client</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>EmailMessage.Status</field>
            <operation>equals</operation>
            <value>Sent</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NCS - AutoLaunch</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Sub_Status__c</field>
            <operation>equals</operation>
            <value>New,In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Product_Type__c</field>
            <operation>contains</operation>
            <value>TORCHx</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>1-MA Setup AutoLaunch</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>