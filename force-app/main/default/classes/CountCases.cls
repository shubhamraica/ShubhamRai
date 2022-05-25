public class CountCases {
    public static void countCasesAndContacts()
    {
        try
        { 
            list<Contact>ContactList=new list<Contact>();
            list<Account>Accountlist=new list<Account>();
            Accountlist=[select id from Account where name='Name14'];
            ContactList=[select name,id,AccountId from Contact];
            system.debug(ContactList);
            Integer i,count=0,counter=0;
            count = ContactList.size();//count contact
            system.debug(count);
            Account ac=new Account();
            ac.id=contactList[0].AccountId;
            ac.Number_of_Cases__c = count;
            update ac;//update in org
            list<Case>CaseList=new list<Case>();
            Caselist=[select id ,AccountId from Case];
            counter=CaseList.size();//count cases
            system.debug(' Count--->'+ counter);
            Account acc=new Account();
            acc.id=caseList[0].AccountId;
            acc.Number_of_Cases__c = counter;
            update acc;//update cases
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
    }
}