@isTest
public class ScheduleFetchLead_Test {
    @isTest static void testMethod1(){
        String CRON_EXP = '0 0 0 15 3 ? *';
        Opportunity OpprObj = new Opportunity();
        OpprObj.Name = 'Opportunity Name ';
        OpprObj.StageName = 'something';
        opprObj.CloseDate = date.today().addDays(1);
        insert OpprObj;
        
        Test.startTest();
        
        String jobId = System.schedule('ScheduleApexClassTest3',  CRON_EXP, new ScheduleFetchLead());
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        
        Test.stopTest();
        // Add assert here to validate result
    }
}