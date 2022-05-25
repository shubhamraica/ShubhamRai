@istest
public class CountContact_test {
    @testsetup
    static void testsetupmethod()
    {
        Account ac=new Account();
        ac.name='testName';
        ac.NumberOfEmployees=1;
        insert ac;
        contact con=new contact();
        con.AccountId=ac.id;
        con.LastName='testLastName';
        insert con;
        Opportunity opp=new Opportunity();
        opp.AccountId=ac.id;
        opp.Name='testOpprName';
        opp.StageName='prospecting';
        opp.CloseDate=date.today().adddays(1);
        insert opp;
    }
@istest
    static void CountContact_testmethod()
    {
        Account acc=new Account();
        acc=[select name from account where name='testName'];
        Contact conn=new Contact();
        conn=[select lastname,accountid from contact where accountid=: acc.id LIMIT 1];
        Opportunity oppp=new Opportunity();
        oppp=[select name,accountid from Opportunity where accountid=: acc.id LIMIT 1];
        test.startTest();
        CountContact.countcontact1();
        test.stopTest();
    }
}