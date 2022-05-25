public class ControllerForDatatable {
    public List<Account> getAccounts(){
        List<Account> results = new List<Account>();
        results = Database.query('SELECT Name FROM Account LIMIT 200');
        return results;
    }
}