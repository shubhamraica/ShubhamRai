@isTest
public class ScheduleDeleteAccountBefore10_Test {
    @isTest static void testMesthod1(){
        ScheduleDeleteAccountBefore10 abc = new ScheduleDeleteAccountBefore10();
        String cronExp = '0 0 12 * * ? *';
        System.schedule('deleteAccount at 12', cronExp, abc);
    }
}