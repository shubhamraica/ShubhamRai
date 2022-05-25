public class alphabeticalOrder{
    public static void ascendingMethod(){
        try{
            List<Account> accountList= new List<Account>();
            accountList=[SELECT Name FROM Account ORDER BY Name ASC Limit 10];
            System.debug('In Assending Order--' + accountList);
        }catch (Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage());
        }
    }
}