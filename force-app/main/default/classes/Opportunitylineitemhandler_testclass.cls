@istest
public class Opportunitylineitemhandler_testclass {
    @testsetup
    static void testsetupmethod()
    {
        Account ac=new Account();
        ac.name='Meenal';
        ac.NumberOfEmployees=1;
        ac.numberOfProductsSold__c=5;
        insert ac;
        id pricebookid=test.getStandardPricebookId();
        Opportunity opp=new Opportunity();
        opp.AccountId=ac.id;
        opp.Name='gupta';
        opp.StageName='somrthings';
        opp.CloseDate=date.today().adddays(1);
        opp.Pricebook2Id=pricebookid;
        insert opp;
        product2 proobj=new product2();
        proobj.Name='myproduct';
        insert proobj;
        pricebookentry pricebookentryobj=new pricebookentry();
        pricebookentryobj.Pricebook2Id=pricebookid;
        pricebookentryobj.Product2Id=proobj.id;
        pricebookentryobj.UnitPrice=100;
        pricebookentryobj.IsActive=true;
        insert pricebookentryobj;
        Opportunitylineitem oli=new Opportunitylineitem();
        oli.OpportunityId=opp.id;
        oli.Product2Id=proobj.id;
        oli.Quantity=100;
        oli.UnitPrice=10;
        insert oli;
        delete oli;
    }
@istest
    static void Opportunitylineitemhandlertestmethod()
    {
      Opportunity Oplist = new Opportunity();
      opList= [select id,accountId from Opportunity LIMIT 1]; 
      Product2 ProductList = new Product2();
      productList = [select id,name from Product2 LIMIT 1]; 
    }
}