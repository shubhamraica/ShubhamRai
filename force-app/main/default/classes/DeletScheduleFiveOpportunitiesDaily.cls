//7.Write a Script to delete the above Schedule Jobs
public class DeletScheduleFiveOpportunitiesDaily{
	public static void DeleteJob_cron(){
        List<CronTrigger> CronTriggerList = new List<CronTrigger>();
        CronTriggerList = [SELECT ID FROM CronTrigger WHERE CronJobDetail.Name = 'create opportunity daily 4 times'];
        for(CronTrigger eachCronTrigger :CronTriggerList){
            System.abortJob(eachCronTrigger.Id);
        }
    }
}