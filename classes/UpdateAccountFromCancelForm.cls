/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 06-Oct-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 06-Oct-2017
  Description ........: Class contains invocable method to assign/ remove Account Temp IMS Rep and Active 
  Cancel Form fields depending on criteria met.
*****************************************************************************/

public class UpdateAccountFromCancelForm
{
    @InvocableMethod
    public static void updateAccountCancelFormFields(List<Id> cancelFormIds)
    {
        /*try{
        
            if(cancelFormIds.size() > 0){
            
                Id cancelRecordTypeId = Schema.SObjectType.Cancellation_Request__c.getRecordTypeInfosByName().get('Cancellation Request').getRecordTypeId();
                Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Charge Failure').getRecordTypeId();
                Map<Id, Account> acctMap = new Map<Id, Account>();
                Map<Id, Cancellation_Request__c> crMap = new Map<Id, Cancellation_Request__c>();
                Map<Id, Case> acctCaseMap = new Map<Id, Case>();
                List<Account> dmlAccts = new List<Account>();
            
                // only get Cancellations that are owned by Users
                for(Cancellation_Request__c cr : 
                    [SELECT Id,
                            Account_Name__c,
                            Outcome__c,
                            OwnerId,
                            Owner.Type,
                            CreatedDate,
                            IsClosed__c
                       FROM Cancellation_Request__c
                      WHERE Id in :cancelFormIds AND
                            RecordTypeId = :cancelRecordTypeId AND
                            Account_Name__c != NULL]){
                            
                    // add record to Map
                    crMap.put(cr.Account_Name__c, cr);
                }
                
                if(crMap.size() > 0){
                
                    // only get Account records related to the Cancel Form
                    for(Account a :
                        [SELECT Id,
                                Temp_IMS_Rep__c,
                                Name,
                                Current_Active_Cancel_Form__c
                           FROM Account
                          WHERE Id in :crMap.keySet()]){
                    
                        // add record to Map
                        acctMap.put(a.Id, a);
                    }
                    
                    // only get Charge Failure Cases that are related to Account and are open
                    for(Case c :
                        [SELECT Id,
                                AccountId,
                                CaseNumber,
                                Status,
                                CreatedDate,
                                OwnerId,
                                IsClosed
                           FROM Case
                          WHERE RecordTypeId = :caseRecordTypeId AND
                                AccountId in :acctMap.keySet() AND
                                Owner.Type = 'User' AND
                                IsClosed = false]){
                                
                        // add record to Map
                        acctCaseMap.put(c.AccountId, c);
                    }
                    
                    // Assign Account Map values
                    for(Account a : acctMap.values()){
                        
                        // Assign Temp IMS Rep on Account; Chrg Failure Case Owner takes precedence over Cancel Form Owner
                        if(acctCaseMap.size() > 0){
                            
                            if(acctCaseMap.get(a.Id).AccountId == a.Id){
                            
                                // Assign Account IMS Temp Rep as Chrg Failure Case Owner
                                a.Temp_IMS_Rep__c = acctCaseMap.get(a.Id).OwnerId;
                                a.Current_Active_Cancel_Form__c = null;
                                
                                // Check for open Cancel Form to Assign Active Cancel Form on Account
                                if(crMap.get(a.Id).Account_Name__c == a.Id){
                                
                                    if(crMap.get(a.Id).IsClosed__c == false){
                                        a.Current_Active_Cancel_Form__c = crMap.get(a.Id).Id; 
                                    }
                                }
                                
                                // Add Account data to update list
                                dmlAccts.add(a);
                            }
                        }
                        else{
                        
                            // there are no open Chrg Failure Cases; check for Open Cancel Form
                            if(crMap.get(a.Id).Account_Name__c == a.Id){
                               
                                if(crMap.get(a.Id).IsClosed__c == false){
                                
                                    a.Temp_IMS_Rep__c = null;
                                    
                                    if(crMap.get(a.Id).Owner.Type == 'User'){
                                    
                                        // Cancel Form is Open; Assign Account IMS Temp Rep as Cancel Form Owner and Current Active Cancel Form Id
                                        a.Temp_IMS_Rep__c = crMap.get(a.Id).OwnerId;
                                    }
                                    
                                    a.Current_Active_Cancel_Form__c = crMap.get(a.Id).Id;
                                }
                                else{
                                    
                                    // No Open Chrg Failure Case or Cancel Form; clear fields
                                    a.Temp_IMS_Rep__c = null;
                                    a.Current_Active_Cancel_Form__c = null;
                                }
                                
                                // Add Account data to update list
                                dmlAccts.add(a);
                            }
                        }
                    }
                    
                    // perform DML operation in SFDC
                    if(dmlAccts.size() > 0){
                        update dmlAccts;
                    }
                }
            }
            
        }
        catch(Exception e){
        
            System.Debug('An error occurred: ' + e.getMessage());
            Apex_Debug_Log__c dbLog = new Apex_Debug_Log__c();
            dbLog.Apex_Class__c = 'UpdateAccountFromChrgFailureCase';
            dbLog.Message__c = e.getMessage();
            dbLog.Method__c = 'updateAccountCancelFormFields(Invocable)';
            dbLog.Record_Id__c = '';
            dbLog.Stack_Trace__c = e.getMessage();
            dbLog.Type__c = 'Error';
            
            insert dbLog;
        }*/
    }
}