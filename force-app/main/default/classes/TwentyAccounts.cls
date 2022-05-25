public class TwentyAccounts {
public static void createAccount(){
        try{
            List<Account> accList=new List<Account>();
            for(Integer i=1;i<=20;i++){ 
                Account accObj=new Account();
                accObj.Name='Shubham Rai '+i;
                accObj.Phone='12345678990 '+i;
                accObj.NumberOfEmployees=1;
                accObj.BillingCity='Noida'+i;
                accObj.BillingCountry='India'+i;
                accList.add(accObj);
            }
            insert accList;
        }catch(Exception e){
             System.debug('Error at line number '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
}