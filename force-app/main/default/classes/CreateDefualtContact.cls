public class CreateDefualtContact{
    public static void CreateDefualtContactFunc(List<account> accountlist){
        try{
            System.debug('In  Triggersabc accountlist'+ accountlist);
            list<contact> TriggerContacts= new  list<contact> ();
            for(Account acc: accountlist){
                if(acc.NumberOfEmployees>0){
                    Integer NumOfEmp =acc.NumberOfEmployees;
                    for(Integer i=0;i<NumOfEmp;i++){
                        Contact contactobj = new Contact();
                        contactobj.LastName = 'Contact ' +i;
                        contactobj.AccountId = acc.Id;
                        TriggerContacts.add(contactobj);
                    }
                }
                else {
                    acc.adderror('Number of employees should be greater than 0');
                }
            }
            insert TriggerContacts;
        }catch(exception e){
            system.debug(e.getLineNumber()+e.getMessage());   
        }
    }   
}