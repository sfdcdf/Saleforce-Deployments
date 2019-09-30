<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CSC_Monitoring_Forms_2_1</fullName>
        <field>CSC_Monitoring_Forms_Text_Formula_2_1__c</field>
        <formula>CSC_Monitoring_Forms_Formula_21__c</formula>
        <name>CSC Monitoring Forms 2.1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CSC_Monitoring_Forms_2_2</fullName>
        <field>CSC_Monitoring_Forms_Text_Formula_2_2__c</field>
        <formula>CSC_Monitoring_Forms_Formula_22__c</formula>
        <name>CSC Monitoring Forms 2.2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Adher_Grade_Essentials_Setup_Call</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Introduction__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Agenda__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Google_Listing_Status__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Contacts__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Email_Marketing__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Lists__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Email_Tracking__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Training_Recap__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Proper_Closing_Transfer__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Post_Call_Tasks__c,
"2", 2,
"1", 1,
"N/A", 2, 0)) / 20</formula>
        <name>Calc Adher Grade - Essentials Setup Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Adhere_Grade_Lighthouse_Save_Call</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Uncover_the_Issue__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Restate_the_Issue__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Concerns__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Build_Value_in_Product__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Essentials_Value_Props__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(No_concession__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Appropriate_downsell__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Confirms_No_Outstanding_Questions__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Complete_notes__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Salesforce_Work__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 24</formula>
        <name>Calc Adhere Grade - Lighthouse Save Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Adherence_Grade_CSC_Monitoring</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Introduction__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Basic_setup__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(USPs_Business_Qualifiers__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Confirm_Segment_Services__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(DB_Login_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Dashboard_Walkthrough__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Review__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Design__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Essentials_Feature_Transition__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Social__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Review_Solicitation__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Photo_Upload__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Offers__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Automated_Email__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Feature_Wrap_Up__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Organic__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 
	
CASE(Ads__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Authorized_Users__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Webinar__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Proper_Closing_Transfer__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Post_Call_Tasks__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 44</formula>
        <name>Calc Adherence Grade - CSC Monitoring</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Adherence_Grade_LH_Inbound_Call</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Requests_Reason_for_Clients_Call__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lighthouse_Portal_Login__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads_Upsell_Pitched__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(New_Feature_Information_Discussed__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(All_Client_Issue_s_Resolved__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Confirms_No_Outstanding_Questions__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Thank_Client__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 16</formula>
        <name>Calc Adherence Grade - LH Inbound Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Adherence_Grade_Lighthouse_CSC</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Introduction__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Automated_Message_Overview__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Feedback_Review_Solicitation__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Recall_Notices__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Treatment_Plan__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Reactivation__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Birthday__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Newsletters__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Custom_Messages__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Home_screen__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Tasks__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Schedule__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Fill_in_Feature__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(New_Patient_Acquisition__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Message_Activation__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)) / 30</formula>
        <name>Calc. Adherence Grade - Lighthouse CSC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Adherence_LH_CSC_Essentials</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Greeting_and_Goals__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Join_me_Login__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Home_screen__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Tasks__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Automated_Message_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Recall_Notices__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Treatment_Plan__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Reactivation__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Birthday__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Feedback__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Newsletters__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Custom_Messages__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Schedule__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Review_Solicitation__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Message_Activation__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 30</formula>
        <name>Calc. Adherence - LH CSC + Essentials</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Final_Grade_CSC_Monitoring</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Introduction__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Basic_setup__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(USPs_Business_Qualifiers__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Confirm_Segment_Services__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(DB_Login_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Dashboard_Walkthrough__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Review__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Design__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Essentials_Feature_Transition__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Social__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Review_Solicitation__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Photo_Upload__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Offers__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Automated_Email__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Feature_Wrap_Up__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Organic__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Authorized_Users__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Webinar__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Proper_Closing_Transfer__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Post_Call_Tasks__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+

CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Resolution_Skills__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Conversational_Ability__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Information_Accuracy__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Pace__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)) / 68</formula>
        <name>Calc Final Grade - CSC Monitoring</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Final_Grade_LH_Inbound_Call</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Requests_Reason_for_Clients_Call__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lighthouse_Portal_Login__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads_Upsell_Pitched__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(New_Feature_Information_Discussed__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(All_Client_Issue_s_Resolved__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Confirms_No_Outstanding_Questions__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Thank_Client__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+

CASE(Call_control__c, 
"4", 5, 
"2", 3.75, 
"1", 2.5, 
"N/A", 1.25, 0)+ 

CASE(Attitude_Tone_Empathy__c, 
"4", 5, 
"2", 3.75, 
"1", 2.5, 
"N/A", 1.25, 0)+ 

CASE( FAIR_Communication__c, 
"4", 5, 
"2", 3.75, 
"1", 2.5, 
"N/A", 1.25, 0)+ 

CASE( Information_Accuracy__c, 
"4", 5, 
"2", 3.75, 
"1", 2.5, 
"N/A", 1.25, 0)) / 36</formula>
        <name>Calc Final Grade - LH Inbound Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Final_Grade_Lighthouse_CSC</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Introduction__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Automated_Message_Overview__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Feedback_Review_Solicitation__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Recall_Notices__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Treatment_Plan__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Reactivation__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Birthday__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Newsletters__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Custom_Messages__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Home_screen__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Tasks__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Schedule__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Fill_in_Feature__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(New_Patient_Acquisition__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Message_Activation__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Call_control__c,
"4", 4,
"2", 2,
"1", 1,
"N/A", 4, 0)+

CASE(Attitude_Tone_Empathy__c,
"4", 4,
"2", 2,
"1", 1,
"N/A", 4, 0)+

CASE( FAIR_Communication__c,
"4", 4,
"2", 2,
"1", 1,
"N/A", 4, 0)+

CASE( Information_Accuracy__c,
"4", 4,
"2", 2,
"1", 1,
"N/A", 4, 0)) / 46</formula>
        <name>Calc Final Grade - Lighthouse CSC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Final_Grade_Lighthouse_Save_Call</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Uncover_the_Issue__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Restate_the_Issue__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Concerns__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Build_Value_in_Product__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Essentials_Value_Props__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(No_concession__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Appropriate_downsell__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Confirms_No_Outstanding_Questions__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Complete_notes__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Salesforce_Work__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Objection_Handling_Skills__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(FAIR_Communication__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Information_Accuracy__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)) / 44</formula>
        <name>Calc Final Grade - Lighthouse Save Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Final_Lighthouse_CSC_Essentials</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE( FAIR_Communication__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE( Information_Accuracy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Greeting_and_Goals__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Join_me_Login__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Home_screen__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Tasks__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Automated_Message_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Recall_Notices__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Treatment_Plan__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Reactivation__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Birthday__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Feedback__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Newsletters__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Custom_Messages__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Schedule__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Review_Solicitation__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Message_Activation__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 46</formula>
        <name>Calc Final - Lighthouse CSC + Essentials</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Final_Score_Essentials_Setup_Call</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Resolution_Skills__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Conversational_Ability__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Information_Accuracy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Pace__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Call_control__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Introduction__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Agenda__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Google_Listing_Status__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Contacts__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Email_Marketing__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Lists__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Email_Tracking__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Training_Recap__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Proper_Closing_Transfer__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Post_Call_Tasks__c,
"2", 2,
"1", 1,
"N/A", 2, 0)) / 44</formula>
        <name>Calc Final Score - Essentials Setup Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Qual_Grade_Essentials_Setup_Call</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Resolution_Skills__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Conversational_Ability__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Information_Accuracy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Pace__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Call_control__c,
"4", 4,
"2", 2,
"N/A", 4, 0)) / 24</formula>
        <name>Calc Qual. Grade - Essentials Setup Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Qual_Grade_Lighthouse_Save_Call</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Objection_Handling_Skills__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(FAIR_Communication__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Information_Accuracy__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)) / 20</formula>
        <name>Calc Qual Grade - Lighthouse Save Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Qualitative_Grade_Lighthouse_CSC</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Call_control__c,
"4", 4,
"2", 2,
"1", 1,
"N/A", 4, 0)+

CASE(Attitude_Tone_Empathy__c,
"4", 4,
"2", 2,
"1", 1,
"N/A", 4, 0)+

CASE( FAIR_Communication__c,
"4", 4,
"2", 2,
"1", 1,
"N/A", 4, 0)+

CASE( Information_Accuracy__c,
"4", 4,
"2", 2,
"1", 1,
"N/A", 4, 0)) / 16</formula>
        <name>Calc Qualitative Grade - Lighthouse CSC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Qualitative_LH_CSC_Essentials</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE( FAIR_Communication__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE( Information_Accuracy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)) / 16</formula>
        <name>Calc Qualitative - LH CSC + Essentials</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Qualitative_LH_Inbound_Call</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Call_control__c,
"4", 5,
"2", 3.75,
"1", 2.5,
"N/A", 1.25, 0)+

CASE(Attitude_Tone_Empathy__c,
"4", 5,
"2", 3.75,
"1", 2.5,
"N/A", 1.25, 0)+

CASE( FAIR_Communication__c,
"4", 5,
"2", 3.75,
"1", 2.5,
"N/A", 1.25, 0)+

CASE( Information_Accuracy__c,
"4", 5,
"2", 3.75,
"1", 2.5,
"N/A", 1.25, 0)) / 20</formula>
        <name>Calc Qualitative Grade - LH Inbound Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Qualititive_Grade_CSC_Monitoring</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Resolution_Skills__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Conversational_Ability__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Information_Accuracy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Pace__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Call_control__c,
"4", 4,
"2", 2,
"N/A", 4, 0)) / 24</formula>
        <name>Calc Qualititive Grade - CSC Monitoring</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calculate_Adherence_Grade_Local_MAXCSC</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Introduction__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Basic_setup__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(USPs_Business_Qualifiers__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Confirm_Segment_Services__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(DB_Login_Overview__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Dashboard_Walkthrough__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Website_Review__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+
	
CASE(Website_Design__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Essentials_Feature_Transition__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Social__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Review_Solicitation__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Photo_Upload__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Offers__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Automated_Email__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Feature_Wrap_Up__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Ads__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Organic__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Lead_Overview__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Authorized_Users__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Setup_Completion_Call__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Post_Call_Tasks__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)+

CASE(Proper_Closing_Transfer__c, 
"2", 2, 
"1", 1,
"N/A", 2, 0)) / 44</formula>
        <name>Calculate Adherence Grade - Local MAXCSC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calculate_Adherence_Grade_Save_Call</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Opening__c, 
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Uncover_the_Issue__c, 
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Concerns__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Ownership__c, 
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Agreement_Details__c, 
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Attempt_Log_in__c, 
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(No_concession__c, 
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Appropriate_downsell__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Issues_Resolved__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(closing__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Outstanding_questions__c, 
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Complete_notes__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Necessary_Follow_Up_Work__c,
"2", 2,
"1", 1,
"N/A", 2, 0))


/ 26</formula>
        <name>Calculate Adherence Grade - Save Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calculate_Final_Score_Local_MAX_CSC</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Introduction__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Basic_setup__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(USPs_Business_Qualifiers__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Confirm_Segment_Services__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(DB_Login_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Dashboard_Walkthrough__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Review__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Design__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Essentials_Feature_Transition__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Social__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Review_Solicitation__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Photo_Upload__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Offers__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Automated_Email__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Feature_Wrap_Up__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Organic__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Authorized_Users__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Setup_Completion_Call__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Post_Call_Tasks__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Proper_Closing_Transfer__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+

CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 0)+ 

CASE(Resolution_Skills__c, 
"4", 4, 
"2", 2, 0)+ 

CASE(Conversational_Ability__c, 
"4", 4, 
"2", 2, 0)+ 


CASE(Information_Accuracy__c, 
"4", 4, 
"2", 2, 0)+ 

CASE(Pace__c, 
"4", 4, 
"2", 2, 0)+ 

CASE(Call_control__c, 
"4", 4, 
"2", 2, 0)) / 68</formula>
        <name>Calculate Final Score - Local MAX CSC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calculate_Final_Score_Save_Call</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(No_concession__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Uncover_the_Issue__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Concerns__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ownership__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Agreement_Details__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 


CASE(Attempt_Log_in__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Necessary_Follow_Up_Work__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Appropriate_downsell__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Issues_Resolved__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Outstanding_questions__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Complete_notes__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Resolution_Skills__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Conversational_Ability__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Information_Accuracy__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Pace__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)) / 50</formula>
        <name>Calculate Final Score - Save Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calculate_Qualitative_Grade_Local_MAX</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c,
"4", 4,
"2", 2, 0)+

CASE(Resolution_Skills__c,
"4", 4,
"2", 2, 0)+

CASE(Conversational_Ability__c,
"4", 4,
"2", 2, 0)+


CASE(Information_Accuracy__c,
"4", 4,
"2", 2, 0)+

CASE(Pace__c,
"4", 4,
"2", 2, 0)+

CASE(Call_control__c,
"4", 4,
"2", 2, 0)) / 24</formula>
        <name>Calculate Qualitative Grade - Local MAX</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calculate_Qualitative_Grade_Save_Call</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Resolution_Skills__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Conversational_Ability__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Information_Accuracy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Pace__c, 
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Call_control__c,
"4", 4,
"2", 2,
"N/A", 4, 0)
) 

/ 24</formula>
        <name>Calculate Qualitative Grade - Save Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CSC Monitoring Forms</fullName>
        <actions>
            <name>CSC_Monitoring_Forms_2_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CSC_Monitoring_Forms_2_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Adherence_Grade_CSC_Monitoring</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_CSC_Monitoring</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qualititive_Grade_CSC_Monitoring</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>LH Specific</description>
        <formula>True  &amp;&amp;  RecordType.Name = 'CSC Monitoring Forms'</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Calculate Lighthouse CSC %2B Essentials Scores</fullName>
        <actions>
            <name>Calc_Adherence_LH_CSC_Essentials</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Lighthouse_CSC_Essentials</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qualitative_LH_CSC_Essentials</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse CSC + Essentials</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Calculate Lighthouse CSC Scores</fullName>
        <actions>
            <name>Calc_Adherence_Grade_Lighthouse_CSC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_Lighthouse_CSC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qualitative_Grade_Lighthouse_CSC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse CSC</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Calculate Lighthouse Inbound Call Scores</fullName>
        <actions>
            <name>Calc_Adherence_Grade_LH_Inbound_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_LH_Inbound_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qualitative_LH_Inbound_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse Inbound Call</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Calculate Lighthouse Save Call</fullName>
        <actions>
            <name>Calc_Adhere_Grade_Lighthouse_Save_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_Lighthouse_Save_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qual_Grade_Lighthouse_Save_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse Save Call</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Calculate Local MAX CSC Grading Scores</fullName>
        <actions>
            <name>Calculate_Adherence_Grade_Local_MAXCSC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Final_Score_Local_MAX_CSC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Qualitative_Grade_Local_MAX</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Local - Max CSC Grading Form</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Calculate Save Call Monitoring Scores</fullName>
        <actions>
            <name>Calculate_Adherence_Grade_Save_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Final_Score_Save_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Qualitative_Grade_Save_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Save Call Monitoring Forms</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Essentials Setup Completion Call</fullName>
        <actions>
            <name>Calc_Adher_Grade_Essentials_Setup_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Score_Essentials_Setup_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qual_Grade_Essentials_Setup_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>it's a general workflow</description>
        <formula>True  &amp;&amp;  RecordType.Name = 'Essentials Setup Completion Call'</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
