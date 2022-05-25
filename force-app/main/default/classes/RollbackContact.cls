public class RollbackContact {
    public static void rollbackContact(savepoint sp){
        Database.rollback(sp);
    }
}