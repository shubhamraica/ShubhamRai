@isTest
public class UnDeleteContact_Test {
    @isTest static void testMethod1(){
        Account ac=new Account();
        ac.name='testName';
        ac.NumberOfEmployees=1;
        insert ac;
        contact con=new contact();
        con.AccountId=ac.id;
        con.LastName='testLastName';
        insert con;
        delete con;
        undelete con;
    }
}