//10.Write the above script in 10 line of code only: HINT: Use For loop
public class ScheduleUsingForLoop{
    public static void ScheduleUsingForLoopFunc(){
        Integer jobId = 0;
        String CronExp;
        for(Integer i=0;i<=55;i+=5){
            jobId+=1;
            cronExp = '0 '+i+' * ? * *';
            system.schedule('run every 5 min JOBId = '+jobId, cronExp, new ScheduleUpdateCountFieldInAccount());
        }
    }
}