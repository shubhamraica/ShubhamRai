public class Counting {
    public static void countcontact()
    {
        
        system.debug('Total contacts dfsdsrrv');
        integer i=0;
       list<contact> countContacts= new list<contact> ();
        list<opportunity> countOppos= new list<opportunity> ();
        countContacts= [select name,id,accountId from contact limit 100 ];
        set<id> accoid=new set<id> ();
        for(contact acc2id: countContacts)
        {
            accoid.add(acc2id.accountid);
        }
       
        countOppos = [select name,id,accountId from opportunity where accountid IN: accoid  limit 100];
        for(contact c:countcontacts)
        {
            for(opportunity op:countOppos)
            {
                if(op.name == c.name)
            {
                i++;
            }
             
            }
            system.debug('Total contacts ' +i);
               
            }
    }

}