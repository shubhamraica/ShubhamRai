//9.Write the Script to Schedule the above class to run in every 5 minutes.
global class ScheduleUpdateCountFieldInAccount implements schedulable{
    global void execute(System.SchedulableContext sc){
        Database.executeBatch(new UpdateCountFieldInAccount());
    }
}