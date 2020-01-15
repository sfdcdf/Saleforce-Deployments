<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>LH_Opportunity_Stage_changed_to_Demo</fullName>
        <description>LH Opportunity Stage changed to Demo</description>
        <protected>false</protected>
        <recipients>
            <recipient>kevin.lewis@lighthousepmg.com.ib</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_LH_Opportunity_in_Demo_Stage</template>
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
        <fullName>Email_from_Account_to_Opportunity</fullName>
        <field>Contact_Email__c</field>
        <formula>Account.Email__c</formula>
        <name>Email from Account to Opportunity</name>
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
        <lookupValue>ann.lewis@lighthousepmg.com.ib</lookupValue>
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
        <fullName>Status_Change_Today</fullName>
        <field>Last_Status_Change__c</field>
        <formula>TODAY()</formula>
        <name>Opportunity Last Status Change to Today</name>
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
        <fullName>in_person_demo_complete_today</fullName>
        <field>In_person_Demo_Completed_Date__c</field>
        <formula>today()</formula>
        <name>in person demo complete=today</name>
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
        <fullName>sdr_true</fullName>
        <field>SDR_Opp__c</field>
        <formula>SDR_Opp2__c</formula>
        <name>Opportunity SDR to Opp</name>
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
        <description>LH Specific</description>
        <triggerType>onCreateOnly</triggerType>
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
        <description>LH Specific</description>
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
        <description>LH Specific</description>
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
        <description>LH Specific</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Owner to Beau when LH Opp is Demo</fullName>
        <actions>
            <name>Owner_to_Beau</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>LH Specific</description>
        <formula>AND( RecordType.DeveloperName = "Lighthouse_Upsell_Opportunity", ISPICKVAL(StageName,"Demo"),  ISPICKVAL(PRIORVALUE(StageName), "In Discussion")  )</formula>
        <triggerType>onAllChanges</triggerType>
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
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
