//11.Write a Script to delete the above Schedule Jobs with for loop
public class DeleteScheduleUsingForLoop {
    public static void DeleteScheduleUsingForLoopFunc(){
        List<CronTrigger> cronList = new List<CronTrigger>();
        cronList = [SELECT id FROM CronTrigger WHERE CronJobDetail.Name LIKE '%run every 5 min JOBId%'];
        for(CronTrigger eachCronObj : cronList){
            System.abortJob(eachCronObj.Id);
        }
    }
}