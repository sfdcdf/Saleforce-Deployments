<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><fieldUpdates>
        <fullName>Activity_Detail_Closed_Won_Opp</fullName>
        <field>Milestone__c</field>
        <literalValue>Closed Won Opportunity</literalValue>
        <name>Activity Detail -&gt; Closed Won Opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Activity_Detail_Customer_Email2</fullName>
        <field>Milestone__c</field>
        <literalValue>Customer Contact</literalValue>
        <name>Task - Activity Detail to Customer Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Activity_Detail_Customer_Email_Sales</fullName>
        <field>Milestone__c</field>
        <literalValue>Other - Customer Activity</literalValue>
        <name>Task - Activity Detail to Customer Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Activity_Details_Closed_Won_Opp</fullName>
        <field>Milestone__c</field>
        <literalValue>Closed Won Opportunity</literalValue>
        <name>Activity Details -&gt; Closed Won Opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Activity_Type_Customer_Email2</fullName>
        <field>Activity_Type__c</field>
        <literalValue>Account Support</literalValue>
        <name>Task - Activity Type to Customer Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Activity_Type_Sales_Activity</fullName>
        <field>Activity_Type__c</field>
        <literalValue>External Customer Activity</literalValue>
        <name>Tasl - Activity Type to Sales Activity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Proactive_or_Reactive</fullName>
        <field>Proactive_vs_Reactive__c</field>
        <literalValue>Proactive</literalValue>
        <name>YBN proactive or reactive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Services_Task_defaults_to_Completed</fullName>
        <field>Status</field>
        <literalValue>Completed</literalValue>
        <name>Services Task defaults to Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Time_to_Complete_Activity_SF_to_Outlook</fullName>
        <field>Time_To_Complete_Activity_Minutes__c</field>
        <formula>5</formula>
        <name>Time to Complete Activity SF to Outlook</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Time_to_Complete_Sales_SF_to_Outlook</fullName>
        <field>Time_To_Complete_Activity_Minutes__c</field>
        <formula>15</formula>
        <name>Time to Complete Sales SF to Outlook</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>YBN_Status_to_Custom_Status</fullName>
        <field>Status__c</field>
        <literalValue>Completed</literalValue>
        <name>YBN: Status to Custom Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>ybn_update_date_time_when_closed</fullName>
        <field>Close_Date_Time__c</field>
        <formula>Now()</formula>
        <name>ybn update date/time when closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>ybn_update_date_when_closed</fullName>
        <field>Close_Date__c</field>
        <formula>TODAY()</formula>
        <name>ybn update date when closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Closed Won Opportunity</fullName>
        <actions>
            <name>Activity_Details_Closed_Won_Opp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Activity_Type_Sales_Activity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>equals</operation>
            <value>Closed Won Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.ActivityDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>Services Task defaults to Completed</fullName>
        <actions>
            <name>Services_Task_defaults_to_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Services</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN - Closed Won Populate Custom Fields</fullName>
        <actions>
            <name>Activity_Detail_Closed_Won_Opp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>equals</operation>
            <value>Closed Won Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>YBN Update Activity Type - CS</fullName>
        <actions>
            <name>Activity_Detail_Customer_Email2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Activity_Type_Customer_Email2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Time_to_Complete_Activity_SF_to_Outlook</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Activity Type upon assigning Unresolved Task</description>
        <formula>AND( Or( Contains( Subject , "email"), Contains( Subject , "Email")), AND( Or( Isblank( Time_To_Complete_Activity_Minutes__c ), ispickval( Activity_Type__c,"" )), AND( Or( /*National IMS*/ (Owner:User.Profile.Id = "00e60000000im1w"), /*System Administrator*/ (Owner:User.Profile.Id = "00e60000000nQe9"), /*National CS Manager*/ (Owner:User.Profile.Id = "00e60000000irPg"), /*National IMS - Senior*/ (Owner:User.Profile.Id = "00e60000000iqO6"), /* Profile seems no longer available - AMM - 08/16/17  (Owner:User.Profile.Id = "00e60000000ir1K"),*/ /* National RM */ (Owner:User.Profile.Id = "00e60000000im3n"),  /*National RM w/ Corp Opp*/ (Owner:User.Profile.Id = "00e32000000iz3q")  ))))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN Update Activity Type Sales Activity</fullName>
        <actions>
            <name>Activity_Detail_Customer_Email_Sales</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Activity_Type_Sales_Activity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Time_to_Complete_Sales_SF_to_Outlook</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
Or(
Contains( Subject , "email"),
Contains( Subject , "Email")),
AND(
ispickval( Activity_Type__c,"" )),
AND(
Or(
(Owner:User.Profile.Id = "00e60000000ilGb"),
(Owner:User.Profile.Id = "00e60000000imyF"),
(Owner:User.Profile.Id = "00e60000000idyQ"),
(Owner:User.Profile.Id = "00e60000000nQe9"),
(Owner:User.Profile.Id = "00e60000000nQe9"),
(Owner:User.Profile.Id = "00e60000000ibjL"))))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN proactive or reactive</fullName>
        <actions>
            <name>Proactive_or_Reactive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Milestone__c</field>
            <operation>equals</operation>
            <value>Performance Review,M105 - Custom Template Creation,In Person Review Meeting,Customer Status Call,M104 - Introduction call,Monthly Touch Point,Internal Stakeholder Meeting,Month 1 Check In,Introduction Call,Status Update</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>YBN%3A Status to Custom Status</fullName>
        <actions>
            <name>YBN_Status_to_Custom_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>YBN_Status_to_Custom_Status</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>ybn update date when status is completed</fullName>
        <actions>
            <name>ybn_update_date_time_when_closed</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ybn_update_date_when_closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 or 2</booleanFilter>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed,Closed - Not Completed,Canceled,No Show</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Status__c</field>
            <operation>equals</operation>
            <value>Completed,Canceled,No Show,Closed - Not Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>