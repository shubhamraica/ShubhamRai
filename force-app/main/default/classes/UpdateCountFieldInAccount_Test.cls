@isTest
public class UpdateCountFieldInAccount_Test {
    @isTest static void testMethod1(){
        Account ac=new Account();
        ac.name='testName';
        ac.NumberOfEmployees=1;
        insert ac;
        contact con=new contact();
        con.AccountId=ac.id;
        con.LastName='testLastName';
        insert con;
        UpdateCountFieldInAccount batchobj=new UpdateCountFieldInAccount();
        database.executeBatch(batchobj);
    }
}