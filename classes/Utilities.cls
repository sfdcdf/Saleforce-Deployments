/**
* @ClassName    : Utilities
* @CreatedBy    : Ron Gong (12/27/2015)
* @Description  : This utility class can be utilized for the following tasks.
                    - GetRecTypeId - Get record types ids by name          
*/

public without sharing class Utilities {
    private static Map<String, Map<String, Schema.RecordTypeInfo>> mapRecTypes = new Map<String, Map<String, Schema.RecordTypeInfo>>();
    
    public static Id GetRecTypeId(String objName, String recTypeName){
        if(mapRecTypes.get(objName)==null){
            Schema.SObjectType objType = Schema.getGlobalDescribe().get(objName);
            Map<String, Schema.RecordTypeInfo> mapTempRT = objType.getDescribe().getRecordTypeInfosByName();
            
            if(mapTempRT.size()>0){
                mapRecTypes.put(objName, mapTempRT);
            } 
        }
        
        if(mapRecTypes.get(objName).get(recTypeName) != null){
            return mapRecTypes.get(objName).get(recTypeName).getRecordTypeId();
        } else {
            return null;
        }
    }
    
}