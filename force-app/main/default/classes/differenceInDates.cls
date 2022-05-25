public class differenceInDates {
    public static void dateDifference(){
        try{
        datetime date1 = datetime.newInstance(2020,11,30,10,2,30);
        datetime date2 = datetime.newInstance(2021,12,31,10,10,40);
        System.debug('THE DIFFERENCE BETWEEN YEARS IS '+Math.abs(date1.year()-date2.year()) +' Years');
        System.debug('THE DIFFERENCE BETWEEN MONTHS IS '+Math.abs(date1.month()-date2.month())+' Months');
        System.debug('THE DIFFERENCE BETWEEN DAYS IS '+Math.abs(date1.day()-date2.day())+' Days');
        System.debug('THE DIFFERENCE BETWEEN HOURS IS '+Math.abs(date1.hour()-date2.hour())+' Hours');
        System.debug('THE DIFFERENCE BETWEEN MINUTES IS '+Math.abs(date1.minute()-date2.minute())+' Minutes');
        System.debug('THE DIFFERENCE BETWEEN SECONDS IS '+Math.abs(date1.second()-date2.second())+' Seconds');
        }catch(Exception e){
            System.debug('Error at line number '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
}