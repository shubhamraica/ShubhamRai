public class CountContact{ 
    public static void countcontact1()
    {
        try{ 
            integer i=0;
            list<contact> countContacts= new list<contact>();
            countContacts=[select name,id,accountId from contact limit 100 ];
            system.debug('contactlist'+countcontacts);
            /* List<id> accountidlist=new List<id> ();
if(countContacts.size()>0)
{
for(contact account2id: countContacts)
{
Contact conobj=new Contact();
conobj.AccountId=account2id.accountid;
accountidlist.add(conobj);
}
insert accountidlist;
}*/
            set<id>accountidset=new set<id>();
            for(contact con:countContacts)
            {
                accountidset.add(con.AccountId);
            }
            list<opportunity> countOppos= new list<opportunity> ();
            countOppos = [select name,id,accountId from opportunity where accountid IN: accountidset  limit 100];
            system.debug(countoppos);
            if(countOppos.size()>0)
            {
                for(contact con:countcontacts)
                {
                    for(opportunity opp:countOppos)
                    {
                        if(opp.name == con.name)
                        {
                            i++;
                        }
                    }   
                }
                system.debug('Total contacts ' +i);
                
            }
        }
        catch(Exception e){
            system.debug(e.getMessage()+e.getLineNumber());
        }
        
    }
}