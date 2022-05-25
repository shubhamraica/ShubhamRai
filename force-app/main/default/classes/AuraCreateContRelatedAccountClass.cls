public class AuraCreateContRelatedAccountClass {
    @AuraEnabled
    public static List<Account> FetchAccountsMethod(){
        try{
            List<Account> showAccount=new List<Account>();
            showAccount=[SELECT Id,Name FROM Account limit 5];
            if(showAccount.size()>0){
            return showAccount; 
            }
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return null;
    }
    @auraEnabled   
    public static Boolean CreateContactMethod(String accId, String ContactName,Integer Price,String ContactFirstName){
        try{
            if(String.isNotEmpty(ContactName)){
                Contact contactobj=new Contact();
                contactobj.FirstName=ContactFirstName;
                contactobj.LastName=ContactName;
                contactobj.AccountId=accId;
                insert contactobj;
                return true;
            }}
        catch(exception e){
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return false;
    }
}