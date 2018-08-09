<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Completed_SEOPPC_Ranking_Scrape</fullName>
        <description>Completed SEOPPC Ranking Scrape</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Account_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Completed_SEOPPC_Scrape_to_Opportunity_Owner_and_AD</template>
    </alerts>
    <alerts>
        <fullName>LH_Opportunity_Stage_changed_to_Demo</fullName>
        <description>LH Opportunity Stage changed to Demo</description>
        <protected>false</protected>
        <recipients>
            <recipient>bosteros@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_LH_Opportunity_in_Demo_Stage</template>
    </alerts>
    <alerts>
        <fullName>New_Initial_Transaction_Opp_Launched</fullName>
        <description>New Initial Transaction Opp Launched</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/New_Initial_Transaction_Opp_Launched</template>
    </alerts>
    <alerts>
        <fullName>Notify_SE_of_Upsell_Followup</fullName>
        <description>Notify SE of Upsell Followup</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Upsell_Followup_Needed</template>
    </alerts>
    <alerts>
        <fullName>Upsell_Addition_to_Josh_Cummings</fullName>
        <description>Upsell Addition notification to Josh Cummings</description>
        <protected>false</protected>
        <recipients>
            <recipient>jcummings@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Alert_for_Opportunity_Upsell_Addition_Approval</template>
    </alerts>
    <alerts>
        <fullName>Upsell_approved_notification</fullName>
        <description>Upsell approved notification</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Alert_for_Opportunity_Upsell_Approved</template>
    </alerts>
    <alerts>
        <fullName>Upsell_rejected_notification</fullName>
        <description>Upsell rejected notification</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Alert_for_Opportunity_Upsell_Rejected</template>
    </alerts>
    <alerts>
        <fullName>YBN_Assign_Relationship_Director_RD</fullName>
        <description>YBN - Assign Relationship Director (RD)</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Sales_Director_Manager_Relationship_Directors</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>YBN_Sales_Email_Templates/YBN_Assign_Relationship_Director_RD</template>
    </alerts>
    <alerts>
        <fullName>YBN_Contract_Signed_Assign_AD</fullName>
        <description>YBN Contract Signed-Assign AD</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Contract_Signed_Assign_AD</template>
    </alerts>
    <alerts>
        <fullName>YBN_Email_Alert_to_Assign_SA</fullName>
        <description>YBN - Assign Solutions Architect</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Solution_Architects</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Corporate_Opp_Created_Assign_SA</template>
    </alerts>
    <alerts>
        <fullName>YBN_ILContract_Signed</fullName>
        <description>YBN IL Contract Signed</description>
        <protected>false</protected>
        <recipients>
            <recipient>bheppner@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tgahagan@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_ILContract_Signed</template>
    </alerts>
    <alerts>
        <fullName>YBN_IL_Boom_Email</fullName>
        <description>YBN IL Boom Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>emily.garza@web.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/WBN_IL_Boom_Email</template>
    </alerts>
    <alerts>
        <fullName>YBN_IL_Opp_Closed_Won_for_YBN_Customer_Side_Business</fullName>
        <description>YBN IL Opp Closed Won for YBN Customer Side Business</description>
        <protected>false</protected>
        <recipients>
            <recipient>aspinelli@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.volkel@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Customer_Local_Side_Business</template>
    </alerts>
    <alerts>
        <fullName>YBN_Opp_in_Contract_Phase_Assign_Force_Field_SD</fullName>
        <ccEmails>emcintyre@yodle.com</ccEmails>
        <description>YBN Opp in Contract Phase-Assign Force Field SD</description>
        <protected>false</protected>
        <recipients>
            <recipient>sfdc@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Contract_Signed_Assign_Force_Field_SD</template>
    </alerts>
    <alerts>
        <fullName>YBN_Opp_in_Exec_Review_Call_Stage_Assign_CSM</fullName>
        <description>YBN - Assign Strategic Project Manager (SPM)</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Strategic_Project_Managers</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Exec_Review_Call_Completed_Assign_CSM</template>
    </alerts>
    <alerts>
        <fullName>YBN_Opp_in_Exec_Review_Call_Stage_Assign_PImS</fullName>
        <description>YBN - Assign PImS</description>
        <protected>false</protected>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Opp_in_Exec_Review_Call_Stage_Assign_PImS</template>
    </alerts>
    <alerts>
        <fullName>YBN_Perf_Team_Run_Book_Weekly_Meeting</fullName>
        <description>YBN Perf Team Run Book &amp; Weekly Meeting</description>
        <protected>false</protected>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Perf_Team_Run_Book_Weekly_Meeting</template>
    </alerts>
    <alerts>
        <fullName>YBN_Phased_Launch_Date_Changed</fullName>
        <description>YBN: Phased Launch Date Changed</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Account_Director_Managers</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_Customer_Success_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>ami.dave@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jswitzer@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Phased_Launch_Date_Changed</template>
    </alerts>
    <alerts>
        <fullName>YBN_Relationship_Launch_Date_Changed</fullName>
        <description>YBN: Relationship Launch Date Changed</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Customer_Success_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>ami.dave@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>doleary@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.hendrickson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jswitzer@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kelly.rix@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mmachado@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mpugh@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.deller@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Relationship_Launch_Date_Changed</template>
    </alerts>
    <alerts>
        <fullName>YBN_SA_Assignment_Alert</fullName>
        <description>YBN SA Assignment Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Solutions_Architect__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_SA_Schedule_Internal_Download_Call_with_SD</template>
    </alerts>
    <alerts>
        <fullName>YBN_SPM_Begins_Filling_Out_Run_Book</fullName>
        <description>YBN SPM Begins Filling Out Run Book</description>
        <protected>false</protected>
        <recipients>
            <field>Force_Field_Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Director_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>jswitzer@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Account_Director__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Strategic_Project_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_CSM_Begins_Filling_Out_Run_Book</template>
    </alerts>
    <alerts>
        <fullName>YBN_Website_Launched_Email</fullName>
        <description>YBN Website Launched Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_VP_of_Client_Services</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>iitenberg@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jwilder@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mmachado@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/YBN_Website_Template_Launched</template>
    </alerts>
    <alerts>
        <fullName>YBN_close_date_is_in_the_past</fullName>
        <description>YBN close date is in the past</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Close_Date_in_the_Past</template>
    </alerts>
    <alerts>
        <fullName>email_alert_for_new_initial_transactions_signed</fullName>
        <description>email alert for new initial transactions signed</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Consultant_Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/New_Relationship_Signed</template>
    </alerts>
    <alerts>
        <fullName>ybn_estimated_launch_dates_needed</fullName>
        <description>ybn - estimated launch dates needed</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Customer_Success_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>aelkin@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Estimated_Launch_Dates_Needed</template>
    </alerts>
    <alerts>
        <fullName>YBN_Contract_Signed</fullName>
        <description>YBN Contract Signed</description>
        <protected>false</protected>
        <recipients>
            <recipient>emily.garza@web.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.hendrickson@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>justin.petrillo@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>lcuiman@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.fucaloro@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mpugh@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mswiader@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ryan.ciampi@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scornwall@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/YBN_Contract_Signed</template>
    </alerts>
    <alerts>
        <fullName>WBN_NCS_Never_Launch_Final_Sales_Ops</fullName>
        <description>WBN - NCS - Never Launch - Final Sales Ops</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>WBN_Templates/WBN_NCS_Approval_Final_Sales_Ops_Tasks_HTML</template>
    </alerts>
    <alerts>
        <fullName>WBN_NCS_Never_Launch_Opportunity_Approval_Final_Rejection</fullName>
        <description>WBN - NCS Never Launch - Opportunity Approval - Final Rejection</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Sales_Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>WBN_Templates/WBN_NCS_Lost_Approval_Final_Rejection_HTML</template>
    </alerts>
    <alerts>
        <fullName>WBN_NCS_Never_Launch_Opportunity_Approval_Notify_Sales_Ops</fullName>
        <description>WBN - NCS Never Launch - Opportunity Approval - Notify Sales Ops</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>WBN_Templates/WBN_NCS_Approval_Notification_Sales_Ops_HTML</template>
    </alerts>
    <alerts>
        <fullName>WBN_NCS_Never_Launch_Opportunity_Approval_Final_Approval</fullName>
        <description>WBN - NCS Never Launch - Opportunity Approval - Final Approval</description>
        <protected>false</protected>
        <recipients>
            <field>IMS_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>YBN_Operations</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>YBN_Sales_Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>WBN_Templates/WBN_NCS_Lost_Approval_Final_Approval_HTML</template>
    </alerts>
    <fieldUpdates>
        <fullName>CPP_Update_Probability_to_10</fullName>
        <field>Probability</field>
        <formula>0.10</formula>
        <name>CPP - Update Probability % to 10%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CPP_Update_Probability_to_30</fullName>
        <field>Probability</field>
        <formula>0.30</formula>
        <name>CPP - Update Probability % to 30%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CPP_Update_Probability_to_5</fullName>
        <field>Probability</field>
        <formula>0.05</formula>
        <name>CPP - Update Probability % to 5%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CPP_Update_Probability_to_50</fullName>
        <field>Probability</field>
        <formula>0.50</formula>
        <name>CPP - Update Probability % to 50%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CPP_Update_Probability_to_80</fullName>
        <field>Probability</field>
        <formula>0.80</formula>
        <name>CPP - Update Probability % to 80%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Client_Discovery_Date_Today</fullName>
        <field>Client_Discovery_Date__c</field>
        <formula>TODAY()</formula>
        <name>Client Discovery Date -&gt; Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_Date_Today</fullName>
        <field>CloseDate</field>
        <formula>TODAY()</formula>
        <name>Close Date -&gt; Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Commission_NCSE_Split</fullName>
        <field>Commission_NCSE_Split__c</field>
        <formula>Commission_NCSE__c</formula>
        <name>Commission NCSE Split</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contract_Expiration</fullName>
        <field>Contract_Expiration_Date__c</field>
        <formula>If(ISPICKVAL(Contract_Expiration__c, "Contract Signed Date"), (CloseDate +(30* (Minimum_Contract_Length__c))), 
If(ISPICKVAL(Contract_Expiration__c, "Contract Execution Date"), (CloseDate +(30*( Minimum_Contract_Length__c))), 
If(ISPICKVAL(Contract_Expiration__c, "Live Date"),(today()-max(if(isnull(today()-Website_Launch_Date__c),-99999999,today()-Website_Launch_Date__c), if(isnull(today()-Custom_Implementation_Launch_Date__c), -99999999,today()-Custom_Implementation_Launch_Date__c), if(isnull(today()-Organic_Launch_Date__c), -99999999,today()-Organic_Launch_Date__c), if(isnull(today()-Portal_Launch_Date__c), -99999999,today()-Portal_Launch_Date__c), if(isnull(today()-Sponsored_Launch_Date__c), -99999999,today()-Sponsored_Launch_Date__c), if(isnull(today()-Display_Launch_Date__c), -99999999,today()-Display_Launch_Date__c), if(isnull(today()-Reviews_Launch_Date__c), -99999999,today()-Reviews_Launch_Date__c))) +(30* (Minimum_Contract_Length__c)),
CloseDate +(30* (Minimum_Contract_Length__c)))))</formula>
        <name>Contract Expiration</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contract_Signed_Field_Update_IL_Renwa</fullName>
        <field>StageName</field>
        <literalValue>Opportunity Closed</literalValue>
        <name>Contract Signed Field Update -IL &amp; Renwa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contract_Stage_Date_Today</fullName>
        <field>Contract_Stage_Date__c</field>
        <formula>TODAY()</formula>
        <name>Contract Stage Date -&gt; Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Demo_Value_Date_Today</fullName>
        <field>Demo_Value_Date__c</field>
        <formula>TODAY()</formula>
        <name>Demo/Value Date -&gt; Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email_from_Account_to_Opportunity</fullName>
        <field>Contact_Email__c</field>
        <formula>Account.Email__c</formula>
        <name>Email from Account to Opportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Stage_Change_Date_Today</fullName>
        <field>Last_Stage_Change_Date__c</field>
        <formula>TODAY()</formula>
        <name>Last Stage Change Date -&gt; Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Local_Completed_By_Manager</fullName>
        <field>Completed_By_Manager__c</field>
        <formula>Owner.Manager.Full_Name__c</formula>
        <name>Local - Completed By Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Local_Completed_By_Rep</fullName>
        <field>Completed_By__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>Local - Completed By Rep</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Local_Completed_By_Role</fullName>
        <field>Completed_By_Role__c</field>
        <formula>$UserRole.Name</formula>
        <name>Local - Completed By Role</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Local_Update_Stage_to_Closed_Won</fullName>
        <description>.</description>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Local - Update Stage to Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>M6</fullName>
        <field>M006__c</field>
        <formula>TODAY()</formula>
        <name>YBN M6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Milestone_Client_Discovery</fullName>
        <field>Milestone__c</field>
        <literalValue>Client Discovery</literalValue>
        <name>Milestone -&gt; Client Discovery</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Milestone_Contract</fullName>
        <field>Milestone__c</field>
        <literalValue>Contract</literalValue>
        <name>Milestone -&gt; Contract</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Milestone_Demo_Value_Prop</fullName>
        <field>Milestone__c</field>
        <literalValue>Demo/Value Prop</literalValue>
        <name>Milestone -&gt; Demo/Value Prop</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Milestone_Solution</fullName>
        <field>Milestone__c</field>
        <literalValue>Solution</literalValue>
        <name>Milestone -&gt; Solution</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Update_Client_Phone_Number</fullName>
        <field>Client_Phone_Number__c</field>
        <formula>Account.Phone</formula>
        <name>Opportunity - Update Client Phone Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_to_Beau</fullName>
        <field>OwnerId</field>
        <lookupValue>bosteros@yodle.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner to Beau</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Phone_Demo_Completed_today</fullName>
        <field>Phone_demo_completed_date__c</field>
        <formula>today()</formula>
        <name>phone demo complete=today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_FF_Sales_Director_Email</fullName>
        <field>Force_Field_Sales_Director_Email__c</field>
        <formula>Account.Sales_Director__r.Email</formula>
        <name>Populate FF Sales Director Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Sales_Director_Email</fullName>
        <field>Sales_Director_Email__c</field>
        <formula>Account.Sales_Director__r.Email</formula>
        <name>Populate Sales Director Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Stage_Lost_Field</fullName>
        <field>Stage_Lost__c</field>
        <formula>TEXT(PRIORVALUE(StageName))</formula>
        <name>Populate Stage Lost Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SE_Follow_Up_Date_Today</fullName>
        <field>SE_Follow_Up_Date__c</field>
        <formula>Today()</formula>
        <name>SE Follow Up Date -&gt; Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Solution_Date_Today</fullName>
        <field>Solution_Date__c</field>
        <formula>TODAY()</formula>
        <name>Solution Date -&gt; Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Change_Today</fullName>
        <field>Last_Status_Change__c</field>
        <formula>TODAY()</formula>
        <name>Opportunity Last Status Change to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Totalupdated</fullName>
        <field>Amount</field>
        <formula>100</formula>
        <name>Opportunity Amount to 100</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>URL_website</fullName>
        <field>What_is_the_URL__c</field>
        <formula>Account.Website</formula>
        <name>Opportunity What is the URL to Website</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Next_Bill_Date</fullName>
        <field>Next_Bill_Date__c</field>
        <formula>Account.Next_Billing_Date__c</formula>
        <name>Update Next Bill Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Phase_1_Original_Est_Launch_Date</fullName>
        <field>Phase_1_Original_Est_Launch_Date__c</field>
        <formula>Phase_1_Estimated_Launch_Date__c</formula>
        <name>Update Phase 1 Original Est Launch Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Phase_2_Original_Est_Launch_Date</fullName>
        <field>Phase_2_Original_Est_Launch_Date__c</field>
        <formula>Phase_2_Estimated_Launch_Date__c</formula>
        <name>Update Phase 2 Original Est Launch Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Phase_3_Original_Est_Launch_Date</fullName>
        <field>Phase_3_Original_Est_Launch_Date__c</field>
        <formula>Phase_3_Estimated_Launch_Date__c</formula>
        <name>Update Phase 3 Original Est Launch Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Probibility_to_15</fullName>
        <field>Probability</field>
        <formula>0.15</formula>
        <name>Update Probibility to 15%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Probibility_to_25</fullName>
        <field>Probability</field>
        <formula>0.25</formula>
        <name>Update Probibility to 25%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upsell_Addition_Approved</fullName>
        <field>True_Upsell_Addition__c</field>
        <literalValue>Approved - True Upsell Addition</literalValue>
        <name>Upsell Addition Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upsell_Addition_Pending</fullName>
        <field>True_Upsell_Addition__c</field>
        <literalValue>Pending  Approval</literalValue>
        <name>Upsell Addition Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upsell_Addition_Rejected</fullName>
        <field>True_Upsell_Addition__c</field>
        <literalValue>Rejected - Does Not Meet Addition Criteria</literalValue>
        <name>Upsell Addition Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upsell_Rejected_Stage_Closed_Lost</fullName>
        <field>StageName</field>
        <literalValue>Closed Lost</literalValue>
        <name>Upsell Rejected - Stage = Closed Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Commissionable_Revenue_Amount_Calc</fullName>
        <field>Commissionable_Revenue_Amount__c</field>
        <formula>(
IF(ISBLANK(Setup_Fee_CR__c), 0, Setup_Fee_CR__c) 
+ IF(ISBLANK(Facebook_Setup_Fee__c), 0, Facebook_Setup_Fee__c)
+ ((IF(ISBLANK(Monthly_Management_Fees__c), 0, Monthly_Management_Fees__c) * Yodle_Web_Multiplier__c) + ((IF(ISBLANK(Monthly_Advertising_Charges__c), 0, Monthly_Advertising_Charges__c) + IF(ISBLANK(corp_Media_Management_Fee__c), 0, corp_Media_Management_Fee__c)) * PPC_Multiplier__c) + (IF(ISBLANK(Organic_fees__c), 0, Organic_fees__c) * Organic_Multiplier__c) + (IF(ISBLANK(Review_Management_Fee_Per_Location__c), 0, Review_Management_Fee_Per_Location__c) * Review_Management_Multiplier__c) + (IF(ISBLANK(Monthly_Display_Fees__c), 0, Monthly_Display_Fees__c) * Display_Multiplier__c )+ IF(ISBLANK(Facebook_Fee_Per_Location__c), 0, Facebook_Fee_Per_Location__c) + IF(ISBLANK(Leads_by_Web_G1__c), 0, Leads_by_Web_G1__c))) * SDR_Multiplier__c*Tradeshow_Multiplier__c*Promo_Multiplier__c</formula>
        <name>YBN Commissionable Revenue Amount Calc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Contract_Lost</fullName>
        <field>Contract_Status__c</field>
        <literalValue>Closed Lost</literalValue>
        <name>YBN Contract Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_M1</fullName>
        <field>M1__c</field>
        <formula>Today()</formula>
        <name>YBN M1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_M100S</fullName>
        <field>M100__c</field>
        <formula>TODAY()</formula>
        <name>YBN M100</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_M1_Date</fullName>
        <field>M1_Date__c</field>
        <formula>TODAY()</formula>
        <name>YBN M1 Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_M2_Date</fullName>
        <field>M2_Date__c</field>
        <formula>TODAY()</formula>
        <name>YBN M2 Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_M3_Date</fullName>
        <field>M3_Date__c</field>
        <formula>TODAY()</formula>
        <name>YBN M3 Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_M4_Date</fullName>
        <field>M4_Date__c</field>
        <formula>TODAY()</formula>
        <name>YBN M4 Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_M5_Date</fullName>
        <field>M5_Date__c</field>
        <formula>TODAY()</formula>
        <name>YBN M5 Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_M6_Date</fullName>
        <field>M6_Date__c</field>
        <formula>TODAY()</formula>
        <name>YBN M6 Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Milestone_to_Stage_M002_IL</fullName>
        <field>StageName</field>
        <literalValue>M002 - Complete local demo (IL)</literalValue>
        <name>YBN: Milestone to Stage M002 IL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Milestone_to_Stage_M003_IL</fullName>
        <field>StageName</field>
        <literalValue>M003 - Contract (IL)</literalValue>
        <name>YBN: Milestone to Stage M003 IL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Opp_Milestone_Stage_M001</fullName>
        <field>StageName</field>
        <literalValue>M001 - Discovery call</literalValue>
        <name>YBN: Opp Milestone-Stage-M001</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Opp_Milestone_Stage_M011</fullName>
        <field>StageName</field>
        <literalValue>M011 - Moving to Close</literalValue>
        <name>YBN: Opp Milestone-Stage M011</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Opp_Milestone_Stage_M012</fullName>
        <field>StageName</field>
        <literalValue>M012 -  Proof of Value agreement</literalValue>
        <name>YBN: Opp Milestone-Stage M012</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Opp_Milestone_Stage_M013</fullName>
        <field>StageName</field>
        <literalValue>M013 - Contract Creation</literalValue>
        <name>YBN: Opp Milestone-Stage M013</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Opp_Milestone_Stage_M014</fullName>
        <field>StageName</field>
        <literalValue>M014 - Deliver Contract</literalValue>
        <name>YBN: Opp Milestone-Stage M014</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Opp_Milestone_Stage_M100</fullName>
        <field>StageName</field>
        <literalValue>M100 - Deal closes</literalValue>
        <name>YBN: Opp Milestone-Stage M100</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_To_Milestone_M014</fullName>
        <field>Milestone__c</field>
        <literalValue>M014 - Deliver Contract to the Customer</literalValue>
        <name>YBN: Stage To Milestone M014</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_CLOSED_LOST</fullName>
        <field>Milestone__c</field>
        <literalValue>CLOSED LOST</literalValue>
        <name>YBN: Stage to Milestone CLOSED LOST</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M001_IL</fullName>
        <field>Milestone__c</field>
        <literalValue>M001 - Set local demo (IL)</literalValue>
        <name>YBN: Stage to Milestone M001 IL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M002_IL</fullName>
        <field>Milestone__c</field>
        <literalValue>M002 - Complete local demo (IL)</literalValue>
        <name>YBN: Stage to Milestone M002 IL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M003_IL</fullName>
        <field>Milestone__c</field>
        <literalValue>M003 - Contract (IL)</literalValue>
        <name>YBN: Stage to Milestone M003 IL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M005</fullName>
        <field>Milestone__c</field>
        <literalValue>M005 - Audit download</literalValue>
        <name>YBN: Stage to Milestone M005</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M006</fullName>
        <field>Milestone__c</field>
        <literalValue>M006 - Implementation &amp; ROI Investigation Call</literalValue>
        <name>YBN: Stage to Milestone M006</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M007</fullName>
        <field>Milestone__c</field>
        <literalValue>M007 - Product Assessment &amp; Strategy</literalValue>
        <name>YBN: Stage to Milestone M007</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M008</fullName>
        <field>Milestone__c</field>
        <literalValue>M008 - Solutions in Action Presentation</literalValue>
        <name>YBN: Stage to Milestone M008</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M009</fullName>
        <field>Milestone__c</field>
        <literalValue>M009 - Proposal Creation &amp; Update SOW</literalValue>
        <name>YBN: Stage to Milestone M009</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M011</fullName>
        <field>Milestone__c</field>
        <literalValue>M012 - Proof of Value Agreement</literalValue>
        <name>YBN: Stage to Milestone M011</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M013</fullName>
        <field>Milestone__c</field>
        <literalValue>M013 - Contract Creation</literalValue>
        <name>YBN: Stage to Milestone M013</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M1</fullName>
        <field>Milestone__c</field>
        <literalValue>M1 - Discovery</literalValue>
        <name>YBN: Stage to Milestone M1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M2</fullName>
        <field>Milestone__c</field>
        <literalValue>M2 - Demo &amp; Value Presentation</literalValue>
        <name>YBN: Stage to Milestone M2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M3</fullName>
        <field>Milestone__c</field>
        <literalValue>M3 - Executive Review</literalValue>
        <name>YBN: Stage to Milestone M3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M4</fullName>
        <field>Milestone__c</field>
        <literalValue>M4 - Solutions Review</literalValue>
        <name>YBN: Stage to Milestone M4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M5</fullName>
        <field>Milestone__c</field>
        <literalValue>M5 - Proposal</literalValue>
        <name>YBN: Stage to Milestone M5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Stage_to_Milestone_M6</fullName>
        <field>Milestone__c</field>
        <literalValue>M6 - Contract</literalValue>
        <name>YBN: Stage to Milestone M6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Units_Calculation</fullName>
        <field>Units__c</field>
        <formula>If (INCLUDES( Products__c ,"PPC"),1,
If (INCLUDES( Products__c ,"Foundations"),1,
If (INCLUDES( Products__c ,"Organic"),1,
If (INCLUDES( Products__c ,"Centermark"),1,0.1))))</formula>
        <name>YBN Units Calculation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_CM_Original_Est_Launch_Date</fullName>
        <field>Centermark_Original_Est_Launch_Date__c</field>
        <formula>Centermark_Estimated_Launch_Date__c</formula>
        <name>YBN: Update CM Original Est Launch Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_Custom_Imp_Original_Est_Laun</fullName>
        <field>Custom_Imp_Original_Est_Launch_Date__c</field>
        <formula>Custom_Implementation_Estimated_Launch__c</formula>
        <name>YBN: Update Custom Imp Original Est Laun</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_Display_Original_Est_Launch</fullName>
        <field>Display_Original_Est_Launch_Date__c</field>
        <formula>Display_Estimated_Launch_Date__c</formula>
        <name>YBN: Update Display Original Est Launch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_PPC_Original_Est_Launch_Date</fullName>
        <field>PPC_Original_Est_Launch_Date__c</field>
        <formula>PPC_Estimated_Launch_Date__c</formula>
        <name>YBN: Update PPC Original Est Launch Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_Portal_Original_Est_Launch_D</fullName>
        <field>Portal_Original_Est_Launch_Date__c</field>
        <formula>Portal_Estimated_Launch_Date__c</formula>
        <name>YBN: Update Portal Original Est Launch D</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_Reviews_Original_Est_Launch</fullName>
        <field>Reviews_Original_Est_Launch_Date__c</field>
        <formula>Reviews_Estimated_Launch_Date__c</formula>
        <name>YBN: Update Reviews Original Est Launch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_Update_Website_Orig_Est_Launch_Date</fullName>
        <field>Website_Template_Original_Est_Launch__c</field>
        <formula>Website_Template_Estimated_Launch_date__c</formula>
        <name>YBN: Update Website Orig Est Launch Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_date_stamp_close_plan</fullName>
        <field>Close_Plan_Last_Updated_Date__c</field>
        <formula>Today()</formula>
        <name>YBN date stamp close plan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_date_stamp_for_why</fullName>
        <field>Why_Not_Buy_Last_Updated_Date__c</field>
        <formula>Today()</formula>
        <name>YBN date stamp not buy</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_date_stamp_for_why_do_biz_with_us</fullName>
        <field>Why_Would_They_Buy_Last_Updated_Date__c</field>
        <formula>Today()</formula>
        <name>YBN date stamp for why</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_percent_to_close_update</fullName>
        <field>Percent__c</field>
        <formula>1.00</formula>
        <name>YBN percent to close update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_update_contract_status_for_month_to</fullName>
        <field>Contract_Status__c</field>
        <literalValue>Contract Signed</literalValue>
        <name>YBN update contract status for month to</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_update_estimated_launch_date</fullName>
        <field>Estimated_Launch_Date__c</field>
        <formula>CloseDate + 60</formula>
        <name>YBN update estimated launch date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_update_organic_locations</fullName>
        <field>Organic__c</field>
        <formula>1</formula>
        <name>YBN - update organic locations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_update_start_date_for_renewals</fullName>
        <field>Milestone_Last_Updated__c</field>
        <formula>Today()</formula>
        <name>YBN update start date for renewals</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>YBN_update_status_to_launch</fullName>
        <field>StageName</field>
        <literalValue>Opportunity Closed</literalValue>
        <name>YBN update status to launch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>amount</fullName>
        <field>Amount</field>
        <formula>Total_Amount__c</formula>
        <name>Opportunity Amount to Total Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>contract_status</fullName>
        <field>Contract_Status__c</field>
        <literalValue>Contract Signed</literalValue>
        <name>contract status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>do_not_call_account_type</fullName>
        <field>Type</field>
        <literalValue>DO NOT CALL</literalValue>
        <name>do not call = account type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>do_not_call_description</fullName>
        <field>Description</field>
        <formula>"DO NOT CALL"</formula>
        <name>do not call = description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>in_person_demo_complete_today</fullName>
        <field>In_person_Demo_Completed_Date__c</field>
        <formula>today()</formula>
        <name>in person demo complete=today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>inbound_opp_true</fullName>
        <field>Inbound_Opp__c</field>
        <formula>"yes"</formula>
        <name>inbound opp = true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>media_management_fee</fullName>
        <field>Media_Management_Fee_of_Locations__c</field>
        <formula>1</formula>
        <name>media management fee number of locations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>national_amount_updated</fullName>
        <field>Amount</field>
        <formula>Corporate_Recurring_Total__c +
 Corporate_Setup_Fees__c +
 Corporate_Website_Fees__c +
 PV_Total_Amount__c</formula>
        <name>Opportunity Amount to Corp Recurring Tot</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>national_record_type_natl_opp</fullName>
        <field>National_Account__c</field>
        <literalValue>YES</literalValue>
        <name>Opportunity National Account to YES</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>newopp</fullName>
        <field>ownership_change_date__c</field>
        <formula>today()</formula>
        <name>Opportunity Owner Change Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>oppownerchange</fullName>
        <field>ownership_change_date__c</field>
        <formula>IF(ISCHANGED(OwnerId) ,TODAY(), ownership_change_date__c)</formula>
        <name>Opportunity Ownership Change Date to Tod</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>review_management_contractlength</fullName>
        <field>Review_Management_Contract_Length__c</field>
        <formula>National_Contract_Length_months__c</formula>
        <name>review management contract length</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>review_management_locations</fullName>
        <field>Review_Management_of_Locations__c</field>
        <formula>1</formula>
        <name>review management locations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>sdr_true</fullName>
        <field>SDR_Opp__c</field>
        <formula>SDR_Opp2__c</formula>
        <name>Opportunity SDR to Opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>setup_fee_locations</fullName>
        <field>Setup_of_Locations__c</field>
        <formula>1</formula>
        <name>setup fee locations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>splitistrue</fullName>
        <field>Split__c</field>
        <literalValue>1</literalValue>
        <name>split is true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>type_national</fullName>
        <field>Type</field>
        <literalValue>National</literalValue>
        <name>Opportunity Type to National</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_current_onboarding_checkbox</fullName>
        <field>Currently_Onboarding__c</field>
        <literalValue>0</literalValue>
        <name>update current onboarding checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_opp_detail_for_corp_opps</fullName>
        <description>Update the opportunity detail for corporate opportunities to ensure sub type picklist options show</description>
        <field>Opportunity_Detail__c</field>
        <literalValue>YBN Corporate Opportunity</literalValue>
        <name>update opp detail for corp opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>upselltype</fullName>
        <field>Type</field>
        <literalValue>Upsell</literalValue>
        <name>Opportunity Type to Upsell</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_centermark_contract_length_update</fullName>
        <field>Centermark_Contract_Length__c</field>
        <formula>National_Contract_Length_months__c</formula>
        <name>ybn centermark contract length update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_date_stampe_mutually_agreed_upon_nex</fullName>
        <field>Next_Step_Last_Updated_Date__c</field>
        <formula>Today()</formula>
        <name>ybn date stampe mutually agreed upon nex</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_display_contract_lenght_update</fullName>
        <field>Display_Contract_Length__c</field>
        <formula>National_Contract_Length_months__c</formula>
        <name>ybn display contract lenght update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_m10</fullName>
        <field>M010__c</field>
        <formula>Today()</formula>
        <name>ybn m10</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_m11</fullName>
        <field>M011__c</field>
        <formula>Today()</formula>
        <name>ybn m11</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_m14</fullName>
        <field>M014__c</field>
        <formula>Today()</formula>
        <name>ybn m14</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_m3</fullName>
        <field>M003__c</field>
        <formula>Today()</formula>
        <name>ybn m3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_m8</fullName>
        <field>M008__c</field>
        <formula>Today()</formula>
        <name>ybn m8</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_update_centermark_locations</fullName>
        <field>Centermark_of_Locations__c</field>
        <formula>1</formula>
        <name>ybn update centermark locations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_update_contract_status</fullName>
        <field>Contract_Status__c</field>
        <literalValue>Contract Signed</literalValue>
        <name>ybn update contract status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_update_organic_contract_length</fullName>
        <field>Organic_Contract_Length__c</field>
        <formula>National_Contract_Length_months__c</formula>
        <name>ybn update organic contract length</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_update_ppc_contract_length</fullName>
        <field>PPC_Contract_Length__c</field>
        <formula>National_Contract_Length_months__c</formula>
        <name>ybn update ppc contract length</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_update_sponosred_launch_date</fullName>
        <field>Sponsored_Launch_Date__c</field>
        <formula>PPA_Executed_Date__c</formula>
        <name>ybn update sponsored launch date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_update_start_date_for_organic_renewa</fullName>
        <field>Organic_Launch_Date__c</field>
        <formula>PPA_Executed_Date__c</formula>
        <name>ybn update start date for organic renewa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_update_yodle_web_fee_locations</fullName>
        <field>Yodle_Web_Setup_of_Locations__c</field>
        <formula>1</formula>
        <name>ybn update yodle web fee locations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_update_yodle_web_launch_date</fullName>
        <field>Yodle_Web_Launch_Date__c</field>
        <formula>PPA_Executed_Date__c</formula>
        <name>ybn update yodle web launch date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ybn_yodle_web_contract_length_update</fullName>
        <field>Yodle_Web_Contract_Length__c</field>
        <formula>National_Contract_Length_months__c</formula>
        <name>ybn yodle web contract length update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Notes_Update_Step1_Approved</fullName>
        <description>Update the Notes for Step 1 Approval</description>
        <field>Approval_Notes__c</field>
        <formula>Approval_Notes__c &amp; "* " &amp; TEXT(TODAY()) &amp; " Owner Approves moving forward to the Closed Lost"</formula>
        <name>WBN APRVL: Notes Update Step1-Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Notes_Update_Step1_Rejected</fullName>
        <description>Update the Notes for Step 1 Rejected</description>
        <field>Approval_Notes__c</field>
        <formula>Approval_Notes__c &amp; "* " &amp; TEXT(TODAY()) &amp; " Owner Rejected - Oppty Saved"</formula>
        <name>WBN APRVL: Notes Update Step1-Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Notes_Update_Step2_Approved</fullName>
        <description>Update the Notes for Step 2 Approval</description>
        <field>Approval_Notes__c</field>
        <formula>Approval_Notes__c &amp; " * " &amp; TEXT(TODAY()) &amp; " Manager Approves "</formula>
        <name>WBN APRVL: Notes Update Step2-Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Notes_Update_Step2_Rejected</fullName>
        <description>Update the Notes for Step 2 Rejected</description>
        <field>Approval_Notes__c</field>
        <formula>Approval_Notes__c &amp; " * " &amp; TEXT(TODAY()) &amp; " Manager Rejected"</formula>
        <name>WBN APRVL: Notes Update Step2-Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Notes_Update_Step3_Approved</fullName>
        <description>Update the Notes for Step 3 Approval</description>
        <field>Approval_Notes__c</field>
        <formula>Approval_Notes__c &amp; "* " &amp; TEXT(TODAY()) &amp; " Sales Manager Approves "</formula>
        <name>WBN APRVL: Notes Update Step3-Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Notes_Update_Step3_Rejected</fullName>
        <description>Update the Notes for Step 3 Rejection</description>
        <field>Approval_Notes__c</field>
        <formula>Approval_Notes__c &amp; "* " &amp; TEXT(TODAY()) &amp; " Sales Manager Rejected "</formula>
        <name>WBN APRVL: Notes Update Step3-Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Saved</fullName>
        <description>WBN Opportunity Approval process Status = Closed - Oppty Saved</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>Closed - Oppty Saved</literalValue>
        <name>WBN APRVL: Status Update - Saved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Step0_InProgrss</fullName>
        <description>WBN Opportunity Approval Process Status = In Progress</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>WBN APRVL: Status Update Step0 InProgrss</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Step1_Approve</fullName>
        <description>Sales Reps or IMS Rep has approved that this moves forward to be Closed Lost</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>Owner Approved</literalValue>
        <name>WBN APRVL: Status Update Step1 - Approve</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Step1_Reject</fullName>
        <description>Step 1 - Owner - Rejected</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>Owner Rejected</literalValue>
        <name>WBN APRVL: Status Update Step1 - Reject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Step2_Approve</fullName>
        <description>WBN Opportunity Approval Process Status = Manager Approved</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>Manager Approved</literalValue>
        <name>WBN APRVL: Status Update Step2 - Approve</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Step2_Reject</fullName>
        <description>WBN Opportunity Approval process Status = Manager Rejected</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>Manager Rejected</literalValue>
        <name>WBN APRVL: Status Update Step2 -Reject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Step3_Approve</fullName>
        <description>WBN Opportunity Approval Process Status = Sales Manager Approved</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>Sales Manager Approved</literalValue>
        <name>WBN APRVL: Status Update Step3 - Approve</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Step3_Reject</fullName>
        <description>WBN Opportunity Approval Process Status = Manager Rejected</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>Sales Manager Rejected</literalValue>
        <name>WBN APRVL: Status Update Step3 - Reject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Step4_Approve</fullName>
        <description>Final Approval Step - This means the Opportunity should be marked as Closed Lost</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>Final Approval</literalValue>
        <name>WBN APRVL: Status Update Step4 - Approve</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WBN_APRVL_Status_Update_Step4_Reject</fullName>
        <description>Final Rejection - Opportunity was SAVED! Product NCS case should be put back into Progress</description>
        <field>Approval_Opp_List_Review_Status__c</field>
        <literalValue>Final Rejection</literalValue>
        <name>WBN APRVL: Status Update Step4 - Reject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Add Client Phone Number to Opportunity</fullName>
        <actions>
            <name>Opportunity_Update_Client_Phone_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Client_Phone_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign LH Opportunity Upon Creation Demo Status</fullName>
        <actions>
            <name>Owner_to_Beau</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lighthouse - Upsell Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Demo</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CPP Probability %25 update Stage - Long-term Nurture</fullName>
        <actions>
            <name>CPP_Update_Probability_to_5</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Initial Transaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Long Term Nurture</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CPP Probability %25 update Stage - Negotiate</fullName>
        <actions>
            <name>CPP_Update_Probability_to_80</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Initial Transaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Negotiate</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CPP Probability %25 update Stage - New Opportunity</fullName>
        <actions>
            <name>CPP_Update_Probability_to_10</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Initial Transaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>New Opportunity</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CPP Probability %25 update Stage - Qualify</fullName>
        <actions>
            <name>CPP_Update_Probability_to_30</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Initial Transaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Qualify</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CPP Probability %25 update Stage - Validate</fullName>
        <actions>
            <name>CPP_Update_Probability_to_50</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner - Initial Transaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Validate</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Complete SEOPPC Ranking Scrape</fullName>
        <actions>
            <name>Completed_SEOPPC_Ranking_Scrape</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Ranking_Scrape_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contract Expiration</fullName>
        <actions>
            <name>Contract_Expiration</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Minimum_Contract_Length__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Email from Account to Opportunity</fullName>
        <actions>
            <name>Email_from_Account_to_Opportunity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Contact_Email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Inbound opp</fullName>
        <actions>
            <name>inbound_opp_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Inbound_Lead__c</field>
            <operation>equals</operation>
            <value>no</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>contains</operation>
            <value>mail,phone,warm,ask,Paid Search,Organic Search</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>notContain</operation>
            <value>list,Referral,Trade Show,cold</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LH Upsell Probability %25 update Stage - Demo</fullName>
        <actions>
            <name>LH_Opportunity_Stage_changed_to_Demo</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Probibility_to_15</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(    RecordType.Name = "Lighthouse - Upsell Opportunity", ISCHANGED(StageName), ISPICKVAL(StageName,"Demo")   )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LH Upsell Probability %25 update Stage - In Discussion</fullName>
        <actions>
            <name>CPP_Update_Probability_to_5</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>TORCHx - Cross-Sell Opporunity,Lighthouse - Upsell Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>In Discussion</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LH Upsell Probability %25 update Stage - Negotiate</fullName>
        <actions>
            <name>Update_Probibility_to_25</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>,Lighthouse - Upsell Opportunity,TORCHx - Cross-Sell Opporunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Negotiate</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Local - Add Next bill date to Opportunity</fullName>
        <actions>
            <name>Update_Next_Bill_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost,Submit for Approval</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Local - Upsell Opportunity</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Local - Completed By Rep</fullName>
        <actions>
            <name>Local_Completed_By_Manager</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Local_Completed_By_Rep</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Local_Completed_By_Role</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Local - Upsell Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost,Submit for Approval</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>National account - total</fullName>
        <actions>
            <name>national_amount_updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>National</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Initial Transaction Opp Launched</fullName>
        <actions>
            <name>New_Initial_Transaction_Opp_Launched</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Opportunity_Launched__c</field>
            <operation>equals</operation>
            <value>Launched</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Initial Transaction Signed - Staff Consultants</fullName>
        <actions>
            <name>email_alert_for_new_initial_transactions_signed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify SE of Upsell Followup</fullName>
        <actions>
            <name>Notify_SE_of_Upsell_Followup</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Individual Location</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SE_Follow_Up_Needed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Owner to Beau when LH Opp is Demo</fullName>
        <actions>
            <name>Owner_to_Beau</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( RecordTypeId = "01232000000JOTR", ISPICKVAL(StageName,"Demo"),  ISPICKVAL(PRIORVALUE(StageName), "In Discussion")  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SDR %3D true</fullName>
        <actions>
            <name>sdr_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Lead_Gen_Rep__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Status Change %3D Today</fullName>
        <actions>
            <name>Status_Change_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( StageName )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>URL %3D website</fullName>
        <actions>
            <name>URL_website</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.What_is_the_URL__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Website</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Updated Opp Detail for All Corp Opps</fullName>
        <actions>
            <name>update_opp_detail_for_corp_opps</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity,YBN - Renewal</value>
        </criteriaItems>
        <description>This rule is used to ensure that picklist options show for corporate opportunities for sub type since we are not using the "opportunity detail" field for corporate opportunities and it is the controlling field for sub type</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>WBN IL Commission NCSE Split</fullName>
        <actions>
            <name>Commission_NCSE_Split</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Individual Location</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.HasOpportunityLineItem</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Updates a currency field so it can be used in oppty splits. Changed to everytime edited</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN  Estimated Launch Date Required</fullName>
        <actions>
            <name>ybn_estimated_launch_dates_needed</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 13 AND ((2 AND 3) OR (4 AND 5) OR (6 AND 7) OR (8 AND (9 OR 10)) OR (11 AND 12) OR (14 AND 15))</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Implementation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Products__c</field>
            <operation>includes</operation>
            <value>Corporate Funded PPC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PPC_Estimated_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Products__c</field>
            <operation>includes</operation>
            <value>Website Template</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Website_Template_Estimated_Launch_date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Products__c</field>
            <operation>includes</operation>
            <value>Custom Implementation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Custom_Implementation_Estimated_Launch__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Products__c</field>
            <operation>includes</operation>
            <value>Centermark</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Centermark_Estimated_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Portal_Estimated_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Products__c</field>
            <operation>includes</operation>
            <value>Display</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Display_Estimated_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Products__c</field>
            <operation>includes</operation>
            <value>Corp Paid Reviews</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Reviews_Estimated_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>DELETE - Moved to fulfillment object.  alert when deal closes that there are no estimated launch dates</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN - Assign Performance Implementation Strategist</fullName>
        <actions>
            <name>YBN_Opp_in_Exec_Review_Call_Stage_Assign_PImS</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Demo/Value Prop</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity,YBN - Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Completed_Presentation_Task__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Performance_Implementation_Strategist__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN - Assign Solutions Architect</fullName>
        <actions>
            <name>YBN_Email_Alert_to_Assign_SA</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Solution_Achitect_Requested</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Solutions_Architect__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity,YBN - Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Solution</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.No_SA_Needed__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.On_Hold_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Rule alerting the SA manager that an opportunity has been created and they need to assign a Solutions Architect</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN - Assign Strategic Project Manager %28SPM%29</fullName>
        <actions>
            <name>YBN_Opp_in_Exec_Review_Call_Stage_Assign_CSM</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and (3 or (4 and 5))</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Contract</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YBN_Sub_Type__c</field>
            <operation>notEqual</operation>
            <value>Location Expansion,Additional Funds</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YBN_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Location Expansion</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Participating_Number_of_Locations__c</field>
            <operation>greaterThan</operation>
            <value>50</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN - Contract Closed Won - Assign SPM</fullName>
        <actions>
            <name>YBN_Opp_in_Exec_Review_Call_Stage_Assign_CSM</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and (3 or 4)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YBN_Sub_Type__c</field>
            <operation>notEqual</operation>
            <value>Location Expansion,Additional Funds</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YBN_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Location Expansion</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN - Launch Dates Updated</fullName>
        <actions>
            <name>YBN_Website_Launched_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND (3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Products__c</field>
            <operation>includes</operation>
            <value>Centermark</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Website_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Organic_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN - Populate SE Follow Up Date</fullName>
        <actions>
            <name>SE_Follow_Up_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.SE_Follow_Up_Needed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SE_Follow_Up_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN - Stage Lost</fullName>
        <actions>
            <name>Close_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Populate_Stage_Lost_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Capture the last stage before an opportunity is closed lost.</description>
        <formula>AND(
  ISPICKVAL(StageName, "Closed Lost"),
  NOT(ISPICKVAL(PRIORVALUE(StageName), "Closed Lost"))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN - participating locations is always 1</fullName>
        <actions>
            <name>YBN_update_organic_locations</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>media_management_fee</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>review_management_locations</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ybn_centermark_contract_length_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ybn_display_contract_lenght_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ybn_update_centermark_locations</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ybn_update_organic_contract_length</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ybn_update_ppc_contract_length</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ybn_update_yodle_web_fee_locations</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ybn_yodle_web_contract_length_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Individual Location</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN - participating locations is always 1 - part two</fullName>
        <actions>
            <name>review_management_contractlength</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>setup_fee_locations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Individual Location</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN -Renwal %26 Individual LocationContract Signed Field Update</fullName>
        <actions>
            <name>Contract_Signed_Field_Update_IL_Renwa</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Contract_Status__c</field>
            <operation>equals</operation>
            <value>Contract Signed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Renewal,YBN - Individual Location</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Alert SA Manager when Opp is created</fullName>
        <actions>
            <name>YBN_Email_Alert_to_Assign_SA</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Solutions_Architect__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction</value>
        </criteriaItems>
        <description>Rule alerting the SA manager that an opportunity has been created and they need to assign a Solutions Architect</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>YBN Close Date in the Past</fullName>
        <actions>
            <name>YBN_close_date_is_in_the_past</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>lessThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Opportunity Closed,Closed Won,Closed Lost,Implementation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity,YBN - Renewal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Commissionable Revenue Amount</fullName>
        <actions>
            <name>YBN_Commissionable_Revenue_Amount_Calc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Used to bypass compile limit for commissions.  Remove when Products are implemented for SE's.</description>
        <formula>AND(
  OR(
    RecordType.Name = 'YBN - Growth Opportunity',
    RecordType.Name = 'YBN - Individual Location',
    RecordType.Name = 'YBN - Initial Transaction',
    RecordType.Name = 'YBN - Renewal'
  ),
  OR(
    ISNEW(),
    ISCHANGED(Setup_Fee_CR__c),
    ISCHANGED(Facebook_Setup_Fee__c),
    ISCHANGED(Monthly_Management_Fees__c),
    ISCHANGED(Yodle_Web_Multiplier__c),
    ISCHANGED(Monthly_Advertising_Charges__c),
    ISCHANGED(corp_Media_Management_Fee__c),
    ISCHANGED(PPC_Multiplier__c),
    ISCHANGED(Organic_fees__c),
    ISCHANGED(Organic_Multiplier__c),
    ISCHANGED(Review_Management_Fee_Per_Location__c),
    ISCHANGED(Review_Management_Multiplier__c),
    ISCHANGED(Monthly_Display_Fees__c),
    ISCHANGED(Display_Multiplier__c),
    ISCHANGED(Facebook_Fee_Per_Location__c),
    ISCHANGED(Leads_by_Web_G1__c),
    ISCHANGED(SDR_Multiplier__c),
    ISCHANGED(Tradeshow_Multiplier__c),
    ISCHANGED(Promo_Multiplier__c), 
    ISCHANGED(Apex_Updated__c)
  )
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN Contract Lost</fullName>
        <actions>
            <name>YBN_Contract_Lost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YBN_Sub_Type__c</field>
            <operation>equals</operation>
            <value>,Location Expansion,Proof of Value,Exclusive Preferred Partner Agreement,Full Rollout,Project Campaign,Low Influence- Preferred Partner Agreement,Premier Preferred Partner Agreement,Seasonal Fixed Length Campaign,Product Expansion,Initial Rollout</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Contract Signed-Assign AD</fullName>
        <actions>
            <name>YBN_Contract_Signed_Assign_AD</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Corporate Contract Signed - Closed Won</fullName>
        <actions>
            <name>YBN_Contract_Signed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>contract_status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity,YBN - Renewal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN IL Boom Email</fullName>
        <actions>
            <name>YBN_IL_Boom_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Individual Location</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN IL Opp Closed for YBN Customers Local Side Business</fullName>
        <actions>
            <name>YBN_IL_Opp_Closed_Won_for_YBN_Customer_Side_Business</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Individual Location</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YBN_Customer_s_Local_Side_Business__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M1</fullName>
        <actions>
            <name>YBN_M1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Modified_Milestone__c</field>
            <operation>equals</operation>
            <value>M001</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.M1__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M1 Date</fullName>
        <actions>
            <name>YBN_M1_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.M1_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M1 - Discovery</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M10</fullName>
        <actions>
            <name>ybn_m10</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Modified_Milestone__c</field>
            <operation>equals</operation>
            <value>M010</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.M010__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M100</fullName>
        <actions>
            <name>YBN_M100S</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Modified_Milestone__c</field>
            <operation>equals</operation>
            <value>M100</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.M100__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M11</fullName>
        <actions>
            <name>ybn_m11</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Modified_Milestone__c</field>
            <operation>equals</operation>
            <value>M011</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.M011__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M14</fullName>
        <actions>
            <name>ybn_m14</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Modified_Milestone__c</field>
            <operation>equals</operation>
            <value>M014</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.M014__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M2 Date</fullName>
        <actions>
            <name>YBN_M2_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.M2_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M2 - Demo &amp; Value Presentation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M3</fullName>
        <actions>
            <name>ybn_m3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Modified_Milestone__c</field>
            <operation>equals</operation>
            <value>M003</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.M003__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M3 Date</fullName>
        <actions>
            <name>YBN_M3_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.M3_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M3 - Executive Review Call</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M4 Date</fullName>
        <actions>
            <name>YBN_M4_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.M4_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M4 - Solutions Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M5 Date</fullName>
        <actions>
            <name>YBN_M5_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.M5_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M5 - Proposal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M6</fullName>
        <actions>
            <name>M6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Modified_Milestone__c</field>
            <operation>equals</operation>
            <value>M006</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.M006__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M6 Date</fullName>
        <actions>
            <name>YBN_M6_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.M6_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M6 - Contract</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN M8</fullName>
        <actions>
            <name>ybn_m8</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Modified_Milestone__c</field>
            <operation>equals</operation>
            <value>M008</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.M008__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Opp in Contract Phase-Assign Force Field SD</fullName>
        <actions>
            <name>YBN_Opp_in_Contract_Phase_Assign_Force_Field_SD</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M5 - Proposal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Force_Field_Sales_Director__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Opp in Exec Review Call Stage- Assign CSM</fullName>
        <actions>
            <name>YBN_Opp_in_Exec_Review_Call_Stage_Assign_CSM</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and (3 or (4 and 5))</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YBN_Sub_Type__c</field>
            <operation>notEqual</operation>
            <value>Location Expansion,Additional Funds</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YBN_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Location Expansion</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Participating_Number_of_Locations__c</field>
            <operation>greaterThan</operation>
            <value>50</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Opp in Exec Review Call Stage- Assign PImS</fullName>
        <actions>
            <name>YBN_Opp_in_Exec_Review_Call_Stage_Assign_PImS</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M3 - Executive Review Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN SA Assignment Alert</fullName>
        <actions>
            <name>YBN_SA_Assignment_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Populate_Sales_Director_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Solutions_Architect__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN SPM Begins Filling Out Run Book</fullName>
        <actions>
            <name>YBN_SPM_Begins_Filling_Out_Run_Book</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Populate_FF_Sales_Director_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Populate_Sales_Director_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Strategic_Project_Manager__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN Units Calculation</fullName>
        <actions>
            <name>YBN_Units_Calculation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND (3 or 4)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Individual Location</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YBN_Sub_Type__c</field>
            <operation>notEqual</operation>
            <value>Corporate Paid Contract</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Milestone__c</field>
            <operation>equals</operation>
            <value>M100 - Deal closes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Opportunity Closed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN date stamp for close plan</fullName>
        <actions>
            <name>YBN_date_stamp_close_plan</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ischanged(   Close_Plan__c   )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN date stamp for mutually agreed upon next steps</fullName>
        <actions>
            <name>ybn_date_stampe_mutually_agreed_upon_nex</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ischanged(   Mutually_Agreed_Upon_Next_Steps__c  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN date stamp for why would they do biz with us</fullName>
        <actions>
            <name>YBN_date_stamp_for_why_do_biz_with_us</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ischanged(  Top_3_reasons_for_doing_business_with_us__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN date stamp for why would they not do biz with us</fullName>
        <actions>
            <name>YBN_date_stamp_for_why</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ischanged(   Top_3_reasons_for_not_working_with_us__c  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN email notification for portal launch</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Portal_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN percent to close update</fullName>
        <actions>
            <name>YBN_percent_to_close_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Modified_Milestone__c</field>
            <operation>equals</operation>
            <value>m100</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN update contract status</fullName>
        <actions>
            <name>ybn_update_contract_status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Implementation,Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Contract_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN update contract status for month to month opps</fullName>
        <actions>
            <name>YBN_update_contract_status_for_month_to</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Corp Month to Month</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN update estimated launch date</fullName>
        <actions>
            <name>YBN_update_estimated_launch_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Transaction,Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Estimated_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN update milestone last change date</fullName>
        <actions>
            <name>YBN_update_start_date_for_renewals</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ischanged( Milestone__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN update opp status when launched</fullName>
        <actions>
            <name>YBN_update_status_to_launch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Milestone__c</field>
            <operation>equals</operation>
            <value>M107 - Launch</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN update start date for renewal organic%2Fcm</fullName>
        <actions>
            <name>ybn_update_start_date_for_organic_renewa</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 3 AND 4 AND ( 2 or 5)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Organic_Contract_Length__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Contract_Status__c</field>
            <operation>equals</operation>
            <value>Contract Signed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PPA_Executed_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Centermark_Contract_Length__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN update start date for renewal sponsored</fullName>
        <actions>
            <name>ybn_update_sponosred_launch_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PPC_Contract_Length__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Contract_Status__c</field>
            <operation>equals</operation>
            <value>Contract Signed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PPA_Executed_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN update start date for renewal yodle web</fullName>
        <actions>
            <name>ybn_update_yodle_web_launch_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Yodle_Web_Contract_Length__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Contract_Status__c</field>
            <operation>equals</operation>
            <value>Contract Signed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PPA_Executed_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Estimated Launch Dates Changed</fullName>
        <actions>
            <name>YBN_Relationship_Launch_Date_Changed</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>DELETE - Migrated over to Fulfillment object</description>
        <formula>And((OR(RecordTypeId="012600000009YRE",RecordTypeId="012600000009YRJ")),
OR(
((AND(ISCHANGED(Website_Template_Estimated_Launch_date__c),NOT(ISNULL(PRIORVALUE(Website_Template_Estimated_Launch_date__c)))))),
(AND(ISCHANGED(Centermark_Estimated_Launch_Date__c), NOT(ISNULL(PRIORVALUE(Centermark_Estimated_Launch_Date__c))))),
(AND(ISCHANGED(Custom_Implementation_Estimated_Launch__c), NOT(ISNULL(PRIORVALUE(Custom_Implementation_Estimated_Launch__c))))),
(AND(ISCHANGED(Portal_Estimated_Launch_Date__c), NOT(ISNULL(PRIORVALUE(Portal_Estimated_Launch_Date__c))))),
(AND(ISCHANGED(PPC_Estimated_Launch_Date__c), NOT(ISNULL(PRIORVALUE(PPC_Estimated_Launch_Date__c))))),
(AND(ISCHANGED(Reviews_Estimated_Launch_Date__c),NOT(ISNULL(PRIORVALUE(Reviews_Estimated_Launch_Date__c))))),
(AND(ISCHANGED(Display_Estimated_Launch_Date__c), NOT(ISNULL(PRIORVALUE(Display_Estimated_Launch_Date__c)))))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Perf Team Run Book %26 Weekly Meeting</fullName>
        <actions>
            <name>YBN_Perf_Team_Run_Book_Weekly_Meeting</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M4 - Solutions Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Phased Launch Estimated Dates Changed</fullName>
        <actions>
            <name>YBN_Phased_Launch_Date_Changed</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>And((OR(RecordTypeId="012600000009YRE",RecordTypeId="012600000009YRJ")), OR((AND(ISCHANGED(Phase_1_Estimated_Launch_Date__c), NOT(ISNULL(PRIORVALUE(Phase_1_Estimated_Launch_Date__c))))),(AND(ISCHANGED(Phase_2_Estimated_Launch_Date__c),NOT(ISNULL(PRIORVALUE(Phase_2_Estimated_Launch_Date__c))))),(AND(ISCHANGED(Phase_3_Estimated_Launch_Date__c),NOT(ISNULL(PRIORVALUE(Phase_3_Estimated_Launch_Date__c)))))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage Date - Client Discovery</fullName>
        <actions>
            <name>Client_Discovery_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Stage_Change_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Client Discovery</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Client_Discovery_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Populates date field on stage change</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage Date - Contract</fullName>
        <actions>
            <name>Contract_Stage_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Stage_Change_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Contract</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Contract_Stage_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Populates date field on stage change</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage Date - Demo%2FValue</fullName>
        <actions>
            <name>Demo_Value_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Stage_Change_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Demo/Value Prop</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Demo_Value_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Populates date field on stage change</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage Date - Solution</fullName>
        <actions>
            <name>Last_Stage_Change_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Solution_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Solution</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Solution_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Populates date field on stage change</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage To Milestone M014</fullName>
        <actions>
            <name>YBN_Stage_To_Milestone_M014</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M014 - Deliver Contract</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to CLOSED WON</fullName>
        <actions>
            <name>Closed_Won_Opportunity</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity,YBN - Renewal,YBN - Individual Location</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to CLOSED WON %28Corporate Only%29</fullName>
        <actions>
            <name>YBN_Assign_Relationship_Director_RD</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN - Initial Transaction,YBN - Growth Opportunity,YBN - Renewal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Client Discovery</fullName>
        <actions>
            <name>Milestone_Client_Discovery</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Client Discovery</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Milestone__c</field>
            <operation>notEqual</operation>
            <value>Client Discovery</value>
        </criteriaItems>
        <description>Updates Milestone on stage change to Client Discovery</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Contract</fullName>
        <actions>
            <name>Milestone_Contract</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Contract</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Milestone__c</field>
            <operation>notEqual</operation>
            <value>Contract</value>
        </criteriaItems>
        <description>Updates Milestone on stage change to Solution</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Demo%2FValue Prop</fullName>
        <actions>
            <name>Milestone_Demo_Value_Prop</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Demo/Value Prop</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Milestone__c</field>
            <operation>notEqual</operation>
            <value>Demo/Value Prop</value>
        </criteriaItems>
        <description>Updates Milestone on stage change to Demo/Value Prop</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone  M002 IL</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M002_IL</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M002 - Complete local demo (IL)</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone CLOSED LOST</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_CLOSED_LOST</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M001 IL</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M001_IL</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M001 - Set Local Demo</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M003 IL</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M003_IL</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M003 - Contract (IL)</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M005</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M005</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M005 - Audit download</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M006</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M006</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M006 - Implementation &amp; ROI Investigatio</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M007</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M007</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M007 - Product Assessment &amp; Implementati</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M008</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M008</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M008 -  Solutions in Action Presentation</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M009</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M009</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M009 - Proposal Creation &amp; Update SOW</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M011</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M011</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M011 - Moving to Close</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M013</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M013</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M013 - Contract Creation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M1</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M1 - Discovery</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M2</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M2 - Demo &amp; Value Presentation</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M3</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M3 - Executive Review Call</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M4</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M4</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M4 - Solutions Review</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M5</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M5</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M5 - Proposal</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Milestone M6</fullName>
        <actions>
            <name>YBN_Stage_to_Milestone_M6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>M6 - Contract</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Stage to Solution</fullName>
        <actions>
            <name>Milestone_Solution</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Solution</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Milestone__c</field>
            <operation>notEqual</operation>
            <value>Solution</value>
        </criteriaItems>
        <description>Updates Milestone on stage change to Solution</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Uncheck currently onboarding when opp is launched</fullName>
        <actions>
            <name>update_current_onboarding_checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Opportunity_Launched__c</field>
            <operation>equals</operation>
            <value>Launched</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update Centermark Original Est Launch Date</fullName>
        <actions>
            <name>YBN_Update_CM_Original_Est_Launch_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Centermark_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Centermark_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update Custom Imp Original Est Launch Date</fullName>
        <actions>
            <name>YBN_Update_Custom_Imp_Original_Est_Laun</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Custom_Implementation_Estimated_Launch__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Custom_Imp_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update Display Original Est Launch Date</fullName>
        <actions>
            <name>YBN_Update_Display_Original_Est_Launch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Display_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Display_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update PPC Original Est Launch Date</fullName>
        <actions>
            <name>YBN_Update_PPC_Original_Est_Launch_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.PPC_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PPC_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update Phase 1 Original Est Launch Date</fullName>
        <actions>
            <name>Update_Phase_1_Original_Est_Launch_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Phase_1_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Phase_1_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update Phase 2 Original Est Launch Date</fullName>
        <actions>
            <name>Update_Phase_2_Original_Est_Launch_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Phase_2_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Phase_2_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update Phase 3 Original Est Launch Date</fullName>
        <actions>
            <name>Update_Phase_3_Original_Est_Launch_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Phase_3_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Phase_3_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update Portal Original Est Launch Date</fullName>
        <actions>
            <name>YBN_Update_Portal_Original_Est_Launch_D</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Portal_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Portal_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update Reviews Original Est Launch Date</fullName>
        <actions>
            <name>YBN_Update_Reviews_Original_Est_Launch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Reviews_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Reviews_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YBN%3A Update Website Template Original Est Launch Date</fullName>
        <actions>
            <name>YBN_Update_Website_Orig_Est_Launch_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Website_Template_Estimated_Launch_date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Website_Template_Original_Est_Launch__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>created%2C so Status Change %3D Today</fullName>
        <actions>
            <name>Status_Change_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISNULL( Last_Status_Change__c )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>house splits</fullName>
        <actions>
            <name>splitistrue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Split_with_the_House__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Split__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>in person demo complete%3Dtoday</fullName>
        <actions>
            <name>in_person_demo_complete_today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.In_person_Demo_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>new national opp %3D national</fullName>
        <actions>
            <name>national_record_type_natl_opp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>type_national</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>National</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>new opp</fullName>
        <actions>
            <name>newopp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>opp owner</fullName>
        <actions>
            <name>oppownerchange</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.OwnerId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>opportunity total</fullName>
        <actions>
            <name>amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>notEqual</operation>
            <value>National</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>phone demo complete%3Dtoday</fullName>
        <actions>
            <name>Phone_Demo_Completed_today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Phone_Demo_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>total for channel partners</fullName>
        <actions>
            <name>Totalupdated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>puts  $60 as the total for all channel partner opps - to get around other validation rule</description>
        <formula>AND(
CreatedBy.ProfileId ="00e60000000ibuQ",
 RecordTypeId &lt;&gt; "012600000009NDy"
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>upsell type</fullName>
        <actions>
            <name>upselltype</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>startsWith</operation>
            <value>upsell</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Closed_Won_Opportunity</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Closed Won Opportunity</subject>
    </tasks>
    <tasks>
        <fullName>Solution_Achitect_Requested</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Solution Achitect Requested</subject>
    </tasks>
    <tasks>
        <fullName>WBN_Never_Launched_Opportunity_Lost</fullName>
        <assignedTo>emily.garza@web.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please update the Opportunity to reflect it as a Partial or Complete Closed Lost Opportunity.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>WBN - Never Launched - Opportunity Lost</subject>
    </tasks>
</Workflow>
