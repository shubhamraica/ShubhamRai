public class updateAbove {
    public static void updateAboveFunc(List<Contact>conlist)
    {      
        try {  
          Set<Id> accountid = new Set<Id>();
          for(Contact c: conlist)
          {
             accountid.add(c.AccountId);
          }
         List<Account> acclist= new List<Account>();
         acclist=[SELECT id,Name FROM Account WHERE Id IN: accountid];
                    for(Account acc_obj : acclist)
                    {
                        for(Contact con_obj : conlist)
                        {
                            String UpdatedName='';
                            UpdatedName = acc_obj.name;
                            UpdatedName= UpdatedName.substring(0,UpdatedName.length()-con_obj.LastName.length());
                            acc_obj.name=UpdatedName;
                        }
                    }
                    update acclist;
                }
                catch(Exception e)
                {system.debug(e);}
            }
            
}