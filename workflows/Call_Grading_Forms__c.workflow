<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CSC_Grade_June_2015</fullName>
        <field>CSC_Call_Grade__c</field>
        <formula>((0.65) * (    CSC_Scripting_Adherence__c    )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>CSC Grade June 2015</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LH_Inbound_Call_Total_Grade</fullName>
        <field>LH_Inbound_Call_Grade__c</field>
        <formula>((0.50) * ( LH_Inbound_Adherence_Percent_June__c ))
+
((0.50) * (Qualitative_Section_Percent__c))</formula>
        <name>LH Inbound Call Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LH_Save_Call_Total_Grade</fullName>
        <field>LH_Save_Call_Total_Grade__c</field>
        <formula>((0.65) * (  LH_Save_Call_Adherence_Percent__c  ))
+
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>LH Save Call Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lighthouse_Auto_CSC_Total_Grade</fullName>
        <field>Lighthouse_Auto_CSC_Total_Grade__c</field>
        <formula>((0.65) * (  LH_Auto_CSC_Adherence__c )) 
+ 
((0.35) * ( Qualitative_Lighthouse_Percent__c))</formula>
        <name>Lighthouse Auto CSC Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lighthouse_CSC_New_Portal_Total_Grade</fullName>
        <field>Lighthouse_CSC_Total_Grade__c</field>
        <formula>((0.65) * ( Lighthouse_CSC_New_Portal_Percent__c )) 
+ 
((0.35) * ( Qualitative_Lighthouse_Percent__c))</formula>
        <name>Lighthouse CSC New Portal Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lighthouse_Essentials_CSC_Total_Grade</fullName>
        <field>Lighthouse_Essentials_Total_Grade__c</field>
        <formula>((0.65) * ( LH_Essentials_Script_Percent__c )) 
+ 
((0.35) * ( Qualitative_Lighthouse_Percent__c))</formula>
        <name>Lighthouse Essentials CSC Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Local_20_Day_Touch_Plan_Grade</fullName>
        <description>Updating 20 day total grade (includes Essentials features)</description>
        <field>Local_20_Day_Touch_Plan_Grade__c</field>
        <formula>((0.65) * (   X20_Day_Essentials_Percent__c  ))
+
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Local 20 Day Touch Plan Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Local_Inbound_Call_Total_Grade_NEW</fullName>
        <field>Inbound_Call_Total_Grade_NEW__c</field>
        <formula>((0.5) * ( Inbound_Script_Adherence_Percent_NEW__c ))
+
((0.5) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Local Inbound Call Total Grade NEW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_CSC_Engage_Call_Grade</fullName>
        <field>CSC_Engage_Total_Grade__c</field>
        <formula>((0.65) * (  CSC_Engage_Script_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c  ))</formula>
        <name>Partner CSC Engage Call Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_CSC_with_Engage_Features_Total_G</fullName>
        <field>Total_Partner_CSC_with_Engage_Features__c</field>
        <formula>((0.65) * (  Partner_CSC_with_Engage_Features_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Partner CSC with Engage Features Total G</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Testing_Qualitative_July_2015</fullName>
        <field>Testing_Qualitative_July_2015__c</field>
        <formula>if( 
ISPICKVAL( Call_Control__c , ""),null, 
if( 
ISPICKVAL( Attitude_Tone__c , ""),null, 
if( 
ISPICKVAL( Object_Handling_Skills__c , ""),null, 
if( 
ISPICKVAL( FAIR_Communication__c , ""),null, 
if( 
ISPICKVAL( Information_Accuracy_new__c , ""),null, 


IF( 
ISPICKVAL( Call_Control__c , "Poor"), 1.25, 
IF( 
ISPICKVAL( Call_Control__c, "Very Good"), 3.75, 
IF( 
ISPICKVAL( Call_Control__c, "Satisfactory"), 2.5, 
5))) 
+ 
(IF( 
ISPICKVAL( Attitude_Tone__c , "Poor"), 1.25, 
IF( 
ISPICKVAL( Attitude_Tone__c, "Very Good"), 3.75, 
IF( 
ISPICKVAL( Attitude_Tone__c, "Satisfactory"), 2.5, 
5))) 
+ 
(IF( 
ISPICKVAL( Object_Handling_Skills__c , "Poor"), 1.25, 
IF( 
ISPICKVAL( Object_Handling_Skills__c , "Very Good"), 3.75, 
IF( 
ISPICKVAL(Object_Handling_Skills__c , "Satisfactory"), 2.5, 
5))) 
+ 
(IF( 
ISPICKVAL( FAIR_Communication__c , "Poor"), 1.25, 
IF( 
ISPICKVAL( FAIR_Communication__c , "Very Good"), 3.75, 
IF( 
ISPICKVAL(FAIR_Communication__c , "Satisfactory"), 2.5, 
5))) 
+ 
(IF( 
ISPICKVAL( Information_Accuracy_new__c , "Excellent"), 5, 
IF( 
ISPICKVAL( Information_Accuracy_new__c , "Some Issues"), 2.5, 
IF( 
ISPICKVAL( Information_Accuracy_new__c , "Misinformation"), 0, 
5))))))))))))/25</formula>
        <name>Testing Qualitative July 2015</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X40_Day_Percentage</fullName>
        <field>X40_Day_Script_Adherence_Percentage__c</field>
        <formula>IF(
ISPICKVAL( Product_Type__c , "Max"), (X40_Day_Script_Adherence_Section__c / 20),
IF(
ISPICKVAL( Product_Type__c , "Organic"), (X40_Day_Script_Adherence_Section__c / 20), (X40_Day_Script_Adherence_Section__c / 20)
))</formula>
        <name>Call Grade - 40 Day Percentage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>40 Day Script Adherence Percentage %25</fullName>
        <actions>
            <name>X40_Day_Percentage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.X40_Day_Script_Adherence_Section__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>40 Day</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CSC Essentials Total Grade</fullName>
        <actions>
            <name>CSC_Grade_June_2015</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.CSC_Scripting_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LH Save Call Total Grade</fullName>
        <actions>
            <name>LH_Save_Call_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse Save Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.LH_Save_Call_Adherence_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lighthouse Auto CSC Total Grade</fullName>
        <actions>
            <name>Lighthouse_Auto_CSC_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse CSC - Auto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.LH_Auto_CSC_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Qualitative_Lighthouse_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lighthouse CSC New Portal Total Grade</fullName>
        <actions>
            <name>Lighthouse_CSC_New_Portal_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse CSC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Lighthouse_CSC_New_Portal_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Lighthouse_CSC_New_Portal_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Qualitative_Lighthouse_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lighthouse Essentials CSC Total Grade</fullName>
        <actions>
            <name>Lighthouse_Essentials_CSC_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse CSC + Essentials</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.LH_Essentials_Script_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Qualitative_Lighthouse_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lighthouse Inbound Call Total Grade</fullName>
        <actions>
            <name>LH_Inbound_Call_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse Inbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.LH_Inbound_Adherence_Percent_June__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Qualitative_Section_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Local 20 Day Touch Plan Grade</fullName>
        <actions>
            <name>Local_20_Day_Touch_Plan_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.X20_Day_Essentials_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>20 Day,test</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Local Inbound Call Total Grade NEW</fullName>
        <actions>
            <name>Local_Inbound_Call_Total_Grade_NEW</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Inbound_Script_Adherence_Percent_NEW__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Inbound Call,test</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Partner CSC Engage Call Grade</fullName>
        <actions>
            <name>Partner_CSC_Engage_Call_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner CSC Engage</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.CSC_Engage_Script_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.CSC_Engage_Script_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Qualitative_Section_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Partner CSC with Engage Features Total Grade</fullName>
        <actions>
            <name>Partner_CSC_with_Engage_Features_Total_G</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner CSC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_CSC_with_Engage_Features_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_CSC_with_Engage_Features_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Testing Qualitative July 2015</fullName>
        <actions>
            <name>Testing_Qualitative_July_2015</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
