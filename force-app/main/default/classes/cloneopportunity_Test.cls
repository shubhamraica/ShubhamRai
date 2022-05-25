@istest
public class cloneopportunity_Test {
    @testsetup
    static void setuptestmethod()
    {
        Account ac=new Account();
        ac.name='test';
        insert ac;
        Opportunity opp=new opportunity();
        opp.Name='opp';
        opp.AccountId=ac.id;
        opp.StageName='prospecting';
        opp.CloseDate=date.today().adddays(1);
        insert opp;
        product2 pro=new product2();
        pro.name='myproduct';
        insert pro;
        id pricebookid=test.getStandardPricebookId();
        PricebookEntry pricebook=new PricebookEntry();
        pricebook.Product2Id=pro.id;
        pricebook.Pricebook2Id=pricebookid;
        pricebook.IsActive=true;
        pricebook.UnitPrice=100;
        insert pricebook;
        opportunitylineitem oli=new opportunitylineitem();
        oli.OpportunityId=opp.id;
        oli.Product2Id=pro.id;
        oli.unitprice=200;
        oli.Quantity=10;
        oli.PricebookEntryId=pricebook.id;
        insert oli;
    }
    @istest
    public static void CloneOpportunity_testmethod()
    {
        opportunitylineitem oliobj=new opportunitylineitem();
        oliobj=[select id,opportunityid,product2id,quantity,unitprice,opportunity.name
                from opportunitylineitem where opportunity.name='opp' and product2.name='myproduct'];
        test.startTest();
        Clone.cloneopportunity();
        test.stopTest();
    }
}