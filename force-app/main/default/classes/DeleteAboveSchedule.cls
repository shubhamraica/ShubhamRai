//Write a Script to delete the above Schedule Jobs
public class DeleteAboveSchedule{
    public static void DeleteJob_cron(){
        List<CronTrigger> CronTriggerList = new List<CronTrigger>();
        CronTriggerList = [Select ID from CronTrigger where CronJobDetail.Name = 'deleteAccount at 12'];
        for(CronTrigger eachCronTrigger :CronTriggerList){
            System.abortJob(eachCronTrigger.Id);
        }
    }
}