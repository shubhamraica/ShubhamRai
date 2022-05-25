public class CurrentUserData {
    public static void userData() {
        try{
        System.debug('Name -->'+'  '+ UserInfo.getName());
        System.debug('Number -->'+' '+ UserInfo.getUserId());
        System.debug('eamil -->'+ ' '+ UserInfo.getUserEmail());
        System.debug('company name -->'+ '  '+ UserInfo.getOrganizationName()); 
        }catch (Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage());
        }
    }
}