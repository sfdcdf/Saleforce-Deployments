<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><fieldUpdates>
        <fullName>Update_Projected_Adoption_Monthly_Value</fullName>
        <field>ProjectedAdoptionMonthlyValue__c</field>
        <formula>Quantity * ProjectedAdoptionPct__c * UnitPrice</formula>
        <name>Update Projected Adoption Monthly Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Projected_Adoption_Total_Value</fullName>
        <field>Projected_Adoption_Total_Value__c</field>
        <formula>Quantity * ProjectedAdoptionPct__c * UnitPrice * 
( 
IF(NOT(ISBLANK(ProjectedAdoptionEndDate__c)) &amp;&amp; NOT(ISBLANK(ProjectedAdoptionStartDate__c)),
  (((YEAR(ProjectedAdoptionEndDate__c) - YEAR(ProjectedAdoptionStartDate__c) - 1) *12) + (12 - MONTH(ProjectedAdoptionStartDate__c) +1) + MONTH(ProjectedAdoptionEndDate__c-15))
  , 0) 
)</formula>
        <name>Update Projected Adoption Total Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Update_Total_Product_Cost</fullName>
        <field>TotalProductCost__c</field>
        <formula>ProductCost__c * Quantity * ContractLength__c</formula>
        <name>Update Total Product Cost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>WBN_OppProducts_ChargeType_OneTime</fullName>
        <field>ProductChargeType__c</field>
        <literalValue>One-Time</literalValue>
        <name>WBN-OppProducts-ChargeType-OneTime</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>WBN_OppProducts_ChargeType_PPCMonthly</fullName>
        <field>ProductChargeType__c</field>
        <literalValue>PPC Monthly</literalValue>
        <name>WBN-OppProducts-ChargeType-PPCMonthly</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>WBN_OppProducts_ChargeType_PPCSeasonal</fullName>
        <field>ProductChargeType__c</field>
        <literalValue>PPC Seasonal</literalValue>
        <name>WBN-OppProducts-ChargeType-PPCSeasonal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>WBN_OppProducts_ChargeType_Recurring</fullName>
        <field>ProductChargeType__c</field>
        <literalValue>Recurring</literalValue>
        <name>WBN-OppProducts-ChargeType-Recurring</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>YBN_Update_Annual_Product_Value</fullName>
        <field>AnnualProductValue__c</field>
        <formula>IF(ContractLength__c &gt; 12, TotalPrice * 12, 
  TotalPrice * ContractLength__c
)</formula>
        <name>YBN - Update Annual Product Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>YBN_Update_Total_Product_Value</fullName>
        <field>TotalProductValue__c</field>
        <formula>TotalPrice * ContractLength__c</formula>
        <name>YBN - Update Total Product Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>Update Projected Adoption Values</fullName>
        <actions>
            <name>Update_Projected_Adoption_Monthly_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Projected_Adoption_Total_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(   NOT(ISBLANK(ProjectedAdoptionPct__c)),   NOT(ISBLANK(ProjectedAdoptionStartDate__c)),   NOT(ISBLANK(ProjectedAdoptionEndDate__c)),   OR(     ISNEW(),     ISCHANGED(UnitPrice),     ISCHANGED(Quantity),     ISCHANGED(ProjectedAdoptionPct__c),     ISCHANGED(ProjectedAdoptionStartDate__c),     ISCHANGED(ProjectedAdoptionEndDate__c)   ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Update Total Product Cost</fullName>
        <actions>
            <name>Update_Total_Product_Cost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(    ISNEW(),    ISCHANGED(ProductCost__c),   ISCHANGED(Quantity),    ISCHANGED(ContractLength__c)  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Update Total Values</fullName>
        <actions>
            <name>YBN_Update_Annual_Product_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>YBN_Update_Total_Product_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(    ISNEW(),   ISCHANGED(UnitPrice),    ISCHANGED(Quantity),    ISCHANGED(TotalPrice),    ISCHANGED(ContractLength__c)  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>WBN-OppProducts-ChargeType-OneTime</fullName>
        <actions>
            <name>WBN_OppProducts_ChargeType_OneTime</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Product2.ProductChargeType__c</field>
            <operation>equals</operation>
            <value>One-Time</value>
        </criteriaItems>
        <description>Workflow Rules to update Charge Type</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>WBN-OppProducts-ChargeType-PPCMonthly</fullName>
        <actions>
            <name>WBN_OppProducts_ChargeType_PPCMonthly</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Product2.ProductChargeType__c</field>
            <operation>equals</operation>
            <value>PPC Monthly</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>WBN-OppProducts-ChargeType-PPCSeasonal</fullName>
        <actions>
            <name>WBN_OppProducts_ChargeType_PPCSeasonal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Product2.ProductChargeType__c</field>
            <operation>equals</operation>
            <value>PPC Seasonal</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>WBN-OppProducts-ChargeType-Recurring</fullName>
        <actions>
            <name>WBN_OppProducts_ChargeType_Recurring</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Product2.ProductChargeType__c</field>
            <operation>equals</operation>
            <value>Recurring</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules></Workflow>