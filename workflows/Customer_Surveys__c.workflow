<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>LH_Issue_Resolution_All_5_Response_to_Client</fullName>
        <description>LH Issue Resolution All 5 Response to Client</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email_from_Account__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercare@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Lighthouse_Medical_IB_OB/Survey_Response_All_5</template>
    </alerts>
    <alerts>
        <fullName>LH_NPS_Survey_Product_Feedback</fullName>
        <ccEmails>lhproductfeedback@yodle.com</ccEmails>
        <description>LH NPS Survey - Product Feedback</description>
        <protected>false</protected>
        <senderAddress>support@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/LH_Survey_Product_Feedback</template>
    </alerts>
    <alerts>
        <fullName>Lighthouse_Exit_Survey_Poor_Customer_Service</fullName>
        <description>Lighthouse Exit Survey - Poor Customer Service</description>
        <protected>false</protected>
        <recipients>
            <recipient>crystal.bellew@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Survey_Emails/Lighthouse_Poor_Customer_Service_Alert</template>
    </alerts>
    <alerts>
        <fullName>Local_NPS_Survey_Product_Feedback</fullName>
        <ccEmails>productideas@yodle.com</ccEmails>
        <description>Local NPS Survey Product Feedback</description>
        <protected>false</protected>
        <senderAddress>csops@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support/Local_NPS_Survey_Product_Feedback</template>
    </alerts>
    <alerts>
        <fullName>National_Customer_Survey_Notification</fullName>
        <description>National Customer Survey Notification</description>
        <protected>false</protected>
        <recipients>
            <field>IMSRep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Notice_to_National_IMS_for_Survey_Completions</template>
    </alerts>
    <alerts>
        <fullName>Rogers_Escalated_Survey</fullName>
        <description>Rogers Escalated Survey</description>
        <protected>false</protected>
        <recipients>
            <recipient>alovill@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ckellogg@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>slavin@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Email_Templates/Rogers_Escalated_Pooled_Survey</template>
    </alerts>
    <alerts>
        <fullName>Survey_Notify_Case_Owner_Of_Fair_Satisfaction</fullName>
        <description>Survey - Notify Case Owner Of Fair Satisfaction</description>
        <protected>false</protected>
        <recipients>
            <field>CaseOwnerEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Survey_Emails/YBN_Notifiy_Of_Fair_Issue_Resolution</template>
    </alerts>
    <alerts>
        <fullName>Survey_Notify_Case_Owner_Of_Poor_Satisfaction</fullName>
        <description>Survey - Notify Case Owner Of Poor Satisfaction</description>
        <protected>false</protected>
        <recipients>
            <field>CaseOwnerEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Survey_Emails/YBN_Notifiy_Of_Poor_Issue_Resolution</template>
    </alerts>
    <alerts>
        <fullName>Surveys_Requested_Contact_Updated</fullName>
        <description>Surveys - Requested Contact Updated</description>
        <protected>false</protected>
        <recipients>
            <field>IMSRep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/Contact_Requested_Surveys</template>
    </alerts>
    <alerts>
        <fullName>Survey_Alert_Exceptions</fullName>
        <description>Survey Alert - Exceptions</description>
        <protected>false</protected>
        <recipients>
            <recipient>WBN_CSC_Managers</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Email_Alert_for_WBN_NPS_Surveys_Exceptions</template>
    </alerts>
    <alerts>
        <fullName>Survey_Alert_to_Manager_of_YBN_CSD</fullName>
        <description>Survey Alert to Manager of YBN CSD</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_of_YBN_CSD__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Email_Alert_for_WBN_NPS_Surveys</template>
    </alerts>
    <alerts>
        <fullName>Survey_Alert_to_YBN_CSD</fullName>
        <description>Survey Alert to YBN CSD</description>
        <protected>false</protected>
        <recipients>
            <field>YBN_CSD_email_alert__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Email_Alert_for_WBN_NPS_Surveys</template>
    </alerts>
    <alerts>
        <fullName>Survey_Alert_to_YBN_Consultant</fullName>
        <description>Survey Alert to YBN Consultant</description>
        <protected>false</protected>
        <recipients>
            <field>YBN_Consultant_email_alert__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/Email_Alert_for_WBN_NPS_Surveys</template>
    </alerts>
    <fieldUpdates>
        <fullName>BCF_Status</fullName>
        <description>When record is created, BCF status field is updated to "New"</description>
        <field>BCF_Status__c</field>
        <literalValue>New</literalValue>
        <name>BCF Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Created_By</fullName>
        <field>Case_Created_By__c</field>
        <formula>Case__r.CreatedBy.FirstName&amp; " "&amp; Case__r.CreatedBy.LastName</formula>
        <name>Survey Case Created By to F&amp;L Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Customer_Survey_Account_Product_Type</fullName>
        <field>Account_Product_Type__c</field>
        <formula>Account__r.Product_Type_Transactional__c</formula>
        <name>Customer Survey Account Product Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Days_Since_Live_at_Creation_Date</fullName>
        <field>Days_Live_at_Creation_Date__c</field>
        <formula>Account__r.Days_Since_Live__c</formula>
        <name>Days Since Live at Creation Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fill_Out_Email_from_Account</fullName>
        <description>Used specifically for LH Issue Resolution Email Alert</description>
        <field>Client_Email_from_Account__c</field>
        <formula>Account__r.Client_E_mail__c</formula>
        <name>Fill Out Email from Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Account_Director_Email</fullName>
        <field>Account_Director_Email__c</field>
        <formula>IF(ISBLANK(Account__r.ParentId), Account__r.Account_Director__r.Email, Account__r.Parent.Account_Director__r.Email)</formula>
        <name>Populate Account Director Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Case_Owner_Email</fullName>
        <field>CaseOwnerEmail__c</field>
        <formula>Case__r.Owner:User.Email</formula>
        <name>Populate Case Owner Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requested_Contact_checkbox</fullName>
        <field>Requested_Contact__c</field>
        <literalValue>1</literalValue>
        <name>Requested Contact checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Survey_Status_Closed_Complete</fullName>
        <field>Status__c</field>
        <literalValue>Closed Completed</literalValue>
        <name>Survey Status = Closed Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Transactional_25_55_Day_Call</fullName>
        <field>Outbound_Case_Completed_By__c</field>
        <formula>Case__r.Completed_Call_By__c</formula>
        <name>Customer Survey Outbound Case by User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner_to_LHSuppport_Austin</fullName>
        <field>OwnerId</field>
        <lookupValue>LH_Support_Austin</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Owner to LH Support - Austin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CSC Business Customization Form</fullName>
        <actions>
            <name>BCF_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>CSC Business Customization Form</value>
        </criteriaItems>
        <description>Status defaults to "new" when record is created</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case Created By</fullName>
        <actions>
            <name>Case_Created_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Surveys__c.Customer_Survey_Name__c</field>
            <operation>contains</operation>
            <value>Issue Resolution</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer Survey Account Product Type</fullName>
        <actions>
            <name>Customer_Survey_Account_Product_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Surveys__c.Account_Product_Type__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Days Since Live at Creation Date</fullName>
        <actions>
            <name>Days_Since_Live_at_Creation_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Fill Out Client Email From Account on Survey</fullName>
        <actions>
            <name>Fill_Out_Email_from_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Issue Resolution</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LH Issue Res All 5%27s</fullName>
        <actions>
            <name>LH_Issue_Resolution_All_5_Response_to_Client</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Survey_Status_Closed_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Owner_to_LHSuppport_Austin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11</booleanFilter>
        <criteriaItems>
            <field>Customer_Surveys__c.Issue_Survey_Wait_time_for_resolution__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Value__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.How_likely_are_you_to_continue_w_Yodle__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Issue_Survey_CS_request_resolved__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Satisfaction_with_how_we_handle_problems__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.CSC_CS_Helpfulness__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Requested_Contact__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Anything_to_share_about_your_experience__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Issue_Survey_What_can_we_do_to_improve__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Issue Resolution</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Customer_Survey_Name__c</field>
            <operation>equals</operation>
            <value>Lighthouse Customer Support Survey</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LH Issue Res All 5%27s with comments</fullName>
        <actions>
            <name>LH_Issue_Resolution_All_5_Response_to_Client</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Owner_to_LHSuppport_Austin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 10 AND 11 AND (8 OR 9)</booleanFilter>
        <criteriaItems>
            <field>Customer_Surveys__c.Issue_Survey_Wait_time_for_resolution__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Value__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.How_likely_are_you_to_continue_w_Yodle__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Issue_Survey_CS_request_resolved__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Satisfaction_with_how_we_handle_problems__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.CSC_CS_Helpfulness__c</field>
            <operation>notEqual</operation>
            <value>4,3,2,1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Requested_Contact__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Anything_to_share_about_your_experience__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Issue_Survey_What_can_we_do_to_improve__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Issue Resolution</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Customer_Survey_Name__c</field>
            <operation>equals</operation>
            <value>Lighthouse Customer Support Survey</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LH NPS Product Feedback</fullName>
        <actions>
            <name>LH_NPS_Survey_Product_Feedback</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>NPS Survey Lighthouse</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Survey_Code__c</field>
            <operation>includes</operation>
            <value>Product - Automated Calling,Product - Automated Messages,Product - Custom Messages,Product - Newsletters,Product - Patient Groups,Product - Postcards,Product - Recall Notices,Product - Task Lists,Product - Text,Product - Citation Network Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Survey_Code__c</field>
            <operation>includes</operation>
            <value>Product - Dashboard Login Issues,Product - Dashboard Technical Issues,Product - Email Marketing,Product - Follow Up/Feature Coming Soon,Product - Lists,Product - Offers,Product - Photos,Product - Positive Feedback,Product - Reviews,Product - Social</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lighthouse Exit Survey Poor Customer Service</fullName>
        <actions>
            <name>Lighthouse_Exit_Survey_Poor_Customer_Service</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Surveys__c.Customer_Survey_Name__c</field>
            <operation>contains</operation>
            <value>Lighthouse Exit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Main_reason_for_leaving_Lighthouse__c</field>
            <operation>contains</operation>
            <value>poor customer service</value>
        </criteriaItems>
        <description>Email sent to Crystal Bellew when an Exit Survey is returned with "Poor Customer Service" selected as reason for cancellation.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Local NPS Product Feedback</fullName>
        <active>false</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Issue Resolution,Survey Pooled CSC,NPS Survey Yodle</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Survey_Code__c</field>
            <operation>includes</operation>
            <value>Product - Automated Calling,Product - Automated Messages,Product - Custom Messages,Product - Newsletters,Product - Patient Groups,Product - Postcards,Product - Recall Notices,Product - Task Lists,Product - Text,Product - Citation Network Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Survey_Code__c</field>
            <operation>includes</operation>
            <value>Product - Dashboard Login Issues,Product - Dashboard Technical Issues,Product - Email Marketing,Product - Follow Up/Feature Coming Soon,Product - Lists,Product - Offers,Product - Photos,Product - Positive Feedback,Product - Reviews,Product - Social</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Local Survey Product Feedback</fullName>
        <actions>
            <name>Local_NPS_Survey_Product_Feedback</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>((1 AND (2 OR 3)) OR (4 AND 5 AND (2 OR 3)))</booleanFilter>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>NPS Survey Yodle,CSC Survey,Survey Pooled CSC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Survey_Code__c</field>
            <operation>includes</operation>
            <value>Product - Contact Manager,Product - Dashboard Login Issues,Product - Dashboard Technical Issues,Product - Email Marketing,Product - Follow Up/Feature Coming Soon,Product - Leads,Product - Lists,Product - Offers,Product - Other,Product - Photos</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Survey_Code__c</field>
            <operation>includes</operation>
            <value>Product - Positive Feedback,Product - Reviews,Product - Segment Specific Concerns,Product - Social</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Issue Resolution</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Communication_Notes__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notice to National IMS for Survey Completions</fullName>
        <actions>
            <name>National_Customer_Survey_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Customer_Surveys__c.IMS_Rep_Role__c</field>
            <operation>contains</operation>
            <value>National</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>OutRank CSC Survey</value>
        </criteriaItems>
        <description>Notice to National IMS for Survey Completions</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Requested Contact checkbox</fullName>
        <actions>
            <name>Requested_Contact_checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Customer_Surveys__c.Survey_Code__c</field>
            <operation>includes</operation>
            <value>CS - Requesting Action from Consultant</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rogers Escalated Pooled Survey</fullName>
        <actions>
            <name>Rogers_Escalated_Survey</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 and 6 and 7</booleanFilter>
        <criteriaItems>
            <field>Customer_Surveys__c.Overall_OutRank_Satisfaction__c</field>
            <operation>equals</operation>
            <value>0,1,2,3,4,5,6</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.CSC_CS_Professionalism__c</field>
            <operation>equals</operation>
            <value>0,1,2,3,4,5,6</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.CS_Timeliness__c</field>
            <operation>equals</operation>
            <value>0,1,2,3,4,5,6</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Customer_Survey_Name__c</field>
            <operation>contains</operation>
            <value>Outrank</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.IMSRep__c</field>
            <operation>contains</operation>
            <value>Outrank Customer Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.CSC_CS_Knowledge__c</field>
            <operation>equals</operation>
            <value>0,1,2,3,4,5,6</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.CSC_CS_Helpfulness__c</field>
            <operation>equals</operation>
            <value>0,1,2,3,4,5,6</value>
        </criteriaItems>
        <description>sends email when pooled account comes in escalated</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Survey - YBN Notify Of Fair Result</fullName>
        <actions>
            <name>Survey_Notify_Case_Owner_Of_Fair_Satisfaction</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Populate_Case_Owner_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Issue Resolution Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Issue_Survey_CS_Satisfaction__c</field>
            <operation>equals</operation>
            <value>7,8</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Survey - YBN Notify Of Poor Result</fullName>
        <actions>
            <name>Survey_Notify_Case_Owner_Of_Poor_Satisfaction</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Populate_Account_Director_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Surveys__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>YBN Issue Resolution Survey</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customer_Surveys__c.Issue_Survey_CS_Satisfaction__c</field>
            <operation>lessOrEqual</operation>
            <value>6</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Survey Pooled Support</fullName>
        <actions>
            <name>Transactional_25_55_Day_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customer_Surveys__c.Customer_Survey_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Surveys - Contact Requested Update</fullName>
        <actions>
            <name>Surveys_Requested_Contact_Updated</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Customer_Surveys__c.Requested_Contact__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
