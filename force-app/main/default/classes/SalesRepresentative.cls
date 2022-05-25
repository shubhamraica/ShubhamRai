public class SalesRepresentative{
    public static void SalesRepresentativeFunc(List<Account> accList){
        try{
            Account owner=[SELECT owner.name FROM Account LIMIT 1];
            for(account accObj : accList){
                accObj.sales_representative__c=userinfo.getName();
            }
            
            System.debug(userinfo.getName());
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
}