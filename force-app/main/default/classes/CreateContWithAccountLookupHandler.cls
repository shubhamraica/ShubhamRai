public class CreateContWithAccountLookupHandler{
    @AuraEnabled
    public static List<Account> FetchAccountsMethod(){
        List<Account> accList = [SELECT Name FROM Account];
        return accList; 
    }
    @auraEnabled   
    public static String CreateContactMethod(String conAccountId, String LastName){
        if(String.isNotEmpty(LastName)){
            Contact conObj=new Contact();
            conObj.LastName=LastName;
            conObj.AccountId=conAccountId;
            insert conObj;
            return 'Contact inserted successfully';
        }
        else if(conAccountId==NULL||(LastName==NULL)){
            return 'You forgot to select an Account or give a name to Contact';
        }
        else{
            return 'Contact insertion failed';
        }
    }
}