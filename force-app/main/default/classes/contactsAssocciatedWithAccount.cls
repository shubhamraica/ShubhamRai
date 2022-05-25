public class contactsAssocciatedWithAccount{
    public static void counterFunc(){
        try{
            list<Contact>ContactList=new list<Contact>();
            list<Account>Accountlist=new list<Account>();
            Accountlist=[select id from Account where name='Cloud Analogy'];
            ContactList=[select name,id,AccountId from Contact where Account.name='Cloud Analogy'];
            //system.debug(ContactList);
            Integer i,counterForContacts=0,counterForCases=0;
            counterForContacts = ContactList.size();
            system.debug(' TOTAL NUMBER OS CONTATCS : '+counterForContacts);
            
            Account ac=new Account();
            ac.id=contactList[0].AccountId;
            ac.Number_of_Contacts__c = counterForContacts;
            update ac;
            list<Case>CaseList=new list<Case>();
            Caselist=[select id ,AccountId from Case where Account.name='Cloud Analogy'];
            counterForCases=CaseList.size();
            system.debug(' TOTAL NUMBER OS CASES : '+ counterForCases);
            Account acc=new Account();
            acc.id=caseList[0].AccountId;
            acc.Number_of_Cases__c = counterForCases;
            update acc;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber() +'.'+e.getMessage());
        }
    }
}