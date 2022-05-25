public class SearchInText {
    public static void searchInTextFunc(){
        try{
            /*List<Account> accList = new List<Account>();
            for(Integer i = 0; i<10; i++){
                Account accObj = new Account();
                accObj.Name = 'Shubham Rai '+i;
                accList.add(accObj);
            }
            insert accList;*/
            List <Account> fetchAccList = new List<Account>();
            fetchAccList = [SELECT Name FROM Account WHERE Name LIKE '%Shubham%'];
            if(!fetchAccList.isEmpty() && fetchAccList.size()>0){
                system.debug('fetchAccList : '+fetchAccList);
                for(Account obj : fetchAccList){
                    obj.Name = Obj.Name + '(updated)';
                }
                update fetchAccList;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
    
}