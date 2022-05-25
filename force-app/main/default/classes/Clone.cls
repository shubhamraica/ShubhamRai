//Write a code to clone(copy ) 1 Opportunity with all Opportunity
// line items into a new Opportunity with Closed Date =
// Old closed date + 30 days & Opportunity name =
// Opportunity Name+ 'Clone'
public class Clone
{
    public static void cloneopportunity()
    {
        
        try{
            Opportunity oppobj=new Opportunity();
            oppobj=[SELECT Id,Name,Stagename,CloseDate ,
                    (SELECT Id,Name,UnitPrice,PricebookEntryId,OpportunityId,Quantity FROM OpportunityLineItems)
                    FROM Opportunity];
            Opportunity oppobj1=new Opportunity();
            oppobj1.Name=oppobj.Name +'Clone';
            oppobj1.CloseDate=oppobj.CloseDate.addDays(30);
            oppobj1.StageName=oppobj.StageName;
            insert oppobj1;
            system.debug(oppobj1);
            for( OpportunityLineItem itemsobj : oppobj.OpportunityLineItems)
            {
                system.debug('itemsobj> ' +itemsobj);
                
                OpportunityLineItem opportunityid = new OpportunityLineItem();
                opportunityid.UnitPrice = itemsobj.UnitPrice;
                opportunityid.PricebookEntryId=itemsobj.PricebookEntryId;
                opportunityid.OpportunityId=itemsobj.OpportunityId;
                opportunityid.Quantity=itemsobj.Quantity;
                insert opportunityid;
            }
        }
        catch(Exception e)
        {
            system.debug('Clone---->'+e.getMessage()+e.getLineNumber());
        }
    }
}