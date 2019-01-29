/****************************************************************************
  Company/ Author ....: E. Ross
  Date Created .......: 26-Dec-2018
  Last Modified By ...: E. Ross
  Last Modified Date .: 26-Dec-2018
  Description ........: Class contains invocable method to call CTS Sync Service method to update 
  relative object record CTS Ticket Reference information
*****************************************************************************/
public class CTSTicketIdSync
{
    @InvocableMethod
    public static void UpdateRelatedObjectData(List<Id> objectIds)
    {
        try
        {
            if(objectIds.size() > 0){
            
                CTSSyncService.UpdateSFDCObject(objectIds);
            }
        }
        catch(Exception e)
        {
            System.Debug('An error occurred: ' + e);
        }
    }
}