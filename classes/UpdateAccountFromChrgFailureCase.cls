/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 06-Oct-2017
  Last Modified By ...: E. Ross
  Last Modified Date .: 06-Oct-2017
  Description ........: Class contains invocable method to assign/ remove Account Temp IMS Rep and Active 
  Cancel Form fields depending on criteria met.
*****************************************************************************/

public class UpdateAccountFromChrgFailureCase
{
    @InvocableMethod
    public static void updateAccountCancelFormFields(List<Id> caseIds)
    {
        /*try{
        
            if(caseIds.size() > 0){
            
                Id cancelRecordTypeId = Schema.SObjectType.Cancellation_Request__c.getRecordTypeInfosByName().get('Cancellation Request').getRecordTypeId();
                Id caseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Charge Failure').getRecordTypeId();
                Map<Id, Account> acctMap = new Map<Id, Account>();
                Map<Id, Cancellation_Request__c> crMap = new Map<Id, Cancellation_Request__c>();
                Map<Id, Case> acctCaseMap = new Map<Id, Case>();
                List<Account> dmlAccts = new List<Account>();
            
                // only get Charge Failure Cases owned by a User
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
                            Id in :caseIds AND
                            Owner.Type = 'User' AND
                            AccountId != NULL]){
                                
                        // add record to Map
                        acctCaseMap.put(c.AccountId, c);
                }
                
                if(acctCaseMap.size() > 0){
                
                    // only get Account records related to the Chrg Failure Cases
                    for(Account a :
                        [SELECT Id,
                                Temp_IMS_Rep__c,
                                Name,
                                Current_Active_Cancel_Form__c
                           FROM Account
                          WHERE Id in :acctCaseMap.keySet()]){
                    
                        // add record to Map
                        acctMap.put(a.Id, a);
                    }
                    
                    // only get Account related Cancellations that are owned by Users and Open
                    for(Cancellation_Request__c cr : 
                        [SELECT Id,
                                Account_Name__c,
                                Outcome__c,
                                OwnerId,
                                CreatedDate,
                                IsClosed__c,
                                Owner.Type
                           FROM Cancellation_Request__c
                          WHERE Account_Name__c in :acctMap.keySet() AND
                                RecordTypeId = :cancelRecordTypeId AND
                                Account_Name__c != NULL AND
                                IsClosed__c = false]){
                            
                        // add record to Map
                        crMap.put(cr.Account_Name__c, cr);
                    }
                    
                    // Assign Account Map values
                    for(Account a : acctMap.values()){
                        
                        if(acctCaseMap.get(a.Id).AccountId == a.Id){
                        
                            if(acctCaseMap.get(a.Id).IsClosed == false){
                            
                                // Assign Account Temp IMS Rep as Chrg Failure Case Owner
                                a.Temp_IMS_Rep__c = acctCaseMap.get(a.Id).OwnerId;
                                a.Current_Active_Cancel_Form__c = null;
                                
                                // Check Open Cancel Form
                                if(crMap.size() > 0){
                                
                                    if(crMap.get(a.Id).Account_Name__c == a.Id){
                                        a.Current_Active_Cancel_Form__c = crMap.get(a.Id).Id;
                                    }
                                }
                                
                                // Add Account to update list
                                dmlAccts.add(a);
                            }
                            else{
                            
                                // Chrg Failure Case is Closed; clear fields
                                a.Temp_IMS_Rep__c = null;
                                a.Current_Active_Cancel_Form__c = null;
                                
                                // Check for Open Cancel Form
                                if(crMap.size() > 0){
                                
                                    if(crMap.get(a.Id).Account_Name__c == a.Id){
                                        
                                        if(crMap.get(a.Id).Owner.Type == 'User'){
                                        
                                            // Assign Account Temp IMS Rep as Cancel Form Owner and Active Cancel Form field
                                            a.Temp_IMS_Rep__c = crMap.get(a.Id).OwnerId;
                                        }
                                       
                                        a.Current_Active_Cancel_Form__c = crMap.get(a.Id).Id;
                                    }
                                }
                                
                                // Add Account to update list
                                dmlAccts.add(a);
                            }
                        }
                    }
                    
                    if(dmlAccts.size() > 0){
                    
                        // perform DML operation in SFDC
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