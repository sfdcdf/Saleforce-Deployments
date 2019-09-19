/*
//Reason : “BeaconHS1Migration” : Inactivated the completed class , as this is not needed for LH Product.
//By : Mahesh Bogila , 7/3/2019
*/
public with sharing class clsS2SShareHelper 
{
    Integer i1 = 1; 
    Integer i2 = 1; 
    Integer i3 = 1; 
    Integer i4 = 1; 
    Integer i5 = 1; 
    Integer i6 = 1; 
    Integer i7 = 1; 
    Integer i8 = 1; 
    Integer i9 = 1; 
    Integer i10 = 1; 

  /*public static Id getConnectionId(String connectionName) {
    
        List<PartnerNetworkConnection> partnerNetConList =
           [Select id from PartnerNetworkConnection where connectionStatus = 'Accepted' and connectionName =:connectionName];
        
        if ( partnerNetConList.size()!= 0 ) {
            return partnerNetConList.get(0).Id;
        }
        
        return null;
    }
    
    public static Id getConnectionOwnerId(String connectionName) {
    
        List<PartnerNetworkConnection> partnerNetConList = 
          [Select createdById from PartnerNetworkConnection where connectionStatus = 'Accepted' and connectionName =: connectionName];
        
        if ( partnerNetConList.size() != 0 ) {
            return partnerNetConList.get(0).createdById;
        }
        
        return null;
    }*/
}