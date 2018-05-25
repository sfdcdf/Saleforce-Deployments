<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata"><alerts>
        <fullName>Lead_Mktg_Alert_ION_lead_creation</fullName>
        <description>Lead - Mktg - Alert ION lead creation</description>
        <protected>false</protected>
        <recipients>
            <recipient>mary.kellum@yodle.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Marketing/New_Lead_Notification_ION</template>
    </alerts><alerts>
        <fullName>Lead_Mktg_Alert_ION_lead_validated</fullName>
        <description>Lead - Mktg - Alert ION lead validated</description>
        <protected>false</protected>
        <recipients>
            <recipient>dlynch@web.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Marketing/New_Lead_Notification_ION</template>
    </alerts><alerts>
        <fullName>Partner_Agreement_Confirmation_Notification</fullName>
        <description>Partner Agreement Confirmation Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>partner@yodle.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Marketing/PartnerAgreement</template>
    </alerts><fieldUpdates>
        <fullName>AKtimezone</fullName>
        <field>TimeZone__c</field>
        <literalValue>Alaska</literalValue>
        <name>Lead Time Zone to Alaska</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Centraltimezone</fullName>
        <field>TimeZone__c</field>
        <literalValue>Central</literalValue>
        <name>Lead Time Zone to Central</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Date_Time_of_1st_activity_now</fullName>
        <field>Date_Time_of_First_Contact__c</field>
        <formula>now()</formula>
        <name>Lead Date/Time of 1st Contact to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Don_t_Redistribute_true</fullName>
        <field>Don_t_Redistribute__c</field>
        <literalValue>1</literalValue>
        <name>Don't Redistribute = true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>ESTtimezone</fullName>
        <field>TimeZone__c</field>
        <literalValue>Eastern</literalValue>
        <name>Lead Time Zone to Eastern</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Email_Email_for_converting</fullName>
        <field>email_for_converting__c</field>
        <formula>Email</formula>
        <name>Email = Email for converting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Mountaintimezone</fullName>
        <field>TimeZone__c</field>
        <literalValue>Mountain</literalValue>
        <name>Lead Time Zone to Mountain</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>SDR_ownership_SDR</fullName>
        <field>SDR_Ownership__c</field>
        <formula>OwnerId</formula>
        <name>Lead SDR Ownership to Owner ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>TimezoneisHI</fullName>
        <field>TimeZone__c</field>
        <literalValue>Hawaii</literalValue>
        <name>Lead Time Zone to Hawaii</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>Trade_Show_lead</fullName>
        <field>Trade_Show__c</field>
        <literalValue>1</literalValue>
        <name>Lead Trade Show to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>URL_website</fullName>
        <field>What_is_the_URL__c</field>
        <formula>Website</formula>
        <name>Lead What is the URL to Website</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>db_next</fullName>
        <field>DB_Remarketing__c</field>
        <name>db = next</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>NextValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>db_remarketing_1</fullName>
        <field>DB_Remarketing__c</field>
        <literalValue>Reassignment 1</literalValue>
        <name>db = remarketing 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>db_remarketing_2</fullName>
        <field>DB_Remarketing__c</field>
        <literalValue>Reassignment 2</literalValue>
        <name>db = remarketing 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>do_not_call_true</fullName>
        <field>DoNotCall</field>
        <literalValue>1</literalValue>
        <name>do not call = true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>donotcallqueue</fullName>
        <field>OwnerId</field>
        <lookupValue>Donotcall</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>do not call queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>email_added_true</fullName>
        <field>Email_added__c</field>
        <literalValue>1</literalValue>
        <name>email added = true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>first_name_first_name_for_converting</fullName>
        <field>First_Name_for_converting__c</field>
        <formula>FirstName</formula>
        <name>first name = first name for converting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>inbound_true</fullName>
        <field>Inbound__c</field>
        <literalValue>1</literalValue>
        <name>Lead Inbound to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>last_name_last_name_for_converting</fullName>
        <field>Last_Name_for_converting__c</field>
        <formula>LastName</formula>
        <name>last name = last name for converting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>leadownerchange</fullName>
        <field>ownership_change_date__c</field>
        <formula>IF(ISCHANGED(OwnerId) ,TODAY(), ownership_change_date__c)</formula>
        <name>Lead Ownership Change Date to Today 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>newleadchangedateistoday</fullName>
        <field>ownership_change_date__c</field>
        <formula>today()</formula>
        <name>Lead Ownership Change Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_AZ_Barden</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>AZ-Barden</literalValue>
        <name>original inbound=AZ-Barden</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_AZ_SDR</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>AZ-SDR</literalValue>
        <name>original inbound=AZ-SDR</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_BOSG</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>BOS-Gross</literalValue>
        <name>original inbound=BOS-Gross</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_BOS_Doyon</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>BOS-Doyon</literalValue>
        <name>original inbound=BOS-Doyon</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_CLT_Harper</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>CLT-Harper</literalValue>
        <name>original inbound=CLT-Harper</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_CLT_Petrinec</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>CLT-Petrinec</literalValue>
        <name>original inbound=CLT-Petrinec</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_JCI</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>JCI</literalValue>
        <name>original inbound=JCI</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_NYC_Cedeno</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>NYC-Cedeno</literalValue>
        <name>original inbound=NYC-Cedeno</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_NYC_asnis</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>NYC-Asnis</literalValue>
        <name>original inbound=NYC-Asnis</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>original_inbound_granat</fullName>
        <field>Original_Inbound_Team__c</field>
        <literalValue>NYC-Granatowski</literalValue>
        <name>original inbound=Granat</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>pacifictimezone</fullName>
        <field>TimeZone__c</field>
        <literalValue>Pacific</literalValue>
        <name>Lead Time Zone to Pacific</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>phone_phone_for_converting</fullName>
        <field>Phone_for_converting__c</field>
        <formula>Phone</formula>
        <name>phone = phone for converting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>record_type_local</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Sales</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>record type = local</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>referralpossible</fullName>
        <field>referral_possible__c</field>
        <literalValue>1</literalValue>
        <name>Lead Referral Possible? to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><fieldUpdates>
        <fullName>status_conf_exist</fullName>
        <field>Status</field>
        <literalValue>Confirmed Existence</literalValue>
        <name>Lead Status to Confirmed Existence</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates><rules>
        <fullName>AK time zone</fullName>
        <actions>
            <name>AKtimezone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>equals</operation>
            <value>AK,Alaska</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Central time zone</fullName>
        <actions>
            <name>Centraltimezone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>equals</operation>
            <value>KY,TN,AL,MS,LA,TX,OK,AR,KS,MO,IL,NE,IA,WI,SD,ND,MN</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>EST time zone</fullName>
        <actions>
            <name>ESTtimezone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>equals</operation>
            <value>ME,VT,NY,CT,NH,MA,RI,PA,NJ,DE,MD,DC,VA,NC,SC,FL,WV,MI,OH,IN</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Email %3D Email for converting</fullName>
        <actions>
            <name>Email_Email_for_converting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>First contact %3D date%2Ftime of 1st activity</fullName>
        <actions>
            <name>Date_Time_of_1st_activity_now</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Days_Since_Last_Activity__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Date_Time_of_First_Contact__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>HI time zone</fullName>
        <actions>
            <name>TimezoneisHI</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>equals</operation>
            <value>HI,Hawaii</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Jared Slosberg %3D DNR</fullName>
        <actions>
            <name>Don_t_Redistribute_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>Jared Slosberg</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Don_t_Redistribute__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Mountain time zone</fullName>
        <actions>
            <name>Mountaintimezone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>equals</operation>
            <value>NM,CO,UT,AZ,WY,ID,MT</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 0</fullName>
        <actions>
            <name>db_remarketing_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 1</fullName>
        <actions>
            <name>db_remarketing_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
            <value>Reassignment 1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 2</fullName>
        <actions>
            <name>db_next</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
            <value>Reassignment 2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 3</fullName>
        <actions>
            <name>db_next</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
            <value>Reassignment 3</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 4</fullName>
        <actions>
            <name>db_next</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
            <value>Reassignment 4</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 5</fullName>
        <actions>
            <name>db_next</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
            <value>Reassignment 5</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 6</fullName>
        <actions>
            <name>db_next</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
            <value>Reassignment 6</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 7</fullName>
        <actions>
            <name>db_next</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
            <value>Reassignment 7</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 8</fullName>
        <actions>
            <name>db_next</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
            <value>Reassignment 8</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Pardot-reassignment %3D 9</fullName>
        <actions>
            <name>db_next</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DB_Remarketing__c</field>
            <operation>equals</operation>
            <value>Reassignment 9</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>open sales</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>Partner Agreement Confirmation</fullName>
        <actions>
            <name>Partner_Agreement_Confirmation_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Description</field>
            <operation>contains</operation>
            <value>partner-programs/referral-program-sign-up</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>contains</operation>
            <value>Partner</value>
        </criteriaItems>
        <description>This goes out once a partner filled out the referral form.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>ProfitFuel %3D DNR</fullName>
        <actions>
            <name>Don_t_Redistribute_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>contains</operation>
            <value>Profitfuel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Don_t_Redistribute__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>SDR ownership</fullName>
        <actions>
            <name>SDR_ownership_SDR</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>contains</operation>
            <value>Austin Miller,sahakian,pesch,DiBrito,leonard,boyle,nathan turner,beals,tyler wright,manoni</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>Trade Show lead</fullName>
        <actions>
            <name>Trade_Show_lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 or 3 )</booleanFilter>
        <criteriaItems>
            <field>Lead.Trade_Show__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>contains</operation>
            <value>Trade Show</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.X2009_Trade_Show__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>URL %3D website</fullName>
        <actions>
            <name>URL_website</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Website</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.What_is_the_URL__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>YBN - Mktg - Alert ION lead creation</fullName>
        <actions>
            <name>Lead_Mktg_Alert_ION_lead_creation</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>ion</value>
        </criteriaItems>
        <description>Send an alert when a lead is generated from the ION system.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>YBN - Mktg - Alert ION lead validated</fullName>
        <actions>
            <name>Lead_Mktg_Alert_ION_lead_validated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>ion</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Confirmed Existence</value>
        </criteriaItems>
        <description>Send an alert when a lead is generated from the ION system.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>activity%2C so not %27record%27</fullName>
        <actions>
            <name>status_conf_exist</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
(LastActivityDate &gt; DATE(2001,01,01) ),( ISPICKVAL( Status , "record")) 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>confirmed existence from activity</fullName>
        <actions>
            <name>status_conf_exist</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Record</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.last_activity__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>do not call</fullName>
        <actions>
            <name>Don_t_Redistribute_true</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>donotcallqueue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DoNotCall</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Berry_Account__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>do not call ownership</fullName>
        <actions>
            <name>Don_t_Redistribute_true</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>do_not_call_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>contains</operation>
            <value>do not</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>email added to lead</fullName>
        <actions>
            <name>email_added_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Email)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>first name %3D first name for converting</fullName>
        <actions>
            <name>first_name_first_name_for_converting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.FirstName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>inbound lead</fullName>
        <actions>
            <name>inbound_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Inbound__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>Inbound (Call / Email)</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>inbound lead %3D local sales</fullName>
        <actions>
            <name>record_type_local</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Inbound__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>last name %3D last name for converting</fullName>
        <actions>
            <name>last_name_last_name_for_converting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LastName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>lead owner change</fullName>
        <actions>
            <name>leadownerchange</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>new lead</fullName>
        <actions>
            <name>newleadchangedateistoday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules><rules>
        <fullName>original inbound%3DAZ-Barden</fullName>
        <actions>
            <name>original_inbound_AZ_Barden</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>AZ - Barden</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>original inbound%3DAZ-SDR</fullName>
        <actions>
            <name>original_inbound_AZ_SDR</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>contains</operation>
            <value>SDR</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>original inbound%3DBOS-Doyon</fullName>
        <actions>
            <name>original_inbound_BOS_Doyon</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>Boston - Doyon</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>original inbound%3DBOS-Gross</fullName>
        <actions>
            <name>original_inbound_BOSG</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>Boston - Gross</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>original inbound%3DCLT-Harper</fullName>
        <actions>
            <name>original_inbound_CLT_Harper</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>Charlotte-Harper</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>original inbound%3DCLT-Petrinec</fullName>
        <actions>
            <name>original_inbound_CLT_Petrinec</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>Charlotte - Petrinec</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>original inbound%3DJCI</fullName>
        <actions>
            <name>original_inbound_JCI</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>contains</operation>
            <value>JCI</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>original inbound%3DNYC-Asnis</fullName>
        <actions>
            <name>original_inbound_NYC_asnis</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>New York - Asnis</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>original inbound%3DNYC-Cedeno</fullName>
        <actions>
            <name>original_inbound_NYC_Cedeno</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>New York - Cedeno</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>original inbound%3DNYC-granatowski</fullName>
        <actions>
            <name>original_inbound_granat</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Original_Inbound_Team__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>equals</operation>
            <value>New York - Granatowski</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules><rules>
        <fullName>pacific time zone</fullName>
        <actions>
            <name>pacifictimezone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>equals</operation>
            <value>CA,NV,OR,WA</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>phone %3D phone for converting</fullName>
        <actions>
            <name>phone_phone_for_converting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Phone</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules><rules>
        <fullName>referral possible</fullName>
        <actions>
            <name>referralpossible</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>contains</operation>
            <value>trade s,nation,referr</value>
        </criteriaItems>
        <description>marks off 'referral possible when the lead source is either referral, referral – national accounts, and Trade Show 2009.</description>
        <triggerType>onAllChanges</triggerType>
    </rules></Workflow>