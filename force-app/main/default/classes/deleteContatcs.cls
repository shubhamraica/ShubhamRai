public class deleteContatcs{
    public static void DeleteRecord(){
        try{
            List<Contact> contactList=new List<Contact>();
            List<Case> caseList=new List<Case>();
            contactList =[SELECT Id, Name FROM Contact WHERE Account.Name Like '%A%'];
            caseList=[Select CaseNumber from Case Where ContactId IN:contactList];
            if(Case.ContactId !=null){
                for(Contact contactObj:contactList){
                    System.debug(contactObj);
                }
                if(!contactList.isEmpty()){
                    delete caseList;
                    delete contactList;
                }
            }
        }catch (Exception ee){
            System.debug('ERROR AT LINE '+ee.getLineNumber()+'\n'+' '+ee.getMessage());
        }
    }
}