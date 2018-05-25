<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Contract_Approved_to_Sales_Owner_RM</fullName>
        <description>Contract Approved to Sales, Owner, RM</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Contract_or_Proposal_Approved</template>
    </alerts><alerts>
        <fullName>Contract_Signed_to_Sales_Rep_Strategic_RM</fullName>
        <ccEmails>nationalcsmanagers@yodle.com</ccEmails>
        <description>Contract Signed to Sales Rep, Strategic, RM</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Relationship_Owner_2__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/New_Contract_Signed_Initiation</template>
    </alerts><alerts>
        <fullName>Contract_or_Proposal_Approved_Sales_Alert</fullName>
        <description>Contract or Proposal Approved - Sales Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Manager_or_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Contract_or_Proposal_Approved</template>
    </alerts><alerts>
        <fullName>Existing_Relationships_Approval_to_Committee</fullName>
        <description>Existing Relationships Approval to Sales</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Manager_or_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Contract_or_Proposal_Approved</template>
    </alerts><alerts>
        <fullName>Existing_Relationships_Email_to_Committee_for_Creation</fullName>
        <ccEmails>contractreview@yodle.com</ccEmails>
        <description>Existing Relationships Email to Committee for Creation</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Manager_or_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Existing_Relationships_Submit_for_Review</template>
    </alerts><alerts>
        <fullName>Existing_Relationships_Revised_Submit_for_Review_to_Committee</fullName>
        <ccEmails>contractreview@yodle.com</ccEmails>
        <description>Existing Relationships Revised Submit for Review to Committee</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Manager_or_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Existing_Relationships_Revised_Submit_for_Review</template>
    </alerts><alerts>
        <fullName>Initiation_Form_New</fullName>
        <description>Initiation Form New</description>
        <protected>false</protected>
        <recipients>
            <recipient>jpyle@yodle.com</recipient>
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
            <recipient>pdelk@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tgahagan@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/New_Tier_4_Form</template>
    </alerts><alerts>
        <fullName>Initiation_Form_Organic_Analysis_Needed</fullName>
        <description>Initiation Form - Organic Analysis Needed</description>
        <protected>false</protected>
        <recipients>
            <recipient>sfdc@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_Client_Side_Organic_Analysis_Needed</template>
    </alerts><alerts>
        <fullName>Initiation_Form_Ranking_Scrape_Completed_to_STR_Owner</fullName>
        <description>Initiation Form - Ranking Scrape Completed to STR Owner</description>
        <protected>false</protected>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_Ranking_Scrape_Completed_to_STR_Owner</template>
    </alerts><alerts>
        <fullName>Initiation_Form_Stage_3_Revised_Proposal_Review</fullName>
        <ccEmails>proposalreview@yodle.com</ccEmails>
        <description>Initiation Form Stage 3 Revised Proposal Review</description>
        <protected>false</protected>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_Stage_3_Revised_Proposal_Review</template>
    </alerts><alerts>
        <fullName>Initiation_Form_Stage_5_Revised_Contract_Submitted</fullName>
        <ccEmails>contractreview@yodle.com</ccEmails>
        <description>Initiation Form Stage 5 Revised Contract Submitted</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Owner_2__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Revised_Contract_Approval</template>
    </alerts><alerts>
        <fullName>Initiation_Form_Sub_Status_to_Proposal_Creation</fullName>
        <description>Initiation Form Sub Status to Proposal Creation</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_Sub_Status_to_Proposal_Creation</template>
    </alerts><alerts>
        <fullName>Initiation_Form_Updates_to_Sales</fullName>
        <description>Initiation Form Updates to Sales</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_Update_Notice_to_Sales</template>
    </alerts><alerts>
        <fullName>New_Initiation_Form_Created_Email_to_Stratejacks</fullName>
        <description>New Initiation Form Created Email to Stratejacks</description>
        <protected>false</protected>
        <recipients>
            <recipient>awilder@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>cgriffith@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jnormoyle@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kturk@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mmachado@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/New_Initiation_Form_Created</template>
    </alerts><alerts>
        <fullName>New_Initiation_Form_Lead_Analyst_Staffing_Needed</fullName>
        <description>New Initation Form Lead Analyst Staffing Needed</description>
        <protected>false</protected>
        <recipients>
            <recipient>kelly.hall@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sarah.mctate@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_Lead_Analyst_Staffing_Needed</template>
    </alerts><alerts>
        <fullName>New_initiation_form_rm_lead_assigned</fullName>
        <description>New Initiation Form RM/Lead Assigned</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Manager_or_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_RM_Lead_Assigned</template>
    </alerts><alerts>
        <fullName>New_initiation_form_strategic_owner_assigned</fullName>
        <description>New initiation form strategic owner assigned</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_Strategic_Owner_Assigned</template>
    </alerts><alerts>
        <fullName>Performance_Estimates_Tier_1_2_Notice_to_Strategic_Owner</fullName>
        <description>Performance Estimates Tier 1 &amp; 2 Notice to Strategic Owner</description>
        <protected>false</protected>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Sub_Status_to_Performance_Estimates</template>
    </alerts><alerts>
        <fullName>Performance_or_Budget_Estimate_Needed</fullName>
        <description>Performance or Budget Estimate Needed</description>
        <protected>false</protected>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Performance_or_Budget_Estimate_Needed</template>
    </alerts><alerts>
        <fullName>Product_Out_of_Box_Email_Alert_to_Managers</fullName>
        <ccEmails>EIoffe@yodle.com</ccEmails>
        <description>Product Out of Box Email Alert to Managers</description>
        <protected>false</protected>
        <recipients>
            <recipient>mmachado@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pszalkowski@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sjones@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Product_Approval_on_Out_of_Box_Assignment</template>
    </alerts><alerts>
        <fullName>Required_Changes_for_Proposal_Completed</fullName>
        <description>Required Changes for Proposal Completed</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Summary_of_Required_Changes_Complete</template>
    </alerts><alerts>
        <fullName>Sent_back_to_sales_rep_when_sub_status_changes</fullName>
        <description>Sent back to sales rep when sub status changes</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/SubStatus_Update_Sent_Back_To_Sales</template>
    </alerts><alerts>
        <fullName>Stage_2_to_Strategic_Owner_Notice</fullName>
        <description>Stage 2 to Strategic Owner Notice</description>
        <protected>false</protected>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_Stage_2_to_Strategic</template>
    </alerts><alerts>
        <fullName>Stage_3B_proposal_review_Notification</fullName>
        <ccEmails>proposalreview@yodle.com</ccEmails>
        <description>Initiation Form Stage 3 Submit Proposal for Review</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Manager_or_Lead__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Initiation_Form_Stage_B_Proposal_Review</template>
    </alerts><alerts>
        <fullName>Stage_4_Email_to_Strategic_Owner</fullName>
        <description>Stage 4 Email to Strategic Owner</description>
        <protected>false</protected>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Stage_4_Email_to_Stratejacks</template>
    </alerts><alerts>
        <fullName>Stage_4_Recommend_CRM_Integration</fullName>
        <description>Stage 4 Recommend CRM Integration</description>
        <protected>false</protected>
        <recipients>
            <recipient>Ron_Email_Alert</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Stage_4_Recommend_CRM_Integration</template>
    </alerts><alerts>
        <fullName>Stage_5_Contract_Review_Notification</fullName>
        <ccEmails>contractreview@yodle.com</ccEmails>
        <description>Stage 5 Contract Review Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Relationship_Owner_2__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Strategic_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Stage_5_Contract_Review</template>
    </alerts><alerts>
        <fullName>Sub_Status_Update_Proposal_Approved</fullName>
        <description>Sub Status Update: Proposal Approved</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Status_Update_Proposal_Approved</template>
    </alerts><fieldUpdates>
        <fullName>Additional_Policies_or_Terms</fullName>
        <field>Additional_Policies_or_Terms_C__c</field>
        <formula>Additional_Policies_or_Terms__c</formula>
        <name>NSR - Additional Policies or Terms</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Approval_by_CS_to_Blank</fullName>
        <field>Approval_by_CS__c</field>
        <name>NSR - Approval by CS to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Approval_by_Finance_to_Blank</fullName>
        <field>Approval_by_Finance__c</field>
        <name>NSR - Approval by Finance to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Approval_by_Legal_to_Blank</fullName>
        <field>Approval_by_Legal__c</field>
        <name>NSR - Approval by Legal to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Approval_by_Product_to_Blank</fullName>
        <field>Approval_by_Product__c</field>
        <name>NSR - Approval by Product to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Approval_by_Sales_to_Blank</fullName>
        <field>Approval_by_Sales__c</field>
        <name>NSR - Approval by Sales to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Assigns_Strategery</fullName>
        <description>Stage 1 - needs assessment
Stage 2 Demo</description>
        <field>OwnerId</field>
        <lookupValue>Stratejacks</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>NSR - Owner to Stratejacks</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Contract_Approved_Sub_Status</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Contract Approved</literalValue>
        <name>Contract Approved Sub Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Removal_Stage_3B_Revised_Prop_2</fullName>
        <field>Proposal_Approved_CS__c</field>
        <name>Date Removal -Stage 3B - Revised Prop 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Removal_Stage_3B_Revised_Prop_3</fullName>
        <field>Proposal_Approved_Finance__c</field>
        <name>Date Removal -Stage 3B - Revised Prop 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Removal_Stage_3B_Revised_Prop_4</fullName>
        <field>Proposal_Approved_Product__c</field>
        <name>Date Removal -Stage 3B - Revised Prop 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Removal_Stage_3B_Revised_Prop_5</fullName>
        <field>Proposal_Approved_Sales__c</field>
        <name>Date Removal -Stage 3B - Revised Prop 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Removal_Stage_3B_Revised_Proposa</fullName>
        <description>Removes Proposal Dates</description>
        <field>Proposal_Approved_by_Sales__c</field>
        <name>Date Removal -Stage 3 - Revised Proposa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Estimated_Number_of_Locations</fullName>
        <field>New_Participating_Number_of_Locations__c</field>
        <formula>Estimated_Number_locations__c</formula>
        <name>Estimated Number of Locations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Expected_Time_of_Decision_Making</fullName>
        <field>Estimated_Time_of_Decision_Making_C__c</field>
        <formula>Expected_time_of_decision_making__c</formula>
        <name>Expected Time of Decision Making</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initiation_Form_Stage_5_to_Re</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Revised Contract Review</literalValue>
        <name>Initiation Form Stage 5 Revised Contract</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initiation_Form_Sub_Status_to_Mktg_Analy</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Marketing Analysis</literalValue>
        <name>Initiation Form Sub Status to Mktg Analy</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initiation_Form_Sub_Status_to_Needs_Staf</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Needs Staffing Assigned</literalValue>
        <name>Initiation Form Sub Status to Needs Staf</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initiation_Form_sub_status_to_Ranking_Sc</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Ranking Scrape</literalValue>
        <name>Initiation Form sub status to Ranking Sc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Initiation_Form_sub_status_to_pending_ne</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Pending Needs Assessment</literalValue>
        <name>Initiation Form sub status to pending ne</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Margin_Recommendation_Status_Update</fullName>
        <description>Updates Status to Stage 5 - Contract Review</description>
        <field>Status__c</field>
        <literalValue>Stage 5 – Contract Review</literalValue>
        <name>Margin Recommendation Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>National_Sub_Status_to_Recommend_Strateg</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Recommend Strategy</literalValue>
        <name>National Sub Status to Recommend Strateg</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>National_sub_status_to_Demo_Creation</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Demo Creation</literalValue>
        <name>National sub status to Demo Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>New_Initiation_form_defaults_to_stage_1</fullName>
        <field>Status__c</field>
        <literalValue>Stage 1 - Needs Assessment</literalValue>
        <name>New Initiation form defaults to stage 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Organic_Fee_per_Location_C</fullName>
        <field>Organic_Fee_per_Location_C__c</field>
        <formula>Proposed_Pricing_Organic_fee_location__c</formula>
        <name>Organic Fee per Location C</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Owner_to_National_Performance_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>NationalCharlotte</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Owner to National Performance Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Owner_to_National_Sales_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>National_Sales</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Owner to National Sales Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Project_Tier_Populate</fullName>
        <field>Projected_Tier__c</field>
        <formula>if( Total_Number_of_Locations__c &gt;= 400, "Tier 1", if(Total_Number_of_Locations__c &gt;=80, "Tier 2", if(Total_Number_of_Locations__c &gt;=40, "Tier 3", "Tier 4")))</formula>
        <name>Project Tier Populate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Setup_Fee_per_Location</fullName>
        <field>Setup_Fee_per_Location_P__c</field>
        <formula>Proposed_Pricing_Setup_Fee_per_Location__c</formula>
        <name>Setup Fee per Location</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Stage_3_Proposal_Creation_Queue_Assign</fullName>
        <field>OwnerId</field>
        <lookupValue>NationalCharlotte</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Stage 3 - Proposal Creation Queue Assign</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Stage_5_Contract_Review_Date_1_Removal</fullName>
        <field>Contract_Approved_by_CS__c</field>
        <name>Stage 5 Contract Review Date 1 Removal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Stage_5_Contract_Review_Date_2_Removal</fullName>
        <field>Contract_Approved_by_Finance__c</field>
        <name>Stage 5 Contract Review Date 2 Removal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Stage_5_Contract_Review_Date_3_Removal</fullName>
        <field>Contract_Approved_by_Legal__c</field>
        <name>Stage 5 Contract Review Date 3 Removal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Stage_5_Contract_Review_Date_4_Removal</fullName>
        <field>Contract_Approved_by_Product__c</field>
        <name>Stage 5 Contract Review Date 4 Removal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Stage_5_Contract_Review_Date_5_Removal</fullName>
        <field>Contract_Approved_by_Sales__c</field>
        <name>Stage 5 Contract Review Date 5 Removal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Stage_5_Contract_Review_Date_6_Removal</fullName>
        <field>Contract_Approved_Sales__c</field>
        <name>Stage 5 Contract Review Date 6 Removal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Strategery_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>Stratejacks</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>National Support Owner to Stratejacks</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Strategic_Client_Side_to_True</fullName>
        <field>Client_Side__c</field>
        <literalValue>1</literalValue>
        <name>Strategic Client Side: to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Strategic_Custom_Template_to_True</fullName>
        <field>Custom_Template__c</field>
        <literalValue>1</literalValue>
        <name>Strategic Custom Template: to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Strategic_Display_to_True</fullName>
        <field>Display1__c</field>
        <literalValue>1</literalValue>
        <name>Strategic Display: to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Strategic_Organic_to_True</fullName>
        <field>Organic__c</field>
        <literalValue>1</literalValue>
        <name>Strategic Organic: to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Strategic_Sponsored_to_True</fullName>
        <field>Products_Listed_in_the_Contract__c</field>
        <literalValue>1</literalValue>
        <name>Strategic Sponsored: to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_Submit_Contract_to_Contract_R</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Contract Review</literalValue>
        <name>Sub Status Submit Contract to Contract R</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_Update_Proposal_Approved</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Proposal Approved</literalValue>
        <name>Sub Status Update: Proposal Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_to_Proposal_Approved</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Proposal Approved</literalValue>
        <name>Sub Status to Proposal Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_to_Proposal_Creation</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Proposal Creation</literalValue>
        <name>Sub Status to Proposal Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_to_Proposal_Estimates</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Proposal Estimates</literalValue>
        <name>Sub Status to Proposal Estimates</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_to_Proposal_Review</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Proposal Review</literalValue>
        <name>Sub Status to Proposal Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_to_Revised_Proposal_Review</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Revised Proposal Review</literalValue>
        <name>Sub Status to Revised Proposal Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_to_Submit_Contract_for_Review</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Submit Contract for Review</literalValue>
        <name>Sub Status to Submit Contract for Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Sub_Status_to_Submit_Proposal_Review</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Submit Proposal for Review</literalValue>
        <name>Sub Status to Submit Proposal Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Yodle_Web_Fee_per_Location_C</fullName>
        <field>MMF_per_Location_C__c</field>
        <formula>Proposed_Pricing_MMF_per_Location__c</formula>
        <name>Yodle Web Fee per Location C</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>CS Support Filled In Move to Proposal Creation</fullName>
        <actions>
            <name>Initiation_Form_Sub_Status_to_Proposal_Creation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Owner_to_National_Sales_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sub_Status_to_Proposal_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Client_Services_recommended_support__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Performance Estimates</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Contract Approved</fullName>
        <actions>
            <name>Contract_Approved_to_Sales_Owner_RM</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Contract_Approved_Sub_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.Contract_Approved_by_CS__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Contract_Approved_by_Finance__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Contract_Approved_by_Sales__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Contract_Approved_by_Product__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Contract Approved Existing Relationships</fullName>
        <actions>
            <name>Existing_Relationships_Approval_to_Committee</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Contract_Approved_Sub_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_CS__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Finance__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Legal__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Product__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Sales__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Proposal/Contract Review for Existing Relationships &amp; Tier 4</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Review_Request_Type__c</field>
            <operation>equals</operation>
            <value>Contract</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Contract Signed Email Alert</fullName>
        <actions>
            <name>Contract_Signed_to_Sales_Rep_Strategic_RM</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Contract Signed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>DL Stratejecks Assignment</fullName>
        <actions>
            <name>Assigns_Strategery</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>((1 and 3 and 5) or 2) and 4</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 1 - Needs Assessment</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 2 – Mktg Analysis &amp; Demo</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Strategic_Owner__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Total_Number_of_Locations__c</field>
            <operation>greaterOrEqual</operation>
            <value>40</value>
        </criteriaItems>
        <description>Assigns DL-strategery when Stage 1 - needs assessment of stage 2 - demo are selected</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Date Removal -Stage 3 - Revised Proposal Review</fullName>
        <actions>
            <name>Initiation_Form_Stage_3_Revised_Proposal_Review</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Date_Removal_Stage_3B_Revised_Prop_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Date_Removal_Stage_3B_Revised_Prop_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Date_Removal_Stage_3B_Revised_Prop_4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Date_Removal_Stage_3B_Revised_Prop_5</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Date_Removal_Stage_3B_Revised_Proposa</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sub_Status_to_Revised_Proposal_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Revised Proposal Submitted,Revised Proposal Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Email RM when assigned on New Initiation Form</fullName>
        <actions>
            <name>New_initiation_form_rm_lead_assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Relationship_Owner_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Email sales when contract or proposal change needed</fullName>
        <actions>
            <name>Sent_back_to_sales_rep_when_sub_status_changes</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Sent Back to Sales</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Proposal/Contract Review for Existing Relationships &amp; Tier 4</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Closed</value>
        </criteriaItems>
        <description>sub status is sent back to sales</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Existing Relationships Review Contract Default Sub Status</fullName>
        <actions>
            <name>Existing_Relationships_Email_to_Committee_for_Creation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Sub_Status_to_Submit_Contract_for_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Proposal/Contract Review for Existing Relationships,Proposal/Contract Review for Existing Relationships &amp; Tier 4</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Review_Request_Type__c</field>
            <operation>equals</operation>
            <value>Contract</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Existing Relationships Review Proposal Default Sub Status</fullName>
        <actions>
            <name>Existing_Relationships_Email_to_Committee_for_Creation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Sub_Status_to_Submit_Proposal_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Proposal/Contract Review for Existing Relationships &amp; Tier 4</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Review_Request_Type__c</field>
            <operation>equals</operation>
            <value>Proposal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Existing Relationships Revised Form Submitted</fullName>
        <actions>
            <name>Existing_Relationships_Revised_Submit_for_Review_to_Committee</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Approval_by_CS_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Approval_by_Finance_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Approval_by_Legal_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Approval_by_Product_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Approval_by_Sales_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Proposal/Contract Review for Existing Relationships</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Revised Proposal Review,Revised Contract Review,Revised Proposal Submitted,Revised Contract Submitted</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Client Side Organic Analysis Needed</fullName>
        <actions>
            <name>Initiation_Form_Organic_Analysis_Needed</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 3 – Proposal Estimates</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Website__c</field>
            <operation>equals</operation>
            <value>client side – sub domain/sub folder,client side</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Recommended_Products_Organic__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Implement Client Side Checkbox</fullName>
        <actions>
            <name>Strategic_Client_Side_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposed_Product_Client_Side__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Implement Custom Template Checkbox</fullName>
        <actions>
            <name>Strategic_Custom_Template_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposed_Product_Custom_Template__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Implement Display Checkbox</fullName>
        <actions>
            <name>Strategic_Display_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposed_Product_Display__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Implement Organic Checkbox</fullName>
        <actions>
            <name>Strategic_Organic_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposed_Product_Organic__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Implement Sponsored Checkbox</fullName>
        <actions>
            <name>Strategic_Sponsored_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposed_Product_Sponsored__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Number of Locations</fullName>
        <actions>
            <name>Estimated_Number_of_Locations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Estimated_Number_locations__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Organic Fee per Location</fullName>
        <actions>
            <name>Additional_Policies_or_Terms</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Expected_Time_of_Decision_Making</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Organic_Fee_per_Location_C</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Setup_Fee_per_Location</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND (3 or 4 or 5)</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposed_Pricing_Organic_fee_location__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposed_Pricing_Setup_Fee_per_Location__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Additional_Policies_or_Terms__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Ranking Scrape Completed to STR Owner</fullName>
        <actions>
            <name>Initiation_Form_Ranking_Scrape_Completed_to_STR_Owner</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.Ranking_Scrape_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form - Web Fee per Location</fullName>
        <actions>
            <name>Yodle_Web_Fee_per_Location_C</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposed_Pricing_MMF_per_Location__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form Ranking Scrape Complete to Mktg</fullName>
        <actions>
            <name>Initiation_Form_Sub_Status_to_Mktg_Analy</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.Ranking_Scrape_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Ranking Scrape</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form Ranking Submit to Chris Cormier</fullName>
        <active>false</active>
        <criteriaItems>
            <field>National_Support_Request__c.Submit_Request_for_Ranking_Scrape__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form Sub Status to Proposal Estimates</fullName>
        <actions>
            <name>Owner_to_National_Performance_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sub_Status_to_Proposal_Estimates</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 3 – Proposal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form Sub Status to Ranking Scrape</fullName>
        <actions>
            <name>Initiation_Form_sub_status_to_Ranking_Sc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 2 – Mktg Analysis &amp; Demo</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Ranking_Scrape_Completed__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form Update Notice to Sales</fullName>
        <actions>
            <name>Initiation_Form_Updates_to_Sales</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Tier 4 &amp; Bottoms Up Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Relationship_Owner_2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation Form to Proposal Creation</fullName>
        <actions>
            <name>Initiation_Form_Sub_Status_to_Proposal_Creation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Proposal Creation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Initiation form - grades complete move to strategy</fullName>
        <actions>
            <name>National_Sub_Status_to_Recommend_Strateg</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.Website_Grade__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Organic_Ranking_Grade__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sponsored_Grade__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Lead Staffing Analyst Needed</fullName>
        <actions>
            <name>New_Initiation_Form_Lead_Analyst_Staffing_Needed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Contract Signed</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Projected_Tier__c</field>
            <operation>equals</operation>
            <value>Tier 1,Tier 2</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Margin Recommendation Status Update</fullName>
        <actions>
            <name>Margin_Recommendation_Status_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Margin_Adjustment_Needed__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>Automatically updates Status to Stage 5 - Contract review if Margin Adjustment Needed is Yes</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>National On Boarding Owner</fullName>
        <actions>
            <name>Strategery_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Proposal/Contract Review for Existing Relationships</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>New Initiation Form Created</fullName>
        <actions>
            <name>Initiation_Form_Sub_Status_to_Needs_Staf</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>New_Initiation_form_defaults_to_stage_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Project_Tier_Populate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>New Initiation Notification Not Tier 4</fullName>
        <actions>
            <name>New_Initiation_Form_Created_Email_to_Stratejacks</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Assigns_Strategery</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Total_Number_of_Locations__c</field>
            <operation>greaterOrEqual</operation>
            <value>40</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>New Initiation form notice to sales when assigned</fullName>
        <actions>
            <name>New_initiation_form_strategic_owner_assigned</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Initiation_Form_sub_status_to_pending_ne</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Strategic_Owner__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>New Initiation form recommend details complete</fullName>
        <actions>
            <name>National_sub_status_to_Demo_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Recommended_Strategy_Details__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Performance or Budget Estimates</fullName>
        <actions>
            <name>Performance_or_Budget_Estimate_Needed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Budget &amp; Metropage Recommendations,Performance Estimates</value>
        </criteriaItems>
        <description>Case Owner is automatically switched to the "Strategic Owner" when the status of the case is changed to Performance or Budget Estimates</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules><rules>
        <fullName>Product Approval on Out of Box Assignment</fullName>
        <actions>
            <name>Product_Out_of_Box_Email_Alert_to_Managers</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.Are_there_out_of_box_requirements__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Describe_out_of_box_requirements__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Sends notifications to Managers when Product Out of Box fields are filled out</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Proposal Approved Existing Relationships</fullName>
        <actions>
            <name>Existing_Relationships_Approval_to_Committee</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Sub_Status_to_Proposal_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_CS__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Finance__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Legal__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Product__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Sales__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Proposal/Contract Review for Existing Relationships</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Review_Request_Type__c</field>
            <operation>equals</operation>
            <value>Proposal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Proposal Approved Section filled out to Proposal Approved</fullName>
        <actions>
            <name>Sub_Status_to_Proposal_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposal_Approved_by_Sales__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposal_Approved_Product__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposal_Approved_Finance__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Proposal_Approved_CS__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Proposal Approved initiation form</fullName>
        <actions>
            <name>Contract_or_Proposal_Approved_Sales_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Proposal Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Required Changes for Proposal Completed</fullName>
        <actions>
            <name>Required_Changes_for_Proposal_Completed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Required_Changes_for_Proposal__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Review Request Type Proposal Approved</fullName>
        <actions>
            <name>Sub_Status_Update_Proposal_Approved</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Sub_Status_Update_Proposal_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Proposal/Contract Review for Existing Relationships &amp; Tier 4</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_CS__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Finance__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Product__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Approval_by_Sales__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Review_Request_Type__c</field>
            <operation>equals</operation>
            <value>Proposal</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Closed</value>
        </criteriaItems>
        <description>When a user selects "proposal" as the "review request type" the sub status should auto update to "proposal approved" and trigger the email alert to sales when the dates are filled out for sales, CS, finance and product.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stage 2 to Strategic Owner Notice</fullName>
        <actions>
            <name>Stage_2_to_Strategic_Owner_Notice</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 2 – Mktg Analysis &amp; Demo</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stage 3 - Proposal Creation Queue Assignment</fullName>
        <actions>
            <name>Stage_3_Proposal_Creation_Queue_Assign</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 3A – Proposal Creation</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <description>Assigns New Owner when Stage 3 - Proposal Creation is selected</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stage 3 Submit Proposal Review Assignment</fullName>
        <actions>
            <name>Stage_3B_proposal_review_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Proposal Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Submit Proposal for Review</value>
        </criteriaItems>
        <description>Send email notification when status is updated to “stage 3 submit proposal for review” to David McCarthy, John Herman, Isaac Itenberg, Julie Shermak, Amy Elbaum, Peter Szalkowski, John Berkowitz &amp; Brian Heppner.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stage 4 Implementation Plan</fullName>
        <actions>
            <name>Stage_4_Email_to_Strategic_Owner</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Assigns_Strategery</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stage 4 Recommend CRM Integration</fullName>
        <actions>
            <name>Stage_4_Recommend_CRM_Integration</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stage 4 – Implementation Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Recommended_Products_CRM_Integration__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stage 5 Contract Review</fullName>
        <actions>
            <name>Stage_5_Contract_Review_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Contract Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Submit Contract for Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Stage 5 Revised Contract Review</fullName>
        <actions>
            <name>Initiation_Form_Stage_5_Revised_Contract_Submitted</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Initiation_Form_Stage_5_to_Re</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_5_Contract_Review_Date_1_Removal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_5_Contract_Review_Date_2_Removal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_5_Contract_Review_Date_3_Removal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_5_Contract_Review_Date_4_Removal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_5_Contract_Review_Date_5_Removal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_5_Contract_Review_Date_6_Removal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and (2 or 3)</booleanFilter>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Revised Contract Submitted</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Revised Contract Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Sub Status Performance Estimates Tier 1 %26 2</fullName>
        <actions>
            <name>Performance_Estimates_Tier_1_2_Notice_to_Strategic_Owner</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Assigns_Strategery</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Performance Estimates</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Projected_Tier__c</field>
            <operation>equals</operation>
            <value>Tier 1,Tier 2</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Sub Status Performance Estimates Tier 3</fullName>
        <actions>
            <name>Initiation_Form_Sub_Status_to_Proposal_Creation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Sub_Status_to_Proposal_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Performance Estimates</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Projected_Tier__c</field>
            <operation>equals</operation>
            <value>Tier 3</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Sub Status Submit Contract to Contract Review</fullName>
        <actions>
            <name>Sub_Status_Submit_Contract_to_Contract_R</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form,Proposal/Contract Review for Existing Relationships,Proposal/Contract Review for Existing Relationships &amp; Tier 4</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Submit Contract for Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Sub Status Submit Proposal to Proposal Review</fullName>
        <actions>
            <name>Sub_Status_to_Proposal_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New Initiation Form,Proposal/Contract Review for Existing Relationships</value>
        </criteriaItems>
        <criteriaItems>
            <field>National_Support_Request__c.Sub_Status__c</field>
            <operation>equals</operation>
            <value>Submit Proposal for Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Tier 4 %26 Bottom%27s Up Record NEW</fullName>
        <actions>
            <name>Initiation_Form_New</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>National_Support_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Tier 4 &amp; Bottoms Up Initiation Form</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules></Workflow>