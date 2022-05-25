public class ReplicaHandler{
    @AuraEnabled
    public static boolean insertAccount(Account Accountdetail){
        try{
            Account accountobj=new Account();
            accountobj.name				= Accountdetail.Name;
            accountobj.Phone			= Accountdetail.Phone;
            accountobj.BillingCity		= Accountdetail.BillingCity;
            accountobj.BillingState		= Accountdetail.BillingState;
            accountobj.NumberOfEmployees	= Accountdetail.NumberOfEmployees;
            insert accountobj;
            return true;
        }catch(exception e){
            system.debug('Error at line '+e.getLineNumber()+'. '+e.getCause());
        }
        return false;
    }
}