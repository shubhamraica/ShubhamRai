@istest
public class CountCases_test {
    @testsetup
    static void setuptestmethod()
    {
        Integer count=5;
        Account ac=new Account();
        ac.name='testName';
        ac.NumberOfEmployees = 1;
        ac.Number_of_Contacts__c=count;
        insert ac;
        Contact con=new Contact();
        con.lastname='testLastName';
        con.AccountId=ac.id;
        insert con;
        Case caseobj=new case();
        caseobj.ContactId=con.id;
        caseobj.SuppliedEmail='meenal.gupta@cloudanalogy.com';
        insert caseobj;
    }
    @istest
    static void CountCases_testmethod()
    {
        account accountobj=new account();
        accountobj=[select id,name,Number_of_Contacts__c from account LIMIT 1];
        contact conn=new contact();
        conn=[select id,name,account.name from contact LIMIT 1];
        case caseobjj=new case();
        caseobjj=[select id,contactid,account.name,accountid from case LIMIT 1];
        test.startTest();
        CountCases.countCasesAndContacts();
        test.stopTest();
    }
}