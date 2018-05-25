<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><fieldUpdates>
        <fullName>CSC_Monitoring_Forms_2_1</fullName>
        <field>CSC_Monitoring_Forms_Text_Formula_2_1__c</field>
        <formula>CSC_Monitoring_Forms_Formula_21__c</formula>
        <name>CSC Monitoring Forms 2.1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>CSC_Monitoring_Forms_2_2</fullName>
        <field>CSC_Monitoring_Forms_Text_Formula_2_2__c</field>
        <formula>CSC_Monitoring_Forms_Formula_22__c</formula>
        <name>CSC Monitoring Forms 2.2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adhere_Grade_Advanced_Features</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Greeting_and_Goals__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Blogging__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Custom_Listing_Content__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Landing_Pages__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Settings__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 12</formula>
        <name>Calc. Adhere Grade - Advanced Features</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adhere_Grade_TORCHx_CSC_Building</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Greeting_and_Goals__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Search_Page__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Attempt_Log_in__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Profile_Page_Contact_Info__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Profile_Page_Site_Info__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Profile_Page_Agent_Page_Customization__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Notifications__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Integration__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Calendar_Integration__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Listing_Rider__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Support_Info__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 28</formula>
        <name>Calc. Adhere Grade - TORCHx CSC Building</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adhere_Grade_TORCHx_CSC_Managing</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Greeting_and_Goals__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Searching_Leads__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Tab_Views__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Details_Timeline__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Details_Searches__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Details_Properties__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Details_Send_Listings__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Drip_Campaigns__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Templates__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Text_Templates__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Mass_Email__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Best_Practices__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 28</formula>
        <name>Calc. Adhere Grade - TORCHx CSC Managing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adherence_Grade_Adoption_Call</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Introduction__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Agenda__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Google_Listing_Status__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Contacts__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Marketing__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lists__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Tracking__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Training_Recap__c, 
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
"N/A", 2, 0)) / 22</formula>
        <name>Calc Adherence Grade - Adoption Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adherence_Grade_Collections_Call</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Payment_Collection__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Save_Attempt__c, 
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

CASE(Review_Pending_Cases_in_Account__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Necessary_Follow_Up_Work__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 14</formula>
        <name>Calc Adherence Grade - Collections Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adherence_Grade_InboundMonitoring</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Acknowledge_Reason_for_Call__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ownership__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(All_Client_Issue_s_Resolved__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Review_Pending_Cases_in_Account__c, 
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
"N/A", 2, 0)+ 

CASE(Proper_Closing_Transfer__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 16</formula>
        <name>Calc Adherence Grade - InboundMonitoring</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adherence_Grade_LBW_Onboarding</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Introduction__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Backend_Login__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Website_Overview__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Account_Information__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Services_Sub_Categories__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Radius_Geo__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Organic__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Lead_Overview__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Marketing_Features__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(closing__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)) / 40</formula>
        <name>Calc Adherence Grade - LBW Onboarding</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adherence_Grade_LBW_Performance</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Precall_Work__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Introduction__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Performance_Opinion__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Review_Calls__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Lead_Rating__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Success_Measurement__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Top_Campaigns__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Ads__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Radius_Geo__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Organic__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Impression_Share__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(closing__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)) / 48</formula>
        <name>Calc Adherence Grade - LBW Performance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adherence_Grade_TORCHx_Inbound_Call</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Requests_Reason_for_Clients_Call__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Backend_Login__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(New_Feature_Information_Discussed__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads_Upsell_Pitched__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Issues_Resolved__c, 
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
        <name>Calc Adherence Grade-TORCHx Inbound Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Adherence_Grade_TORCHx_Save_Call</fullName>
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

CASE(Necessary_Follow_Up_Work__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 24</formula>
        <name>Calc Adherence Grade - TORCHx Save Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Grade_Advanced_Features</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Greeting_and_Goals__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Blogging__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Custom_Listing_Content__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Landing_Pages__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Settings__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
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


CASE( Information_Accuracy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)) / 24</formula>
        <name>Calc Final Grade - Advanced Features</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Grade_Collections_Call</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Payment_Collection__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Save_Attempt__c, 
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

CASE(Review_Pending_Cases_in_Account__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Necessary_Follow_Up_Work__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+

CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Resolution_Skills__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Pace__c, 
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
"N/A", 4, 0)) / 38</formula>
        <name>Calc Final Grade - Collections Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Grade_Inbound_Monitoring</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Acknowledge_Reason_for_Call__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ownership__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(All_Client_Issue_s_Resolved__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Review_Pending_Cases_in_Account__c, 
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
"N/A", 2, 0)+ 

CASE(Proper_Closing_Transfer__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Resolution_Skills__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Conversational_Ability__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Pace__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Information_Accuracy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)) / 40</formula>
        <name>Calc Final Grade - Inbound Monitoring</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Grade_LBW_Onboarding</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Introduction__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Backend_Login__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Website_Overview__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Account_Information__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Services_Sub_Categories__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Radius_Geo__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Organic__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Lead_Overview__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Marketing_Features__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(closing__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+
 
CASE(Attitude_Tone_Empathy__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Resolution_Skills__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Conversational_Ability__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Information_Accuracy__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Pace__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Call_control__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Perspective__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 54</formula>
        <name>Calc Final Grade - LBW Onboarding</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Grade_LBW_Performance</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Precall_Work__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Introduction__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Performance_Opinion__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Review_Calls__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Lead_Rating__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Success_Measurement__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Top_Campaigns__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Ads__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Radius_Geo__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Organic__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Impression_Share__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(closing__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+

CASE(Attitude_Tone_Empathy__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Resolution_Skills__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Conversational_Ability__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Information_Accuracy__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Pace__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Call_control__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Perspective__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 62</formula>
        <name>Calc Final Grade - LBW Performance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Grade_TORCHx_CSC_Building</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Greeting_and_Goals__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Website_Search_Page__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Attempt_Log_in__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Profile_Page_Contact_Info__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Profile_Page_Site_Info__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Profile_Page_Agent_Page_Customization__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Notifications__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Integration__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Calendar_Integration__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Listing_Rider__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Support_Info__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
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
"N/A", 4, 0)) / 44</formula>
        <name>Calc Final Grade - TORCHx CSC Building</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Grade_TORCHx_CSC_Managing</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Greeting_and_Goals__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Overview__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Searching_Leads__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Tab_Views__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Details_Timeline__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Details_Searches__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Details_Properties__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lead_Details_Send_Listings__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Drip_Campaigns__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Templates__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Text_Templates__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Mass_Email__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Best_Practices__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
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
"N/A", 4, 0)) / 44</formula>
        <name>Calc Final Grade - TORCHx CSC Managing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Grade_TORCHx_Inbound_Call</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Requests_Reason_for_Clients_Call__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Backend_Login__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(New_Feature_Information_Discussed__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads_Upsell_Pitched__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Issues_Resolved__c, 
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

CASE(FAIR_Communication__c, 
"4", 5, 
"2", 3.75, 
"1", 2.5, 
"N/A", 1.25, 0)+ 

CASE(Information_Accuracy__c, 
"4", 5, 
"2", 3.75, 
"1", 2.5, 
"N/A", 1.25, 0)) / 36</formula>
        <name>Calc Final Grade - TORCHx Inbound Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Grade_TORCHx_Save_Call</fullName>
        <field>Final_Score__c</field>
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

CASE(Necessary_Follow_Up_Work__c, 
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
        <name>Calc Final Grade - TORCHx Save Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Final_Score_Adoption_Call</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Introduction__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Agenda__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Google_Listing_Status__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Contacts__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Marketing__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Lists__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Email_Tracking__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Ads__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Training_Recap__c, 
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

CASE(Call_control__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Pace__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Information_Accuracy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)) / 46</formula>
        <name>Calc Final Score - Adoption Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qual_Grade_Advanced_Features</fullName>
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


CASE( Information_Accuracy__c,
"4", 4,
"2", 2,
"1", 1,
"N/A", 4, 0)) / 12</formula>
        <name>Calc Qual Grade - Advanced Features</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qual_Grade_Collections_Call</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Resolution_Skills__c, 
"4", 4, 
"2", 2, 
"N/A", 4, 0)+ 

CASE(Pace__c, 
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
"N/A", 4, 0)) / 24</formula>
        <name>Calc Qual Grade - Collections Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qual_Grade_Inbound_Monitoring</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Resolution_Skills__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Conversational_Ability__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Call_control__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Pace__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)+ 

CASE(Information_Accuracy__c, 
"4", 4, 
"2", 2, 
"1", 1, 
"N/A", 4, 0)) / 24</formula>
        <name>Calc Qual Grade - Inbound Monitoring</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qual_Grade_TORCHX_CSC_Building</fullName>
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
        <name>Calc Qual Grade - TORCHX CSC Building</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qual_Grade_TORCHX_CSC_Managing</fullName>
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
        <name>Calc Qual Grade - TORCHX CSC Managing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qual_Grade_TORCHx_Inbound_Call</fullName>
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

CASE(FAIR_Communication__c, 
"4", 5, 
"2", 3.75, 
"1", 2.5, 
"N/A", 1.25, 0)+ 

CASE(Information_Accuracy__c, 
"4", 5, 
"2", 3.75, 
"1", 2.5, 
"N/A", 1.25, 0)) / 20</formula>
        <name>Calc Qual Grade - TORCHx Inbound Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qual_Grade_TORCHx_Save_Call</fullName>
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
        <name>Calc Qual Grade - TORCHx Save Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qualitative_Grade_Adoption_Call</fullName>
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

CASE(Call_control__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Pace__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Information_Accuracy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)) / 24</formula>
        <name>Calc Qualitative Grade - Adoption Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qualitative_Grade_LBW_Onboarding</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Resolution_Skills__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Conversational_Ability__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Information_Accuracy__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Pace__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Call_control__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Perspective__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 14</formula>
        <name>Calc Qualitative Grade - LBW Onboarding</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qualitative_Grade_LBW_Performance</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Resolution_Skills__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Conversational_Ability__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Information_Accuracy__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Pace__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Call_control__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Perspective__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)) / 14</formula>
        <name>Calc Qualitative Grade - LBW Performance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qualitative_Grade_Owner_Verified</fullName>
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
        <name>Calc. Qualitative Grade - Owner Verified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calc_Qualitative_PIN_Collection</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Call_control__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Attitude_Tone_Empathy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE( Objection_Handling_Skills__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+


CASE( FAIR_Communication__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE( Information_Accuracy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)) / 20</formula>
        <name>Calc. Qualitative Grade - PIN Collection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Adherence_Grade_Local_Chat</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Confirm_Ability_to_Help__c, 
"N/A", 4,
"4", 4, 
"2", 2 ,0)+

CASE( Complete_notes__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE( Outstanding_Casework_Reviewed__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+


CASE(Confirms_Main_Issue_Addressed__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Confirms_No_Outstanding_Questions__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+


CASE(closing__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Correct_Grammar_Spelling__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Quick_Text_Used_When_Applicable__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Child_Cases_Chat_Transcript_Attached__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Necessary_Casework_Submitted__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Changes_Completed_Correctly__c,
"N/A", 4,
"4", 4,
"2", 2, 0)
) / 44</formula>
        <name>Calculate Adherence Grade - Local Chat</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Adherence_Grade_Local_Email</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE(Proper_Template_Used__c, 
"N/A", 4, 
"4", 4, 
"2", 2 ,0)+ 

CASE(Client_s_Issues_Questions_Restated__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Outstanding_Casework_Reviewed__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 


CASE(Outbound_Dial_if_necessary__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Proper_Case_Reason_Statuses_Used__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Child_Case_and_Response_Attached_Correct__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Complete_notes__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Correct_Grammar_Spelling__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Necessary_Casework_Submitted__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Changes_Completed_Correctly__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)) / 40</formula>
        <name>Calculate Adherence Grade - Local Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Adherence_Grade_Owner_Verified</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE( Opening__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Co_Management_Access__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Co_Management_Walkthrough__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(closing__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Salesforce_Work__c,
"2", 2,
"1", 1,
"N/A", 2, 0)) /10</formula>
        <name>Calculate Adherence Grade-Owner Verified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Adherence_Grade_PIN_Collection</fullName>
        <field>Adherence_Grade__c</field>
        <formula>(CASE( Opening__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Verify_PIN__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Verify_Time_Frame__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(  Verify_Address_Sent__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Junk_Mail_Warning__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Next_Action_for_Client__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Alert_Others_of_Mail__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Maps_Initial_Claiming_Updated_Correctly__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( closing__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Complete_notes__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X1_Appropriate_Rebuttals_Utilized__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X1_satisfied_with_response__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X2_Appropriate_Rebuttals_Utilized__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X2_Client_Satisfied_With_Response__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X3_Appropriate_Rebuttals_Utilized__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X3_Client_Satisfied_With_Response__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X4_Appropriate_Rebuttals_Utilized__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X4_Client_Satisfied_With_Response__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)) / 36</formula>
        <name>Calculate Adherence Grade-PIN Collection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Final_Score_Local_Chat</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Confirm_Ability_to_Help__c, 
"N/A", 4,
"4", 4, 
"2", 2 ,0)+

CASE( Complete_notes__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE( Outstanding_Casework_Reviewed__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+ 

CASE(Confirms_Main_Issue_Addressed__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Confirms_No_Outstanding_Questions__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+


CASE(closing__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Correct_Grammar_Spelling__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Quick_Text_Used_When_Applicable__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Child_Cases_Chat_Transcript_Attached__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Necessary_Casework_Submitted__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Changes_Completed_Correctly__c,
"N/A", 4,
"4", 4,
"2", 2, 0)+

CASE(Attitude_Tone_Empathy__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Resolution_Skills__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Conversational_Ability__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Information_Accuracy__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Pace__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Chat_Control__c, 
"N/A", 2, 
"2", 2, 
"1", 1, 0))/ 56</formula>
        <name>Calculate Final Score - Local Chat</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Final_Score_Local_Email</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Proper_Template_Used__c, 
"N/A", 4, 
"4", 4, 
"2", 2 ,0)+ 

CASE(Client_s_Issues_Questions_Restated__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Outstanding_Casework_Reviewed__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 


CASE(Outbound_Dial_if_necessary__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Proper_Case_Reason_Statuses_Used__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Child_Case_and_Response_Attached_Correct__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Complete_notes__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Correct_Grammar_Spelling__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Necessary_Casework_Submitted__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Changes_Completed_Correctly__c, 
"N/A", 4, 
"4", 4, 
"2", 2, 0)+ 

CASE(Resolution_Skills__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Information_Accuracy__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)) / 44</formula>
        <name>Calculate Final Score - Local Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Final_Score_Owner_Verified</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE( Opening__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Co_Management_Access__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Co_Management_Walkthrough__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(closing__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE(Salesforce_Work__c, 
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
"N/A", 4, 0)) / 34</formula>
        <name>Calculate Final Score - Owner Verified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Final_Score_PIN_Collection</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE(Call_control__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE(Attitude_Tone_Empathy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE( Objection_Handling_Skills__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+


CASE( FAIR_Communication__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE( Information_Accuracy__c,
"4", 4,
"2", 2,
"N/A", 4, 0)+

CASE( Opening__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Verify_PIN__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Verify_Time_Frame__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Verify_Address_Sent__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Junk_Mail_Warning__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Next_Action_for_Client__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Alert_Others_of_Mail__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( Maps_Initial_Claiming_Updated_Correctly__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( closing__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE(Complete_notes__c, 
"2", 2, 
"1", 1, 
"N/A", 2, 0)+ 

CASE( X1_Appropriate_Rebuttals_Utilized__c,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X1_satisfied_with_response__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X2_Appropriate_Rebuttals_Utilized__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X2_Client_Satisfied_With_Response__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X3_Appropriate_Rebuttals_Utilized__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X3_Client_Satisfied_With_Response__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X4_Appropriate_Rebuttals_Utilized__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)+

CASE( X4_Client_Satisfied_With_Response__c ,
"2", 2,
"1", 1,
"N/A", 2, 0)) / 56</formula>
        <name>Calculate Final Score - PIN Collection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Maps_Quality_Assurance_Final</fullName>
        <field>Final_Score__c</field>
        <formula>(CASE( Contact_Date__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE( Correct_Status__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  Cannot_Complete_Reason__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  Notes_for_Pin_Team__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE( Pin_Action_Taken__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE( Pin_Action_Owner__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE( PIN_Action_Details__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE( Detailed_Notes__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE( Setup_Date__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  Attempts_to_Contact__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)+


CASE(  Call_Attached__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+


CASE(  OV_Max_Attempts__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+


CASE(  Existing_Listings_in_Pan_Notated__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  Listing_1_2_4_Status__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE( Google_Listing_Status__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE( Google_Status__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  Owner_Verified_Status__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  MIC_Updated_for_listing_to_be_claimed__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  Google_Listing_Status__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  GMBL_Account_Status__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  GMBL_Account_Status__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  GMBL_Owner_Conflict_Status__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  Are_we_manager_Not_Comm_Manager__c  ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  Other_SEO_Company_Listed__c   ,
"2", 2,
"0", 0,
"N/A", 2, 0)+

CASE(  Is_Google_Account_listed_in_MIC__c ,
"2", 2,
"0", 0,
"N/A", 2, 0)) / 50</formula>
        <name>Calculate Maps Quality Assurance Final</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Qualitative_Grade_Local_Chat</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Attitude_Tone_Empathy__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Resolution_Skills__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Conversational_Ability__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Information_Accuracy__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Pace__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 


CASE(Chat_Control__c, 
"N/A", 2, 
"2", 2, 
"1", 1, 0)) / 12</formula>
        <name>Calculate Qualitative Grade - Local Chat</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Calculate_Qualitative_Grade_Local_Emai</fullName>
        <field>Qualitative_Grade__c</field>
        <formula>(CASE(Resolution_Skills__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)+ 

CASE(Information_Accuracy__c, 
"N/A", 2, 
"2", 2, 
"1", 1 ,0)) / 4</formula>
        <name>Calculate Qualitative Grade - Local Emai</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
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
    </fieldUpdates><fieldUpdates>
        <fullName>Call_Flow_Formula_2</fullName>
        <field>Call_Flow_Adherence_Formula_2_Text__c</field>
        <formula>Call_Flow_Adherence_Formula_2__c</formula>
        <name>Call Flow Formula 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Formula</fullName>
        <field>Formula_Text__c</field>
        <formula>Formula__c</formula>
        <name>Formula</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Formula_2</fullName>
        <field>Formula_2_Text__c</field>
        <formula>Formula_2__c</formula>
        <name>Formula 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Inbound_Monitoring_Forms</fullName>
        <field>Inbound_Monitoring_Text_Formula__c</field>
        <formula>Inbound_Monitoring_Formula__c</formula>
        <name>Inbound Monitoring Forms</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Inbound_Monitoring_Forms_2</fullName>
        <field>Inbound_Monitoring_Text_Formula_2__c</field>
        <formula>Inbound_Monitoring_Formula_2__c</formula>
        <name>Inbound Monitoring Forms 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Formula_1</fullName>
        <field>Call_Flow_Adherence_Formula_1_Text__c</field>
        <formula>Call_Flow_Adherence_Formula_1__c</formula>
        <name>Update Formula 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
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
        <active>true</active>
        <formula>True  &amp;&amp;  RecordType.Name = 'CSC Monitoring Forms'</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate Adoption Call Scores</fullName>
        <actions>
            <name>Calc_Adherence_Grade_Adoption_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Score_Adoption_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qualitative_Grade_Adoption_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Adoption Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate Collections Call Scores</fullName>
        <actions>
            <name>Calc_Adherence_Grade_Collections_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_Collections_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qual_Grade_Collections_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Collections Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate Inbound Monitoring Form</fullName>
        <actions>
            <name>Calc_Adherence_Grade_InboundMonitoring</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_Inbound_Monitoring</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qual_Grade_Inbound_Monitoring</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Inbound Monitoring Forms</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate LBW Onboarding Quality Process Form</fullName>
        <actions>
            <name>Calc_Adherence_Grade_LBW_Onboarding</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_LBW_Onboarding</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qualitative_Grade_LBW_Onboarding</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>LBW Onboarding Quality Process</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate LBW Performance Quality Process Form</fullName>
        <actions>
            <name>Calc_Adherence_Grade_LBW_Performance</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_LBW_Performance</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qualitative_Grade_LBW_Performance</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>contains</operation>
            <value>LBW Performance Call Quality Process</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
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
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse CSC + Essentials</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
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
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse CSC</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
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
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse Inbound Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
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
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse Save Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate Local Chat Scores</fullName>
        <actions>
            <name>Calculate_Adherence_Grade_Local_Chat</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Final_Score_Local_Chat</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Qualitative_Grade_Local_Chat</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Local - Live Chat Monitoring Form</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate Local Email Scores</fullName>
        <actions>
            <name>Calculate_Adherence_Grade_Local_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Final_Score_Local_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Qualitative_Grade_Local_Emai</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Local - Email Monitoring Form</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
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
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Local - Max CSC Grading Form</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate Maps Owner Verified Score</fullName>
        <actions>
            <name>Calc_Qualitative_Grade_Owner_Verified</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Adherence_Grade_Owner_Verified</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Final_Score_Owner_Verified</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps - Owner Verified</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate Maps Quality Assurance Form</fullName>
        <actions>
            <name>Calculate_Maps_Quality_Assurance_Final</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps - Quality Assurance Form</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate PIN Collection Score</fullName>
        <actions>
            <name>Calc_Qualitative_PIN_Collection</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Adherence_Grade_PIN_Collection</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calculate_Final_Score_PIN_Collection</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Maps - PIN Collection</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
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
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Save Call Monitoring Forms</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate TORCHx CSC Advanced Features</fullName>
        <actions>
            <name>Calc_Adhere_Grade_Advanced_Features</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_Advanced_Features</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qual_Grade_Advanced_Features</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx CSC - Advanced Features</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate TORCHx CSC Building Awareness and Driving Leads Scores</fullName>
        <actions>
            <name>Calc_Adhere_Grade_TORCHx_CSC_Building</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_TORCHx_CSC_Building</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qual_Grade_TORCHX_CSC_Building</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx CSC - Building Awareness and Driving Leads</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate TORCHx CSC Managing Relationships</fullName>
        <actions>
            <name>Calc_Adhere_Grade_TORCHx_CSC_Managing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_TORCHx_CSC_Managing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qual_Grade_TORCHX_CSC_Managing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx CSC - Managing Relationships</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate TORCHx Inbound Call Scores</fullName>
        <actions>
            <name>Calc_Adherence_Grade_TORCHx_Inbound_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_TORCHx_Inbound_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qual_Grade_TORCHx_Inbound_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx Inbound Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Calculate TORCHx Save Call</fullName>
        <actions>
            <name>Calc_Adherence_Grade_TORCHx_Save_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Final_Grade_TORCHx_Save_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_Qual_Grade_TORCHx_Save_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Call_Grading_Form_2_0__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx Save Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
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
        <active>true</active>
        <formula>True  &amp;&amp;  RecordType.Name = 'Essentials Setup Completion Call'</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Inbound Monitoring Forms</fullName>
        <actions>
            <name>Inbound_Monitoring_Forms</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inbound_Monitoring_Forms_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>TRUE  &amp;&amp; RecordTypeId = '01232000000M3c4'</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Save Call Monitoring Forms</fullName>
        <actions>
            <name>Call_Flow_Formula_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Formula</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Formula_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Formula_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>TRUE &amp;&amp; RecordTypeId = '01232000000M3bz'</formula>
        <triggerType>onAllChanges</triggerType>
    </rules></Workflow>