@istest
public class ContactHandler_test {
    @istest
    static void ContactHandler_testmethod()
    {
        Account ac=new Account();
        ac.name='Meenal';
        ac.NumberOfEmployees=1;
        insert ac;
        contact con=new contact();
        con.AccountId=ac.id;
        con.LastName='gupta';
        con.Email='meenal.gupta@cloudanalogy.com';
        insert con;
        delete con;
        undelete con;
    }
}