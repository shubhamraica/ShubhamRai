//Schedule the above class to run every day at 12:00 PM.
global class ScheduleDeleteAccountBefore10  Implements schedulable{
    global void execute(System.SchedulableContext sc){
        DeleteAccountBefore10 obj = new DeleteAccountBefore10();
        Database.executeBatch(obj);
    }
}