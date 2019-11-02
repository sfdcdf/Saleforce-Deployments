<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Lighthouse_Exit_Survey</fullName>
        <description>Lighthouse Exit Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountservices@lighthousepmg.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Survey_Emails/Lighthouse_Exit_Survey</template>
    </alerts>
    <fieldUpdates>
        <fullName>Cancellation_Checkbox</fullName>
        <field>Cancelled__c</field>
        <literalValue>1</literalValue>
        <name>Account - Cancelled to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Hold_Status_Date</fullName>
        <field>Hold_Status_Date__c</field>
        <name>Clear Hold Status Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Commission_December_2011</fullName>
        <field>NE_09_Commission_Month__c</field>
        <formula>date(2011,12,01)</formula>
        <name>Commission - December 2011</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Commission_November_2011</fullName>
        <field>NE_09_Commission_Month__c</field>
        <formula>date(2011,11,01)</formula>
        <name>Commission - November 2011</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Consumable_Price_to_1_79</fullName>
        <field>Consumable_Price__c</field>
        <formula>1.79</formula>
        <name>Consumable Price to $1.79</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Consumables_Price_to_199</fullName>
        <field>Consumable_Price__c</field>
        <formula>1.99</formula>
        <name>Consumables Price to $1.99</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Consumables_Price_to_2_49</fullName>
        <field>Consumable_Price__c</field>
        <formula>2.49</formula>
        <name>Consumables Price to $2.49</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Pitched_to_Today</fullName>
        <field>Date_Pitched__c</field>
        <formula>Today()</formula>
        <name>Date Pitched to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LH_Exit_Survey_Sent</fullName>
        <field>LH_Exit_Survey_Sent__c</field>
        <literalValue>1</literalValue>
        <name>LH Exit Survey Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LH_Exit_Survey_Sent_Date</fullName>
        <field>LH_Exit_Survey_Sent_Date__c</field>
        <formula>today()</formula>
        <name>LH Exit Survey Sent Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketo_Sync_Checkbox_Update_for_Marketo</fullName>
        <field>Sync_to_Marketo__c</field>
        <literalValue>1</literalValue>
        <name>Sync to Marketo On Demand</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pitched_By_User_Fill_In</fullName>
        <field>Pitched_By__c</field>
        <formula>$User.FirstName &amp; " " &amp; $User.LastName</formula>
        <name>Pitched By User Fill In</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Client_Email</fullName>
        <field>Client_E_mail__c</field>
        <formula>Email__c</formula>
        <name>Populate Client Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Touchplan_Email_to_Populate</fullName>
        <field>Email_for_Touchplan__c</field>
        <formula>Email__c</formula>
        <name>Account - Email for Touchplan to Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X180_day_live_rate</fullName>
        <field>Live_on_180th_Day__c</field>
        <literalValue>1</literalValue>
        <name>Account - Live 180th Day to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>berrycontractreceived</fullName>
        <field>Date_Berry_Contract_Received__c</field>
        <formula>IF(ISCHANGED( Berry_Contract_Received__c) ,NOW(),NULL)</formula>
        <name>Account - Date Berry Contract Rec to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>orderdatelivedate</fullName>
        <description>when there is a live date, but no order date</description>
        <field>Order_Date__c</field>
        <formula>Live_Date__c</formula>
        <name>Account - Order Date to Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>substatusstatus</fullName>
        <field>Sub_Status__c</field>
        <formula>CASE(Status__c , "LIVE", "Live", "OFF", "Off","")</formula>
        <name>Account - Sub Status to Live/Off</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>typecustomer</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>Account - Type to Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>LH Upsell Result Detail</fullName>
        <actions>
            <name>Date_Pitched_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pitched_By_User_Fill_In</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>General</description>
        <formula>ISCHANGED ( Upsell_Result__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LHFS SSU Email - Marketo</fullName>
        <actions>
            <name>Marketo_Sync_Checkbox_Update_for_Marketo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.LHFS_Self_Sign_Up__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate Client Email</fullName>
        <actions>
            <name>Populate_Client_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client_E_mail__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>180-day live rate</fullName>
        <actions>
            <name>X180_day_live_rate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Days_Since_Live__c</field>
            <operation>greaterOrEqual</operation>
            <value>180</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>LIVE</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Acct - Hold Status Cleared</fullName>
        <actions>
            <name>Clear_Hold_Status_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Account_Hold_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_Hold_Status__c</field>
            <operation>equals</operation>
            <value>Non-Compete</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Hold_Status_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancellation Checkbox</fullName>
        <actions>
            <name>Cancellation_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>OFF</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Letters Price for Non-US</fullName>
        <actions>
            <name>Consumables_Price_to_2_49</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BillingCountry</field>
            <operation>notEqual</operation>
            <value>US,USA,United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Upsell_Candidate__c</field>
            <operation>equals</operation>
            <value>Letters</value>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Letters Price for US</fullName>
        <actions>
            <name>Consumables_Price_to_199</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BillingCountry</field>
            <operation>equals</operation>
            <value>US,USA,United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Upsell_Candidate__c</field>
            <operation>equals</operation>
            <value>Letters</value>
        </criteriaItems>
        <description>general</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lighthouse Exit Survey</fullName>
        <actions>
            <name>Lighthouse_Exit_Survey</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>LH_Exit_Survey_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LH_Exit_Survey_Sent_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>LH Specific . sent to lighthouse dental/chiro clients when account moves to "off" status</description>
        <formula>AND(   ISPICKVAL(Status__c, "OFF"),  CONTAINS (IMS_Rep__c, "Lighthouse"),  OR( CONTAINS(Secondary_Segments__c , "Dentist"), CONTAINS(Secondary_Segments__c , "Chiro"), CONTAINS(Secondary_Segments__c , "Orthodontist")),    CPP_Account__c = "No",   CONTAINS (Product_Type_Transactional__c, "Lighthouse"),  Days_Live__c &gt; 60  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Postcard Price for Non-US</fullName>
        <actions>
            <name>Consumable_Price_to_1_79</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BillingCountry</field>
            <operation>notEqual</operation>
            <value>US,USA,United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Upsell_Candidate__c</field>
            <operation>equals</operation>
            <value>Postcards</value>
        </criteriaItems>
        <description>LH Specific</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Touchplan Email to Populate</fullName>
        <actions>
            <name>Touchplan_Email_to_Populate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client_Type__c</field>
            <operation>notContain</operation>
            <value>National,YBN</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>YL customer</fullName>
        <actions>
            <name>typecustomer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>General</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>live date without order date</fullName>
        <actions>
            <name>orderdatelivedate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Live_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Order_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>General , for when accounts have a live date, but no order date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>remove %27sales%27 substatus</fullName>
        <actions>
            <name>substatusstatus</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>LIVE,OFF</value>
        </criteriaItems>
        <description>General , when accounts move to Live or off, make the sub status the same as the status</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
