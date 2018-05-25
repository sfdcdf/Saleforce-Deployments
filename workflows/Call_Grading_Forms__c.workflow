<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Call_Graded_Form_Completed_by_Service_Voice_Team_Email_to_Managers</fullName>
        <description>Call Graded Form Completed by Service Voice Team Email to Managers</description>
        <protected>false</protected>
        <recipients>
            <recipient>awebster@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cmasterson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kday@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>servicevoiceteam@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Call_Grading_Form_Complete</template>
    </alerts><fieldUpdates>
        <fullName>CSC_Essentials_Total_Grade</fullName>
        <field>CSC_Essentials_Total_Grade__c</field>
        <formula>((0.65) * (   CSC_Script_Adherence__c   )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>CSC Essentials Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CSC_Grade_April_2015</fullName>
        <field>CSC_Grade__c</field>
        <formula>((0.65) * (  CSC_Script_Adherence__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>CSC Grade April 2015</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CSC_Grade_June_2015</fullName>
        <field>CSC_Call_Grade__c</field>
        <formula>((0.65) * (    CSC_Scripting_Adherence__c    )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>CSC Grade June 2015</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CSC_Script_Adherence_Percent</fullName>
        <field>CSC_Script_Adherence_Section_Percent__c</field>
        <formula>IF(
ISPICKVAL( Product_Type__c , "Max"), ( CSC_Script_Adherence_Section__c/ 56),
IF(
ISPICKVAL( Product_Type__c , "Organic"), (CSC_Script_Adherence_Section__c/ 56), (CSC_Script_Adherence_Section__c / 56)
))</formula>
        <name>CSC Script Adherence Percent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates><fieldUpdates>
        <fullName>Chat_Total_Grade</fullName>
        <field>Chat_Total_Grade__c</field>
        <formula>(IF( 
ISPICKVAL( Confirms_Ability_To_Help__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Confirms_Main_Issue_Answered__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Confirms_No_Outstanding_Questoins__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Proper_Chat_Closing__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Correct_Punctuation_Capitalization__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Correct_Grammar_Spelling__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Appropriate_Tone__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Quick_Text_Used__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Chat_Knowledge_Responses_Used__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Case_Created_Chat_Attached__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Necessary_cases_changes_submitted__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Information_Accuracy_new__c , "Excellent"), 2, 
IF( 
ISPICKVAL( Information_Accuracy_new__c , "Some Issues"), 1, 
IF( 
ISPICKVAL( Information_Accuracy_new__c , "Misinformation"), 0, 
2))) 
))))))))))))/24</formula>
        <name>Chat Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Collections_Call_Grade</fullName>
        <field>Collections_Call_Grade__c</field>
        <formula>((0.65) * (  Collections_Call_Adherence__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Collections Call Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Grade</fullName>
        <field>Email_Grade__c</field>
        <formula>((IF( 
ISPICKVAL( Proper_Subject_Line__c , "Partially"), 5, 
IF( 
ISPICKVAL( Proper_Subject_Line__c , "No"), 0, 
10)) 
+ 
(IF( 
ISPICKVAL( Proper_Email_Opening__c , "Partially"), 5, 
IF( 
ISPICKVAL( Proper_Email_Opening__c, "No"), 0, 
10)) 
+ 
(IF( 
ISPICKVAL( Client_s_Issues_Questions_Addressed__c , "Partially"),5, 
IF( 
ISPICKVAL( Client_s_Issues_Questions_Addressed__c , "No"), 0, 
10)) 
+ 
(IF( 
ISPICKVAL( outstanding_casework_reviewed__c , "Partially"), 5, 
IF( 
ISPICKVAL( outstanding_casework_reviewed__c , "No"), 0, 
10)) 
+ 
(IF( 
ISPICKVAL( Spelling_Grammar_Accurate__c , "Partially"), 5, 
IF( 
ISPICKVAL( Spelling_Grammar_Accurate__c , "No"), 0, 
10)) 
+ 
(IF( 
ISPICKVAL( Proper_Email_Closing__c , "Partially"), 5, 
IF( 
ISPICKVAL( Proper_Email_Closing__c, "No"), 0, 
10)) 
+ 
(IF( 
ISPICKVAL( Proper_Response_Type_call_vs_email__c , "Partially"), 5, 
IF( 
ISPICKVAL( Proper_Response_Type_call_vs_email__c, "No"), 0, 
10)) 
+ 
(IF( 
ISPICKVAL( Email_Library_Template_Used__c , "Partially"), 5, 
IF( 
ISPICKVAL( Email_Library_Template_Used__c , "No"), 0, 
10)) 
+ 
(IF( 
ISPICKVAL( Interaction_and_Follow_Up_Logged__c , "Partially"), 5, 
IF( 
ISPICKVAL( Interaction_and_Follow_Up_Logged__c , "No"), 0, 
10)) 
))))))))))/90</formula>
        <name>Email Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_Inbound_Call_Total_Grade</fullName>
        <field>LH_Inbound_Call_Grade__c</field>
        <formula>((0.50) * ( LH_Inbound_Adherence_Percent_June__c ))
+
((0.50) * (Qualitative_Section_Percent__c))</formula>
        <name>LH Inbound Call Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_Inbound_Total_Grade</fullName>
        <field>Lighthouse_Inbound_Call_Grade_NEW__c</field>
        <formula>((0.50) * (  LH_Inbound_Adherence_Percent_June__c ))
+
((0.50) * (Qualitative_Section_Percent__c))</formula>
        <name>LH Inbound Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>LH_Save_Call_Total_Grade</fullName>
        <field>LH_Save_Call_Total_Grade__c</field>
        <formula>((0.65) * (  LH_Save_Call_Adherence_Percent__c  ))
+
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>LH Save Call Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Lighthouse_Auto_CSC_Total_Grade</fullName>
        <field>Lighthouse_Auto_CSC_Total_Grade__c</field>
        <formula>((0.65) * (  LH_Auto_CSC_Adherence__c )) 
+ 
((0.35) * ( Qualitative_Lighthouse_Percent__c))</formula>
        <name>Lighthouse Auto CSC Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Lighthouse_CSC_New_Portal_Total_Grade</fullName>
        <field>Lighthouse_CSC_Total_Grade__c</field>
        <formula>((0.65) * ( Lighthouse_CSC_New_Portal_Percent__c )) 
+ 
((0.35) * ( Qualitative_Lighthouse_Percent__c))</formula>
        <name>Lighthouse CSC New Portal Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Lighthouse_Essentials_CSC_Total_Grade</fullName>
        <field>Lighthouse_Essentials_Total_Grade__c</field>
        <formula>((0.65) * ( LH_Essentials_Script_Percent__c )) 
+ 
((0.35) * ( Qualitative_Lighthouse_Percent__c))</formula>
        <name>Lighthouse Essentials CSC Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Local_70_Day_Touch_Plan_Grade</fullName>
        <field>Local_70_Day_Touch_Plan_Grade__c</field>
        <formula>((0.65) * (  X70_Day_Essentials_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Local 70 Day Touch Plan Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Local_CSC_Script_Adherence</fullName>
        <field>Local_CSC_Script_Adherence__c</field>
        <formula>(Local_CSC_Script_Adherence_Points_new__c /56)</formula>
        <name>Local CSC Script Adherence %</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Local_Inbound_Call_Total_Grade_NEW</fullName>
        <field>Inbound_Call_Total_Grade_NEW__c</field>
        <formula>((0.5) * ( Inbound_Script_Adherence_Percent_NEW__c ))
+
((0.5) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Local Inbound Call Total Grade NEW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>New_40_Day_Total_Grade</fullName>
        <field>New_40_Day_Total_Grade__c</field>
        <formula>((0.65) * (  X40_Day_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>New 40 Day Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>New_Save_Call_Grade</fullName>
        <field>New_Save_Call_Grade__c</field>
        <formula>((0.65) * (  New_Save_Call_Script_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>New Save Call Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>New_Setup_Completion_Total_Grade</fullName>
        <field>New_Setup_Completion_Total_Grade__c</field>
        <formula>((0.65) * (  New_Setup_Completion_Call_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>New Setup Completion Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Outbound_Call_Non_Touch_Plan_Grade</fullName>
        <field>Outbound_Call_Non_Touch_Point_Grade__c</field>
        <formula>((0.5) * (  Outbound_Call_Non_Touch_Point_Adherence__c  )) 
+ 
((0.5) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Outbound Call Non Touch Plan Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>PIN_Collection_Call_Total_Grade</fullName>
        <field>PIN_Collection_Total_Grade__c</field>
        <formula>((0.50) * (   PIN_Collection_Script_Adherence_Percent__c   )) 
+ 
((0.50) * ( PIN_Collection_Qualitative_Section_Perc__c ))</formula>
        <name>PIN Collection Call Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>PIN_Collection_Owner_Verified_Total_Grad</fullName>
        <field>Pin_Collection_OV_Total_Grade__c</field>
        <formula>((0.5) * (  Pin_Collection_OV_Script_Percent__c )) 
+ 
((0.5) * (  PIN_Collection_Qualitative_Section_Perc__c  ))</formula>
        <name>PIN Collection Owner Verified Total Grad</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Partner_20_Total_Grade</fullName>
        <field>Partner_20_Total_Grade__c</field>
        <formula>((0.65) * (  Partner_20_Script_Adherence_Percent__c ))
+
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Partner 20 Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Partner_40_Total_Grade</fullName>
        <field>Partner_40_Total_Grade__c</field>
        <formula>((0.65) * (  Partner_40_Script_Adherence_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Partner 40 Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Partner_70_Day_Total_Grade</fullName>
        <field>Partner_70_Day_Call_Total_Grade__c</field>
        <formula>((0.75) * (  Partner_70_Day_Script_Adherence_Percent__c  )) 
+ 
((0.25) * (Qualitative_Section_Percent__c))</formula>
        <name>Partner 70 Day Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Partner_CSC_Engage_Call_Grade</fullName>
        <field>CSC_Engage_Total_Grade__c</field>
        <formula>((0.65) * (  CSC_Engage_Script_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c  ))</formula>
        <name>Partner CSC Engage Call Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Partner_CSC_with_Engage_Features_Total_G</fullName>
        <field>Total_Partner_CSC_with_Engage_Features__c</field>
        <formula>((0.65) * (  Partner_CSC_with_Engage_Features_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Partner CSC with Engage Features Total G</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Partner_Inbound_Call_Total_Grade_Engag</fullName>
        <field>Partner_Inbound_Total_Grade__c</field>
        <formula>((0.5) * ( Partner_Inbound_Script_Percent__c )) 
+ 
((0.5) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Partner Inbound Call Total Grade + Engag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Partner_Save_Call_Total_Grade</fullName>
        <field>Partner_Save_Call_Total_Grade__c</field>
        <formula>((0.5) * (  Partner_Save_Call_Script_Adherence_Perc__c )) 
+ 
((0.5) * (Qualitative_Section_Percent__c))</formula>
        <name>Partner Save Call Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Save_Call_Path_Total_Grade</fullName>
        <field>Save_Call_Grade__c</field>
        <formula>((0.65) * (  Save_Call_Script_Percent__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Save Call Path Total Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Soft_Skills_Score</fullName>
        <field>Soft_Skills_Score__c</field>
        <formula>((IF( 
ISPICKVAL( Is_client_s_name_used_throughout_call__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Attempt_to_build_rapport__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Offer_thorough_responses__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Call_free_of_silence_and_dead_air__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Avoid_interrupting_speaking_over_client__c , "No"), -1, 
1) 
+ 
(IF( 
ISPICKVAL( Compliments_or_builds_up_client__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Personalized_Segment_suggestions__c , "No"), 0, 
2) 
+ (IF( 
ISPICKVAL( Call_continuity_and_fluidity__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Conversation_topics_appropriate__c , "No"), -1, 
1) 
+ 
(IF( 
ISPICKVAL( Reference_previous_comments_notes__c , "No"), 0, 
1)))))))))))/17)*100</formula>
        <name>Soft Skills Score</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Soft_Skills_Score_Total</fullName>
        <field>Soft_Skills_Score__c</field>
        <formula>((IF( 
ISPICKVAL( Is_client_s_name_used_throughout_call__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Attempt_to_build_rapport__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Offer_thorough_responses__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Call_free_of_silence_and_dead_air__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Avoid_interrupting_speaking_over_client__c , "No"), -1, 
1) 
+ 
(IF( 
ISPICKVAL( Compliments_or_builds_up_client__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Personalized_Segment_suggestions__c , "No"), 0, 
2) 
+ (IF( 
ISPICKVAL( Call_continuity_and_fluidity__c , "No"), 0, 
2) 
+ 
(IF( 
ISPICKVAL( Conversation_topics_appropriate__c , "No"), -1, 
1) 
+ 
(IF( 
ISPICKVAL( Reference_previous_comments_notes__c , "No"), 0, 
1)))))))))))/17)*100</formula>
        <name>Soft Skills Score Total</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Testing_CSC_Adherence_July_2015</fullName>
        <field>Testing_CSC_Adherence_July_2015__c</field>
        <formula>if( 
ISPICKVAL( Greeting__c , ""),null, 
if( 
ISPICKVAL( Goals_of_CSC__c , ""),null, 
if( 
ISPICKVAL( Basic_Setup__c , ""),null, 
if( 
ISPICKVAL( Business_Info__c , ""),null, 
if( 
ISPICKVAL( USPs__c , ""),null, 
if( 
ISPICKVAL( Services__c , ""),null, 
if( 
ISPICKVAL( Attempt_Dashboard_Log_In__c , ""),null, 
if( 
ISPICKVAL( Home_Screen_Overview__c , ""),null, 
if( 
ISPICKVAL( Social__c , ""),null, 
if( 
ISPICKVAL( Contacts_Essentials__c , ""),null, 
if( 
ISPICKVAL( Marketing_Communication__c , ""),null, 
if( 
ISPICKVAL( Reviews_Solicitation__c  , ""),null, 
if( 
ISPICKVAL( Photo_Upload__c , ""),null, 
if( 
ISPICKVAL( Adversite_Design__c , ""),null, 
if( 
ISPICKVAL( Adversite_Review__c , ""),null, 
if( 
ISPICKVAL( Google_Bing_PIN__c , ""),null, 
if( 
ISPICKVAL( Next_Touch_Plan_Contact_Info__c , ""),null, 
if( 
ISPICKVAL( Confirms_No_Outstanding_Questoins__c , ""),null, 
if( 
ISPICKVAL( Formal_Closing__c , ""),null, 
if( 
ISPICKVAL( Template_Notes_in_Issue_Tracker__c , ""),null, 


(IF( 
ISPICKVAL( Greeting__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Greeting__c, "Partially Covered"), 1, 
2))
+ 
(IF( 
ISPICKVAL( Goals_of_CSC__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Goals_of_CSC__c, "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( Basic_Setup__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Basic_Setup__c, "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( Business_Info__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Business_Info__c , "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( USPs__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( USPs__c , "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( Services__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Services__c , "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( Attempt_Dashboard_Log_In__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Attempt_Dashboard_Log_In__c , "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( Home_Screen_Overview__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Home_Screen_Overview__c , "Partially Covered"), 2, 
4)) 
+ 
(IF( 
ISPICKVAL( Social__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Social__c , "Partially Covered"), 2, 
4)) 
+ 
(IF( 
ISPICKVAL( Contacts_Essentials__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Contacts_Essentials__c, "Partially Covered"), 2, 
4)) 
+ 
(IF( 
ISPICKVAL( Marketing_Communication__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Marketing_Communication__c, "Partially Covered"), 2, 
4)) 
+ 
(IF( 
ISPICKVAL( Reviews_Solicitation__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Reviews_Solicitation__c , "Partially Covered"), 2, 
4)) 
+ 
(IF( 
ISPICKVAL( Photo_Upload__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Photo_Upload__c , "Partially Covered"), 2, 
4)) 
+ 
(IF( 
ISPICKVAL( Adversite_Design__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Adversite_Design__c, "Partially Covered"), 2, 
4)) 
+ 
(IF( 
ISPICKVAL( Adversite_Review__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Adversite_Review__c , "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( Google_Bing_PIN__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Google_Bing_PIN__c , "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( Next_Touch_Plan_Contact_Info__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Next_Touch_Plan_Contact_Info__c , "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( Confirms_No_Outstanding_Questoins__c , "No"), 0, 
IF( 
ISPICKVAL( Confirms_No_Outstanding_Questoins__c , "Yes"), 2, 
2)) 
+ 
(IF( 
ISPICKVAL( Formal_Closing__c , "Not Covered"), 0, 
IF( 
ISPICKVAL( Formal_Closing__c , "Partially Covered"), 1, 
2)) 
+ 
(IF( 
ISPICKVAL( Template_Notes_in_Issue_Tracker__c , "No"), 0, 
IF( 
ISPICKVAL( Template_Notes_in_Issue_Tracker__c , "Yes"), 2, 
2)) 
))))))))))))))))))))/54))))))))))))))))))))</formula>
        <name>Testing CSC Adherence July 2015</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Yodle_Path_Coaching_Call_Grade</fullName>
        <field>Yodle_Path_Coaching_Call_Grade__c</field>
        <formula>((0.65) * (  Yodle_Path_Coaching_Call_Adherence__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Yodle Path Coaching Call Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Yodle_Path_Setup_Call_Grade</fullName>
        <field>Yodle_Path_Setup_Call_Grade__c</field>
        <formula>((0.65) * (  Yodle_Path_Setup_Call_Adherence__c  )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Yodle Path Setup Call Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Yodle_Path_Touch_Point_Grade</fullName>
        <field>Yodle_Path_Touch_Point_Grade__c</field>
        <formula>((0.65) * (  Yodle_Path_Touch_Point_Adherence__c )) 
+ 
((0.35) * ( New_Qualitative_Adherence__c ))</formula>
        <name>Yodle Path Touch Point Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>40 Day Script Adherence Percentage %25</fullName>
        <actions>
            <name>X40_Day_Percentage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.X40_Day_Script_Adherence_Section__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>40 Day</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>CSC Essentials Total Grade</fullName>
        <actions>
            <name>CSC_Grade_June_2015</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>CSC Script Adherence %25</fullName>
        <actions>
            <name>CSC_Script_Adherence_Percent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.CSC_Script_Adherence_Section__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Call Grading Form Completion</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>20 Day,CSC,40 Day,Save Call,Inbound Call,70 Day,Setup Completion Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.CreatedById</field>
            <operation>equals</operation>
            <value>Megan Comerford,Christopher Jackobel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Caller_Team__c</field>
            <operation>contains</operation>
            <value>Day,Masterson,Webster</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Call_Graded_Form_Completed_by_Service_Voice_Team_Email_to_Managers</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Call_Grading_Forms__c.CreatedDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Chat Grade</fullName>
        <actions>
            <name>Chat_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Live Chat</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Collections Call Grade</fullName>
        <actions>
            <name>Collections_Call_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Collections Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Collections_Call_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Email Grade</fullName>
        <actions>
            <name>Email_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Email</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>LH Save Call Total Grade</fullName>
        <actions>
            <name>LH_Save_Call_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Lighthouse Auto CSC Total Grade</fullName>
        <actions>
            <name>Lighthouse_Auto_CSC_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Lighthouse CSC New Portal Total Grade</fullName>
        <actions>
            <name>Lighthouse_CSC_New_Portal_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Lighthouse Essentials CSC Total Grade</fullName>
        <actions>
            <name>Lighthouse_Essentials_CSC_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Lighthouse Inbound Call Total Grade</fullName>
        <actions>
            <name>LH_Inbound_Call_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Local 20 Day Touch Plan Grade</fullName>
        <actions>
            <name>Local_20_Day_Touch_Plan_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Local 70 Day Touch Plan Grade</fullName>
        <actions>
            <name>Local_70_Day_Touch_Plan_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.X70_Day_Essentials_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>70 Day,test</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Local CSC Script Adherence %25</fullName>
        <actions>
            <name>Local_CSC_Script_Adherence</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Local_CSC_Script_Adherence_Points_new__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Local Inbound Call Total Grade NEW</fullName>
        <actions>
            <name>Local_Inbound_Call_Total_Grade_NEW</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>New Local 40 Day Touch Plan Grade</fullName>
        <actions>
            <name>New_40_Day_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.X40_Day_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>40 Day</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>New Save Call Path Total Grade</fullName>
        <actions>
            <name>New_Save_Call_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Save_Call_Script_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Test,Save Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>New Setup Completion Total Grade</fullName>
        <actions>
            <name>New_Setup_Completion_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Setup_Completion_Call_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Setup Completion Call,Partner Setup Completion Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Outbound Call Non Touch Plan Grade</fullName>
        <actions>
            <name>Outbound_Call_Non_Touch_Plan_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Outbound Call - Non Touch Point</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Outbound_Call_Non_Touch_Point_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>PIN Collection Call Total Grade</fullName>
        <actions>
            <name>PIN_Collection_Call_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>PIN Collection,Maps - PIN Collection</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.PIN_Collection_Script_Adherence_Section__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.PIN_Collection_Qualitative_Section_Perc__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.PIN_Collection_Qualitative_Section_Perc__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>PIN Collection Owner Verified Total Grade</fullName>
        <actions>
            <name>PIN_Collection_Owner_Verified_Total_Grad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps - Owner Verified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Pin_Collection_OV_Script_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.PIN_Collection_Qualitative_Section_Perc__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>update OV PIN call grading form total grade</description>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Partner 20 Total Grade</fullName>
        <actions>
            <name>Partner_20_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner 20 Day</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_20_Script_Adherence_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Partner 40 Total Grade</fullName>
        <actions>
            <name>Partner_40_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner 40 Day</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_40_Script_Adherence_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Partner 70 Day Total Grade</fullName>
        <actions>
            <name>Partner_70_Day_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner 70 Day</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_70_Day_Script_Adherence_Section__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_70_Day_Script_Adherence_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Qualitative_Section_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Partner CSC Engage Call Grade</fullName>
        <actions>
            <name>Partner_CSC_Engage_Call_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Partner CSC with Engage Features Total Grade</fullName>
        <actions>
            <name>Partner_CSC_with_Engage_Features_Total_G</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
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
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Partner Inbound Call Total Grade %2B Engage</fullName>
        <actions>
            <name>Partner_Inbound_Call_Total_Grade_Engag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner Inbound Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_Inbound_Script_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_Inbound_Script_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Partner Save Call Total Grade</fullName>
        <actions>
            <name>Partner_Save_Call_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner Save Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_Save_Call_Script_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Partner_Save_Call_Script_Adherence_Perc__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Qualitative_Section_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Save Call Path Total Grade</fullName>
        <actions>
            <name>Save_Call_Path_Total_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Save_Call_Script_Percent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Test,Save Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Soft Skills Ability</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Soft_Skills_Score__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Used to evaluate overall agent soft skills effectiveness.</description>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Soft Skills Score</fullName>
        <actions>
            <name>Soft_Skills_Score_Total</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Caller__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Conversational_Ability__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Testing CSC Adherence July 2015</fullName>
        <actions>
            <name>Testing_CSC_Adherence_July_2015</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Test</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Testing Qualitative July 2015</fullName>
        <actions>
            <name>Testing_Qualitative_July_2015</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Yodle Path Coaching Call Grade</fullName>
        <actions>
            <name>Yodle_Path_Coaching_Call_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Yodle Path Coaching Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Yodle_Path_Coaching_Call_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Yodle Path Setup Call Grade</fullName>
        <actions>
            <name>Yodle_Path_Setup_Call_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Yodle Path Setup Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Yodle_Path_Setup_Call_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Yodle Path Touch Point Grade</fullName>
        <actions>
            <name>Yodle_Path_Touch_Point_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Forms__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Yodle Path Touch Point</value>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.New_Qualitative_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Call_Grading_Forms__c.Yodle_Path_Touch_Point_Adherence__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules></Workflow>