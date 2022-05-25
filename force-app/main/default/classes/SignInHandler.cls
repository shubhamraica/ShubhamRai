public class SignInHandler{
    @AuraEnabled
    public static String getDetails(String Username, String Password){ 
        try{
            List<Contact> con_List=[SELECT Username__c,Password__c FROM Contact WHERE Username__c =: Username LIMIT 1];
            if((con_List[0].Password__c==Password)&&(Password!=NULL)&&(Username!=NULL)){
                return 'Login successfull!!!!';
            }
            else if((con_List[0].Password__c!=Password)||(con_List[0].Password__c!=NULL)){
                return 'Invalid password please try again!!!!';
            }
            else if((con_List[0].Password__c==NULL)||(con_List[0].Username__c==NULL)){
                return 'You are missing Password/Username';
            }
            else{
                return 'There is some error';
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getCause());
        }
        return NULL;
    }
}