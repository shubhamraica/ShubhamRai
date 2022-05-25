public class OpportunityLineItem_handler 
{
    
    public static void countOli(map<id,OpportunityLineItem> Olimap)
        
    {
        try
        {
        
        set<id>oppid=new set<id>();
        List<Account> AccountList=new List<Account>();
        
        
        for(id eachid:Olimap.Keyset())
        {
            oppid.add(Olimap.get(eachid).opportunityid);
        }
        List<opportunity> opplist=new List<opportunity>();
        
        opplist=[select id,Accountid,(select id from opportunitylineitems) from opportunity where id IN:oppid];
        
        if(!opplist.isEmpty())
        {
        for(opportunity opp:oppList)
        {
            Account acc=new Account();
            acc.id=opp.AccountId;
            acc.Number_of_LineItems__c=opp.opportunityLineitems.size();
            
            AccountList.add(acc);
        }
        
        update AccountList;
        }
        }
        
         catch(Exception e)
        {
            System.debug(e.getMessage()+' '+e.getLineNumber());
        }
        
    }
    
}