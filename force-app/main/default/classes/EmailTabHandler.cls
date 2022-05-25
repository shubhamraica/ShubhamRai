public class EmailTabHandler {
    @AuraEnabled 
    public static user fetchUser(){
        try{
            // query current user information  
            User oUser = [SELECT id, Name, Username,Alias, Email FROM User WHERE id =: userInfo.getUserId()];
            return oUser;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }        
        return NULL;
    }
}