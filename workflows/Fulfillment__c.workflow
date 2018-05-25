<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>FUL_Phased_Launch_Date_Changed</fullName>
        <description>FUL - Phased Launch Date Changed</description>
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
        <template>National_Templates/FUL_Phased_Launch_Date_Changed</template>
    </alerts><alerts>
        <fullName>FUL_YBN_Estimated_Launch_Dates_Needed</fullName>
        <description>FUL - YBN: Estimated Launch Dates Needed</description>
        <protected>false</protected>
        <recipients>
            <recipient>YBN_Customer_Success_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>mbrevig@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>National_Templates/FUL_YBN_Estimated_Launch_Dates_Needed</template>
    </alerts><alerts>
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
        <template>Support/FUL_YBN_Relationship_Launch_Date_Changed</template>
    </alerts><fieldUpdates>
        <fullName>FUL_Update_CM_Original_Est_Launch_Date</fullName>
        <field>Centermark_Original_Est_Launch_Date__c</field>
        <formula>Centermark_Estimated_Launch_Date__c</formula>
        <name>FUL - Update CM Original Est Launch Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>FUL_Update_Custom_Imp_Original_Est_Lau</fullName>
        <field>Custom_Imp_Original_Est_Launch_Date__c</field>
        <formula>Custom_Implementation_Estimated_Launch__c</formula>
        <name>FUL - Update Custom Imp Original Est Lau</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>FUL_Update_Display_Original_Est_Launch</fullName>
        <field>Display_Original_Est_Launch_Date__c</field>
        <formula>Display_Estimated_Launch_Date__c</formula>
        <name>FUL - Update Display Original Est Launch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>FUL_Update_FB_Original_Est_Launch_Date</fullName>
        <field>Facebook_Estimated_Launch_Date__c</field>
        <formula>Facebook_Estimated_Launch_Date__c</formula>
        <name>FUL - Update FB Original Est Launch Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>FUL_Update_PPC_Original_Est_Launch_Dt</fullName>
        <field>PPC_Original_Est_Launch_Date__c</field>
        <formula>PPC_Estimated_Launch_Date__c</formula>
        <name>FUL - Update PPC Original Est Launch Dt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>FUL_Update_Phase_1_Original_Est_Launch</fullName>
        <field>Phase_1_Original_Est_Launch_Date__c</field>
        <formula>Phase_1_Estimated_Launch_Date__c</formula>
        <name>FUL - Update Phase 1 Original Est Launch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>FUL_Update_Phase_2_Original_Est_Launch</fullName>
        <field>Phase_2_Original_Est_Launch_Date__c</field>
        <formula>Phase_2_Estimated_Launch_Date__c</formula>
        <name>FUL - Update Phase 2 Original Est Launch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>FUL_Update_Phase_3_Original_Est_Launch</fullName>
        <field>Phase_3_Original_Est_Launch_Date__c</field>
        <formula>Phase_3_Estimated_Launch_Date__c</formula>
        <name>FUL - Update Phase 3 Original Est Launch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>FUL_Update_Reviews_Original_Est_Launch</fullName>
        <field>Reviews_Original_Est_Launch_Date__c</field>
        <formula>Reviews_Estimated_Launch_Date__c</formula>
        <name>FUL - Update Reviews Original Est Launch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>FUL_Update_Website_Orig_Est_Launch_Da</fullName>
        <field>Website_Template_Original_Est_Launch__c</field>
        <formula>Website_Template_Estimated_Launch_Date__c</formula>
        <name>FUL - Update Website Orig Est Launch Da</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>FUL - Phased Launch Estimated Dates Changed</fullName>
        <actions>
            <name>FUL_Phased_Launch_Date_Changed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>OR(   AND(     ISCHANGED(Phase_1_Estimated_Launch_Date__c),       NOT(ISNULL(PRIORVALUE(Phase_1_Estimated_Launch_Date__c)))   ),        AND(     ISCHANGED(Phase_2_Estimated_Launch_Date__c),     NOT(ISNULL(PRIORVALUE(Phase_2_Estimated_Launch_Date__c)))   ),    AND(     ISCHANGED(Phase_3_Estimated_Launch_Date__c),     NOT(ISNULL(PRIORVALUE(Phase_3_Estimated_Launch_Date__c)))   ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>FUL - Update Centermark Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_CM_Original_Est_Launch_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Centermark_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.Centermark_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - Update Custom Imp Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_Custom_Imp_Original_Est_Lau</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Custom_Implementation_Estimated_Launch__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.Custom_Imp_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - Update Display Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_Display_Original_Est_Launch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Display_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.Display_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - Update Facebook Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_FB_Original_Est_Launch_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Facebook_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.Facebook_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - Update PPC Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_PPC_Original_Est_Launch_Dt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.PPC_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.PPC_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - Update Phase 1 Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_Phase_1_Original_Est_Launch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Phase_1_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.Phase_1_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - Update Phase 2 Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_Phase_2_Original_Est_Launch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Phase_2_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.Phase_2_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - Update Phase 3 Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_Phase_3_Original_Est_Launch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Phase_3_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.Phase_3_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - Update Reviews Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_Reviews_Original_Est_Launch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Reviews_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.Reviews_Original_Est_Launch_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - Update Website Template Original Est Launch Date</fullName>
        <actions>
            <name>FUL_Update_Website_Orig_Est_Launch_Da</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment__c.Website_Template_Estimated_Launch_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Fulfillment__c.Website_Template_Original_Est_Launch__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - YBN Estimated Launch Date Required</fullName>
        <actions>
            <name>FUL_YBN_Estimated_Launch_Dates_Needed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
  ISPICKVAL(Status__c, "Onboarding"),
  OR(
    AND(CONTAINS(Products_Sold__c, "Corporate Funded PPC"), ISBLANK(PPC_Estimated_Launch_Date__c)),
    AND(CONTAINS(Products_Sold__c, "Website Template"), ISBLANK(Website_Template_Estimated_Launch_Date__c)),
    AND(CONTAINS(Products_Sold__c, "Custom Implementation"), ISBLANK(Custom_Imp_Original_Est_Launch_Date__c)),
    AND(CONTAINS(Products_Sold__c, "Centermark"), ISBLANK(Centermark_Estimated_Launch_Date__c)),
    AND(CONTAINS(Products_Sold__c, "Display"), ISBLANK(Display_Estimated_Launch_Date__c)),
    AND(CONTAINS(Products_Sold__c, "Corp Paid Reviews"), ISBLANK(Reviews_Estimated_Launch_Date__c))
  )
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>FUL - YBN%3A Estimated Launch Dates Changed</fullName>
        <actions>
            <name>YBN_Relationship_Launch_Date_Changed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>OR(
  AND(ISCHANGED(Website_Template_Estimated_Launch_Date__c),NOT(ISNULL(PRIORVALUE(Website_Template_Estimated_Launch_Date__c)))),
  AND(ISCHANGED(Centermark_Estimated_Launch_Date__c), NOT(ISNULL(PRIORVALUE(Centermark_Estimated_Launch_Date__c)))),
  AND(ISCHANGED(Custom_Implementation_Estimated_Launch__c), NOT(ISNULL(PRIORVALUE(Custom_Implementation_Estimated_Launch__c)))),
  AND(ISCHANGED(PPC_Estimated_Launch_Date__c), NOT(ISNULL(PRIORVALUE(PPC_Estimated_Launch_Date__c)))),
  AND(ISCHANGED(Reviews_Estimated_Launch_Date__c),NOT(ISNULL(PRIORVALUE(Reviews_Estimated_Launch_Date__c)))),
  AND(ISCHANGED(Display_Estimated_Launch_Date__c), NOT(ISNULL(PRIORVALUE(Display_Estimated_Launch_Date__c))))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules></Workflow>