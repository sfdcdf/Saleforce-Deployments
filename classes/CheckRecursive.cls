public Class CheckRecursive{
    private static boolean beforeInsert = true;
    private static boolean beforeUpdate = true;
    private static boolean beforeDelete = true;
    private static boolean afterInsert = true;
    private static boolean afterUpdate = true;
    private static boolean afterDelete = true;
    private static boolean afterUndelete = true;
    
    public static boolean runBeforeInsert(){
        if(beforeInsert){
            beforeInsert=false;
            return true;                
        }else{
            return beforeInsert;
        }
    }
    
    public static boolean runBeforeUpdate(){
        if(beforeUpdate){
            beforeUpdate=false;
            return true;                
        }else{
            return beforeUpdate;
        }
    }
    
    public static boolean runBeforeDelete(){
        if(beforeDelete){
            beforeDelete=false;
            return true;                
        }else{
            return beforeDelete;
        }
    }
    
    public static boolean runAfterInsert(){
        if(afterInsert){
            afterInsert=false;
            return true;                
        }else{
            return afterInsert;
        }
    }
    
    public static boolean runAfterUpdate(){
        if(afterUpdate){
            afterUpdate=false;
            return true;                
        }else{
            return afterUpdate;
        }
    }
    
    public static boolean runAfterDelete(){
        if(afterDelete){
            afterDelete=false;
            return true;                
        }else{
            return afterDelete;
        }
    }
    
    public static boolean runAfterUndelete(){
        if(afterUndelete){
            afterUndelete=false;
            return true;                
        }else{
            return afterUndelete;
        }
    }
}