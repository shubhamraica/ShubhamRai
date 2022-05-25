public class ShowAccountPicklistHandler{
    @auraEnabled
    public static list<account> getAllAccounts(){
        list<account> accList =[SELECT Name, (SELECT LastName FROM Contacts),(SELECT Name FROM Opportunities) FROM Account ORDER BY Name LIMIT 10];
        return accList;
    }
}