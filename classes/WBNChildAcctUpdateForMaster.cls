/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 23-Oct-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 23-Oct-2018
  Description ........: Class contains invocable method to update child Account 
  specific fields based Parent Account.
*****************************************************************************/
public class WBNChildAcctUpdateForMaster
{
    @InvocableMethod
    public static void updatedFieldsForParent(List<Id> acctIds)
    {
        try{
        
            WBNChildAcctUpdateForMasterFuture.updatedFieldsForParent(acctIds);
            
        }
        catch(Exception ex){
        
            System.Debug('An error occurred: ' + ex.getMessage());
        }
    }
}