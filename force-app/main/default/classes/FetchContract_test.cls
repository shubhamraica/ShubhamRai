@istest
public class FetchContract_test {
    @testsetup
    static void testsetupmethod()
    {
        Account ac=new account();
        ac.name='test';
        ac.NumberOfEmployees = 1;
        insert ac;
        Contact con=new Contact();
        con.lastname='gupta';
        con.AccountId=ac.id;
        insert con;
        Contract Contractobj=new Contract();
        Contractobj.AccountId=ac.id;
        contractobj.CustomerSignedId=con.id;
        contractobj.StartDate=date.today();
        contractobj.Status='Draft';
        
        contractobj.BillingStreet='meerut';
        contractobj.BillingCity='meerut';
        contractobj.BillingState= 'up';
        contractobj.BillingPostalCode='250002';
        contractobj.BillingCountry='india';
        insert Contractobj;
    }
    @istest
    static void FetchContract_testmethod()
    {
        Contract Contractobj2=new Contract();
        Contractobj2=[select status,startdate,BillingStreet,BillingCity,BillingState,BillingPostalCode,BillingCountry,CustomerSignedId
                      ,AccountId from Contract where Account.id!=null and CustomerSignedId!=null];
        test.startTest();
        createContract.createContractWithSameDetails();
        test.stopTest();
    }
}