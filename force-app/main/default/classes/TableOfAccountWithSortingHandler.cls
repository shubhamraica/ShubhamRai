public class TableOfAccountWithSortingHandler {
    @AuraEnabled
    public static list <Contact> fetchContact(boolean isAsc) {
        try {
            String SOQLQuery = 'SELECT LastName, AccountId, Email, Department, Id  FROM Contact ORDER BY LastName ';
            if (isAsc){
                SOQLQuery += ' asc';
            } 
            else{
                SOQLQuery += ' desc';
            }
            SOQLQuery += ' LIMIT 15';
            list <contact> lstResult;
            lstResult = Database.query(SOQLQuery);
            List <Contact> returnConList = new List <Contact > ();
            for (contact each: lstResult) {
                returnConList.add(each);
            }
            return returnConList;
        }catch (Exception e) {
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getCause());
            return null;
        }
    }
}