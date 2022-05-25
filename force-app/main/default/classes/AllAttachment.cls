public class AllAttachment {
    public static void attachmentRecord()
    {
        
        try{
            List<Account> accountlist =new List<account>();
            accountlist = [select Id from account];
            List<Attachment> attachmentlist = new List<attachment>();
            
            if(!accountlist.isEmpty())
            {
                attachmentlist = [SELECT ParentId,Name,Id,Body FROM Attachment WHERE ParentId=: accountlist[0].Id limit 50];
            }
            
            List<Contact> contactlist = new List<Contact>();
            contactlist = [SELECT Id,LastName FROM Contact WHERE AccountId=: accountlist[0].Id limit 50];
            
            List<Attachment> deleteatt = new List<attachment>();
            
            List<Contact> deletecon = new List<Contact>();
            List<Attachment> contactattachlist = new List<Attachment>();
            Integer K=0;
            for(Attachment obj :attachmentlist){
                if(K>0){
                    Attachment attachmentobj= new Attachment();
                    attachmentobj.Id=obj.Id;
                    deleteatt.add(attachmentobj);
                }
                K++;
            }
            delete deleteatt;
            Integer L=0;
            for(contact contactobj :contactlist){
                if(L==0){
                    Attachment att= new Attachment();
                    att.Name =attachmentlist[0].Name;
                    att.Body =attachmentlist[0].Body;
                    att.ParentId =contactobj.Id;
                    contactattachlist.add(att);
                    
                }
                if(L>0){
                    Contact con= new Contact();
                    con.Id=contactobj.Id;
                    deletecon.add(con);
                    
                }
                L++;
                
            }
            if(!deletecon.isEmpty())
            {
                delete deletecon;
            }
            if(!contactattachlist.isEmpty())
            {
                insert contactattachlist;
            }
            
        }
        catch(exception e)
        {
            System.debug(e.getMessage()+e.getLineNumber());
            
        }
        
    }
}