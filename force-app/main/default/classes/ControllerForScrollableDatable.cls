public class ControllerForScrollableDatable {
    public List<Account> getAccounts(){
        List<Account> results = new List<Account>();
        results = Database.query('SELECT Name FROM Account LIMIT 20');
        return results;
    }
}