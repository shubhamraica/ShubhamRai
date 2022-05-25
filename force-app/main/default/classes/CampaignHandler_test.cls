@istest
public class CampaignHandler_test {
@istest
    static void CampaignHandler_testmethod()
    {
        Campaign camp=new Campaign();
        camp.Name='new camp';
        camp.Status='completed';
        insert camp;
        update camp;
        Opportunity opportunityobj=new Opportunity();
        opportunityobj.name='oppname';
        opportunityobj.StageName='prospecting';
        opportunityobj.CloseDate=date.today().adddays(1);
        opportunityobj.CampaignId=camp.id;
        insert opportunityobj;
        id pricebookid=test.getStandardPricebookId();
        product2 proobj=new product2();
        proobj.Name='myproduct';
        proobj.number_of_products_sold__c=5;
        insert proobj;
        pricebookentry pricebookentryobj=new pricebookentry();
        pricebookentryobj.Pricebook2Id=pricebookid;
        pricebookentryobj.Product2Id=proobj.id;
        pricebookentryobj.UnitPrice=100;
        pricebookentryobj.IsActive=true;
        insert pricebookentryobj;
        OpportunitylineItem oli=new OpportunitylineItem();
        oli.OpportunityId=opportunityobj.id;
        oli.Quantity=100;
        oli.TotalPrice=200;
        oli.PricebookEntryId=pricebookentryobj.id;
        oli.Product2Id=proobj.id;
        insert oli;
    }
}