public class ContactLookUp{
public static void contactLookUpFunc(){
        try{
            List<Contact> ContactList=new List<Contact>();
            List<Account> AccountList=new List<Account>();
            AccountList=[Select Id from Account Limit 10];
            Integer i=1;
            for(Account acct:AccountList){
                Contact contact=new Contact();
                contact.LastName='Rai '+i;
                contact.AccountId=acct.Id;
                ++i;
                ContactList.add(contact);  
            }
            insert ContactList;
            System.debug(ContactList);
        }catch(DMLException e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+' . '+' '+e.getMessage());
        }
    }
}